//
//  ZJTextField.m
//  inborn
//
//  Created by 郑键 on 17/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJTextField.h"
#import "YBPhoneNumberTextField.h"
#import "YBMessageCodeTextField.h"
#import "YBPasswordTextField.h"
#import "YBTopAlert.h"

@interface ZJTextField() <UITextFieldDelegate>

/**
 bottom spacing line
 */
@property (nonatomic, strong) ZJBaseView *bottomSpacingLineView;

/**
 tips icon imageView
 */
@property (nonatomic, strong) ZJBaseImageView *iconImageView;

/**
 placeHolder label
 */
@property (nonatomic, strong) YBDefaultLabel *placeHolderLabel;

/**
 textField
 */
@property (nonatomic, strong) UITextField *textField;

/**
 bottom spacing line view height
 */
@property (nonatomic, assign) CGFloat bottomSpacingLineViewHeight;

/**
 bottom spacing line view color
 */
@property (nonatomic, strong) UIColor *bottomSpacingLineViewColor;

/**
 键盘样式
 */
@property (nonatomic, assign) UIKeyboardType keyboardType;

/**
 最大输入字数
 */
@property (nonatomic, assign) NSInteger maxCount;

/**
 iconImage
 */
@property (nonatomic, strong) UIImage *iconImage;

/**
 placeHolderStringKey
 */
@property (nonatomic, copy) NSString *placeHolderStringKey;

/**
 secureTextEntry:
 */
@property (nonatomic, assign) BOOL secureTextEntry;

/**
 回调Block
 */
@property (nonatomic, copy) ZJTextFieldEndEditingCallBackBlock endEditingCallBackBlock;

/**
 回调Block
 */
@property (nonatomic, copy) ZJTextFieldBeginEditingCallBackBlock beginEditingCallBackBlock;

@end

@implementation ZJTextField

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

/**
 成为第一响应
 */
- (void)becomeFirstResponder
{
    [self.textField becomeFirstResponder];
}

/**
 解除第一响应
 */
- (void)resignFirstResponder
{
    [self.textField resignFirstResponder];
}

/**
 按钮点击事件
 
 @param sender 按钮
 */
- (void)textFieldFuncButtonClick:(UIButton *)sender
{
    /**
     *  密码输入框按钮
     */
    if (sender.tag == 1001) {
        [self.textField ex_changeSecureTextEntry:sender.selected];
        sender.selected = !sender.selected;
    }
    
    /**
     *  clear
     */
    if (sender.tag == 1003) {
        self.textField.text = @"";
        if (self.texfiledDelegate) {
            [self.texfiledDelegate mytextfiled:self textfiledstr:@""];
        }
    }
}

/**
 校验输入信息
 
 @return 返回报错信息Key，报错信息为空时，校验通过
 */
- (NSString *)verifyTheInputInformation
{
    if (self.textField.text.length == 0
        || [self.textField.text isEqualToString:@""]) {
        
        /**
         *  不做非空校验
         */
        return nil;
        
    }else{
        
        if ([self isKindOfClass:[YBPhoneNumberTextField class]]) {
            
            /**
             *  手机号码校验
             */
            return [self.textField.text ex_isMobileNumber] ? nil : ALERT_TIPS_PHONEERROR_STRINGKEY;
        }
        
        if ([self isKindOfClass:[YBMessageCodeTextField class]]) {
            
            /**
             *  验证码校验，暂时不做校验
             */
            //return ALERT_TIPS_VERCODEERROR_STRINGKEY;
            return nil;
        }
        
        if ([self isKindOfClass:[YBPasswordTextField class]]) {
            
            /**
             *  密码验证
             */
//            return [self.textField.text ex_isPassword] ? nil : LOGIN_TIPS_PWD_STRINGKEY;
        }
    }
    
    return nil;
}

#pragma mark - Fourth.代理方法

#pragma mark <UITextFieldDelegate>

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    /**
     *  开始编辑
     */
    [self beginEditingAnimation];
    
    self.funcButton.hidden                      = NO;
    
    /**
     *  开始回调
     */
    self.beginEditingCallBackBlock(self.textField);
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    /**
     *  校验信息
     */
    if ([self verifyTheInputInformation]) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                                tipsStringKey:[self verifyTheInputInformation]
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
    }
    
    /**
     *  结束编辑，判断，如果有文字，不展示结束动画
     */
    [self endEditingAnimtaion];
    
    self.funcButton.hidden                      = YES;
    
    /**
     *  结束回调
     */
    self.endEditingCallBackBlock(self.textField);
}

