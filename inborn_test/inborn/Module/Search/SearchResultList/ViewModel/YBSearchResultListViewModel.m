//
//  YBSearchResultListViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSearchResultListViewModel.h"
#import "ZJSearchService.h"
#import "ZJHomePageService.h"
#import "User_LocalData.h"

@implementation YBSearchResultListViewModel

/**
 *  根据条件搜索商品（方法内部配置页面发小）
 *
 *  @param key                     搜索的关键词
 *  @param orderByFiled            1综合排序 2热度 3喜欢 4价格 5商户自营
 *  @param orderByType             1为升序ASC 2为降序DESC
 *  @param curPage                 当前页
 *  @param successCallBack successCallBack
 */
- (void)searchCategoryGoodListWithKey:(NSString *)key
                         orderByFiled:(NSString *)orderByFiled
                          orderByType:(NSString *)orderByType
                              curPage:(NSString *)curPage
                              success:(ZJViewModelCallBackSuccessBlock)successCallBack
                           faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    /**
     *  记录搜索数据
     */
    self.orderByFiled = orderByFiled;
    self.orderByType = orderByType;
    self.key = key;
    
    WEAKSELF(self);
    [[ZJSearchService share] searchCategoryGoodListWithKey:key
                                              orderByFiled:orderByFiled
                                               orderByType:orderByType
                                                   curPage:curPage
                                                   success:^(id objc, id requestInfo) {
                                                       
                                                       [weakself handleRequestObj:objc[@"data"]];
                                                       
                                                       /**
                                                        *  回调
                                                        */
                                                       successCallBack(weakself);
                                                       
                                                   } fail:^(id error, id requestInfo) {
                                                       
                                                       [weakself handleRequestFailed:requestInfo];
                                                       
                                                       failBlock(error);
                                                       
                                                   }];
    
}

- (void)handleRequestObj:(id)obj
{
    [super handleRequestObj:@{@"pageData":obj}];
    
    /**
     *  商品数据
     */
    NSMutableArray *tempArrayGoods;
    NSMutableArray *tempArrayGoodIds;
    if ([self.pageDataModel.pageNum isEqualToString:@"1"]) {
        tempArrayGoods = [NSMutableArray array];
        tempArrayGoodIds        = [NSMutableArray array];
    }else{
        tempArrayGoods = [NSMutableArray arrayWithArray:self.goodListArray];
        tempArrayGoodIds        = [NSMutableArray arrayWithArray:self.goodIdArray];
    }
    
    [obj[@"pageData"] enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        
        YBGoodListGoodModel *object = [YBGoodListGoodModel modelWithDictionary: obj];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"customId == %@", object.customId];
        NSArray *screenTempArray = [tempArrayGoods filteredArrayUsingPredicate:predicate];
        YBLog(@"%@\n%@", object.customId,
              screenTempArray);
        if (screenTempArray.count == 0
            || tempArrayGoods.count == 0
            || !tempArrayGoods) {
            object.currentIndex = tempArrayGoods.count;
            [tempArrayGoods addObject:object];
        }else{
            [tempArrayGoods replaceObjectAtIndex:[screenTempArray.firstObject currentIndex] withObject:object];
        }
    }];
    self.goodListArray = tempArrayGoods.copy;
    self.goodIdArray            = tempArrayGoodIds.copy;
    
    /**
     *  查询物品喜欢状态
     */
    if ([User_LocalData getTokenId]
        && ![[User_LocalData getTokenId] ex_isEmpty]) {
        [self checkGoodLikeWithGoodIdsArray:self.goodIdArray];
    }
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
    __block NSString *goodIds = @"";
    [goodIdsArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([[NSString stringWithFormat:@"%@", goodIds] ex_isEmpty]) {
            goodIds = obj;
        }else{
            goodIds = [NSString stringWithFormat:@"%@_%@", goodIds, obj];
        }
    }];
    
    /**
     *  发送网络请求
     */
    [[ZJHomePageService share] isAddCollectionWithGoodsId:goodIds
                                                  success:^(id objc, id requestInfo) {
                                                      YBLog(@"%@\n%@", objc, requestInfo);
                                                      
                                                      [self.goodListArray enumerateObjectsUsingBlock:^(YBGoodListGoodModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                                          obj.goodListCollectionModel = [YBGoodListCollectionModel modelWithDictionary:objc[@"data"]];
                                                      }];
                                                      
                                                      /**
                                                       *  发送通知，通知cell更新
                                                       */
                                                      [SYSTEM_NOTIFICATIONCENTER postNotificationName:PUBLIC_GOODLISTCOLLECTION_NOTIFICATION object:nil userInfo:nil];
                                                      
                                                  } fail:^(id error, id requestInfo) {
                                                      YBLog(@"%@\n%@", error, requestInfo);
                                                  }];
}


@end
