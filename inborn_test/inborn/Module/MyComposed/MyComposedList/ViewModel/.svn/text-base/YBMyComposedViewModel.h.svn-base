//
//  YBMyComposedViewModel.h
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewModel.h"
#import "YBGoodModel.h"

@interface YBMyComposedViewModel : ZJBaseViewModel

/**
 数据数组
 */
@property (nonatomic, strong) NSArray<YBGoodModel *> *composeListArray;

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
               failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 删除发布商品
 
 @param goodModel                   商品模型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)delGoodWithGoodsModel:(YBGoodModel *)goodModel
         successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
              failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 商品下架
 
 @param goodModel                   商品模型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)offShelveWithGoodsModel:(YBGoodModel *)goodModel
           successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 商品重新上架
 
 @param goodModel                   商品模型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)refreshShelveWithGoodsModel:(YBGoodModel *)goodModel
               successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                    failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 商品延期
 
 @param goodModel                   商品模型
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)refreshGoodTimeWithGoodsModel:(YBGoodModel *)goodModel
                 successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                      failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

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
                 failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 倒计时
 */
- (void)countDown;

@end