/**
 textField输入
 
 @param textField               textField
 @param range                   range
 @param string                  string
 @return return                 value
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *totalString;
    NSString *tostring =[textField.text stringByReplacingCharactersInRange:range withString:string];
    if (tostring.length <=0) {
        if (self.placeHolderStringKey == TEXTFIELD_PLACEHOLDER_PHONE_STRINGKEY ||
            self.placeHolderStringKey == TEXTFIELD_PLACEHOLDER_PWD_STRINGKEY) {
            self.funcButton.alpha = 0;
        }
    }else{
        if (self.placeHolderStringKey == TEXTFIELD_PLACEHOLDER_PHONE_STRINGKEY ||
            self.placeHolderStringKey == TEXTFIELD_PLACEHOLDER_PWD_STRINGKEY) {
            self.funcButton.alpha = 1;
        }
    }
    
    if (string.length <= 0) {
        totalString = [textField.text substringToIndex:textField.text.length-1];
    }
    else {
        totalString = [NSString stringWithFormat:@"%@%@",textField.text,string];
    }
    
    if (totalString.length == self.maxCount + 1) {
        return NO;
    }
    if (self.texfiledDelegate) {
        [self.texfiledDelegate mytextfiled:self textfiledstr:tostring];
    }
    return YES;
}

#pragma mark - Fifth.视图生命周期

/**
 子类初始化项目输入框实例
 
 @param endEditingCallBackBlock         结束编辑回调
 @param beginEditingCallBackBlock       开始编辑回调
 @return                                项目输入框实例
 */
+ (instancetype)textFieldWithEndEditingCallBackBlock:(ZJTextFieldEndEditingCallBackBlock)endEditingCallBackBlock
                           beginEditingCallBackBlock:(ZJTextFieldBeginEditingCallBackBlock)beginEditingCallBackBlock
{
    /**
     *  默认样式
     */
    return [self textFieldWithKeyboardType:UIKeyboardTypeDefault
                                  maxCount:50
                                 iconImage:[UIImage new]
                      placeHolderStringKey:@"输入文字"
                           secureTextEntry:NO
                   endEditingCallBackBlock:endEditingCallBackBlock
                 beginEditingCallBackBlock:beginEditingCallBackBlock];
}

/**
 初始化项目输入框实例
 
 @param keyboardType                    键盘模式
 @param maxCount                        最大输入数
 @param iconImage                       图片
 @param placeHolderStringKey            占位文字key
 @param secureTextEntry                 是否密文
 @param endEditingCallBackBlock         结束编辑回调
 @param beginEditingCallBackBlock       开始编辑回调
 
 @return                                项目输入框实例
 */
+ (instancetype)textFieldWithKeyboardType:(UIKeyboardType)keyboardType
                                 maxCount:(NSInteger)maxCount
                                iconImage:(UIImage *)iconImage
                     placeHolderStringKey:(NSString *)placeHolderStringKey
                          secureTextEntry:(BOOL)secureTextEntry
                  endEditingCallBackBlock:(ZJTextFieldEndEditingCallBackBlock)endEditingCallBackBlock
                beginEditingCallBackBlock:(ZJTextFieldBeginEditingCallBackBlock)beginEditingCallBackBlock
{
    ZJTextField *textField                  = [[self alloc] init];
    textField.keyboardType                  = keyboardType;
    textField.maxCount                      = maxCount;
    textField.iconImage                     = iconImage;
    textField.placeHolderStringKey          = placeHolderStringKey;
    textField.endEditingCallBackBlock       = endEditingCallBackBlock;
    textField.secureTextEntry               = secureTextEntry;
    textField.beginEditingCallBackBlock     = beginEditingCallBackBlock;
    return textField;
}

#pragma mark - Sixth.界面配置

/**
 配置界面
 */
