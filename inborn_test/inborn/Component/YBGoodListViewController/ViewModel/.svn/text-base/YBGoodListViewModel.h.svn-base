//
//  YBGoodListViewModel.h
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewModel.h"
#import "YBGoodListViewCategoriesModel.h"
#import "YBGoodListGoodModel.h"
#import "YBGoodListAdsModel.h"

@interface YBGoodListViewModel : ZJBaseViewModel

/**
 组数
 */
@property (nonatomic, assign) NSInteger sectionCount;

/**
 广告轮播
 */
@property (nonatomic, strong) NSArray<YBGoodListAdsModel *> *adsArray;

/**
 广告轮播urlStrings
 */
@property (nonatomic, strong) NSArray<NSString *> *adsImageUrlStrings;

/**
 商品数据
 */
@property (nonatomic, strong) NSArray<YBGoodListGoodModel *> *goodListArray;

/**
 商品编号数组
 */
@property (nonatomic, strong) NSArray<NSString *> *goodIdArray;

/**
 分类数据
 */
@property (nonatomic, strong) NSArray<YBGoodListViewCategoriesModel *> *categoriesArray;

/**
 分类类目对应的商品列表
 */
@property (nonatomic, strong) NSArray *totalGoodListArray;

/**
 添加喜欢
 
 @param goodId                      goodId
 @param successCallBackBlock        successCallBackBlock
 @param failedCallBackBlock         failedCallBackBlock
 */
- (void)addCollectionWithGoodId:(NSString *)goodId
           successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
            failedCallBackBlock:(ZJViewModelCallBackFailureBlock)failedCallBackBlock;

/**
 取消喜欢
 
 @param goodId                      goodId
 @param successCallBackBlock        successCallBackBlock
 @param failedCallBackBlock         failedCallBackBlock
 */
- (void)cancelCollectionWithGoodId:(NSString *)goodId
              successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
               failedCallBackBlock:(ZJViewModelCallBackFailureBlock)failedCallBackBlock;

@end
