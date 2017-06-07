//
//  YBGoodListController.h
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewController.h"
@class YBGoodListController;
@class YBGoodListViewCategoriesModel;
@class YBGoodListViewModel;

@protocol YBGoodListControllerDelegate <NSObject>

/**
 滚动回调，用于处理Navigationbar、筛选视图、tabBar、主视图右下角功能按钮

 @param goodListController              商品列表视图
 @param contentOffset                   偏移量
 */
- (void)goodListController:(YBGoodListController *)goodListController
             contentOffSet:(CGPoint)contentOffset;

@end

@interface YBGoodListController : ZJBaseCollectionViewController

/**
 视图模型
 */
@property (nonatomic, strong) YBGoodListViewModel *viewModel;

/**
 代理
 */
@property (nonatomic, weak) id<YBGoodListControllerDelegate> customDelegate;

/**
 当前的分类
 */
@property (nonatomic, strong) YBGoodListViewCategoriesModel *categoriesModel;

/**
 数据数组
 */
@property (nonatomic, strong) NSArray *goodDataArray;

/**
 广告数据
 */
@property (nonatomic, strong) NSArray *adsArray;

/**
 广告图片url数组
 */
@property (nonatomic, strong) NSArray *adsImageUrlStrings;

/**
 获取数据
 */
@property (nonatomic, assign) BOOL getNewData;

/**
 刷新当前页面
 */
- (void)refreshCurrentPage;

@end
