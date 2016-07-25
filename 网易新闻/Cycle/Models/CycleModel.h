//
//  CycleModel.h
//  网易新闻
//
//  Created by 董潇 on 16/7/23.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CycleModel : NSObject
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *imgsrc;

+ (void)cycleWithDataUrlstr:(NSString *)urlstr successBlock:(void(^)(NSArray *arr))successBlock failBlock:(void(^)(NSError *errer))failBlock;
@end
