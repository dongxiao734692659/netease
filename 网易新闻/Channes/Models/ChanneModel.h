//
//  ChanneModel.h
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChanneModel : NSObject

@property (nonatomic, copy)NSString *tname;
@property (nonatomic, copy)NSString *tid;

+ (NSArray *)channel;
@end
