//
//  YBRegisterPhoneViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRegisterPhoneViewController.h"
#import "YBRegisterPhoneTopView.h"
#import "YBAttributedStringLabel.h"
#import "YBRegisterMessageCodeViewController.h"
#import "YBLoginViewController.h"
#import "ZJLoginAndRegisterService.h"
#import "YBLoginResultViewController.h"
#import "YBServieceAgreementViewController.h"
#import "YBMessageCodeTextField.h"
@interface YBRegisterPhoneViewController ()
@property (strong ,nonatomic) YBRegisterPhoneTopView * topView;
@property (strong ,nonatomic) YBAttributedStringLabel * boomLable;
@property(nonatomic,strong) NSString * phoneStr;

@property(nonatomic,assign) sourceVcType  sourceVcType;
/**
 第三方登录过来的手机号 是否注册过，YES: 注册; NO: 未注册
 */
@property(nonatomic,assign) BOOL  isRegisterBool;

/**
 第三方登录 openid
 */
@property(nonatomic,strong) NSString * openid;

@end

@implementation YBRegisterPhoneViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
/**
 服务协议
 */
- (void)clickAggerment:(UITapGestureRecognizer *)tap
{
    YBServieceAgreementViewController *serviceVC = [[YBServieceAgreementViewController alloc]init];
    [self.navigationController pushViewController:serviceVC animated:YES];
}

/**
 点击事件
 tag:
 1 注册
 2 登录
 */
- (void)clickTopSubviewWithBtntag:(NSInteger)tag
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if (tag == 1) {
        if (self.sourceVcType == registerType) [self registerLoadMessageCodeWithPhone];
        else if (self.sourceVcType == forgetpasswordType) [self forgetPasswordLoadMessageCodeWithPhone];
        else if (self.sourceVcType == thridQQLoginType) [self thridLoginCheckPhoneWithLoginType:@"2"];
        else if (self.sourceVcType == thridWXLoginType) [self thridLoginCheckPhoneWithLoginType:@"1"];
    }else if (tag == 2) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/**
 输入框的回调事件
 */
- (void)setTextFieldWhenEndEditingWithType:(textFieldType)type text:(NSString *)textStr
{
    if (type == phoneType) {
        self.phoneStr           = textStr;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.topView.ex_y = ADJUST_PERCENT_FLOAT(0);
    }];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    
    [self.topView registerPhoneWithtextFieldWithEndEditing:^(textFieldType type, NSString *textStr) {
        self.phoneStr = textStr;
    } textfieldBeginEditingBlock:^(textFieldType type) {
    }];
}

/**
 初始化
 */
+ (instancetype)creatRegisterPhoneViewControllerWithSourceType:(sourceVcType)type
                                                        Extend:(id)extend;
{
    YBRegisterPhoneViewController *viewcontroller   = [[YBRegisterPhoneViewController alloc]init];
    viewcontroller.sourceVcType                     = type;
    if (type == thridQQLoginType || type == thridWXLoginType) {
        viewcontroller.openid                       = [extend[@"openid"] ex_isEmpty] ? @"" : extend[@"openid"];
    }
    return viewcontroller;
}

#pragma mark  *** 网络请求

/**
 第三方校验手机号
 type: 
     1表示微信。
     2表示QQ（必传）
 data.flag:
     0未注册，可以绑定;
     1已绑定其他账号，不能绑定;
     2账号被禁用，不能绑定;
     3已注册，可以绑定
 */
