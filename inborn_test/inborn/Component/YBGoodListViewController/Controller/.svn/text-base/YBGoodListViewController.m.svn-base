//
//  YBGoodListViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListViewController.h"
#import "ZJBaseBarButtonItem.h"
#import "YBGoodListViewModel.h"
#import "YBSearchBarView.h"
#import "YBSelectedListAlert.h"
#import "YBSelectedListAlertModel.h"
#import "YBGoodListViewCategoriesConditionalScreeningCell.h"
#import "YBRightImageButton.h"
#import "YBHomePageGoodListController.h"
#import "YBSearchResultListController.h"
#import "YBHomePageController.h"

@interface YBGoodListViewController () <UIScrollViewDelegate, YBGoodListViewCategoriesControllerDelegate>

/**
 视图模型
 */
@property (nonatomic, strong) YBGoodListViewModel *goodListViewModel;

/**
 筛选视图数据
 */
@property (nonatomic, strong) NSArray *selectedAlertModelArray;

@end

@implementation YBGoodListViewController

#pragma mark - Zero.Const

#pragma mark - First.通知

/**
 通知监听条件筛选
 
 @param no no
 */
- (void)conditionalScreenButtonClick:(NSNotification *)no
{
    /**
     *  判断按钮tag
     *  1001-综合排序
     *  1002-商户自营
     *  1003-价格筛选
     *  1004-筛选
     */
    YBLog(@"%@", no.userInfo);
    
    NSDictionary *dict                                  = no.userInfo;
    YBRightImageButton *button                          = dict[@"button"];
    
    /**
     *  0-默认（无）
     *  1-升序
     *  2-降序
     */
    NSString *priceType                                 = dict[@"priceType"];
    
    /**
     *  获取cell
     */
    __weak YBGoodListViewCategoriesConditionalScreeningCell *conditionalScreeningCell = dict[@"cell"];
    
    if (button.tag == 1001) {
        
        /**
         *  弹出综合筛选视图
         *  STATUS_BAR_HEIGHT + ADJUST_PERCENT_FLOAT(44.f)
         */
        WEAKSELF(self);
        YBLog(@"%f", CGRectGetMaxY(self.categoriesController.collectionView.frame));
        [[YBSelectedListAlert sharedAlert] showAlertWithAlertModelArray:self.selectedAlertModelArray
                                                              topMargin:CGRectGetMaxY(self.categoriesController.collectionView.frame)
                                                     eventCallBackBlock:^(id sender) {
                                                         YBLog(@"%@", sender);
                                                         
                                                         /**
                                                          *  选中条件/或取消选中回调，根据条件发起网络请求，并关闭选中状态
                                                          */
                                                         conditionalScreeningCell.resetButtonStatus = YES;
                                                         [conditionalScreeningCell setSelectedConditional:ZJSTRING(@"综合排序")];
                                                         
                                                         /**
                                                          *  如果为空，则不发送网络请求
                                                          */
                                                         if (!sender) return;
                                                         
                                                         YBSelectedListAlertModel *model = (YBSelectedListAlertModel *)sender;
                                                         
                                                         /**
                                                          *  修改选中条件的文字
                                                          */
                                                         [conditionalScreeningCell setSelectedConditional:model.titleString];
                                                         
                                                         /**
                                                          *  取出当前控制器，并调用加载数据方法
                                                          */
                                                         NSInteger index                        = self.contentScrollView.contentOffset.x / self.view.width;
                                                         YBGoodListController *listController   = weakself.goodListControllersArray[index >= self.goodListControllersArray.count - 1 ? self.goodListControllersArray.count - 1 : index];
                                                         
                                                         /**
                                                          *  判断不同控制器调用不同方法
                                                          */
                                                         if ([listController isKindOfClass:[YBHomePageGoodListController class]]) {
                                                             
                                                             YBHomePageGoodListController *homePageGoodListController = (YBHomePageGoodListController *)listController;
                                                             
                                                             [homePageGoodListController searchDataWithSort:model.sort
                                                                                                     search:@"jsonString"
                                                                                                    curPage:@"1"];
                                                         }
                                                         
                                                         if ([listController isKindOfClass:[YBSearchResultListController class]]) {
                                                             
                                                             YBSearchResultListController *searchResultController = (YBSearchResultListController *)listController;
                                                             
                                                             [searchResultController searchDataWithKey:nil
                                                                                          orderByFiled:model.orderByFiled
                                                                                           orderByType:@"2"
                                                                                               curPage:@"1"];
                                                         }
                                                     }];
        
    }else if (button.tag == 1002) {
        
        /**
         *  暂未开放
         */
        
    }else if (button.tag == 1003) {
        
        /**
         *  价格筛选
         */
        
        /**
         *  取出当前控制器，并调用加载数据方法
         */
        NSInteger index                        = self.contentScrollView.contentOffset.x / self.view.width;
        YBGoodListController *listController   = self.goodListControllersArray[index >= self.goodListControllersArray.count - 1 ? self.goodListControllersArray.count - 1 : index];
        
        /**
         *  判断不同控制器调用不同方法
         */
        if ([listController isKindOfClass:[YBHomePageGoodListController class]]) {
            
            NSString *sort;
            NSString *search;
            if ([priceType isEqualToString:@"0"]) {
                sort = @"browse_desc";
            }
            
            if ([priceType isEqualToString:@"1"]) {
                sort = @"price_asc";
            }
            
            if ([priceType isEqualToString:@"2"]) {
                sort = @"price_desc";
            }
            
            YBHomePageGoodListController *homePageGoodListController = (YBHomePageGoodListController *)listController;
            [homePageGoodListController searchDataWithSort:sort
                                                    search:search
                                                   curPage:@"1"];
        }
        
        if ([listController isKindOfClass:[YBSearchResultListController class]]) {
            
            NSString *orderByType;
            NSString *orderByFiled;
            if ([priceType isEqualToString:@"0"]) {
                orderByType = @"2";
                orderByFiled = @"1";
            }
            
            if ([priceType isEqualToString:@"1"]) {
                orderByType = @"1";
                orderByFiled = @"4";
            }
            
            if ([priceType isEqualToString:@"2"]) {
                orderByType = @"2";
                orderByFiled = @"4";
            }
            
            YBSearchResultListController *searchResultController = (YBSearchResultListController *)listController;
            [searchResultController searchDataWithKey:nil
                                         orderByFiled:orderByFiled
                                          orderByType:orderByType
                                              curPage:@"1"];
        }
        
    }else if (button.tag == 1004) {
        
        /**
         *  暂未开放
         */
    }
}

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark <YBGoodListViewCategoriesControllerDelegate>

