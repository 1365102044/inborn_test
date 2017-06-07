//
//  YBLoginTopBigView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLoginTopBigView.h"
#import "YBPhoneNumberTextField.h"
#import "YBPasswordTextField.h"
#import "YBMessageCodeTextField.h"
#import "ZJBaseButton.h"
#import "User_LocalData.h"
static CGFloat logoimageBoomdistance =  80;

@interface YBLoginTopBigView ()<textfiledchangeDelegate>

@property(nonatomic,strong) ZJBaseImageView * logoImageView;
@property(nonatomic,strong) ZJBaseImageView * accoutHeaderImageview;
@property(nonatomic,strong) YBPhoneNumberTextField * phoneNumberTextField;
@property(nonatomic,strong) YBPasswordTextField * passwrodTextField;
@property(nonatomic,strong) YBDefaultButton * loginBtn;
@property(nonatomic,strong) YBDefaultButton * forgetPWBtn;
@property(nonatomic,assign) loginTypeEnum  loginType;
@property(nonatomic,strong) YBDefaultLabel * accountLable;

/**
 textfiled block
 */
@property(nonatomic,copy) textFieldBlock  textFieldBlock;
@property(nonatomic,copy) textFieldBeiginBlock textFieldBeginBlock;
@property(nonatomic,copy) textFieldRequestMessageCodeBlock  requestMessageCodeBlock;
/**
 点击block
 */
@property(nonatomic,copy) clickLoginBtnOrForgetBtn  clickTopBtnBlock;
@property(nonatomic,copy) clickBoomBtnBlock clickBoomBtnBlock;


@property(nonatomic,strong) NSString * phonestr;
@property(nonatomic,strong) NSString * passwdstr;
@property(nonatomic,strong) NSString * messagestr;

/**
 boomview
 */
@property(nonatomic,strong) YBDefaultButton *quickLoginBtn;
@property(nonatomic,strong) YBDefaultButton * AccountloginBtn;
@property(nonatomic,strong) YBDefaultButton * QQloginBtn;
@property(nonatomic,strong) YBDefaultButton * WeiXinloginBtn;
@property(nonatomic,strong) YBDefaultButton * HelpBtn;
@property(nonatomic,strong) YBDefaultButton * switchAccountLoginBtn;

@property(nonatomic,strong) UIView * lineview1;
@property(nonatomic,strong) UIView * lineview2;
/**
 是否隐藏微信图片，默认NO,(不隐藏)
 */
@property(nonatomic,assign)   BOOL  isShowWXicon;
@end

@implementation YBLoginTopBigView
/**
 改变loginBtn的颜色状态
 */
- (void)mytextfiled:(UIView *)mytextfiled textfiledstr:(NSString *)textfieldstr
{
    if (mytextfiled == _phoneNumberTextField) {
        _phonestr = textfieldstr;
    }else if(mytextfiled == _passwrodTextField) {
        _passwdstr = textfieldstr;
    }else if (mytextfiled == _messageCodeTextField){
        _messagestr = textfieldstr;
    }
    
    if (_loginType == generalLoginType) {
        if (_phonestr.length>= 11 && _passwdstr.length > 0) {
            _loginBtn.backgroundColor = ZJCOLOR.color_c2;
            _loginBtn.userInteractionEnabled = YES;
        }else{
            _loginBtn.backgroundColor = ZJCOLOR.color_c5;
            _loginBtn.userInteractionEnabled = NO;
        }
    }
    if (_loginType == haveAcountLoginType) {
        if (_passwdstr.length > 0 ) {
            _loginBtn.backgroundColor = ZJCOLOR.color_c2;
            _loginBtn.userInteractionEnabled = YES;
        }else{
            _loginBtn.backgroundColor = ZJCOLOR.color_c5;
            _loginBtn.userInteractionEnabled = NO;
        }
    }
    if (_loginType ==  quickLoginType) {
        if (_messagestr.length > 0 &&_phonestr.length >=11) {
            _loginBtn.backgroundColor = ZJCOLOR.color_c2;
            _loginBtn.userInteractionEnabled = YES;
        }else{
            _loginBtn.backgroundColor = ZJCOLOR.color_c5;
            _loginBtn.userInteractionEnabled = NO;
        }
    }
    
}

