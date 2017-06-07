//
//  YBHomePageViewModel.h
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListViewModel.h"

@interface YBHomePageViewModel : YBGoodListViewModel

/**
 排序：price_asc,price_desc,collection_desc,browse_desc
 */
@property (nonatomic, copy) NSString *sort;

/**
 搜索条件
 */
@property (nonatomic, copy) NSString *serach;

/**
 *  获取首页分类数据
 *
 *  @param successCallBack successCallBack
 */
- (void)getHomePageCategoriesSuccess:(ZJViewModelCallBackSuccessBlock)successCallBack
                     failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;
;

/**
 *  获取标签对应商品列表
 *
 *  @param tabId               标签id（必传）
 *  @param curPage             页码（必传）
 *  @param sort                排序price_asc,price_desc,collection_desc,browse_desc（非必传）
 *  @param search              搜索条件（非必传）
 *  @param successCallBack successCallBack
 */
- (void)getCategoryGoodListWithTabId:(NSString *)tabId
                             curPage:(NSString *)curPage
                                sort:(NSString *)sort
                              search:(NSString *)search
                             success:(ZJViewModelCallBackSuccessBlock)successCallBack
                          faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

@end
