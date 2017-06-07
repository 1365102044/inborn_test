//
//  YBGoodListViewCategoriesController.m
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListViewCategoriesController.h"
#import "YBGoodListViewCategoriesModel.h"
#import "YBGoodListViewCategoriesConditionalScreeningCell.h"
#import "YBGoodListViewCategoriesCell.h"

@interface YBGoodListViewCategoriesController ()

/**
 当前collectionView的布局
 */
@property (nonatomic, strong) UICollectionViewFlowLayout *currentFl;

/**
 当前的组数
 */
@property (nonatomic, assign) CGFloat sectionCount;

/**
 当为分类时，上一个选中的indexPath
 */
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

/**
 当前页
 */
@property (nonatomic, assign) NSInteger currentIndex;

/**
 无限循环避免重用问题的总数组
 */
@property (nonatomic, strong) NSArray *totalCategoriesArray;

@end

@implementation YBGoodListViewCategoriesController

#pragma mark - Zero.Const

/**
 *  分类筛选器
 */
static NSString * const YBGoodListViewCategoriesControllerCategoriesReuseIdentifier                         = @"YBGoodListViewCategoriesControllerCategoriesReuseIdentifier";

/**
 *  条件筛选器
 */
static NSString * const YBGoodListViewCategoriesControllerConditionalScreeningReuseIdentifier               = @"YBGoodListViewCategoriesControllerConditionalScreeningReuseIdentifier";

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setCatrgoriesArray:(NSArray *)catrgoriesArray
{
    _catrgoriesArray                                    = catrgoriesArray;
//    YBGoodListViewCategoriesModel *categoriesModel      = _catrgoriesArray[2];
//    categoriesModel.isSelected                          = YES;
//    NSMutableArray *tempArray                           = [NSMutableArray array];
//    for (NSInteger i = 0; i < 200; i++) {
//        [tempArray addObject:catrgoriesArray.copy];
//    }
//    
    //    self.totalCategoriesArray               = tempArray.copy;
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView reloadData];
    [self.collectionView.collectionViewLayout invalidateLayout];
    
    /**
     *  滚动到中间位置
     *  禁止滚动
     */
//    self.collectionView.contentSize = CGSizeMake(catrgoriesArray.count * 200 * ADJUST_PERCENT_FLOAT(self.collectionView.width / 6), 0);
//    [self.collectionView setContentOffset:CGPointMake(catrgoriesArray.count * 100 * ADJUST_PERCENT_FLOAT(self.collectionView.width / 6) - ADJUST_PERCENT_FLOAT(self.collectionView.width / 6 ) * 0.5, 0) animated:NO];
//    if ([self.customDelegate respondsToSelector:@selector(goodListViewCategoriesController:indexPath:)]) {
//        [self.customDelegate goodListViewCategoriesController:self indexPath:[NSIndexPath indexPathForItem:2 inSection:0]];
//    }
//    self.currentIndexPath                   = [NSIndexPath indexPathForItem:2 inSection:100];
    [self collectionView:self.collectionView didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0]];
}

- (void)setType:(YBGoodListViewCategoriesType)type
{
    _type                                   = type;
    
    /**
     *  默认及分类筛选
     */
    if (type == YBGoodListViewDefault
        || type == YBGoodListViewCategories) {
        
        //NSAssert(self.catrgoriesArray, @"如果筛选器类型为Default和Categories时，先传入catrgoriesArray");
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 12, 0, 0);
    }
    
    /**
     *  条件筛选
     */
    if (type == YBGoodListViewConditionalScreening) {
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    [self.collectionView.collectionViewLayout invalidateLayout];
    [self.collectionView reloadData];
    
//    self.collectionView.contentSize = CGSizeMake(self.catrgoriesArray.count * 200 * ADJUST_PERCENT_FLOAT(self.collectionView.width / 6), 0);
//    [self.collectionView setContentOffset:CGPointMake(self.catrgoriesArray.count * 100 * ADJUST_PERCENT_FLOAT(self.collectionView.width / 6) - ADJUST_PERCENT_FLOAT(self.collectionView.width / 6 ) * 0.5, 0) animated:NO];
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma  mark <UIScrollViewDelegate>

- (void)scrollTitlesViewWithSelectedCell:(UICollectionViewCell *)sender
{
    /**
     *  计算channelScrollView应该滚动的偏移量
     */
    CGFloat needScrollOffsetX = sender.center.x - self.collectionView.bounds.size.width * 0.5;
    
    if (needScrollOffsetX < 0) {
        return;
        needScrollOffsetX = -12;
    }
    
    CGFloat maxScrollOffsetX = self.collectionView.contentSize.width - self.collectionView.bounds.size.width ;
    
    if (needScrollOffsetX > maxScrollOffsetX) {
        needScrollOffsetX = maxScrollOffsetX;
    }
    
    [self.collectionView setContentOffset:CGPointMake(needScrollOffsetX, 0) animated:YES];
}

#pragma mark <UICollectionViewDataSource>

/**
 多少组
 
 @param collectionView collectionView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    [self.collectionView.collectionViewLayout invalidateLayout];
    if (self.type == YBGoodListViewDefault
        || self.type == YBGoodListViewCategories) {
        return 1;
    }
    
    if (self.type == YBGoodListViewConditionalScreening) {
        return 1;
    }
    return 1;
}

/**
 多少行
 
 @param collectionView collectionView
 @param section        section
 
 @return 组对应行数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.type == YBGoodListViewDefault
        || self.type == YBGoodListViewCategories) {
        return self.catrgoriesArray.count;
    }
    
    if (self.type == YBGoodListViewConditionalScreening) {
        return 1;
    }
    return 1;
}

/**
 自定义cell
 
 @param collectionView collectionView
 @param indexPath      indexPath
 
 @return 自定义样式cell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type == YBGoodListViewDefault
        || self.type == YBGoodListViewCategories) {
        
        YBGoodListViewCategoriesCell *categoriesCell    = [collectionView dequeueReusableCellWithReuseIdentifier:YBGoodListViewCategoriesControllerCategoriesReuseIdentifier
                                                                                                    forIndexPath:indexPath];
        categoriesCell.categoriesModel                  = self.catrgoriesArray[indexPath.item];
        return categoriesCell;
    }
    
    if (self.type == YBGoodListViewConditionalScreening) {
        
        YBGoodListViewCategoriesConditionalScreeningCell *conditionalScreenCell = [collectionView dequeueReusableCellWithReuseIdentifier:YBGoodListViewCategoriesControllerConditionalScreeningReuseIdentifier
                                                                                                                            forIndexPath:indexPath];
        return conditionalScreenCell;
    }
    return nil;
}

/**
 item大小
 
 @param collectionView              collectionView
 @param collectionViewLayout        collectionViewLayout
 @param indexPath                   indexPath
 @return return                     value
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type == YBGoodListViewDefault
        || self.type == YBGoodListViewCategories) {
        return CGSizeMake(self.collectionView.width / 6,
                          collectionView.height);
    }
    
    if (self.type == YBGoodListViewConditionalScreening) {
        return CGSizeMake(self.collectionView.width,
                          self.collectionView.height);
    }
    return CGSizeMake(0,
                      0);
}

/**
 返回最小间距
 
 @param collectionView       collectionView
 @param collectionViewLayout collectionViewLayout
 @param section              section
 
 @return return 最小间距
 */
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.1f;
}

