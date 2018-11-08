//
//  YUChangeFileNameTool.m
//  NOEEChangeProjectName
//
//  Created by zhenyu on 2018/6/21.
//  Copyright © 2018年 timely. All rights reserved.
//

#import "YUChangeFileNameTool.h"
#import "ZYProjectConfig.h"
#import "ZYCommonFuction.h"


// 全局变量
NSString *_fixFuctionCodeString;

@interface YUChangeFileNameTool ()


@end

@implementation YUChangeFileNameTool

// 开始替换文件名
+ (void)startChangeFileName
{
    

// MARK: -----------------------  1. 配置

    //
    NSString *prefixStr = ZYAddPrefixStr;  // 前缀
    NSString *suffixStr = ZYAddSuffixStr;  // 后缀
    NSInteger insertIndex = ZYInsertIndex;    // 后缀插入到倒数第几位
    NSString * originalPath = ZYTargetFileBasePath;  // 目标根目录
    _fixFuctionCodeString = [NSString stringWithContentsOfFile:ZYProjectFilePath(@"resource/mixCodes.m") encoding:NSUTF8StringEncoding error:nil];  // 垃圾类方法
   
// MARK: -----------------------  2. 修改文件名
    // 2. 修改文件名，并把修改过的文件名放入数组
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    // 获取项目工程名
    NSArray *firstPathArr = [fileManager contentsOfDirectoryAtPath:originalPath error:nil];
    NSString *projectName = nil;
    for (NSString *firstPath in firstPathArr) {
        if ([firstPath hasSuffix:@".xcodeproj"]) {
            projectName = [firstPath stringByReplacingOccurrencesOfString:@".xcodeproj" withString:@""];
            break;
        }
    }
    
    originalPath = [originalPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", projectName]];
    
    //深入遍历,所有的子目录结构
    NSArray * originalAllFileArray = [fileManager subpathsOfDirectoryAtPath:originalPath error:&error];
    
    // 不需要重命名的文件
    NSArray *notNeedReplaceArr = [self notNeedReplaceArrayWithAllFiles:originalAllFileArray keys: @[@"+", @".xib"]];
    
    //
    NSMutableArray *allMFileArrM = [NSMutableArray array];
    for (int i = 0; i < originalAllFileArray.count; i++) {
        @autoreleasepool {
            NSString *filePath = originalAllFileArray[i];
            NSString *lastPathComponent = [filePath lastPathComponent];
            // NOEECustomLog
            if ((![lastPathComponent hasSuffix:@".m"] && ![lastPathComponent hasSuffix:@".h"])  || lastPathComponent.length < 15 || [lastPathComponent containsString:@"+"]) {
                continue;
            }
            
            NSRange range = [lastPathComponent rangeOfString:@"."];
            if ([notNeedReplaceArr containsObject:[lastPathComponent substringToIndex:range.location]]) {
                continue;
            }
            
            
            NSString *tmpPath = [originalPath stringByAppendingPathComponent:filePath];
            NSError * error;
            NSMutableString *tmpMutStr = [prefixStr stringByAppendingString:lastPathComponent].mutableCopy;
            [tmpMutStr insertString:suffixStr atIndex:tmpMutStr.length - insertIndex];
            NSString *newLastPathComponent = tmpMutStr;
            filePath = [filePath stringByReplacingOccurrencesOfString:lastPathComponent withString:newLastPathComponent];
            
            NSString *newPath = [originalPath stringByAppendingPathComponent:filePath];
            BOOL ret =  [fileManager moveItemAtPath:tmpPath toPath:newPath error:&error];
            if (!ret) {  NSLog(@"%@",error); }
            
            if ([[filePath lastPathComponent] containsString:@".h"]) {
                NSString *fileName = [newLastPathComponent stringByReplacingOccurrencesOfString:@".h" withString:@""];
                if (![allMFileArrM containsObject:fileName]) {
                    [allMFileArrM addObject:fileName];
                }
            }
        }
    }
    

// MARK: -----------------------  3. 全局替换文件中的命名
    NSArray * newArray = [fileManager subpathsOfDirectoryAtPath:originalPath error:&error];
    for (NSString *filePath in newArray) {
        @autoreleasepool {
            NSString *newPath = [originalPath stringByAppendingPathComponent:filePath];
            NSString *lastPathComponent = [filePath lastPathComponent];
            if ((![lastPathComponent hasSuffix:@".m"] && ![lastPathComponent hasSuffix:@".h"] && ![lastPathComponent containsString:@".pch"])) {
                continue;
            }
            [self replaceProjectFileContentWithFilePath:newPath newFileNames:allMFileArrM options:ZYSearchOptionsNormal];
        }
    }
    
    
// MARK: -----------------------  4. 替换 .pbxproj 中的文件内容
    NSString *xcodeprojFilePath = [originalPath stringByAppendingPathExtension:@"xcodeproj"];
    NSString *xcworkspaceFilePath = [originalPath stringByAppendingPathExtension:@"xcworkspace"];
    
    BOOL isDirectory;
    // a.改工程文件内容
    if ([fileManager fileExistsAtPath:xcodeprojFilePath isDirectory:&isDirectory] && isDirectory) {
        
        // 01. 替换 project.pbxproj 文件内容
        NSString *projectPbxprojFilePath = [xcodeprojFilePath stringByAppendingPathComponent:@"project.pbxproj"];
        [self replaceProjectFileContentWithFilePath:projectPbxprojFilePath newFileNames:allMFileArrM options:ZYSearchOptionsProject];
        // 02. 替换 project.xcworkspace/contents.xcworkspacedata 文件内容
        NSString *contentsXcworkspacedataFilePath = [xcodeprojFilePath stringByAppendingPathComponent:@"project.xcworkspace/contents.xcworkspacedata"];
        [self replaceProjectFileContentWithFilePath:contentsXcworkspacedataFilePath newFileNames:allMFileArrM options:ZYSearchOptionsProject];
        // 03. xcuserdata 本地用户文件
        NSString *xcuserdataFilePath = [xcodeprojFilePath stringByAppendingPathComponent:@"xcuserdata"];
        if ([fileManager fileExistsAtPath:xcuserdataFilePath]) {
            [fileManager removeItemAtPath:xcuserdataFilePath error:nil];
        }
    }
    // b.改工程组文件内容
    if ([fileManager fileExistsAtPath:xcworkspaceFilePath isDirectory:&isDirectory] && isDirectory) {
        // 替换 contents.xcworkspacedata 文件内容
        NSString *contentsXcworkspacedataFilePath = [xcworkspaceFilePath stringByAppendingPathComponent:@"contents.xcworkspacedata"];
        [self replaceProjectFileContentWithFilePath:contentsXcworkspacedataFilePath newFileNames:allMFileArrM options:ZYSearchOptionsProject];
        // xcuserdata 本地用户文件
        NSString *xcuserdataFilePath = [xcworkspaceFilePath stringByAppendingPathComponent:@"xcuserdata"];
        if ([fileManager fileExistsAtPath:xcuserdataFilePath]) {
            [fileManager removeItemAtPath:xcuserdataFilePath error:nil];
        }
//        // 改名工程文件
//        renameFile(xcworkspaceFilePath, [[projectDir stringByAppendingPathComponent:newName] stringByAppendingPathExtension:@"xcworkspace"]);
    }
    
    
    
    // 图片压缩
    NSString *commandString = [NSString stringWithFormat:@"cd %@; find . -iname \"*.png\" -exec echo {} \\; -exec convert {} {} \\;", originalPath];
    ZYCommand(commandString);
    
    
    
    NSLog(@"===================");
    NSLog(@"文件替换完成: %@ ", [NSDate date]);
    NSLog(@"===================");
}


// 更改文件内容（主要是替换文件名）
+ (BOOL)replaceProjectFileContentWithFilePath:(NSString *)filePath newFileNames:(NSArray *)newFileNames options:(ZYSearchOptions)options {
    
    NSString *prefixStr = ZYAddPrefixStr;  // 前缀
    NSString *suffixStr = ZYAddSuffixStr;  // 后缀
    NSInteger prefixStrLength = prefixStr.length;
    NSInteger suffixStrLength = suffixStr.length;
    BOOL isChanged = NO;
    
    NSError *error;
    NSString *text = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) { // 读取失败，或目录不存在
        return NO;
    }
    for (NSString *fileName in newFileNames) {
        @autoreleasepool {
            NSString *oldFileName = [[fileName stringByReplacingOccurrencesOfString:prefixStr withString:@""] stringByReplacingOccurrencesOfString:suffixStr withString:@""];
            NSArray *rangeArr = [self rangesForContent:text searchText:oldFileName options:options];
            
            NSInteger startLocation = 0;
            for (NSString *location in rangeArr) {
                text = [text stringByReplacingOccurrencesOfString:oldFileName withString:fileName options:NSCaseInsensitiveSearch range:NSMakeRange([location integerValue] +  startLocation, oldFileName.length)];
                startLocation += (prefixStrLength + suffixStrLength);
                if (!isChanged) { isChanged = YES; }
            }
        }
    }
    if (isChanged) {
        NSString *lastPathComponent = [filePath lastPathComponent];
        // 添加混淆代码
        if ([filePath  containsString:@".m"] && ![lastPathComponent containsString:@"+"]) {
            NSRange endRang = [text rangeOfString:@"@end" options:NSBackwardsSearch];
            if (endRang.location != NSNotFound && endRang.length != 0) {
                NSString *currentClassName = [lastPathComponent substringToIndex:lastPathComponent.length - 2];
                NSString *tmpfixFuctionCodeString = [_fixFuctionCodeString stringByReplacingOccurrencesOfString:@"THER" withString:currentClassName];
                text = [text stringByReplacingOccurrencesOfString:@"@end" withString:tmpfixFuctionCodeString options:NSCaseInsensitiveSearch range:NSMakeRange(endRang.location, endRang.length)];
            }
        }

        // 覆盖原文件
        [text writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return isChanged;
}

// MARK: -----------------------  获取这个字符串中的所有xxx的所在的range.location
+ (NSMutableArray *)rangesForContent:(NSString *)contentText searchText:(NSString *)searchText options:(ZYSearchOptions)options
{
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:3];
    if (searchText == nil || [searchText isEqualToString:@""]) {
        return nil;
    }
    NSRange range = [contentText rangeOfString:searchText]; //获取第一次出现的range
    if (range.location != NSNotFound && range.length != 0) {
        NSNumber *locationNumBer = [self locationNumberWithContent:contentText range:range searchText:searchText options:options];
        if (locationNumBer) {
            [arrayRanges addObject:locationNumBer]; //将第一次的加入到数组中
        }
        
        NSRange rang1 = {0, 0};
        NSInteger location = 0;
        NSInteger length = 0;
        for (int i = 0;; i++) {
            if (0 == i) { // 去掉这个xxx
                location = range.location + range.length;
                length = contentText.length - range.location - range.length;
                rang1 = NSMakeRange(location, length);
            } else {
                location = rang1.location + rang1.length;
                length = contentText.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location-1, length);
            }
            
            // 在一个range范围内查找另一个字符串的range
            rang1 = [contentText rangeOfString:searchText options:NSLiteralSearch range:rang1];
            if (rang1.location == NSNotFound || rang1.length == 0) {
                break;
            } else { //添加符合条件的location进数组
                NSNumber *locationNumBer = [self locationNumberWithContent:contentText range:rang1 searchText:searchText options:options];
                if (locationNumBer) {
                    [arrayRanges addObject:locationNumBer];
                }
            }
        }
        return arrayRanges;
    }
    return nil;
}

