//
//  YBGoodListController.m
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListController.h"
#import "YBGoodListControllerFlowLayout.h"
#import "YBGoodListCell.h"
#import "YBGoodListPictureCarouselHeaderView.h"
#import "YBGoodListGoodModel.h"
#import "YBGoodListViewCategoriesModel.h"
#import "YBGoodsDeatilImageViewController.h"
#import "User_LocalData.h"
#import "YBGoodListViewModel.h"
#import "ZJBaseNavigationController.h"
#import "YBActivityWebViewController.h"

@interface YBGoodListController () <YBGoodListControllerFlowLayoutDelegate, YBGoodListCellDelegate, YBGoodListPictureCarouselHeaderViewDelegate>

/**
 <#descrption#>
 */
@property (nonatomic, assign) BOOL refreshFalg;

@end

@implementation YBGoodListController

#pragma mark - Zero.Const

/**
 *  头部重用标志
 */
static NSString * const YBGoodListControllerPictureCarouselHeaderReuseIdentifier                        = @"YBGoodListControllerPictureCarouselHeaderReuseIdentifier";

/**
 *  商品cell重用标志
 */
static NSString * const YBGoodListControllerGoodCellReuseIdentifier                                     = @"YBGoodListControllerGoodCellReuseIdentifier";

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setViewModel:(YBGoodListViewModel *)viewModel
{
    _viewModel = viewModel;
}

#pragma mark - Third.点击事件

/**
 *  加载新数据
 */
- (void)loadNewData
{
    
}

/**
 *  加载更多
 */
- (void)loadMoreData
{
    
}


#pragma mark - Fourth.代理方法

#pragma mark <YBGoodListPictureCarouselHeaderViewDelegate>

/**
 图片点击事件

 @param goodListPictureCarouselHeaderView   goodListPictureCarouselHeaderView
 @param index                               index
 @param adModel                             adModel
 */
- (void)goodListPictureCarouselHeaderView:(YBGoodListPictureCarouselHeaderView *)goodListPictureCarouselHeaderView
                                    index:(NSInteger)index
                                  adModel:(YBGoodListAdsModel *)adModel
{
    YBLog(@"%zd", index);
    YBGoodListAdsModel *currentAdModel = self.viewModel.adsArray[index];
    
    if ([currentAdModel.adUrl isEqualToString:@""]
        || currentAdModel.adUrl.length == 0
        || [currentAdModel.adUrl isEqualToString:@"#"]){
        return;
    }
    
    if ([currentAdModel.adUrl hasPrefix: @"$"]) {
        
        /**
         *  调转详情页
         */
        NSString *goodId = [currentAdModel.adUrl substringWithRange:NSMakeRange(1, currentAdModel.adUrl.length - 1)];
        YBGoodsDeatilImageViewController *detailImageViewController = [YBGoodsDeatilImageViewController creatGoodsDeatilImageViewControllerWithGoodsId:goodId Extend:nil];
        ZJBaseNavigationController *navigationController = [[ZJBaseNavigationController alloc] initWithRootViewController:detailImageViewController];
        detailImageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:navigationController animated:YES completion:^{
            
        }];
        return;
    }
    
    YBActivityWebViewController *activityWebViewController = [[YBActivityWebViewController alloc] init];
    activityWebViewController.adUrl = currentAdModel.adUrl;
    activityWebViewController.adTitle = currentAdModel.adTitle;
    [self.navigationController pushViewController:activityWebViewController animated:YES];
}

#pragma mark <YBGoodListCellDelegate>

/**
 喜欢点击事件
 
 @param goodListCell                goodListCell
 @param sender                      sender
 */
- (void)goodListCell:(YBGoodListCell *)goodListCell button:(UIButton *)sender
{
    /**
     *  获取indexPath
     */
    NSIndexPath *currentIndexPath = [self.collectionView indexPathForCell:goodListCell];
    
    /**
     *  获取数据
     */
    YBGoodListGoodModel *goodListModel = self.goodDataArray[currentIndexPath.item];
    
    /**
     *  判断是否登录。
     *  如果未登录，跳转登录页面
     *  如果登录，发送网络请求
     */
    WEAKSELF(self);
    if ([User_LocalData getTokenId]
        && ![[User_LocalData getTokenId] ex_isEmpty]) {
        
        if (goodListModel.goodListCollectionModel.status) {
            
            /**
             *  发送取消网络请求
             */
            [self.viewModel cancelCollectionWithGoodId:goodListModel.customId
                                  successCallBackBlock:^(id model) {
                                      
                                      goodListModel.goodListCollectionModel.status = NO;
                                      [weakself.collectionView reloadData];
                                      
                                  } failedCallBackBlock:^(id error) {
                                      
                                  }];
        }else{
            
            /**
             *  发送添加喜欢网络请求
             */
            [self.viewModel addCollectionWithGoodId:goodListModel.customId
                               successCallBackBlock:^(id model) {
                                   
                                   goodListModel.goodListCollectionModel.status = YES;
                                   [weakself.collectionView reloadData];
                                   
                               } failedCallBackBlock:^(id error) {
                                   
                               }];
        }
    }else{
        
        /**
         *  登录
         */
    }
    
}

#pragma mark <UICollectionViewDataSource>

