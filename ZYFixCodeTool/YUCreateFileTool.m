//
//  YUCreateFileTool.m
//  NOEEChangeProjectName
//
//  Created by zhenyu on 2018/6/21.
//  Copyright © 2018年 timely. All rights reserved.
//

#import "YUCreateFileTool.h"
#import "ZYCommon.h"

@implementation YUCreateFileTool

// 创建文件
+ (void)createFilesWithCount:(NSInteger)count
{
    // 资源路径
    NSString *resourcePath = ZYProjectFilePath(@"resource");
    NSString *filesPath = ZYProjectFilePath(@"changeFile/Classes");
    NSArray *wordArr = [NSArray arrayWithContentsOfFile:ZYProjectFilePath(@"resource/commonword.plist")];
    NSArray *letterArr = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    // 原始文件名
    NSString *oldClassName = @"THER";
    NSString *oldClassNameH = [oldClassName stringByAppendingString:@".h"];
    NSString *oldClassNameM = [oldClassName stringByAppendingString:@".m"];
    
    NSString *newClassName = nil;
    NSString *newClassNameH = nil;
    NSString *newClassNameM = nil;

    NSString *lastClassNameH = oldClassNameH;
    NSString *currentComponent = nil;
    
    NSFileManager * fm = [NSFileManager defaultManager];
    // 原始文件内容
    NSString *textH = [NSString stringWithContentsOfFile:[resourcePath stringByAppendingPathComponent:oldClassNameH] encoding:NSUTF8StringEncoding error:nil];
    NSString *textM = [NSString stringWithContentsOfFile:[resourcePath stringByAppendingPathComponent:oldClassNameM] encoding:NSUTF8StringEncoding error:nil];
    
    // 创建oldClass文件
    [textH writeToFile:[filesPath stringByAppendingPathComponent:oldClassNameH] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    [textM writeToFile:[filesPath stringByAppendingPathComponent:oldClassNameM] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    // 循环创建文件
    NSError *error = nil;
    for (int i = 0; i < count; i++) {
        @autoreleasepool {
            // 需要创建的文件名
            NSString *wordStr1 = wordArr[arc4random() % (wordArr.count)];
            NSString *wordStr2 = wordArr[arc4random() % (wordArr.count)];
            NSString *letterStr1 = letterArr[arc4random() % (letterArr.count)];
            NSString *letterStr2 = letterArr[arc4random() % (letterArr.count)];
            NSString *letterStr3 = letterArr[arc4random() % (letterArr.count)];
            newClassName = [NSString stringWithFormat:@"%@%@%@%@%@%@", letterStr1, letterStr2, letterStr3, oldClassName, wordStr1, wordStr2];
            newClassNameH = [newClassName stringByAppendingString:@".h"];
            newClassNameM = [newClassName stringByAppendingString:@".m"];
            
            if (i%100 == 0) {
                currentComponent = [NSString stringWithFormat:@"%@%@%@%@", letterStr1, letterStr2, letterStr3, wordStr1];
            }
            
            // .h文件内容处理并创建
            NSString *newTextH = [textH stringByReplacingOccurrencesOfString:oldClassName withString:newClassName];
            if (![fm fileExistsAtPath:[filesPath stringByAppendingPathComponent:currentComponent]]) {
                [fm createDirectoryAtPath:[filesPath stringByAppendingPathComponent:currentComponent] withIntermediateDirectories:YES attributes:nil error:nil];
            }
            [newTextH writeToFile:[filesPath stringByAppendingPathComponent:[currentComponent stringByAppendingPathComponent:newClassNameH]] atomically:YES encoding:NSUTF8StringEncoding error:&error];
            
            // .m文件内容处理并创建
            NSString *newTextM = [textM stringByReplacingOccurrencesOfString:oldClassName withString:newClassName];
            newTextM = [newTextM stringByReplacingOccurrencesOfString:@"//mychangetag" withString:[@"#import \"YUClass.h\"" stringByReplacingOccurrencesOfString:@"YUClass.h" withString:lastClassNameH]];
            [newTextM writeToFile:[filesPath stringByAppendingPathComponent:[currentComponent stringByAppendingPathComponent:newClassNameM]] atomically:YES encoding:NSUTF8StringEncoding error:&error];
            
            lastClassNameH = newClassNameH;
        }
    }
    
    NSLog(@"===================");
    NSLog(@"创建文件完成: %@ ", [NSDate date]);
    NSLog(@"===================");
}

@end
