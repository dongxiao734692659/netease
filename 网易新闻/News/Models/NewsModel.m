//
//  NewsModel.m
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "NewsModel.h"
#import "NetWorkTools.h"

@implementation NewsModel

+ (instancetype)newsWithDict:(NSDictionary *)dict{
    
    NewsModel *model = [[NewsModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@==%@",self.title,self.source];
}

+ (void)downloadDataWithUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *))successBlock failBlock:(void (^)(NSError *))failBlock{
    
    [[NetWorkTools sharedNewworkTools]GET:urlstr parameters:0 progress:0 success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
       
        NSDictionary *dict = responseObject;
        
        NSString *key = responseObject.keyEnumerator.nextObject;
        
        NSArray *arr = [dict objectForKey:key];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            NewsModel *model = [NewsModel newsWithDict:obj];
            
            [arrM addObject:model];
        }];
        
        if (successBlock) {
            successBlock(arrM.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock(error);
        }
    }];
}
@end













