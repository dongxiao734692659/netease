//
//  NetWorkTools.h
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>


@interface NetWorkTools : AFHTTPSessionManager

+ (instancetype)sharedNewworkTools;

@end