/**
 商品分类点击回调
 
 @param goodListViewCategoriesController    goodListViewCategoriesController
 @param indexPath                           indexPath
 */
- (void)goodListViewCategoriesController:(YBGoodListViewCategoriesController *)goodListViewCategoriesController
                               indexPath:(NSIndexPath *)indexPath
{
    /**
     *  滚动底部视图
     */
    [self.contentScrollView setContentOffset:CGPointMake(indexPath.item * self.view.width, 0)
                                    animated:YES];
    
    /**
     *  滚动分类视图，让选中居中
     */
    [self setupSubGoodListControllersWithScrollView:self.contentScrollView];
}

#pragma mark <YBGoodListControllerDelegate>

- (void)goodListController:(YBGoodListController *)goodListController
             contentOffSet:(CGPoint)contentOffset
{
    
}

/**
 改变Navigaion头部控件的alpha
 
 @param alpha 0~1.0
 */
- (void)changeNavigationSubViewsAlpha:(CGFloat)alpha
{
    [self.translucentBgView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj,
                                                                  NSUInteger idx,
                                                                  BOOL * _Nonnull stop) {
        obj.alpha = alpha;
    }];
}

#pragma mark <UIScrollViewDelegate>

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self setupSubGoodListControllersWithScrollView:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)setupSubGoodListControllersWithScrollView:(UIScrollView *)scrollView
{
    if (self.goodListControllersArray.count != 0) {
        
        /**
         *  获取当前索引
         */
        NSInteger index                             = scrollView.contentOffset.x / self.view.width;
        
        /**
         *  从子控制器数组取出子控制器
         */
        YBGoodListController *vc                    = self.goodListControllersArray[index >= self.goodListControllersArray.count - 1 ? self.goodListControllersArray.count - 1 : index];
        vc.collectionView.ex_x                      = scrollView.contentOffset.x;
        vc.collectionView.height                    = scrollView.height;
        vc.collectionView.width                     = scrollView.width;
        vc.collectionView.ex_y                      = scrollView.ex_y;
        if ([self isKindOfClass:[YBHomePageController class]]) {
            vc.collectionView.contentInset              = UIEdgeInsetsMake((ADJUST_PERCENT_FLOAT(goodListCategoriesViewHeight) + STATUS_AND_NAVIGATION_HEIGHT),
                                                                           vc.collectionView.contentInset.left,
                                                                           vc.collectionView.contentInset.bottom,
                                                                           vc.collectionView.contentInset.right);
            
        }else{
            vc.collectionView.contentInset              = UIEdgeInsetsMake((self.categoriesController.collectionView.height + STATUS_AND_NAVIGATION_HEIGHT),
                                                                           vc.collectionView.contentInset.left,
                                                                           vc.collectionView.contentInset.bottom,
                                                                           vc.collectionView.contentInset.right);
            vc.customDelegate                           = self;
            
        }
        
        vc.customDelegate                           = self;
        vc.getNewData                               = YES;
        [scrollView addSubview:vc.collectionView];
    }
}

