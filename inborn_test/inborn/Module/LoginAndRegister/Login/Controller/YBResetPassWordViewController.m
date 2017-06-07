//
//  YBResetPassWordViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBResetPassWordViewController.h"
#import "YBAttributedStringLabel.h"
#import "YBPasswordTextField.h"
#import "YBDefaultButton.h"
#import "YBDefaultLabel.h"
#import "ZJLoginAndRegisterService.h"
#import "YBLoginResultViewController.h"
#import "YBLoginViewController.h"
@interface YBResetPassWordViewController ()

@property(nonatomic,strong) YBDefaultLabel * titleLable;
@property(nonatomic,strong) YBPasswordTextField * passwordTextField;
@property(nonatomic,strong) YBAttributedStringLabel * descLable;
@property(nonatomic,strong) YBDefaultButton * reSetPwBtn;
/**
 请求参数
 */
@property(nonatomic,strong) NSString * phoneStr;
@property(nonatomic,strong) NSString * passWordStr;
@property(nonatomic,strong) NSString * messageCodeStr;
@end

@implementation YBResetPassWordViewController
#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
- (void)clickResetPwBtn:(UIButton *)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self reSetPassWordRequest];
}

#pragma mark  *** 网络请求

/**
 重写设置新的 密码
 */
- (void)reSetPassWordRequest
{
    
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }else if ([_messageCodeStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_VERCODE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }else if ([_passWordStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PWD_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }else if (![_passWordStr ex_isPassword]){
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:LOGIN_TIPS_PWD_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
        
    [[ZJLoginAndRegisterService share] forgetPwdSecondWithPhone:_phoneStr
                                                        smsCode:_messageCodeStr
                                                    newPassWord:_passWordStr
                                                        success:^(id objc, id requestInfo) {
                                                            
                                                            /**
                                                             返回登录页面
                                                             */
                                                            [self.navigationController popToRootViewControllerAnimated:YES];
    } fail:^(id error, id requestInfo) {
        
    }];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

/**
 初始化控制器
 */
+ (instancetype)creatReSetPassWordViewControllerWithPhone:(NSString *)phone
                                              messageCode:(NSString *)messageCode
                                                   Extend:(id)extend;
{
    YBResetPassWordViewController *viewcontroller       = [[YBResetPassWordViewController alloc]init];
    viewcontroller.phoneStr                             = phone;
    viewcontroller.messageCodeStr                       = messageCode;
    return viewcontroller;
}

#pragma mark - Sixth.界面配置
- (void)setUI
{
    [self.view addSubview:self.titleLable];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.descLable];
    [self.view addSubview:self.reSetPwBtn];
    
    [self setSubviewContrans];
}

/**
 设置约束
 */
- (void)setSubviewContrans
{
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(105));
        make.right.and.left.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(40));
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(50));
        make.right.and.left.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(PROJECT_CUSTOM_TEXTFIELD_HEIGHT));
    }];
    
    [_descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_passwordTextField.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-55));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(88));
    }];
    
    [_reSetPwBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_descLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(30));
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-55));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(40));
    }];
}
#pragma mark - Seventh.懒加载
/**
  设置密码
 */
- (YBDefaultButton *)reSetPwBtn{
    if (!_reSetPwBtn) {
        _reSetPwBtn = [YBDefaultButton buttonDefWithTitleStringKey:REIGSTER_BUTTON_RESETPWD_STRINGKEY titleColor:ZJCOLOR.color_c0 titleFont:SYSTEM_REGULARFONT(14) target:self selector:@selector(clickResetPwBtn:)];
    }
    return _reSetPwBtn;
}

/**
 重置密码
 */
- (YBDefaultLabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(24) text:REIGSTER_TITLE_RESETPWD_STRINGKEY textColor:ZJCOLOR.color_c4];
        _titleLable.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLable;
}

- (YBAttributedStringLabel *)descLable {
    if (!_descLable) {
        _descLable = [[YBAttributedStringLabel alloc]init];
        [_descLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c5,
                                                            @"content":ZJSTRING(LOGIN_TIPS_PWD_STRINGKEY),
                                                            @"size":SYSTEM_REGULARFONT(12),
                                                            @"lineSpacing":@10}]];
//        _descLable.numberOfLines                           = 2;
    }
    return _descLable;
}

- (YBPasswordTextField *)passwordTextField {
    if (!_passwordTextField) {
        WEAKSELF(self);
        _passwordTextField = [YBPasswordTextField textFieldWithEndEditingCallBackBlock:^(UITextField *textField) {
            weakself.passWordStr = textField.text;
        } beginEditingCallBackBlock:^(UITextField *textField) {
            
        }];
    }
    return _passwordTextField;
}

@end

