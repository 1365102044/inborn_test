//
//  YBCertifiedPaymentAlertView.h
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
@class YBAttributedStringLabel;
@class YBRightImageButton;
@class YBVerCodeTextField;

@interface YBCertifiedPaymentAlertView : ZJBaseView

/**
 获取短信验证码
 */
@property (nonatomic, strong) YBDefaultButton *loadMessageButton;

/**
 确认支付按钮
 */
@property (nonatomic, strong) YBDefaultButton *surePayButton;

@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *amontLabel;
@property (weak, nonatomic) IBOutlet YBRightImageButton *bankCardButton;
@property (nonatomic, strong) YBVerCodeTextField *verCodeTextField;
@property (nonatomic, copy) ZJEventCallBackBlock callBackBlock;

/**
 成为第一响应者
 */
- (void)becomeFirstRespond;

/**
 注销第一响应者
 */
- (void)registerFirstRespond;

/**
 清空用户已输入的验证码
 */
- (void)clearVerCode;

/**
 验证失败
 */
- (void)checkFailed;

@end
