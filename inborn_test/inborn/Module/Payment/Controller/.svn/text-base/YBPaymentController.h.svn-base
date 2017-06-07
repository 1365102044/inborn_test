//
//  YBPaymentController.h
//  inborn
//
//  Created by 郑键 on 17/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTableViewController.h"

@interface YBPaymentController : ZJBaseTableViewController

/**
 初始化手段类型选择控制器

 @param orderId                 订单id
 @param paymentMethod           支付方式
 @param extend                  扩展参数（nil）
 @return                        支付手段控制器
 */
+ (instancetype)paymentControllerWithOrderId:(NSString *)orderId
                               paymentMethod:(ZJProjectPaymentMethod)paymentMethod
                            paymentEventType:(ZJProjectPaymentEventType)paymentEventType
                                      extend:(id)extend;

@end
