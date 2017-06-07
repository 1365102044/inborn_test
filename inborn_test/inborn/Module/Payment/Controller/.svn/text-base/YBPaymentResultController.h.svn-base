//
//  YBPaymentResultController.h
//  inborn
//
//  Created by 郑键 on 17/4/11.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"
#import "YBOrderModel.h"

typedef NS_ENUM(NSUInteger, YBPaymentResultControllerType) {
    YBPaymentResultControllerDefault,
    YBPaymentResultControllerAll,
    YBPaymentResultControllerDeposit,
    YBPaymentResultControllerPen,
    YBPaymentResultControllerError,
    YBPaymentResultControllerDepositBalance_All,
    YBPaymentResultControllerDepositBalance_Part,
};

@interface YBPaymentResultController : ZJBaseViewController

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *paymentId;

/**
 初始化支付结果控制器

 @param type                    type
 @param orderModel              orderModel
 @param paymentEventType        paymentEventType
 @param extend                  extend
 @return                        支付结果控制器
 */
+ (instancetype)paymentResultControllerWithType:(YBPaymentResultControllerType)type
                                     orderModel:(YBOrderModel *)orderModel
                               paymentEventType:(ZJProjectPaymentEventType)paymentEventType
                                         extend:(id)extend;

@end
