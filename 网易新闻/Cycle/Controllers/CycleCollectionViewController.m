//
//  CycleCollectionViewController.m
//  网易新闻
//
//  Created by 董潇 on 16/7/23.
//  Copyright © 2016年 dongxiao. All rights reserved.
//

#import "CycleCollectionViewController.h"
#import "CycleCollectionViewCell.h"
#import "CycleModel.h"

@interface CycleCollectionViewController ()

@property (nonatomic, strong)NSArray *dataArr;

@property (nonatomic, strong)UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

static NSString * const ID = @"cycleCell";

@implementation CycleCollectionViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.flowLayout.itemSize = self.collectionView.bounds.size;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self loadCycle];
    
    [self creatPageContrl];
    
}
- (void)creatPageContrl{
    
    
    self.pageControl = [[UIPageControl alloc]init];
    
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
    [self.view addSubview:self.pageControl];
}


- (void)loadCycle {
    
    [CycleModel cycleWithDataUrlstr:@"ad/headline/0-4.html" successBlock:^(NSArray *arr) {
        
        self.dataArr = arr;
        
        [self.collectionView reloadData];
        
        self.pageControl.numberOfPages = self.dataArr.count;
        
        //设置pageControl的size
        
        
        CGSize pageControlSize = [self.pageControl sizeForNumberOfPages:self.dataArr.count];
        
        self.pageControl.frame = CGRectMake(self.collectionView.bounds.size.width *0.8, self.collectionView.bounds.size.height - pageControlSize.height, pageControlSize.width, pageControlSize.height);
        
        
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.dataArr.count inSection:0];
        
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
        
        
        
        
        
        
    } failBlock:^(NSError *errer) {
        
        NSLog(@"%@",errer);
    }];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / self.collectionView.bounds.size.width;
    
    self.pageControl.currentPage = index % self.dataArr.count;
    
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    
    NSIndexPath *indexPath;
    
    if (index == 0) {
        indexPath = [NSIndexPath indexPathForItem:self.dataArr.count inSection:0];
        
    }else if (index == items - 1){
        indexPath = [NSIndexPath indexPathForItem:self.dataArr.count - 1 inSection:0];
    }
    
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dataArr.count*2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];;
    

    CycleModel *model = self.dataArr[indexPath.item % self.dataArr.count];
    
    cell.model = model;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
