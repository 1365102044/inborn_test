//
//  YBVerCodeTextField.m
//  inborn
//
//  Created by 郑键 on 17/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBVerCodeTextField.h"

@interface YBVerCodeTextField() <UITextFieldDelegate>

/**
 view
 */
@property (nonatomic, strong) ZJBaseView *view;

/**
 展示label数组
 */
@property (nonatomic, strong) NSMutableArray *labelsArray;

@end

@implementation YBVerCodeTextField

#pragma mark - Zero.Const

/**
 展示输入内容Label的间距
 */
CGFloat showLabelMargin             = 15;

/**
 展示输入框的最大个数
 */
CGFloat showLabelMaxCount           = 6;

#pragma mark - First.通知

#pragma mark - Second.赋值

/**
 输入验证码错误，错误动画
 
 @param passWordFailed 输入验证码错误
 */
- (void)setPassWordFailed:(BOOL)passWordFailed
{
    _passWordFailed = passWordFailed;
    
    if (passWordFailed) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"position.x";
        animation.values = @[ @0, @15, @-15, @15, @0 ];
        animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
        animation.duration = 0.4;
        
        animation.additive = YES;
        [self.layer addAnimation:animation forKey:@"shake"];
    }
}

#pragma mark - Third.点击事件

/**
 成为第一响应
 */
- (void)becomeFirstResponder
{
    [self.inputVerificationCodeTextField becomeFirstResponder];
}

/**
 解除第一响应
 */
- (void)resignFirstResponder
{
    [self.inputVerificationCodeTextField resignFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self becomeFirstResponder];
}

#pragma mark - Fourth.代理方法

#pragma mark <UITextFieldDelegate>

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    /**
     *  避免父类调用动画导致的崩溃
     */
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    /**
     *  避免父类调用动画导致的崩溃
     */
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
    if (textField.text.length >= showLabelMaxCount && string.length) {
        return NO;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",@"^[0-9]*$"];
    if (![predicate evaluateWithObject:string]) {
        return NO;
    }
    
    NSString *totalString;
    if (string.length <= 0) {
        totalString = [textField.text substringToIndex:textField.text.length-1];
    }
    else {
        totalString = [NSString stringWithFormat:@"%@%@",textField.text,string];
    }
    
    [self setLabelWithTotalString:totalString];
    
    if (totalString.length == showLabelMaxCount) {
        
        if ([self.delegate respondsToSelector:@selector(verCodeTextField:verificationCodeText:)]) {
            [self.delegate verCodeTextField:self verificationCodeText:totalString];
        }
    }
    
    return YES;
}

/**
 显示输入内容
 
 @param totalString 内容
 */
- (void)setLabelWithTotalString:(NSString *)totalString
{
    [self.labelsArray enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        obj.text                                                                    = @"";
        [self setLabelBroderWithStatus:NO label:obj];
    }];
    
    NSRange range;
    for (NSInteger i = 0; i < totalString.length; i++) {
        range                                                                       = [totalString rangeOfComposedCharacterSequenceAtIndex:i];
        UILabel *label                                                              = self.labelsArray[i];
        label.text                                                                  = [totalString substringWithRange:range];
    }
    
    if (totalString.length == showLabelMaxCount) {
        return;
    }
    [self setLabelBroderWithStatus:YES
                             label:self.labelsArray[totalString.length]];
}

#pragma mark - Fifth.视图生命周期

/**
 初始化
 
 @param frame frame
 @return 返回实例
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupCustomUI];
        
    }
    
    return self;
}

#pragma mark - Sixth.界面配置

/**
 配置界面
 */
- (void)setupCustomUI
{
    [self addSubview:self.view];
    [self.view addSubview:self.inputVerificationCodeTextField];
    [self.labelsArray enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        [self.view addSubview:obj];
    }];
}

/**
 布局子控件
 */
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(32.f));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-32.f));
    }];
    
    [self.inputVerificationCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    __block UILabel *currentLabel;
    [self.labelsArray enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            if (idx == 0) {
                make.left.top.bottom.mas_equalTo(self.view);
            }else{
                make.width.height.top.mas_equalTo(currentLabel);
                make.left.mas_equalTo(currentLabel.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(showLabelMargin));
                if (idx == self.labelsArray.count - 1) {
                    make.right.bottom.mas_equalTo(self.view);
                }
            }
        }];
        
        currentLabel = obj;
    }];
}

/**
 配置label的边框
 
 @param status  状态 YES选中 NO未选中
 @param label   展示控件
 */
- (void)setLabelBroderWithStatus:(BOOL)status
                           label:(UILabel *)label
{
    label.layer.borderWidth                                                             = 1.0f;
    //label.layer.cornerRadius                                                            = 5.0f;
    
    if (status) {
        label.layer.borderColor                                                          = [UIColor blackColor].CGColor;
    }else{
        label.layer.borderColor                                                          = [UIColor lightGrayColor].CGColor;
    }
}

#pragma mark - Seventh.懒加载

- (ZJBaseView *)view
{
    if (!_view) {
        _view = [[ZJBaseView alloc] init];
    }
    return _view;
}

- (NSMutableArray *)labelsArray
{
    if (!_labelsArray) {
        _labelsArray                                                                = [NSMutableArray arrayWithCapacity:showLabelMaxCount];
        for (NSInteger i = 0; i < showLabelMaxCount; i++) {
            UILabel *label                                                          = [UILabel new];
            //label.layer.cornerRadius                                                = 2.f;
            label.backgroundColor                                                   = [UIColor whiteColor];
            //label.clipsToBounds                                                     = YES;
            label.textAlignment                                                     = NSTextAlignmentCenter;
            label.font                                                              = [UIFont systemFontOfSize:23.5f];
            [_labelsArray addObject:label];
            BOOL isSelected                                                         = NO;
            if (i == 0) {
                isSelected                                                          = YES;
            }
            [self setLabelBroderWithStatus:isSelected label:label];
        }
    }
    return _labelsArray;
}

- (UITextField *)inputVerificationCodeTextField
{
    if (!_inputVerificationCodeTextField) {
        _inputVerificationCodeTextField                                             = [UITextField new];
        _inputVerificationCodeTextField.keyboardType                                = UIKeyboardTypeNumberPad;
        _inputVerificationCodeTextField.backgroundColor                             = [UIColor groupTableViewBackgroundColor];
        _inputVerificationCodeTextField.delegate                                    = self;
        _inputVerificationCodeTextField.hidden                                      = YES;
    }
    return _inputVerificationCodeTextField;
}

#pragma mark - Eigth.Other

/**
 清空已输入的验证码
 */
- (void)clearVerCode
{
    self.inputVerificationCodeTextField.text = @"";
    [self.labelsArray enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        obj.text = @"";
    }];
}

@end