- (void)setupCustomUI
{
    self.backgroundColor                    = ZJCOLOR.color_c0;
    [self addSubview:self.textField];
    [self addSubview:self.bottomSpacingLineView];
    [self addSubview:self.iconImageView];
    [self addSubview:self.placeHolderLabel];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.bottomSpacingLineView);
        make.top.mas_equalTo(self);
    }];
    
    [self.bottomSpacingLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(55.f));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-55.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(self.bottomSpacingLineViewHeight));
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.textField);
        make.left.mas_equalTo(self.bottomSpacingLineView).mas_offset(ADJUST_PERCENT_FLOAT(4.5));
        make.height.width.mas_equalTo(ADJUST_PERCENT_FLOAT(20.f));
    }];
    
    [self.placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.iconImageView);
        make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(15));
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(40.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(14.f));
    }];
}

#pragma mark - Seventh.懒加载

- (CGFloat)bottomSpacingLineViewHeight
{
    if (!_bottomSpacingLineViewHeight) {
        _bottomSpacingLineViewHeight            = 0.5f;
    }
    return _bottomSpacingLineViewHeight;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField                              = [[UITextField alloc] init];
        _textField.backgroundColor              = [UIColor redColor];
        _textField.font                         = SYSTEM_REGULARFONT(13.f);
        _textField.textColor                    = ZJCOLOR.color_c4;
        _textField.backgroundColor              = ZJCOLOR.color_c0;
        _textField.keyboardType                 = self.keyboardType;
        _textField.delegate                     = self;
        _textField.secureTextEntry              = self.secureTextEntry;
    }
    return _textField;
}

- (UILabel *)placeHolderLabel
{
    if (!_placeHolderLabel) {
        _placeHolderLabel                       = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13.f)
                                                                           text:self.placeHolderStringKey
                                                                      textColor:ZJCOLOR.color_c5];
    }
    return _placeHolderLabel;
}

- (ZJBaseImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView                          = [[ZJBaseImageView alloc] init];
        _iconImageView.backgroundColor          = ZJCOLOR.color_c0;
        _iconImageView.image                    = self.iconImage;
    }
    return _iconImageView;
}

- (ZJBaseView *)bottomSpacingLineView
{
    if (!_bottomSpacingLineView) {
        _bottomSpacingLineView                  = [[ZJBaseView alloc] init];
        _bottomSpacingLineView.backgroundColor  = ZJCOLOR.color_c5;
    }
    return _bottomSpacingLineView;
}

#pragma mark - Eigth.Animation

- (void)beginEditingAnimation
{
    [self updateBottomSpacingLineView];
    self.bottomSpacingLineView.backgroundColor      = ZJCOLOR.color_c2;
    
    /**
     *  缩小图片
     */
    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bottomSpacingLineView.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-15.f));
        make.centerY.mas_equalTo(self.placeHolderLabel);
        make.width.height.mas_equalTo(0.01);
    }];
    
    /**
     *  缩小平移占位label
     */
    self.placeHolderLabel.font = SYSTEM_REGULARFONT(10.f);
    [self.placeHolderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self.bottomSpacingLineView);
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(40.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(10.f));
    }];
    
    /**
     *  开始动画
     */
    [UIView animateWithDuration:0.25 animations:^{
        self.iconImageView.alpha = 0;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)endEditingAnimtaion
{
    [self updateBottomSpacingLineView];
    self.bottomSpacingLineView.backgroundColor      = ZJCOLOR.color_c5;
    
    CGFloat alpha = 0;
    
    /**
     *  有文字时不展示动画
     */
    if (self.textField.text.length == 0
        || [self.textField.text isEqualToString:@""]) {
        /**
         *  放大图片
         */
        [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.placeHolderLabel);
            make.left.mas_equalTo(self.bottomSpacingLineView).mas_offset(ADJUST_PERCENT_FLOAT(4.5));
            make.height.width.mas_equalTo(ADJUST_PERCENT_FLOAT(20.f));
        }];
        
        /**
         *  方法占位文字
         */
        self.placeHolderLabel.font = SYSTEM_REGULARFONT(13.f);
        [self.placeHolderLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.textField);
            make.left.mas_equalTo(self.iconImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(15));
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(40.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(14.f));
        }];
        
        alpha = 1.f;
    }
    
    /**
     *  开始动画
     */
    [UIView animateWithDuration:0.25 animations:^{
        self.iconImageView.alpha = alpha;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)updateBottomSpacingLineView
{
    self.bottomSpacingLineViewHeight                = self.bottomSpacingLineViewHeight == 0.5 ? 1.0 : 0.5;
    [self.bottomSpacingLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(55.f));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-55.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(self.bottomSpacingLineViewHeight));
    }];
}

@end
