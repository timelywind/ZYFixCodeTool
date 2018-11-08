//
//  YUChangeFileNameTool.h
//  NOEEChangeProjectName
//
//  Created by zhenyu on 2018/6/21.
//  Copyright © 2018年 timely. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZYSearchOptions){
    ZYSearchOptionsNormal,     //  默认查找方式，(主要是查找.m、.h文件中的被替换的文件名)
    ZYSearchOptionsProject,    // .pbxproj中的文件名（必须保证查到的字符串后缀是.h或.m，否则会错改了文件夹的名字）
};


@interface YUChangeFileNameTool : NSObject

// 开始替换文件名
+ (void)startChangeFileName;

@end
