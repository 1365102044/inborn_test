//
//  YBMyComposedViewModel.m
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMyComposedViewModel.h"
#import "YBComposeService.h"

@interface YBMyComposedViewModel()

@end

@implementation YBMyComposedViewModel

/**
 倒计时
 */
- (void)countDown
{
    [self.composeListArray enumerateObjectsUsingBlock:^(YBGoodModel *  _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
        obj.surplusBidTime -= 1;
    }];
    
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:COMPOSE_LISTCOUNTDOWN_NOTIFICATION object:nil userInfo:nil];
}

/**
 加载发布列表数据
 
 @param curPage                     当前页
 @param pageSize                    页面大小
 @param goodsType                   商品类型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)composeListWithCurPage:(NSString *)curPage
                      pageSize:(NSString *)pageSize
                     goodsType:(NSString *)goodsType
          successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
               failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBComposeService share] composeListWithCurPage:curPage
                                            pageSize:pageSize
                                           goodsType:goodsType
                                             success:^(id objc, id requestInfo) {
                                                 YBLog(@"%@\n%@", objc, requestInfo);
                                                 [self handleRequestObj:objc[@"data"]];
                                                 successCallBackBlock(self);
                                                 
                                             } fail:^(id error, id requestInfo) {
                                                 YBLog(@"%@\n%@", error, requestInfo);
                                                 failureCallBack(error);
                                                 
                                             }];
}

/**
 配置当前页面数据
 
 @param obj obj(包装后的数据)
 */
- (void)handleRequestObj:(id)obj
{
    /**
     *  适配项目中不同分页参数
     */
    [super handleRequestObj:@{@"pageData":obj}];
    
    NSMutableArray *tempComposeListArray;
    
    if ([self.pageDataModel.curPage isEqualToString:@"1"]) {
        tempComposeListArray = [NSMutableArray array];
    }else{
        tempComposeListArray = [NSMutableArray arrayWithArray:self.composeListArray];
    }
    
    [obj[@"data"] enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                               NSUInteger idx,
                                               BOOL * _Nonnull stop) {
        YBGoodModel *goodModel = [YBGoodModel modelWithDictionary:obj];
        goodModel.surplusBidTime = goodModel.payCountdown.doubleValue / 1000;
        [tempComposeListArray addObject:goodModel];
    }];
    
    self.composeListArray = tempComposeListArray.copy;
}

/**
 删除发布商品
 
 @param goodModel                   商品模型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)delGoodWithGoodsModel:(YBGoodModel *)goodModel
         successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
              failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBComposeService share] delGoodWithGoodsId:goodModel.customId
                                         success:^(id objc, id requestInfo) {
                                             
                                             NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.composeListArray];
                                             [tempArray removeObject:goodModel];
                                             self.composeListArray = tempArray.copy;
                                             successCallBackBlock(nil);
                                             
                                         } fail:^(id error, id requestInfo) {
                                             failureCallBack(error);
                                         }];
}

/**
 商品下架
 
 @param goodModel                   商品模型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)offShelveWithGoodsModel:(YBGoodModel *)goodModel
           successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBComposeService share] offShelveWithGoodsId:goodModel.customId
                                           success:^(id objc, id requestInfo) {
                                               NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.composeListArray];
                                               [tempArray removeObject:goodModel];
                                               self.composeListArray = tempArray.copy;
                                               successCallBackBlock(nil);
                                           } fail:^(id error, id requestInfo) {
                                               
                                           }];
}

/**
 商品重新上架
 
 @param goodModel                   商品模型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)refreshShelveWithGoodsModel:(YBGoodModel *)goodModel
               successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                    failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBComposeService share] refreshShelveWithGoodsId:goodModel.customId
                                               success:^(id objc, id requestInfo) {
                                                   
                                                   NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.composeListArray];
                                                   [tempArray removeObject:goodModel];
                                                   self.composeListArray = tempArray.copy;
                                                   successCallBackBlock(nil);
                                                   
                                               } fail:^(id error, id requestInfo) {
                                                   failureCallBack(error);
                                               }];
}

/**
 商品延期
 
 @param goodModel                   商品模型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)refreshGoodTimeWithGoodsModel:(YBGoodModel *)goodModel
                 successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                      failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBComposeService share] refreshGoodTimeWithGoodsId:goodModel.customId
                                                 success:^(id objc, id requestInfo) {
                                                     successCallBackBlock(nil);
                                                 } fail:^(id error, id requestInfo) {
                                                     failureCallBack(error);
                                                 }];
}

/**
 查询单个商品
 
 @param goodModel                   商品模型
 @param currentIndexPath            位置
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)queryGoodsWithGoodsModel:(YBGoodModel *)goodModel
                currentIndexpath:(NSIndexPath *)currentIndexPath
            successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                 failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBComposeService share] queryGoodsWithGoodsId:goodModel.customId
                                            success:^(id objc, id requestInfo) {
                                                successCallBackBlock(nil);
                                                
                                                YBGoodModel *tempGoodModel = [YBGoodModel modelWithDictionary:objc[@"data"]];
                                                NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.composeListArray];
                                                [tempArray replaceObjectAtIndex:currentIndexPath.row withObject:tempGoodModel];
                                                self.composeListArray = tempArray.copy;
                                                
                                            } fail:^(id error, id requestInfo) {
                                                failureCallBack(error);
                                            }];
}

@end
