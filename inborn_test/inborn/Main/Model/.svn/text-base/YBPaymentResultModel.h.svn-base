//
//  YBPaymentResultModel.h
//  inborn
//
//  Created by 郑键 on 17/4/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

@interface YBPaymentResultModel : ZJBaseModel

/**
 返回结果，SUCCESS成功，FAIL表示失败，ORDERNOTEXIST表示未支付取消（支付宝），NOTPAY表示未支付取消（微信）
 */
@property (nonatomic, copy) NSString *paymentResult;

/**
 本次支付金额
 */
@property (nonatomic, copy) NSString *payAmt;

/**
 订单编号
 */
@property (nonatomic, copy) NSString *orderId;

/**
 订单剩余支付金额
 */
@property (nonatomic, copy) NSString *orderPayAmount;

/**
 是否支付定金
 */
@property (nonatomic, copy) NSString *isDepositPay;

/**
 显示状态：1全款成功，2分笔支付一次，3分笔支付最后一次，4定金支付成功，5定金尾款支付一次，6定金尾款支付最后一次
 */
@property (nonatomic, copy) NSString *showStatus;

@end
