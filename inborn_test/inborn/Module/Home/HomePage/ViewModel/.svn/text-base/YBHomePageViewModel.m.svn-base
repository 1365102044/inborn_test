//
//  YBHomePageViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBHomePageViewModel.h"
#import "ZJHomePageService.h"
#import "User_LocalData.h"

@interface YBHomePageViewModel()

/**
 保存商品id的拼接字符串，用于二次请求用户喜欢数据
 */
@property (nonatomic, copy) NSString *goodIds;

@end

@implementation YBHomePageViewModel

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
                          faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    WEAKSELF(self);
    [[ZJHomePageService share] getCategoryGoodListWithTabId:tabId
                                                    curPage:curPage
                                                       sort:sort
                                                     search:search
                                                    success:^(id objc, id requestInfo) {
                                                        
                                                        [weakself handleRequestObj:objc[@"data"]];
                                                        
                                                        /**
                                                         *  回调
                                                         */
                                                        successCallBack(weakself);
                                                    }
                                                       fail:^(id error, id requestInfo) {
                                                           
                                                           [weakself handleRequestFailed:requestInfo];
                                                           
                                                           failBlock(error);
                                                       }];
}

/**
 *  获取首页分类数据
 *
 *  @param successCallBack successCallBack
 */
- (void)getHomePageCategoriesSuccess:(ZJViewModelCallBackSuccessBlock)successCallBack
                     failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    WEAKSELF(self);
    [[ZJHomePageService share] getHomePageCategoriesSuccess:^(id objc, id requestInfo) {
        
        /**
         *  由于首页加载数据优化，采用不统一的数据格式，所以这里特殊处理
         */
        
        NSDictionary *dict = objc[@"data"];
        [weakself handleRequestObj:dict[@"tabData"]];
        
        /**
         *  分类数据
         */
        NSMutableArray *tempArrayCaterogies = [NSMutableArray array];
        [dict[@"tabs"] enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            [tempArrayCaterogies addObject:[YBGoodListViewCategoriesModel modelWithDictionary: obj]];
        }];
        self.categoriesArray = tempArrayCaterogies.copy;
        
        /**
         *  回调
         */
        successCallBack(weakself);
        
    } fail:^(id error, id requestInfo) {
        
        [weakself handleRequestFailed:error];
        failureCallBack(error);
    }];
}

- (void)handleRequestObj:(id)obj
{
    [super handleRequestObj:obj];
    
    /**
     *  商品数据
     */
    NSMutableArray *tempArrayGoods;
    NSMutableArray *tempArrayGoodIds;
    if ([self.pageDataModel.pageNum isEqualToString:@"1"]) {
        tempArrayGoods          = [NSMutableArray array];
        tempArrayGoodIds        = [NSMutableArray array];
    }else{
        tempArrayGoods          = [NSMutableArray arrayWithArray:self.goodListArray];
        tempArrayGoodIds        = [NSMutableArray arrayWithArray:self.goodIdArray];
    }
    
    [obj[@"goods"] enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
        
        YBGoodListGoodModel *object = [YBGoodListGoodModel modelWithDictionary: obj];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"customId == %@", object.customId];
        NSArray *screenTempArray = [tempArrayGoods filteredArrayUsingPredicate:predicate];
//        YBLog(@"%@\n%@", object.customId,
//              screenTempArray);
        if (screenTempArray.count == 0
            || tempArrayGoods.count == 0
            || !tempArrayGoods) {
            object.currentIndex = tempArrayGoods.count;
            [tempArrayGoods addObject:object];
        }else{
            [tempArrayGoods replaceObjectAtIndex:[screenTempArray.firstObject currentIndex] withObject:object];
        }
        
        /**
         *  用于后期请求喜欢
         */
//        [tempArrayGoodIds addObject:obj[@"id"]];
    }];
    
    self.goodListArray          = tempArrayGoods.copy;
    self.goodIdArray            = tempArrayGoodIds.copy;
    
    /**
     *  查询物品喜欢状态
     */
    if ([User_LocalData getTokenId]
        && ![[User_LocalData getTokenId] ex_isEmpty]) {
        [self checkGoodLikeWithGoodIdsArray:self.goodIdArray];
    }
    
    /**
     *  广告数据
     */
    NSMutableArray *tempArrayAds = [NSMutableArray array];
    [obj[@"ads"] enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                              NSUInteger idx,
                                              BOOL * _Nonnull stop) {
        [tempArrayAds addObject:[YBGoodListAdsModel modelWithDictionary: obj]];
    }];
    self.adsArray = tempArrayAds.copy;
}

- (void)handleRequestFailed:(NSError *)error
{
    [super handleRequestFailed:error];
}

/**
 查看用户是否喜欢当前物品
 
 @param goodIdsArray goodIdsArray
 */
- (void)checkGoodLikeWithGoodIdsArray:(NSArray *)goodIdsArray
{
//    __block NSString *goodIds = @"";
//    [goodIdsArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([[NSString stringWithFormat:@"%@", goodIds] ex_isEmpty]) {
//            goodIds = obj;
//        }else{
//            goodIds = [NSString stringWithFormat:@"%@_%@", goodIds, obj];
//        }
//    }];
//    
//    /**
//     *  发送网络请求
//     */
//    [[ZJHomePageService share] isAddCollectionWithGoodsId:goodIds
//                                                  success:^(id objc, id requestInfo) {
//                                                      YBLog(@"%@\n%@", objc, requestInfo);
//                                                      
//                                                      [self.goodListArray enumerateObjectsUsingBlock:^(YBGoodListGoodModel * _Nonnull obj,
//                                                                                                       NSUInteger idx,
//                                                                                                       BOOL * _Nonnull stop) {
//                                                          @try {
//                                                              NSDictionary *dict = objc[@"data"][idx];
//                                                              obj.goodListCollectionModel = [YBGoodListCollectionModel modelWithDictionary:dict];
//                                                              YBLog(@"%@\n%@", obj.goodListCollectionModel, dict);
//                                                          } @catch (NSException *exception) {
//                                                              YBLog(@"%@", exception);
//                                                          } @finally {
//                                                              
//                                                          }
//                                                      }];
//                                                      
//                                                      /**
//                                                       *  发送通知，通知cell更新
//                                                       */
//                                                      [SYSTEM_NOTIFICATIONCENTER postNotificationName:PUBLIC_GOODLISTCOLLECTION_NOTIFICATION object:nil userInfo:nil];
//                                                      
//                                                  } fail:^(id error, id requestInfo) {
//                                                      YBLog(@"%@\n%@", error, requestInfo);
//                                                  }];
}

@end