/**
 textfield的开始编辑和编辑完成后
 */
- (void)textFieldbeginEditingCallBackBlock:(textFieldBeiginBlock)textfieldBegin  EndEditingCallBackBlock:(textFieldBlock)textfieldEndeditingBlock requestMessageCodeBlock:(textFieldRequestMessageCodeBlock)requestMessageCodeBlock
{
    self.textFieldBlock = textfieldEndeditingBlock;
    self.textFieldBeginBlock = textfieldBegin;
    self.requestMessageCodeBlock = requestMessageCodeBlock;
    
}

/**
 点击方法 （登录：101／忘记密码：100 / 102 帮助）
 */
- (void)clickBtn:(UIButton *)sender{
    if (self.clickTopBtnBlock) {
        self.clickTopBtnBlock(sender.tag);
    }
}

/**
 通过控制器类型 改变布局
 */
- (void)setLoginType:(loginTypeEnum)loginType
{
    [self setSubviewUI];
    [self setSubviewConstraints];
    
    _loginType = loginType;
    if (loginType == quickLoginType) {
        _accoutHeaderImageview.hidden          = YES;
        _passwrodTextField.hidden              = YES;
        _forgetPWBtn.hidden                    = YES;
        _messageCodeTextField.hidden           = NO;
        _accountLable.hidden                   = YES;
        _logoImageView.hidden                  = NO;
        [_loginBtn setTitle:ZJSTRING(@"验证并登录") forState:UIControlStateNormal];
        self.accoutHeaderImageview.image            = ZJCURRENTIMAGE(IMAGEFILEPATH_LOGINANDREGISTER_LOGIN,
                                                                     @"login_logo_icon",
                                                                     ZJProjectLoadImageDefault);
        [self.phoneNumberTextField becomeFirstResponder];
        
        self.AccountloginBtn.hidden                 = NO;
        self.QQloginBtn.hidden                      = NO;
        self.quickLoginBtn.hidden                   = YES;
        self.switchAccountLoginBtn.hidden           = YES;
        self.lineview1.hidden                       = NO;
        self.lineview2.hidden                       = NO;
        self.WeiXinloginBtn.hidden                  = YES;
        if (self.isShowWXicon) {
            self.WeiXinloginBtn.hidden                  = NO;
        }
        
    } else if(loginType == generalLoginType) {
        _accoutHeaderImageview.hidden          = YES;
        _logoImageView.hidden                  = NO;
        _messageCodeTextField.hidden           = YES;
        _passwrodTextField.hidden              = NO;
        _forgetPWBtn.hidden                    = NO;
        _accountLable.hidden                   = YES;
        _phoneNumberTextField.hidden           = NO;
        [_loginBtn setTitle:ZJSTRING(@"登录") forState:UIControlStateNormal];
        self.accoutHeaderImageview.image            = ZJCURRENTIMAGE(IMAGEFILEPATH_LOGINANDREGISTER_LOGIN,
                                                                     @"login_logo_icon",
                                                                     ZJProjectLoadImageDefault);
        [self.phoneNumberTextField becomeFirstResponder];
        
        self.AccountloginBtn.hidden                 = YES;
        self.QQloginBtn.hidden                      = NO;
        self.quickLoginBtn.hidden                   = NO;
        self.switchAccountLoginBtn.hidden           = YES;
        self.lineview1.hidden                       = NO;
        self.lineview2.hidden                       = NO;
        self.WeiXinloginBtn.hidden                  = YES;
        if (self.isShowWXicon) {
            self.WeiXinloginBtn.hidden                  = NO;
        }
        [self setSubviewConstraints];
        
    }else if (loginType == haveAcountLoginType) {
        _phoneNumberTextField.hidden            = YES;
        _messageCodeTextField.hidden            = YES;
        _passwrodTextField.hidden               = NO;
        _forgetPWBtn.hidden                     = NO;
        _accountLable.hidden                    = NO;
        _logoImageView.hidden                   = YES;
        _accountLable.text                      = [User_LocalData getUserData].nickname;
        _accoutHeaderImageview.layer.cornerRadius       = ADJUST_PERCENT_FLOAT(30);
        _accoutHeaderImageview.layer.masksToBounds      = YES;
        
        [_loginBtn setTitle:ZJSTRING(@"登录") forState:UIControlStateNormal];
        
        if ([[User_LocalData getUserData].headImage isEqualToString:@"default"]) {
            _accoutHeaderImageview.image                    = [UIImage imageNamed:@"mine_defaultphoto_icon"];
        } else {
            [_accoutHeaderImageview sd_setImageWithURL:[NSURL URLWithString:[User_LocalData getUserData].headImage] placeholderImage:[UIImage imageNamed:@"mine_defaultphoto_icon"]];
        }
        
        [_accoutHeaderImageview mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(60), ADJUST_PERCENT_FLOAT(60)));
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(87.5));
        }];
        [_passwrodTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_logoImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(logoimageBoomdistance));
            make.right.and.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(PROJECT_CUSTOM_TEXTFIELD_HEIGHT));
        }];
        [_passwrodTextField becomeFirstResponder];
        
        self.AccountloginBtn.hidden                 = YES;
        self.WeiXinloginBtn.hidden                  = YES;
        self.QQloginBtn.hidden                      = YES;
        self.quickLoginBtn.hidden                   = YES;
        self.switchAccountLoginBtn.hidden           = NO;
        self.lineview1.hidden                       = YES;
        self.lineview2.hidden                       = YES;
    }
   
}