/**
 多少组
 
 @param collectionView collectionView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
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
    return self.goodDataArray.count;
}

/**
 自定义cell
 
 @param collectionView collectionView
 @param indexPath      indexPath
 
 @return 自定义样式cell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YBGoodListCell *cell                                            = [collectionView dequeueReusableCellWithReuseIdentifier:YBGoodListControllerGoodCellReuseIdentifier
                                                                                                                forIndexPath:indexPath];
    
    cell.goodModel                                                  = self.goodDataArray[indexPath.item];
    cell.delegate                                                   = self;
    return cell;
}

/**
 HeaderView
 
 @param collectionView  列表
 @param kind            组头组尾标志
 @param indexPath       indexPath
 @return                组头组尾
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        YBGoodListPictureCarouselHeaderView *headerView             = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                                         withReuseIdentifier:YBGoodListControllerPictureCarouselHeaderReuseIdentifier
                                                                                                                forIndexPath:indexPath];
        headerView.adsImageUrlStringArray                           = self.adsImageUrlStrings;
        headerView.adsModelArray                                    = self.adsArray;
        headerView.delegate                                         = self;
        return headerView;
    }
    return nil;
}

#pragma mark <YBWaterflowLayoutDelegate>

/**
 防止崩溃报错
 
 @param height 高度
 */
- (void)returenMaxHeight:(CGFloat)height
{
    
}

/**
 组头高度
 
 @param waterflowLayout             waterflowLayout
 @param indexPath                   indexPath
 @return return                     value
 */
- (CGFloat)collectionViewLayout:(YBGoodListControllerFlowLayout *)waterflowLayout
heightForSupplementaryViewAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.adsArray.count != 0
        && self.adsArray) {
        return ADJUST_PERCENT_FLOAT(150.f);
    }else{
        return ADJUST_PERCENT_FLOAT(0.f);
    }
}

/**
 计算每个item的高度
 
 @param waterflowLayout             布局
 @param indexPath                   当前个数
 @param itemWidth                   宽度
 @return                            高度
 */
- (CGFloat)waterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout
  heightForItemAtIndexPath:(NSIndexPath *)indexPath
                 itemWidth:(CGFloat)itemWidth
{
    /**
     *  计算每个item的高度，图片高度及文字高度
     */
    YBGoodListGoodModel *goodModel                      = self.goodDataArray[indexPath.item >= self.goodDataArray.count ? self.goodDataArray.count - 1 : indexPath.item];
    goodModel.itemWidth                                 = itemWidth;
    return goodModel.itemHeight;
}

/**
 列间距
 
 @param waterflowLayout             布局
 @return                            列间距
 */
- (CGFloat)columnMarginInWaterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout
{
    return 6;
}

/**
 行间距
 
 @param waterflowLayout             布局
 @return                            行间距
 */
- (CGFloat)rowMarginInWaterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout
{
    return 6;
}

/**
 内边距
 
 @param waterflowLayout             布局
 @return                            内边距
 */
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(6,
                            6,
                            6,
                            6);
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  调转详情页
     */
    YBGoodListGoodModel *goodModel                      = self.goodDataArray[indexPath.item];
    YBGoodsDeatilImageViewController *detailImageViewController = [YBGoodsDeatilImageViewController creatGoodsDeatilImageViewControllerWithGoodsId:goodModel.customId Extend:nil];
    ZJBaseNavigationController *navigationController = [[ZJBaseNavigationController alloc] initWithRootViewController:detailImageViewController];
    detailImageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:navigationController animated:YES completion:^{
        
    }];
}

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

#pragma mark <UIScrollViewDelegate>

/**
 滚动监听
 
 @param scrollView scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.customDelegate goodListController:self contentOffSet:scrollView.contentOffset];
}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    if(decelerate){
//        scrollView.decelerationRate = 0.0;
//    }
//    
//}

#pragma mark - Fifth.控制器生命周期

- (instancetype)init
{
    YBGoodListControllerFlowLayout *fl      = [[YBGoodListControllerFlowLayout alloc] init];
    fl.delegate                             = self;
    if (self = [self initWithCollectionViewLayout:fl]) {
        
    }
    return self;
}

/**
 视图加载完毕
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.mj_header                                       = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.collectionView.mj_header.automaticallyChangeAlpha              = YES;
    
    self.collectionView.mj_footer                                       = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    MJRefreshAutoFooter *autoFooter                                     = (MJRefreshAutoFooter *)self.collectionView.mj_footer;
    autoFooter.triggerAutomaticallyRefreshPercent                       = -300;
    self.collectionView.mj_footer.automaticallyChangeAlpha              = YES;
    self.collectionView.contentInset                                    = UIEdgeInsetsMake(0, 0, ADJUST_PERCENT_FLOAT(100), 0);
    
    self.collectionView.backgroundColor     = ZJCOLOR.color_c12;
    [self registerViews];
    
    self.refreshFalg = YES;
}

#pragma mark - Sixth.界面配置

/**
 Register
 */
- (void)registerViews
{
    [self.collectionView registerClass:[YBGoodListCell class]
            forCellWithReuseIdentifier:YBGoodListControllerGoodCellReuseIdentifier];
    [self.collectionView registerClass:[YBGoodListPictureCarouselHeaderView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:YBGoodListControllerPictureCarouselHeaderReuseIdentifier];
}

#pragma mark - Seventh.懒加载

#pragma mark - Eight.LoadData

#pragma mark - Eight.LoadData

/**
 刷新当前页面
 */
- (void)refreshCurrentPage
{
    if (![self.collectionView.mj_header isRefreshing]
        && self.collectionView.userInteractionEnabled == YES
        && self.refreshFalg) {
        self.refreshFalg = NO;
        [self.collectionView.mj_header beginRefreshing];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.refreshFalg = YES;
        });
    }
}


@end