#pragma mark - Fifth.控制器生命周期

/**
 控制器初始化视图完毕
 */
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets                       = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /**
     *  隐藏原有NavigationBar
     */
    self.navigationController.navigationBar.hidden                  = YES;
    [self registerNotification];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    /**
     *  隐藏原有NavigationBar
     */
    self.navigationController.navigationBar.hidden                  = NO;
    [self removeNoification];
}

#pragma mark - Sixth.界面配置

/**
 移除通知监听
 */
- (void)removeNoification
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self
                                         name:GOODLIST_CONDITIONALSCREENING_CLICK_NOTIFICATION
                                       object:nil];
}

/**
 注册通知监听
 */
- (void)registerNotification
{
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(conditionalScreenButtonClick:)
                                      name:GOODLIST_CONDITIONALSCREENING_CLICK_NOTIFICATION
                                    object:nil];
}

/**
 配置Navigation
 */
- (void)setupCustomNavigation
{
    
}

/**
 配置UI界面
 */
- (void)setupCustomUI
{
    /**
     *  底部是ScrollView（用于左右切换视图）
     *  顶部CollectionView用户无限轮播及选择分类
     *  底部CollectionView用来瀑布流展示商品（headerView展示活动轮播器）
     *  滑动到指定位置后，右下角出现客服、足记、指定按钮
     */
    [self addChildViewController:self.categoriesController];
    [self.view addSubview:self.categoriesController.collectionView];
    
    /**
     *  背景虚化，实现高斯模糊
     */
    self.categoriesController.collectionView.backgroundColor            = [UIColor clearColor];
    
    [self.view insertSubview:self.translucentBgView
                belowSubview:self.categoriesController.collectionView];
    
    /**
     *  添加高斯模糊背景
     */
    [self.translucentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(0);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.categoriesController.collectionView);
    }];
    
    UIBlurEffect *translucentBgViewblur                                 = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *translucentBgEffectview                         = [[UIVisualEffectView alloc] initWithEffect:translucentBgViewblur];
    [self.view insertSubview:translucentBgEffectview belowSubview:self.translucentBgView];
    [translucentBgEffectview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.translucentBgView);
    }];
}

#pragma mark - Seventh.懒加载

