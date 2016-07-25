//
//  NetWorkTools.m
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "NetWorkTools.h"

@implementation NetWorkTools

static id _instancetype;
+ (instancetype)sharedNewworkTools{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //单例,截取网络网址前半
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        _instancetype = [[self alloc]initWithBaseURL:url];
    });
    return _instancetype;
}

@end
