//
//  main.m
//  ZYFixCodeTool
//
//  Created by zhenyu on 2018/11/7.
//  Copyright © 2018年 timely. All rights reserved.
//


/*********/
/*
 使用方法：
 在ZYProjectConfig.h 文件中配置对应的路劲、前缀、后缀等，然后运行即可
 */
/*********/


#import <Foundation/Foundation.h>
#import "YUChangeFileNameTool.h"
#import "ZYCommonFuction.h"
#import "ZYProjectConfig.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {


        // 项目文件重命名
        [YUChangeFileNameTool startChangeFileName];

        
        NSLog(@"===================");
        NSLog(@"文件替换完成: %@ ", [NSDate date]);
        NSLog(@"===================");
    }
    return 0;
}
