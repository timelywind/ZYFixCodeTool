//
//  ZYCommonFuction.m
//  ZYFixCodeTool
//
//  Created by zhenyu on 2018/11/7.
//  Copyright © 2018年 timely. All rights reserved.
//

#import "ZYCommonFuction.h"
#import "ZYProjectConfig.h"

NSString *ZYProjectFilePath(NSString *path) {
    NSString *basePath = ZYProjectFileBasePath;
    if (!path.length) {
        return basePath;
    }
    return [NSString stringWithFormat:@"%@/%@", basePath, path];
}

NSString *ZYCommand (NSString *cmd) {
    // 初始化并设置shell路径
    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/bash"];
    // -c 用来执行string-commands（命令字符串），也就说不管后面的字符串里是什么都会被当做shellcode来执行
    NSArray *arguments = [NSArray arrayWithObjects: @"-c", cmd, nil];
    [task setArguments: arguments];
    
    // 新建输出管道作为Task的输出
    NSPipe *pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    
    // 开始task
    NSFileHandle *file = [pipe fileHandleForReading];
    [task launch];
    
    // 获取运行结果
    NSData *data = [file readDataToEndOfFile];
    return [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
}