/**
 最小间距
 
 @param collectionView       collectionView
 @param collectionViewLayout collectionViewLayout
 @param section              section
 
 @return 最小间距
 */
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    YBLog(@"%f", ((self.collectionView.width - (self.collectionView.width / 6) * 5 - 12 * 2) / 4));
    return ((self.collectionView.width - (self.collectionView.width / 6) * 5 - 12 * 2) / 4);
}

/**
 点击事件
 
 @param collectionView              collectionView
 @param indexPath                   indexPath
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self categoriesClickWithIndexPath:indexPath animated:YES];
}

/**
 分类点击事件
 
 @param indexPath indexPath
 @param animated 是否开启滚动动画
 */
- (void)categoriesClickWithIndexPath:(NSIndexPath *)indexPath
                            animated:(BOOL)animated
{
    /**
     *  条件筛选
     */
    if (self.type == YBGoodListViewConditionalScreening) {
        return;
    }
    
    if (self.currentIndexPath.item == indexPath.item) {
        return;
    }
    
    /**
     *  分类筛选点击事件
     */
    YBGoodListViewCategoriesModel *categoriesModel              = self.catrgoriesArray[indexPath.item];
    YBGoodListViewCategoriesModel *currentCategoriesModel       = self.catrgoriesArray[self.currentIndexPath.item];
    categoriesModel.isSelected                                  = YES;
    currentCategoriesModel.isSelected                           = NO;
    
    //[self.collectionView reloadData];
    
    self.currentIndexPath                                       = indexPath;
    
    if ([self.customDelegate respondsToSelector:@selector(goodListViewCategoriesController:indexPath:)]) {
        [self.customDelegate goodListViewCategoriesController:self indexPath:indexPath];
    }
    
    /**
     *  获取选中cell
     */
    YBGoodListViewCategoriesCell *categoriesCell                = (YBGoodListViewCategoriesCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
    /**
     *  转换cell坐标到父控件
     */
    CGRect cellFrame                                            = [self.collectionView convertRect:categoriesCell.frame fromView:self.collectionView];
    
    YBLog(@"%@", NSStringFromCGRect(cellFrame));
    if (animated
        && categoriesCell) {
        //[self.collectionView setContentOffset:CGPointMake(centerX - self.collectionView.width * 0.5, 0) animated:animated];
        //[self scrollTitlesViewWithSelectedCell:(UICollectionViewCell *)categoriesCell];
        [self.collectionView reloadData];
    }
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

#pragma mark - Fifth.控制器生命周期

- (instancetype)init
{
    UICollectionViewFlowLayout *fl      = [[UICollectionViewFlowLayout alloc] init];
    fl.scrollDirection                  = UICollectionViewScrollDirectionHorizontal;
    fl.minimumLineSpacing               = 0;
    fl.minimumInteritemSpacing          = 0;
    self.currentFl                      = fl;
    
    if (self = [self initWithCollectionViewLayout:fl]) {
        
    }
    return self;
}

/**
 视图加载完毕
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerViews];
    self.collectionView.bounces = NO;
    
    if (self.type == YBGoodListViewDefault
        || self.type == YBGoodListViewCategories) {
        
        self.collectionView.contentInset = UIEdgeInsetsMake(0, 12, 0, 0);
    }
}

/**
 视图即将出现

 @param animated animated
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - Sixth.界面配置

/**
 Register
 */
- (void)registerViews
{
    [self.collectionView registerClass:[YBGoodListViewCategoriesConditionalScreeningCell class]
            forCellWithReuseIdentifier:YBGoodListViewCategoriesControllerConditionalScreeningReuseIdentifier];
    [self.collectionView registerClass:[YBGoodListViewCategoriesCell class]
            forCellWithReuseIdentifier:YBGoodListViewCategoriesControllerCategoriesReuseIdentifier];
}

#pragma mark - Seventh.懒加载


@end