/**
 初始化view
 */
+ (instancetype)creatLoginTopViewWithType:(loginTypeEnum)Type isShowWXicon:(BOOL)isShowWXicon clickTopBtnBlock:(clickLoginBtnOrForgetBtn)clickTopBlock clickBoomBtnBlock:(clickBoomBtnBlock)clickBoomBtnBlock
{
    YBLoginTopBigView *view         = [[YBLoginTopBigView alloc]init];
    view.isShowWXicon               = isShowWXicon;
    view.clickBoomBtnBlock          = clickBoomBtnBlock;
    view.clickTopBtnBlock           = clickTopBlock;
    return view;
}
- (void)setUpdateloginType:(loginTypeEnum)updateloginType
{
    self.loginType = updateloginType;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

/**
 添加控件
 */
- (void)setSubviewUI
{
    
    [self addSubview:self.logoImageView];
    [self addSubview:self.accoutHeaderImageview];
    [self addSubview:self.accountLable];
    
    /**
     手机号
     */
    [self addSubview:self.phoneNumberTextField];
    /**
     密码
     */
    [self addSubview:self.passwrodTextField];
    /**
     短信验证码
     */
    [self addSubview:self.messageCodeTextField];
    
    [self addSubview:self.forgetPWBtn];
    [self addSubview:self.loginBtn];
    
    [self addSubview:self.HelpBtn];
    [self addSubview:self.AccountloginBtn];
    [self addSubview:self.QQloginBtn];
    [self addSubview:self.WeiXinloginBtn];
    [self addSubview:self.quickLoginBtn];
    [self addSubview:self.switchAccountLoginBtn];
    [self addSubview:self.lineview1];
    [self addSubview:self.lineview2];
    
}

/**
 子视图添加约束
 */
- (void)setSubviewConstraints
{
    
    [_accoutHeaderImageview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(60), ADJUST_PERCENT_FLOAT(60)));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(87.5));
    }];
    
    [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(54), ADJUST_PERCENT_FLOAT(77)));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(87.5));
    }];
    
    [_accountLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_logoImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-55));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
    }];
    
    [_phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(PROJECT_CUSTOM_TEXTFIELD_HEIGHT));
        make.top.mas_equalTo(_logoImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(logoimageBoomdistance));
    }];
    
    [_passwrodTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_phoneNumberTextField.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.left.and.right.and.height.mas_equalTo(_phoneNumberTextField);
    }];
    
    [_messageCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_phoneNumberTextField.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.left.and.right.and.height.mas_equalTo(_phoneNumberTextField);
    }];
    
    [_forgetPWBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).mas_offset(-55);
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(150), ADJUST_PERCENT_FLOAT(30)));
        make.top.mas_equalTo(_passwrodTextField.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(15));
    }];
    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-55));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(40));
        make.top.mas_equalTo(_forgetPWBtn.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(15));
    }];
    
    
    CGFloat btnw = (SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(110))/3;
    if (!self.isShowWXicon) {
        btnw = (SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(110))/2;
    }
    CGFloat toLoginBtnBoom = ADJUST_PERCENT_FLOAT(60);
    CGFloat loginBtnHei   = ADJUST_PERCENT_FLOAT(30);
    [self.AccountloginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(btnw);
        make.height.mas_offset(loginBtnHei);
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.top.mas_equalTo(_loginBtn.mas_bottom).mas_offset(toLoginBtnBoom);
    }];
    
    [self.quickLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(btnw);
        make.height.mas_offset(loginBtnHei);
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.top.mas_equalTo(_loginBtn.mas_bottom).mas_offset(toLoginBtnBoom);
    }];
    
    [self.QQloginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(btnw);
        make.height.mas_offset(loginBtnHei);
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(55)+ btnw);
        make.top.mas_equalTo(_loginBtn.mas_bottom).mas_offset(toLoginBtnBoom);
    }];
    
    [self.WeiXinloginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(btnw);
        make.height.mas_offset(loginBtnHei);
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(55)+ btnw*2);
        make.top.mas_equalTo(_loginBtn.mas_bottom).mas_offset(toLoginBtnBoom);
    }];
    
    [self.lineview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(55)+ btnw + 0.5);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.width.mas_offset(0.5);
        make.centerY.mas_equalTo(_QQloginBtn.mas_centerY);
    }];
    if (self.isShowWXicon) {
        [self.lineview2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(55)+ btnw*2 + 1);
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
            make.width.mas_offset(0.5);
            make.centerY.mas_equalTo(_QQloginBtn.mas_centerY);
        }];
    }
    
    [self.switchAccountLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(100), ADJUST_PERCENT_FLOAT(30)));
        make.centerX.mas_equalTo(self.centerX);
        make.top.mas_equalTo(_loginBtn.mas_bottom).mas_offset(toLoginBtnBoom);
    }];
    
    [self.HelpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-15));
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(25), ADJUST_PERCENT_FLOAT(25)));
    }];
}

