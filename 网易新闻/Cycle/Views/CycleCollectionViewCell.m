//
//  CycleCollectionViewCell.m
//  网易新闻
//
//  Created by 董潇 on 16/7/23.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "CycleCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@interface CycleCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *tltleLab;

@end

@implementation CycleCollectionViewCell

- (void)setModel:(CycleModel *)model{
    
    _model = model;
    
    self.tltleLab.text = model.title;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
}

@end
