//
//  YBCertifiedPaymentVerifyPhoneNumber.h
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBaseViewController.h"
@class YBPaymentServiceSignModel;
@class YBBankCardModel;
@class YBPaymentViewModel;

typedef NS_ENUM(NSUInteger, YBCertifiedPaymentVerifyPhoneNumberType) {
    YBCertifiedPaymentVerifyPhoneNumberDefault,
    YBCertifiedPaymentVerifyPhoneNumberChange,
    YBCertifiedPaymentVerifyPhoneNumberVer,
};

@interface YBCertifiedPaymentVerifyPhoneNumber : YBCertifiedPaymentBaseViewController

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBPaymentViewModel *paymentViewModel;

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBBankCardModel *bankCardModel;

/**
 <#descrption#>
 */
@property (nonatomic, assign) YBCertifiedPaymentVerifyPhoneNumberType type;

/**
 YBPaymentServiceSignModel
 */
@property (nonatomic, strong) YBPaymentServiceSignModel *paymentServiceSignModel;

/**
 电话号码
 */
@property (nonatomic, copy) NSString *phoneNumber;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *acctName;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *idNo;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *bankCardId;

@end
