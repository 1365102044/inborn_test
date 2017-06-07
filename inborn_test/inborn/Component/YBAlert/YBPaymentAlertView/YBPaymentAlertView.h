//
//  YBPaymentAlertView.h
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseAlert.h"
@class YBOrderModel;
@class YBPaymentServiceSignModel;
@class YBBankCardModel;
@class YBPaymentViewModel;

@interface YBPaymentAlertView : ZJBaseAlert

/**
 显示支付弹窗
 
 @param orderModel                                  订单模型
 @param paymentSingModel                            支付模型
 @param paymentViewModel                            支付视图模型
 @param bankCardModelArray                          银行卡列表数组
 @param eventCallBackBlock                          点击事件回调
 */
- (void)showAlertWithOrderModel:(YBOrderModel *)orderModel
               paymentSingModel:(YBPaymentServiceSignModel *)paymentSingModel
               paymentViewModel:(YBPaymentViewModel *)paymentViewModel
             bankCardModelArray:(NSArray *)bankCardModelArray
             eventCallBackBlock:(ZJEventCallBackBlock)eventCallBackBlock;

/**
 开始倒计时
 */
- (void)startCountDonw;

/**
 隐藏弹窗
 */
- (void)hiddenAlert;

@end