- (NSArray *)selectedAlertModelArray
{
    if (!_selectedAlertModelArray) {
        
        /**
         *  后期数据可以从网络获取
         */
        NSMutableArray *tempArrayM = [NSMutableArray array];
        
        YBSelectedListAlertModel *model = [[YBSelectedListAlertModel alloc] init];
        model.titleString = @"综合排序";
        model.iconImage = ZJCURRENTIMAGE(IMAGEFILEPATH_SCREEN,
                                         @"screen_selected_icon",
                                         ZJProjectLoadImageDefault);
        model.orderByFiled = @"1";
        
        
        YBSelectedListAlertModel *model2 = [[YBSelectedListAlertModel alloc] init];
        model2.titleString = @"热度";
        model2.iconImage = ZJCURRENTIMAGE(IMAGEFILEPATH_SCREEN,
                                          @"screen_selected_icon",
                                          ZJProjectLoadImageDefault);
        model2.sort      = @"collection_desc";
        model2.orderByFiled = @"2";
        
        YBSelectedListAlertModel *model3 = [[YBSelectedListAlertModel alloc] init];
        model3.titleString = @"喜欢";
        model3.iconImage = ZJCURRENTIMAGE(IMAGEFILEPATH_SCREEN,
                                          @"screen_selected_icon",
                                          ZJProjectLoadImageDefault);
        model3.sort      = @"browse_desc";
        model3.orderByFiled = @"3";
        
        [tempArrayM addObject:model];
        [tempArrayM addObject:model2];
        [tempArrayM addObject:model3];
        
        _selectedAlertModelArray = tempArrayM.copy;
    }
    return _selectedAlertModelArray;
}

- (ZJBaseView *)translucentBgView
{
    if (!_translucentBgView) {
        _translucentBgView                                              = [[ZJBaseView alloc] init];
        _translucentBgView.backgroundColor                              = [ZJCOLOR.color_c0 colorWithAlphaComponent:0.9];
    }
    return _translucentBgView;
}

- (CGFloat)currentOffsetY
{
    if (!_currentOffsetY) {
        _currentOffsetY                                                 = CGFLOAT_MIN;
    }
    return _currentOffsetY;
}

- (NSMutableArray *)goodListControllersArray
{
    if (!_goodListControllersArray) {
        _goodListControllersArray                                       = [NSMutableArray array];
    }
    return _goodListControllersArray;
}

- (YBGoodListViewCategoriesController *)categoriesController
{
    if (!_categoriesController) {
        _categoriesController                                           = [[YBGoodListViewCategoriesController alloc] init];
        _categoriesController.customDelegate                            = self;
    }
    return _categoriesController;
}

- (ZJBaseScrollView *)contentScrollView
{
    if (!_contentScrollView) {
        _contentScrollView                                              = [[ZJBaseScrollView alloc] initWithFrame:CGRectMake(0,
                                                                                                                             0,
                                                                                                                             self.view.width,
                                                                                                                             self.view.height)];
        _contentScrollView.delegate                                     = self;
        _contentScrollView.scrollEnabled                                = NO;
    }
    return _contentScrollView;
}

#pragma mark - Eighth.Other

/**
 获取当前界面新数据
 */
- (void)refreshCurrentGoodsData
{
    /**
     *  获取当前索引
     */
    if (self.goodListControllersArray.count == 0) {
        return;
    }
    NSInteger index                             = self.contentScrollView.contentOffset.x / self.view.width;
    YBGoodListController *vc                    = self.goodListControllersArray[index];
    [vc refreshCurrentPage];
}

/**
 当前商品控制器指定
 */
- (void)toTopCurrentGoodListController
{
    /**
     *  获取当前索引
     */
    NSInteger index                             = self.contentScrollView.contentOffset.x / self.view.width;
    
    /**
     *  从子控制器数组取出子控制器
     */
    YBGoodListController *vc                    = self.goodListControllersArray[index];
    
    /**
     *  滚动置顶
     */
    [vc.collectionView scrollToTop];
}

@end
