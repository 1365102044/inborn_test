//
//  YBPaymentDeliveryTypeController.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewController.h"
@class YBConfirmOrderViewModel;

/**
 用户选中支付方式及配送方式回调

 @param userDeliveryType    userDeliveryType
 @param paymentMethod       paymentMethod
 */
typedef void(^YBPaymentDeliverTypeControllerCallBack)(NSString *userDeliveryType, ZJProjectPaymentMethod paymentMethod);

@interface YBPaymentDeliveryTypeController : ZJBaseCollectionViewController

/**
 创建配送方式及付款方式控制器
 
 @param deliverType         初始化的配送方式
 @param paymentMethod       初始化的支付方式
 @param callBackBLock       回调
 @return 控制器
 */
+ (instancetype)paymentDeliveryTypeControllerWithDeliveryType:(NSString *)deliverType
                                                paymentMethod:(ZJProjectPaymentMethod)paymentMethod
                                        confirmOrderViewModel:(YBConfirmOrderViewModel *)confirmOrderViewModel
                                                callBackBLock:(YBPaymentDeliverTypeControllerCallBack)callBackBLock;

@end
