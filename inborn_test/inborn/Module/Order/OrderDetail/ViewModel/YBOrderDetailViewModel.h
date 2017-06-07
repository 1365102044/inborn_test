//
//  YBOrderDetailViewModel.h
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJOrderViewModel.h"
#import "YBOrderDetailModel.h"
@class YBAttributedStringLabel;

@interface YBOrderDetailViewModel : ZJOrderViewModel

/**
 当前支付方式
 */
@property (nonatomic, assign) NSInteger orderPayType;

/**
 orderId
 */
@property (nonatomic, copy) NSString *orderId;

/**
 orderModel
 */
@property (nonatomic, strong) YBOrderDetailModel *orderDetailModel;

/**
 数据数组
 */
@property (nonatomic, strong) NSArray<NSDictionary *> *dataArray;

/**
 加载订单详情数据
 
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)loadOrderDetailWithSuccessCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                                failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 取消订单
 
 @param reason                      原因
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)cancelOrderWithReason:(NSString *)reason
         successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
              failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 确认收货
 
 @param successCallBackBlock        successCallBackBlock
 @param failureCallBack             failureCallBack
 */
- (void)confirmOrderSuccessCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                         failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 切换支付方式
 
 @param successCallBackBlock        successCallBackBlock
 @param failureCallBack             failureCallBack
 */
- (void)changePaymentTypeWithPaymentType:(NSString *)paymentType
                    successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                         failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 倒计时时间
 
 @return 返回倒计时字符串
 */
- (NSString *)countDownString;

/**
 配置底部
 
 @param bottomFuncView 配置底部视图
 */
- (void)setupBottomFuncView:(UIView *)bottomFuncView;


@end
