//
//  YBMessageCodeTextField.h
//  inborn
//
//  Created by 郑键 on 17/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJTextField.h"

@interface YBMessageCodeTextField : ZJTextField

/**
 验证码输入框实例
 
 @param endEditingCallBackBlock             结束编辑回调
 @param beginEditingCallBackBlock           开始编辑回调
 @param loadMessageCodeButtonCallBack       点击获取验证码按钮回调
 @return                                    项目输入框实例
 */
+ (instancetype)textFieldMessageCodeWithEndEditingCallBackBlock:(ZJTextFieldEndEditingCallBackBlock)endEditingCallBackBlock
                                      beginEditingCallBackBlock:(ZJTextFieldBeginEditingCallBackBlock)beginEditingCallBackBlock
                                  loadMessageCodeButtonCallBack:(ZJEventCallBackBlock)loadMessageCodeButtonCallBack;

/**
 开始倒计时
 */
- (void)startCountDown;

@end
