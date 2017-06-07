//
//  YBCertifiedPaymentBankCardListViewModel.m
//  inborn
//
//  Created by 郑键 on 17/4/10.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBankCardListViewModel.h"
#import "YBPaymentService.h"

@implementation YBCertifiedPaymentBankCardListViewModel

/**
 删除银行卡
 
 @param bankCardId              银行卡id编号
 @param successCallBack         成功
 @param failBlock               失败
 */
- (void)delBankCardWithBankCardId:(NSString *)bankCardId
                          success:(ZJViewModelCallBackSuccessBlock)successCallBack
                       faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    [[YBPaymentService share] certifiedDelBankWithBankCardId:bankCardId success:^(id objc, id requestInfo) {
        
        successCallBack(objc);
        
    } fail:^(id error, id requestInfo) {
        
        failBlock(error);
        
    }];
}

@end