// 筛选出符合条件的字符所在的location
+ (NSNumber *)locationNumberWithContent:(NSString *)contentText range:(NSRange)range searchText:(NSString *)searchText options:(ZYSearchOptions)options {
    if (options == ZYSearchOptionsProject) {
        // 前一个字符不能为子母或下划线
        int prefixAsciiCode = [contentText characterAtIndex:range.location - 1]; // 前一个字符
        // 后两个字符必须是.m或.h
        NSString *suffixStr = [contentText substringWithRange:NSMakeRange(range.location + searchText.length, 2)];
        if (([suffixStr isEqualToString:@".h"] || [suffixStr isEqualToString:@".m"]) && ![self includingLetter:prefixAsciiCode]) {
            return [NSNumber numberWithInteger:range.location];
        }
    } else {
        int prefixAsciiCode = [contentText characterAtIndex:range.location - 1]; // 前一个字符
        int suffixAsciiCode = [contentText characterAtIndex:range.location + searchText.length]; // 后一个字符
        if (![self includingNumber:prefixAsciiCode] && ![self includingNumber:suffixAsciiCode]) {
            return [NSNumber numberWithInteger:range.location];
        }
    }
    return nil;
}


// 是否包括数字
+ (BOOL)includingNumber:(int)codeNumber
{
    if (codeNumber >= 48 && codeNumber<= 57) {
        return YES;
    }
    if (codeNumber >= 65 && codeNumber<= 90) {
        return YES;
    }
    if (codeNumber >= 97 && codeNumber<= 122) {
        return YES;
    }
    if (codeNumber == 95) {
        return YES;
    }
    if (codeNumber == 43) {
        return YES;
    }
    
    return NO;
}

// 是否包括字母或下划线
+ (BOOL)includingLetter:(int)codeNumber {
    if (codeNumber >= 65 && codeNumber<= 90) { // A-Z
        return YES;
    }
    if (codeNumber >= 97 && codeNumber<= 122) { // a-z
        return YES;
    }
    if (codeNumber == 95) { // 下划线 _
        return YES;
    }
    return NO;
}

+ (NSArray *)notNeedReplaceArrayWithAllFiles:(NSArray *)oldAllFileArray keys:(NSArray *)keys
{
    // 不需要重命名的文件
    NSMutableArray *notNeedReplaceArr = [NSMutableArray array];
    for (NSString *filePath in oldAllFileArray) {
        @autoreleasepool {
            NSString *lastPathComponent = filePath.lastPathComponent;
            
            for (NSString *key in keys) {
                if ([lastPathComponent containsString:key]) {
                    NSRange range = [lastPathComponent rangeOfString:key];
                    NSString *className = [lastPathComponent substringToIndex:range.location];
                    if (![notNeedReplaceArr containsObject:className] && className.length > 12) {
                        [notNeedReplaceArr addObject: className];
                    }
                    break;
                }
            }
        }
    }
    return notNeedReplaceArr;
}

@end