/**
 点击 boombtn
 */
- (void)clickbtn:(UIButton *)sender
{
    if (self.clickBoomBtnBlock) {
        self.clickBoomBtnBlock(sender.titleLabel.text);
    }
}

#pragma mark  *** 懒加载

#pragma  topview

/**
 login图
 */
- (ZJBaseImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [[ZJBaseImageView alloc]init];
        self.logoImageView.image            = ZJCURRENTIMAGE(IMAGEFILEPATH_LOGINANDREGISTER_LOGIN,
                                                             @"login_logo_icon",
                                                             ZJProjectLoadImageDefault);
    }
    return _logoImageView ;
}

/**
 账号头像
 */
- (ZJBaseImageView *)accoutHeaderImageview {
    if (!_accoutHeaderImageview) {
        _accoutHeaderImageview = [[ZJBaseImageView alloc]init];
    }
    return _accoutHeaderImageview;
}

/**
 账户昵称
 */
- (YBDefaultLabel *)accountLable {
    if (!_accountLable) {
        _accountLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12)
                                                 text:@""
                                            textColor:ZJCOLOR.color_c4];
        _accountLable.textAlignment         = NSTextAlignmentCenter;
        _accountLable.hidden                = YES;
    }
    return _accountLable;
}

/**
 手机号
 */
