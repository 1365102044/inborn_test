//
//  YBRefundModel.m
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRefundModel.h"

@implementation YBRefundModel

- (NSString *)refundStatusStr
{
    if (self.refundStatus==1) {
        
        return @"处理中";
    }else if (self.refundStatus ==2){
        
        return @"处理中";
    }else if (self.refundStatus ==3){
        
        return @"退款成功";
    }else if (self.refundStatus ==4){
        
        return @"退款驳回";
    }
    return  nil;
}

@end

/**
 "buyerId": 232554300032417,
 "createTime": 1491806769000,
 "gatewayDealId": "2017041045798043",
 "id": "20170410144609299_ORD_1_0",
 "isDepositPay": 0,
 "isPartPay": 1,
 "payAmt": 100000,
 "payChannel": 1,
 "payFee": 0,
 "payStatus": 2,
 "payType": 5,
 "payedTime": 1491806804000,
 "transId": 732554385970174,
 "transType": 1
 */
