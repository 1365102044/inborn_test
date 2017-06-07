//
//  YBGoodListViewController.h
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"
#import "YBGoodListViewCategoriesController.h"
#import "ZJBaseScrollView.h"
#import "YBGoodListController.h"
@class YBGoodListViewModel;

/**
 *  顶部分类选择器高度
 */
static CGFloat goodListCategoriesViewHeight                    = 101.f;

/**
 *  顶部分类选择器变为条件选择器后高度
 */
static CGFloat goodListConditionalScreeningViewHeight          = 44.f;

/**
 * 不展示顶部分类选择器
 */
static CGFloat goodListNoCategoriesViewHeight                   = 0.f;

@interface YBGoodListViewController : ZJBaseViewController <YBGoodListControllerDelegate>

/**
 catrgoriesController
 */
@property (nonatomic, strong) YBGoodListViewCategoriesController *categoriesController;

/**
 当前scrollView滚动的偏移量
 */
@property (nonatomic, assign) CGFloat currentOffsetY;

/**
 contentView
 */
@property (nonatomic, strong) ZJBaseScrollView *contentScrollView;

/**
 goodListControllersArray
 */
@property (nonatomic, strong) NSMutableArray *goodListControllersArray;

/**
 translucentBgView，自定义的导航栏，子类需要从新添加按钮并自己布局
 */
@property (nonatomic, strong) ZJBaseView *translucentBgView;


/**
 配置Navigation
 */
- (void)setupCustomNavigation;

/**
 配置界面
 */
- (void)setupCustomUI;

/**
 改变Navigaion头部控件的alpha
 
 @param alpha 0~1.0
 */
- (void)changeNavigationSubViewsAlpha:(CGFloat)alpha;

/**
 配置底部商品列表控制器

 @param scrollView 容器视图
 */
- (void)setupSubGoodListControllersWithScrollView:(UIScrollView *)scrollView;

/**
 当前商品控制器指定
 */
- (void)toTopCurrentGoodListController;

/**
 获取当前界面新数据
 */
- (void)refreshCurrentGoodsData;

@end