- (YBPhoneNumberTextField *)phoneNumberTextField {
    if (!_phoneNumberTextField) {
        _phoneNumberTextField = [YBPhoneNumberTextField textFieldWithEndEditingCallBackBlock:^(UITextField *textField) {
            if (self.textFieldBlock) {
                self.textFieldBlock(phoneType,textField.text);
            }
            
        } beginEditingCallBackBlock:^(UITextField *textField) {
            if (self.textFieldBeginBlock) {
                self.textFieldBeginBlock(phoneType, textField);
            }
        }];
        _phoneNumberTextField.texfiledDelegate = self;
    }
    return _phoneNumberTextField;
}

/**
 密码
 */
- (YBPasswordTextField *)passwrodTextField  {
    if (!_passwrodTextField ) {
        _passwrodTextField  = [YBPasswordTextField textFieldWithEndEditingCallBackBlock:^(UITextField *textField) {
            if (self.textFieldBlock) {
                self.textFieldBlock(passWordType,textField.text);
            }
        } beginEditingCallBackBlock:^(UITextField *textField) {
            if (self.textFieldBeginBlock) {
                self.textFieldBeginBlock(passWordType,textField);
            }
        }];
        _passwrodTextField.texfiledDelegate = self;
    }
    return _passwrodTextField ;
}

/**
 短信验证码
 */
- (YBMessageCodeTextField *)messageCodeTextField {
    if (!_messageCodeTextField) {
        _messageCodeTextField = [YBMessageCodeTextField textFieldMessageCodeWithEndEditingCallBackBlock:^(UITextField *textField) {
            if (self.textFieldBlock) {
                self.textFieldBlock(messageCodeType,textField.text);
            }
        } beginEditingCallBackBlock:^(UITextField *textField) {
            if (self.textFieldBeginBlock) {
                self.textFieldBeginBlock(messageCodeType,textField);
            }
        } loadMessageCodeButtonCallBack:^(id sender) {
            if (self.requestMessageCodeBlock) {
                self.requestMessageCodeBlock();
            }
        }];
        _messageCodeTextField.texfiledDelegate = self;
    }
    return _messageCodeTextField;
}

/**
 忘记密码
 */
- (YBDefaultButton *)forgetPWBtn {
    if (!_forgetPWBtn) {
        _forgetPWBtn =  [YBDefaultButton buttonWithTitleStringKey:LOGIN_FORGETPWD_STRINGKEY
                                                       titleColor:ZJCOLOR.color_c4
                                                        titleFont:SYSTEM_REGULARFONT(12)
                                                           target:self
                                                         selector:@selector(clickBtn:)];
        _forgetPWBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _forgetPWBtn.tag                    = 100;
    }
    return _forgetPWBtn;
}

/**
 登录按钮
 */
- (YBDefaultButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [YBDefaultButton buttonWithTitleStringKey:@""
                                                   titleColor:ZJCOLOR.color_c0
                                                    titleFont:SYSTEM_REGULARFONT(12)
                                                       target:self
                                                     selector:@selector(clickBtn:)];
        _loginBtn.backgroundColor =  ZJCOLOR.color_c5;
        _loginBtn.tag                       = 101;
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius  = ADJUST_PERCENT_FLOAT(20);
        _loginBtn.userInteractionEnabled = NO;
    }
    return _loginBtn;
}


#pragma  boomview

/**
 快捷登录
 */
