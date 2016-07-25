//
//  ChanneModel.m
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "ChanneModel.h"

@implementation ChanneModel

+ (instancetype)channelWithDict:(NSDictionary *)dict{
    
    ChanneModel *model = [[ChanneModel alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@--%@",self.tid,self.tname];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

+ (NSArray *)channel{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSArray *arr = [dict objectForKey:@"tList"];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ChanneModel *model = [ChanneModel channelWithDict:obj];
        
        [arrM addObject:model];
    }];
    //按需求排列
    [arrM sortUsingComparator:^NSComparisonResult(ChanneModel * obj1, ChanneModel * obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
    
    return arrM.copy;
}
@end













