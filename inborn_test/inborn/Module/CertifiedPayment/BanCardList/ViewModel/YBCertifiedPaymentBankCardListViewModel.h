//
//  YBCertifiedPaymentBankCardListViewModel.h
//  inborn
//
//  Created by 郑键 on 17/4/10.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewModel.h"

@interface YBCertifiedPaymentBankCardListViewModel : ZJBaseViewModel

/**
 删除银行卡
 
 @param bankCardId              银行卡id编号
 @param successCallBack         成功
 @param failBlock               失败
 */
- (void)delBankCardWithBankCardId:(NSString *)bankCardId
                          success:(ZJViewModelCallBackSuccessBlock)successCallBack
                       faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

@end
