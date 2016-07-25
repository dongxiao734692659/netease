//
//  CycleModel.m
//  网易新闻
//
//  Created by 董潇 on 16/7/23.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "CycleModel.h"
#import "NetWorkTools.h"
@implementation CycleModel
+ (instancetype)cycleWithDict:(NSDictionary *)dict{
    
    CycleModel *model = [[CycleModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}


+ (void)cycleWithDataUrlstr:(NSString *)urlstr successBlock:(void (^)(NSArray *))successBlock failBlock:(void (^)(NSError *))failBlock{
    
    [[NetWorkTools sharedNewworkTools]GET:urlstr parameters:0 progress:0 success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        NSString *key = responseObject.keyEnumerator.nextObject;
        
        NSArray *arr = [responseObject objectForKey:key];
        
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        
        [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CycleModel *model = [CycleModel cycleWithDict:obj];
            
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
