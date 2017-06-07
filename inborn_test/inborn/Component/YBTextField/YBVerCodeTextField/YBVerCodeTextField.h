//
//  YBVerCodeTextField.h
//  inborn
//
//  Created by 郑键 on 17/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJTextField.h"
@class YBVerCodeTextField;

@protocol YBVerCodeTextFieldDelegate <NSObject>

/**
 输入完成回调
 
 @param verificationCodeInputView           当前输入控件
 @param verificationCodeText                输入内容
 */
- (void)verCodeTextField:(YBVerCodeTextField *)verificationCodeInputView
    verificationCodeText:(NSString *)verificationCodeText;

@end

@interface YBVerCodeTextField : ZJTextField

/**
 代理
 */
@property (nonatomic, weak) id<YBVerCodeTextFieldDelegate> delegate;

/**
 输入框
 */
@property (nonatomic, strong) UITextField *inputVerificationCodeTextField;

/**
 密码验证失败
 */
@property(assign, nonatomic) BOOL passWordFailed;

/**
 清空已输入的验证码
 */
- (void)clearVerCode;

@end
