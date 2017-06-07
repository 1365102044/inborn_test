//
//  YBCertifiedPaymentChangePhoneNumberController.h
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBaseViewController.h"
@class YBBankCardModel;
@class YBPaymentViewModel;

@interface YBCertifiedPaymentChangePhoneNumberController : YBCertifiedPaymentBaseViewController

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBPaymentViewModel *paymentViewModel;

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBBankCardModel *bankCardModel;

@end
