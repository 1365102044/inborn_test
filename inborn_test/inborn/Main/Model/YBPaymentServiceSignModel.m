//
//  YBPaymentServiceSignModel.m
//  inborn
//
//  Created by 郑键 on 17/3/31.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentServiceSignModel.h"

@implementation YBPaymentServiceSignModel

- (NSString *)paymentId
{
    if (!_paymentId) {
        _paymentId = _no_order;
    }
    return _paymentId;
}

@end
