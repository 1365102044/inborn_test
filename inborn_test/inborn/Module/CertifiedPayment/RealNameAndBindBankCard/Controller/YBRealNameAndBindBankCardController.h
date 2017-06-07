//
//  YBRealNameAndBindBankCardController.h
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBaseViewController.h"
@class YBBankCardModel;
@class YBPaymentViewModel;

@interface YBRealNameAndBindBankCardController : YBCertifiedPaymentBaseViewController

/**
 银行卡查询属性创建后传递
 */
@property (nonatomic, strong) YBBankCardModel *bankCardModel;

/**
 paymentViewModel
 */
@property (nonatomic, strong) YBPaymentViewModel *paymentViewModel;


@end
