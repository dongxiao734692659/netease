//
//  NewsModel.h
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
/// 新闻标题
@property (nonatomic,copy) NSString *title;
/// 新闻图标
@property (nonatomic,copy) NSString *imgsrc;
/// 新闻来源
@property (nonatomic,copy) NSString *source;
/// 新闻回复数
@property (nonatomic,strong) NSNumber *replyCount;
/// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
/// 大图标记
@property (nonatomic, assign) BOOL imgType;

+ (void)downloadDataWithUrlstr:(NSString *)urlstr successBlock:(void(^)(NSArray *arr))successBlock failBlock:(void(^)(NSError *error))failBlock;
@end