- (YBDefaultButton *)quickLoginBtn {
    if (!_quickLoginBtn) {
        _quickLoginBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:ZJSTRING(@"快捷登录")
                                                                     titleColor:ZJCOLOR.color_c4
                                                                      titleFont:SYSTEM_REGULARFONT(12)
                                                                  imageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                                     imageNamed:@"login_phone"
                                                                           type:ZJProjectButtonSetImage
                                                                         target:self selector:@selector(clickbtn:)];
        _quickLoginBtn.imageView.contentMode = UIViewContentModeCenter;
        _quickLoginBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    }
    return _quickLoginBtn   ;
}

/**
 QQ
 */
- (YBDefaultButton *)QQloginBtn {
    if (!_QQloginBtn) {
        _QQloginBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:ZJSTRING(@"QQ")
                                                                  titleColor:ZJCOLOR.color_c4
                                                                   titleFont:SYSTEM_REGULARFONT(12)
                                                               imageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                                  imageNamed:@"login_QQ"
                                                                        type:ZJProjectButtonSetImage
                                                                      target:self selector:@selector(clickbtn:)];
        _QQloginBtn.imageView.contentMode = UIViewContentModeCenter;
        _QQloginBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    }
    return _QQloginBtn   ;
}

/**
 微信
 */
- (YBDefaultButton *)WeiXinloginBtn {
    if (!_WeiXinloginBtn) {
        _WeiXinloginBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:ZJSTRING(@"微信")
                                                                      titleColor:ZJCOLOR.color_c4
                                                                       titleFont:SYSTEM_REGULARFONT(12)
                                                                   imageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                                      imageNamed:@"login_wechat"
                                                                            type:ZJProjectButtonSetImage
                                                                          target:self selector:@selector(clickbtn:)];
        _WeiXinloginBtn.imageView.contentMode = UIViewContentModeCenter;
        _WeiXinloginBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
        
    }
    return _WeiXinloginBtn   ;
}

/**
 账号
 */
- (YBDefaultButton *)AccountloginBtn {
    if (!_AccountloginBtn) {
        _AccountloginBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:ZJSTRING(@"账号")
                                                                       titleColor:ZJCOLOR.color_c4
                                                                        titleFont:SYSTEM_REGULARFONT(12)
                                                                    imageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                                       imageNamed:@"login_lock"
                                                                             type:ZJProjectButtonSetImage
                                                                           target:self selector:@selector(clickbtn:)];
        _AccountloginBtn.imageView.contentMode = UIViewContentModeCenter;
        _AccountloginBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    }
    return _AccountloginBtn   ;
}

/**
 切换账号
 */
- (YBDefaultButton *)switchAccountLoginBtn {
    if (!_switchAccountLoginBtn) {
        _switchAccountLoginBtn = [YBDefaultButton buttonWithTitleStringKey:ZJSTRING(@"切换账号")
                                                                titleColor:ZJCOLOR.color_c4
                                                                 titleFont:SYSTEM_REGULARFONT(12)
                                                                    target:self
                                                                  selector:@selector(clickbtn:)];
    }
    return _switchAccountLoginBtn;
}

- (YBDefaultButton *)HelpBtn {
    if (!_HelpBtn) {
        _HelpBtn = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                      imageNamed:@"login_help_icon"
                                                            type:ZJProjectButtonSetImage
                                                          target:self selector:@selector(clickBtn:)];
        _HelpBtn.tag = 102;
        
    }
    return _HelpBtn;
}

- (UIView *)lineview1 {
    if (!_lineview1) {
        _lineview1 = [[UIView alloc]init];
        _lineview1.backgroundColor = ZJCOLOR.color_c16;
    }
    return _lineview1;
}
- (UIView *)lineview2 {
    if (!_lineview2) {
        _lineview2 = [[UIView alloc]init];
        _lineview2.backgroundColor = ZJCOLOR.color_c16;
    }
    return _lineview2;
}

@end
