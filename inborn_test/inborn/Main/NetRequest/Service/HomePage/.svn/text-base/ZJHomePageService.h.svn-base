//
//  ZJHomePageService.h
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface ZJHomePageService : ZJBaseService

/**
 *  获取首页分类
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getHomePageCategoriesSuccess:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消首页分类网络请求
 */
- (void)cancelGetHomePageCategoriesNetRequest;

/**
 *  获取标签对应商品列表
 *
 *  @param tabId               标签id（必传）
 *  @param curPage             页码（必传）
 *  @param sort                排序price_asc,price_desc,collection_desc,browse_desc（非必传）
 *  @param search              搜索条件（非必传）
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getCategoryGoodListWithTabId:(NSString *)tabId
                             curPage:(NSString *)curPage
                                sort:(NSString *)sort
                              search:(NSString *)search
                             success:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消分类商品列表网络请求
 */
- (void)cancelGetCategoryGoodListNetRequest;

/**
 *  获取公共配置数据
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getpublicConfigureInformationSuccess:(ZJNetRequestSuccessBlock)successBlock
                                        fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消获取公共配置数据网络请求
 */
- (void)cancelgetpublicInformationNetRequest;

/**
 *  根据商品的id查看商品是否已经添加到收藏
 *
 *  @param goodsId                 一组商品的id的字符串id1_id2_id3
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)isAddCollectionWithGoodsId:(NSString *)goodsId
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消根据商品的id查看商品是否已经添加到收藏网络请求
 */
- (void)cancelIsAddCollectionNetRequest;

/**
 *  添加收藏
 *
 *  @param goodId                  一组商品的id的字符
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)addCollectionWithGoodId:(NSString *)goodId
                        success:(ZJNetRequestSuccessBlock)successBlock
                           fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消添加收藏网络请求
 */
- (void)cancelAddCollectionNetRequest;

/**
 *  取消收藏
 *
 *  @param goodId                  一组商品的id的字符
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)cancelCollectionWithGoodId:(NSString *)goodId
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消取消收藏网络请求
 */
- (void)cancelCancelCollectionNetRequest;

/**
 *  版本控制
 *
 *  @param currentAppVersion       一组商品的id的字符
 *  @param appType                 渠道 1.iOS
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)checkVersionWithCurrentAppVersion:(NSString *)currentAppVersion
                                  appType:(NSString *)appType
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消版本控制网络请求
 */
- (void)cancelCheckVersionNetRequest;

@end
