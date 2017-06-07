//
//  YBMessageCodeTextField.m
//  inborn
//
//  Created by 郑键 on 17/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageCodeTextField.h"
#import "YBTimerManager.h"

@interface YBMessageCodeTextField()

/**
 按钮点击回调
 */
@property (nonatomic, copy) ZJEventCallBackBlock eventCallBackBlock;

/**
 定时器
 */
@property (nonatomic, strong) YBTimerManager *timerManager;

/**
 倒计时60s
 */
@property (nonatomic, assign) CGFloat countDownTime;

@end

@implementation YBMessageCodeTextField

#pragma mark - First.通知

- (void)timerCountDown:(NSNotification *)no
{
    [self.funcButton setTitle:[NSString stringWithFormat:@"%.0fs", self.countDownTime--]
                     forState:UIControlStateNormal];
    if (self.countDownTime <= 0) {
        [self.timerManager stopTimer];
        self.funcButton.enabled = YES;
        [self.funcButton setTitle:ZJSTRING(TEXTFIELD_FUNCBUTTON_SMS_STRINGKEY)
                         forState:UIControlStateNormal];
    }
}

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

/**
 按钮点击事件
 
 @param sender 按钮
 */
- (void)textFieldFuncButtonClick:(UIButton *)sender
{
    [super textFieldFuncButtonClick:sender];
    [self becomeFirstResponder];
    /**
     *  短信验证码输入框按钮
     */
    if (sender.tag == 1002) {
        self.eventCallBackBlock(sender);
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

/**
 验证码输入框实例
 
 @param endEditingCallBackBlock             结束编辑回调
 @param beginEditingCallBackBlock           开始编辑回调
 @param loadMessageCodeButtonCallBack       点击获取验证码按钮回调
 @return                                    项目输入框实例
 */
+ (instancetype)textFieldMessageCodeWithEndEditingCallBackBlock:(ZJTextFieldEndEditingCallBackBlock)endEditingCallBackBlock
                                      beginEditingCallBackBlock:(ZJTextFieldBeginEditingCallBackBlock)beginEditingCallBackBlock
                                  loadMessageCodeButtonCallBack:(ZJEventCallBackBlock)loadMessageCodeButtonCallBack
{
    /**
     *  配置初始化参数
     */
    UIKeyboardType keyboardType                        = UIKeyboardTypeNumberPad;
    NSInteger maxCount                                 = 6;
    UIImage *iconImage                                 = ZJCURRENTIMAGE(IMAGEFILEPATH_LOGINANDREGISTER_LOGIN,
                                                                        @"login_verificationCode_icon",
                                                                        ZJProjectLoadImageDefault);
    
    
    YBMessageCodeTextField *textField                  = [super textFieldWithKeyboardType:keyboardType
                                                                                 maxCount:maxCount
                                                                                iconImage:iconImage
                                                                     placeHolderStringKey:TEXTFIELD_PLACEHOLDER_VERCODE_STRINGKEY
                                                                          secureTextEntry:NO
                                                                  endEditingCallBackBlock:endEditingCallBackBlock
                                                                beginEditingCallBackBlock:beginEditingCallBackBlock];
    textField.eventCallBackBlock                       = loadMessageCodeButtonCallBack;
    [textField setupCustomUI];
    return textField;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self registerNotification];
    }
    return self;
}

- (void)dealloc
{
    [self removeNotification];
}

#pragma mark - Sixth.界面配置

- (void)removeNotification
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self
                                         name:TIMER_NOTIFICATION
                                       object:nil];
}

- (void)registerNotification
{
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(timerCountDown:)
                                      name:TIMER_NOTIFICATION
                                    object:nil];
}

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    YBDefaultButton *loadMessageCode                    = [YBDefaultButton buttonWithTitleStringKey:TEXTFIELD_FUNCBUTTON_SMS_STRINGKEY
                                                                                         titleColor:ZJCOLOR.color_c4
                                                                                          titleFont:SYSTEM_REGULARFONT(13.f)
                                                                                             target:self
                                                                                           selector:@selector(textFieldFuncButtonClick:)];
    
    loadMessageCode.tag                                 = 1002;
    loadMessageCode.titleLabel.textAlignment            = NSTextAlignmentLeft;
    self.funcButton                                     = loadMessageCode;
    [self addSubview:loadMessageCode];
    [loadMessageCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(20.f));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-55.f));
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(75.f));
    }];
}

#pragma mark - Seventh.懒加载

- (YBTimerManager *)timerManager
{
    if (!_timerManager) {
        _timerManager = [[YBTimerManager alloc] init];
    }
    return _timerManager;
}

#pragma mark - Eight.Other

/**
 开始倒计时
 */
- (void)startCountDown
{
    /**
     *  倒计时
     */
    [self.timerManager startTimerWithTimeInterVal:1.f];
    self.funcButton.enabled = NO;
    self.countDownTime = 60.f;
}

@end
