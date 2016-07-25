//
//  HomeViewController.m
//  网易新闻
//
//  Created by 董潇 on 16/7/22.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "HomeViewController.h"
#import "ChanneLab.h"
#import "ChanneModel.h"
#import "HomeCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong)NSArray *dataArr;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;

@property (nonatomic, strong)NSMutableArray *labM;

@end

@implementation HomeViewController

- (NSArray *)dataArr{
    if (_dataArr ==nil) {
        _dataArr = [ChanneModel channel];
    }
    return _dataArr;
}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    self.flowLayout.itemSize = self.newsCollectionView.bounds.size;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self creatLab];
}

- (void)creatLab {
    
    int labW = 80;
    int labH = self.scrollView.bounds.size.height;
    
    for (int i = 0; i < self.dataArr.count; i++) {
        
        ChanneLab *lab = [[ChanneLab alloc]initWithFrame:CGRectMake(labW * i, 0, labW, labH)];
        
        
        [self.labM addObject:lab];
        
        ChanneModel *model = self.dataArr[i];
        
//        lab.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
        lab.text = model.tname;
        lab.textAlignment = NSTextAlignmentCenter;
        
        [self.scrollView addSubview:lab];
        
        self.scrollView.contentSize = CGSizeMake(labW * self.dataArr.count, 0);
        
        
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeCell" forIndexPath:indexPath];
    
    ChanneModel *model = self.dataArr[indexPath.item];
    
    NSString *urlstr = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];
    
    cell.urlstr = urlstr;
    
    return cell;
}
@end



















