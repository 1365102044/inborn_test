//
//  YBPhoneNumberTextField.m
//  inborn
//
//  Created by 郑键 on 17/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPhoneNumberTextField.h"

@implementation YBPhoneNumberTextField

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

/**
 手机号输入框实例
 
 @param endEditingCallBackBlock         结束编辑回调
 @return                                项目输入框实例
 */
+ (instancetype)textFieldWithEndEditingCallBackBlock:(ZJTextFieldEndEditingCallBackBlock)endEditingCallBackBlock
                           beginEditingCallBackBlock:(ZJTextFieldBeginEditingCallBackBlock)beginEditingCallBackBlock
{
    /**
     *  配置初始化参数
     */
    UIKeyboardType keyboardType                        = UIKeyboardTypeNumberPad;
    NSInteger maxCount                                 = 11;
    UIImage *iconImage                                 = ZJCURRENTIMAGE(IMAGEFILEPATH_LOGINANDREGISTER_LOGIN,
                                                                        @"login_phone_icon",
                                                                        ZJProjectLoadImageDefault);
    
    
    YBPhoneNumberTextField *textField                  = [super textFieldWithKeyboardType:keyboardType
                                                                                 maxCount:maxCount
                                                                                iconImage:iconImage
                                                                     placeHolderStringKey:TEXTFIELD_PLACEHOLDER_PHONE_STRINGKEY
                                                                          secureTextEntry:NO
                                                                  endEditingCallBackBlock:endEditingCallBackBlock
                                                                beginEditingCallBackBlock:beginEditingCallBackBlock];
    [textField setupCustomUI];
    return textField;
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    YBDefaultButton *clearButton                            = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                                                                 imageNamed:@"login_close"
                                                                                                       type:ZJProjectButtonSetBackgroundImage
                                                                                                     target:self
                                                                                                   selector:@selector(textFieldFuncButtonClick:)];
    clearButton.tag                                      = 1003;
    clearButton.hidden                                   = YES;
    self.funcButton                                      = clearButton;
    self.funcButton.alpha                                = 0;
    [self addSubview:clearButton];
    [clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(20.f));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-55.f));
    }];
}

#pragma mark - Seventh.懒加载

@end
