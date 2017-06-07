//
//  YBCertifiedPaymentVerifyPhoneNumberViewModel.m
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentVerifyPhoneNumberViewModel.h"
#import "YBPaymentService.h"

@implementation YBCertifiedPaymentVerifyPhoneNumberViewModel

/**
 获取短信验证码
 
 @param phoneNumber phoneNumber     手机号
 @param bankCardId bankCardId       bindMob
 */
- (void)loadMessageCodeWithPhoneNumber:(NSString *)phoneNumber
                            bankCardId:(NSString *)bankCardId
                               success:(ZJViewModelCallBackSuccessBlock)successCallBack
                            faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    [[YBPaymentService share] certifiedGetCodeWithBankCardId:bankCardId
                                                     bindMob:phoneNumber
                                                     success:^(id objc, id requestInfo) {
                                                         
                                                         YBLog(@"%@\n%@", objc, requestInfo);
                                                         successCallBack(nil);
                                                         
                                                     } fail:^(id error, id requestInfo) {
                                                         
                                                         YBLog(@"%@\n%@", error, requestInfo);
                                                         failBlock(error);
                                                     }];
}

@end