- (void)thridLoginCheckPhoneWithLoginType:(NSString *)type
{
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    if (![_phoneStr ex_isMobileNumber]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONEERROR_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    [[ZJLoginAndRegisterService share] thirdLoginVerPhoneWithPhone:_phoneStr
                                                              type:type
                                                           success:^(id objc, id requestInfo) {
                                                               @try {
                                                                   NSInteger flag = [objc[@"data"][@"flag"] integerValue];
                                                                   if (flag==0) {
                                                                       self.isRegisterBool = NO;
                                                                       [self thridLoginSendMessageCode];
                                                                   }else if (flag ==3) {
                                                                       self.isRegisterBool = YES;
                                                                       [self thridLoginSendMessageCode];
                                                                   }else if (flag == 1) {
                                                                      
                                                                       [self.navigationController pushViewController:[YBLoginResultViewController creatLoginResultViewControllerWithType:phoneAlreadyBindOtherWXResultType extend:@{@"thirdtype":(_sourceVcType == thridQQLoginType ? @"QQ" : @"WX")}]
                                                                                                            animated:YES];
                                                                   }else if (flag == 2) {
                                                                       [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                                                                                    tipsStringKey:@"账号被禁用，不能绑定"
                                                                                                             type:YBTopAlertError
                                                                                               eventCallBackBlock:^(id sender) {
                                                                                                   [self.navigationController popToRootViewControllerAnimated:YES];
                                                                                               }];
                                                                   }
                                                               } @catch (NSException *exception) {
                                                               } @finally {
                                                               }
                                                               
                                                           } fail:^(id error, id requestInfo) {
                                                               
                                                           }];
}

/**
 第三方登录 获取验证码
 */
- (void)thridLoginSendMessageCode
{
    [[ZJLoginAndRegisterService share] thirdLoginLoadMessageCodeWithPhone:_phoneStr
                                                                     type:(_sourceVcType == thridQQLoginType ? @"2":@"1")
                                                                  success:^(id objc, id requestInfo) {
                                                                      
                                                                      [self pushMessageCodeVC];
                                                                  } fail:^(id error, id requestInfo) {
                                                                      
                                                                  }];
}

/**
 注册的
 */
- (void)registerLoadMessageCodeWithPhone
{
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    if (![_phoneStr ex_isMobileNumber]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONEERROR_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    [[ZJLoginAndRegisterService share] registerLoadMessageCodeWithPhone:_phoneStr
                                                                success:^(id objc, id requestInfo) {
                                                                    YBLog(@"--组册获取验证码--%@--%@",objc,requestInfo);
                                                                    [self pushMessageCodeVC];
        
                                                                } fail:^(id error, id requestInfo) {
                                                                    YBLog(@"-er-组册获取验证码--%@--%@",error,requestInfo);
                                                                }];
}

/**
 忘记密码
 */
- (void)forgetPasswordLoadMessageCodeWithPhone
{
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    if (![_phoneStr ex_isMobileNumber]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONEERROR_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    [[ZJLoginAndRegisterService share]forgetPwdLoadMessageCodeWithPhone:_phoneStr
                                                                success:^(id objc, id requestInfo) {
                                                                    [self pushMessageCodeVC];
        
    } fail:^(id error, id requestInfo) {
    
    }];
}

/**
 注册，忘记密码，第三方登录都->验证码 (根据类型)
 */
- (void)pushMessageCodeVC
{
    if (_sourceVcType == registerType||_sourceVcType == forgetpasswordType)
    {
        [self.navigationController pushViewController:[YBRegisterMessageCodeViewController creatRegisterMessageCodeViewControllerWithPhone:_phoneStr
                                                                                                                              SourceVcType:_sourceVcType
                                                                                                                                    Extend:nil]
                                             animated:YES];
        
    } else if (_sourceVcType == thridWXLoginType || _sourceVcType == thridQQLoginType) {
        
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        if (_openid) {
            param[@"openid"] = _openid;
        }
        
        if (_isRegisterBool) {
            param[@"phoneISregister"] = @"register";
        } else {
            param[@"phoneISregister"] = @"Notregister";
        }
        
        [self.navigationController pushViewController:[YBRegisterMessageCodeViewController creatRegisterMessageCodeViewControllerWithPhone:_phoneStr
                                                                                                                              SourceVcType:_sourceVcType
                                                                                                                                    Extend:param]
                                             animated:YES];
        
    }
}

#pragma mark - Sixth.界面配置
- (void)setUI
{
    [self.view addSubview:self.topView];
    WEAKSELF(self)
    self.topView.clickBtnBlock = ^(NSInteger btntag){
        [weakself clickTopSubviewWithBtntag:btntag];
    };
    [self.view addSubview:self.boomLable];
    if (self.sourceVcType == registerType) {
        [_boomLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-20));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(180), 60));
            make.centerX.mas_equalTo(self.view.mas_centerX);
        }];
        
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.bottom.mas_equalTo(_boomLable.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(0));
        }];
    }else{
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(0));
        }];
    }
    
}

#pragma mark - Seventh.懒加载
- (YBRegisterPhoneTopView *)topView{
    if (!_topView) {
        _topView = [YBRegisterPhoneTopView creatReginsterTopViewWithSourceVcType:self.sourceVcType];
    }
    return _topView;
}

- (YBAttributedStringLabel *)boomLable{
    if (!_boomLable) {
        _boomLable = [[YBAttributedStringLabel alloc]init];
        [_boomLable  setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c5,
                                                              @"content":[NSString stringWithFormat:@"%@\n",ZJSTRING(REIGSTER_TIPS_AGREEMENT_STRINGKEY)],
                                                              @"size":SYSTEM_REGULARFONT(12),
                                                              @"lineSpacing":@5},
                                                            @{@"color":ZJCOLOR.color_c4,
                                                              @"content":ZJSTRING(REIGSTER_BUTTON_AGREEMENT_STRINGKEY),
                                                              @"size":SYSTEM_REGULARFONT(12),
                                                              @"lineSpacing":@5}]];
        _boomLable.userInteractionEnabled                   = YES;
        _boomLable.textAlignment                            = NSTextAlignmentCenter;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAggerment:)];
        [_boomLable addGestureRecognizer:tap];
    }
    return _boomLable;
}

@end
