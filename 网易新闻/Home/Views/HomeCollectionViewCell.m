//
//  HomeCollectionViewCell.m
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "NewsTableViewController.h"

@interface HomeCollectionViewCell ()

@property (nonatomic, strong)NewsTableViewController *newsVC;

@end

@implementation HomeCollectionViewCell

- (void)awakeFromNib{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.newsVC = [[NewsTableViewController alloc]init];
    
    self.newsVC = [storyboard instantiateInitialViewController];
    
    self.newsVC.tableView.frame = self.contentView.bounds ;
    
    [self addSubview:self.newsVC.tableView];
}


- (void)setUrlstr:(NSString *)urlstr{
    
    _urlstr = urlstr;
    
    self.newsVC.urlstr = urlstr;
}
@end
