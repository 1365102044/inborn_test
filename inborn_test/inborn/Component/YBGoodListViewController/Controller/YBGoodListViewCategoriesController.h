//
//  YBGoodListViewCategoriesController.h
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewController.h"
@class YBGoodListViewCategoriesModel;
@class YBGoodListViewCategoriesController;

/**
 当前种类

 - YBGoodListViewDefault:                   默认（默认为分类筛选）
 - YBGoodListViewCategories:                分类筛选
 - YBGoodListViewConditionalScreening:      条件筛选
 */
typedef NS_ENUM(NSUInteger, YBGoodListViewCategoriesType) {
    YBGoodListViewDefault,
    YBGoodListViewCategories,
    YBGoodListViewConditionalScreening,
};

@protocol YBGoodListViewCategoriesControllerDelegate <NSObject>

/**
 商品分类点击

 @param goodListViewCategoriesController    goodListViewCategoriesController
 @param indexPath                           indexPath
 */
- (void)goodListViewCategoriesController:(YBGoodListViewCategoriesController *)goodListViewCategoriesController
                               indexPath:(NSIndexPath *)indexPath;

@end

@interface YBGoodListViewCategoriesController : ZJBaseCollectionViewController

/**
 数据入口(传入商品分类数据)
 */
@property (nonatomic, strong) NSArray *catrgoriesArray;

/**
 告诉当前控制器是什么种类
 */
@property (nonatomic, assign) YBGoodListViewCategoriesType type;

/**
 代理
 */
@property (nonatomic, weak) id<YBGoodListViewCategoriesControllerDelegate> customDelegate;

@end
