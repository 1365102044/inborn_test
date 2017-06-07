//
//  YBCertifiedPaymentBindBankCardViewModel.m
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBindBankCardViewModel.h"
#import "YBPaymentService.h"

@implementation YBCertifiedPaymentBindBankCardViewModel

/**
 银行卡信息
 
 @param cardNumber          卡号
 @param successCallBack     成功
 @param failureCallBack     失败
 */
- (void)bankCardInfoWithCardNumber:(NSString *)cardNumber
                   successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
                   failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBPaymentService share] certifiedPayBankInfoWithCardNo:cardNumber
                                                     success:^(id objc, id requestInfo) {
                                                         
                                                         YBBankCardModel *bankCardModel = [YBBankCardModel modelWithDictionary:objc[@"data"]];
                                                         successCallBack(bankCardModel);
                                                         
                                                     } fail:^(id error, id requestInfo) {
                                                         YBLog(@"%@\n%@", error, requestInfo);
                                                         failureCallBack(error);
                                                     }];
}

@end
