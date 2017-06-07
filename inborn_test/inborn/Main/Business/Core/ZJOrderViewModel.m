//
//  ZJOrderViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJOrderViewModel.h"
#import "YBOrderModel.h"

@implementation ZJOrderViewModel

/**
 判断当前订单的支付方式
 
 @param orderModel orderModel
 @return 返回支付方式
 */
- (ZJProjectPaymentMethod)currentPaymentMethodOrderModel:(YBOrderModel *)orderModel
{
    if (orderModel.orderPayType == 1) {
        return ZJProjectPaymentMethodAll;
    }else if (orderModel.orderPayType == 2) {
        return ZJProjectPaymentMethodDeposit;
    }else if (orderModel.orderPayType == 3) {
        return ZJProjectPaymentMethodPen;
    }
    return 0;
}

@end
