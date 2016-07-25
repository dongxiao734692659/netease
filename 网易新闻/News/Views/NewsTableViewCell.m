//
//  NewsTableViewCell.m
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <UIImageView+WebCache.h>
@interface NewsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *scrImgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *sourceLab;
@property (weak, nonatomic) IBOutlet UILabel *replyLab;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *scrInageViews;

@end


@implementation NewsTableViewCell

- (void)setModel:(NewsModel *)model{
    
    _model = model;
    
    [self.scrImgView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    
    self.titleLab.text = model.title;
    
    self.sourceLab.text = model.source;
    
    self.replyLab.text = [NSString stringWithFormat:@"%@",model.replyCount];
    
    
    for (int i = 0; i < model.imgextra.count; i++) {
        
        UIImageView *img = self.scrInageViews[i];
        
        NSDictionary *dict = model.imgextra[i];
        
        NSString *imgstr = [dict objectForKey:@"imgsrc"];
        
        [img sd_setImageWithURL:[NSURL URLWithString:imgstr]];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
