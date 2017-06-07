//
//  YBCertifiedPaymentBindBankCardController.h
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBaseViewController.h"
@class YBBankCardModel;

/**
 绑卡控制器类型

 - YBCertifiedPaymentBindBankCardControllerDefault:             默认
 - YBCertifiedPaymentBindBankCardControllerBankCard:            银行卡
 - YBCertifiedPaymentBindBankCardControllerPhone:               银行卡手机号
 - YBCertifiedPaymentBindBankCardControllerBankCardNumber       银行卡号
 */
typedef NS_ENUM(NSUInteger, YBCertifiedPaymentBindBankCardControllerType) {
    YBCertifiedPaymentBindBankCardControllerDefault,
    YBCertifiedPaymentBindBankCardControllerBankCard,
    YBCertifiedPaymentBindBankCardControllerPhone,
    YBCertifiedPaymentBindBankCardControllerBankCardNumber,
};

@interface YBCertifiedPaymentBindBankCardController : YBCertifiedPaymentBaseViewController

/**
 创建绑定银行卡控制器

 @param type            type
 @param extend          扩展参数，传入支付viewModel，用于后续数据提交
 @return                绑定银行卡控制器
 */
+ (instancetype)certifiedPaymentBindBankCardControllerType:(YBCertifiedPaymentBindBankCardControllerType)type
                                                    extend:(id)extend;

/**
 银行卡查询属性创建后传递
 */
@property (nonatomic, strong) YBBankCardModel *bankCardModel;

@end
