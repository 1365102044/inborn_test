//
//  YBLoginBoomView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLoginBoomView.h"

@interface YBLoginBoomView ()

@property (nonatomic, strong) UIButton *quickLoginBtn;
@property(nonatomic,strong) UILabel * thirdTitleLable;
@property(nonatomic,strong) UIButton * QQBtn;
@property(nonatomic,strong) UIButton * WeiXinBtn;
@property(nonatomic,strong) UIButton * HelpBtn;
/**
 是否隐藏微信图片，默认NO,(不隐藏)
 */
@property(nonatomic,assign)   BOOL  isHiddenWX;
@property(nonatomic,assign) loginTypeEnum  loginType;

@end

@implementation YBLoginBoomView

/**
 根据控制器的类型，控制子视图的隐藏
 */
- (void)setLoginType:(loginTypeEnum)loginType
{
    if (loginType == quickLoginType) {
        [_quickLoginBtn setTitle:@"账号密码登录" forState:UIControlStateNormal];
//        _quickLoginBtn.hidden           = YES;
//        _thirdTitleLable.hidden         = YES;
//        _QQBtn.hidden                   = YES;
//        _WeiXinBtn.hidden               = YES;
    } else if(loginType == generalLoginType || loginType == haveAcountLoginType) {
        [_quickLoginBtn setTitle:@"手机号快捷登录" forState:UIControlStateNormal];
//        _quickLoginBtn.hidden           = NO;
//        _thirdTitleLable.hidden         = NO;
//        _QQBtn.hidden                   = NO;
        _WeiXinBtn.hidden               = _isHiddenWX;
    }
}

/**
 初始化view
 */
+ (instancetype)creatLoginBoomViewWithType:(loginTypeEnum)Type
                                isHiddenWX:(BOOL)isHiddenWX
{
    YBLoginBoomView *view           = [[YBLoginBoomView alloc]init];
    view.isHiddenWX                 = !isHiddenWX;
//    view.loginType                  = Type;
    [view IsHiddenWX:!isHiddenWX];
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
        [self setSubviewUI];
        [self setSubviewContrans];
    }
    return self;
}

/**
 创建子视图
 */
- (void)setSubviewUI
{
    _HelpBtn = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                  imageNamed:@"login_help_icon"
                                                        type:ZJProjectButtonSetBackgroundImage
                                                      target:self
                                                    selector:@selector(clickSubViewBtn:)];
    _HelpBtn.tag                      = 105;
    [self addSubview:_HelpBtn];
    
    _thirdTitleLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12)
                                                text:LOGIN_OTHERTYPELOGIN_STRINGKEY
                                           textColor:ZJCOLOR.color_c4];
    [self addSubview:_thirdTitleLable];
    
    
    _QQBtn = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                imageNamed:@"login_QQ"
                                                      type:ZJProjectButtonSetBackgroundImage
                                                    target:self
                                                  selector:@selector(clickSubViewBtn:)];
    _QQBtn.tag                          = 104;
    [self addSubview:_QQBtn];
    
    
    _WeiXinBtn = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                    imageNamed:@"login_wechat"
                                                          type:ZJProjectButtonSetBackgroundImage
                                                        target:self
                                                      selector:@selector(clickSubViewBtn:)];
    _WeiXinBtn.tag                      = 103;
    [self addSubview:_WeiXinBtn];
    
    _quickLoginBtn = [YBDefaultButton buttonWithTitleStringKey:LOGIN_PHONELOGIN_STRINGKEY
                                                    titleColor:ZJCOLOR.color_c4
                                                     titleFont:SYSTEM_REGULARFONT(12)
                                                        target:self
                                                      selector:@selector(clickSubViewBtn:)];
    _quickLoginBtn.tag                  = 102;
    [self addSubview:_quickLoginBtn];
}

/**
 子视图添加约束
 */
- (void)setSubviewContrans
{
    [_HelpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-10));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(18), ADJUST_PERCENT_FLOAT(18)));
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-20));
    }];
    
    [_WeiXinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(55), ADJUST_PERCENT_FLOAT(55)));
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-55));
        make.bottom.mas_equalTo(_HelpBtn.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-20));
    }];
    
    [_QQBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(_WeiXinBtn);
        make.bottom.mas_equalTo(_HelpBtn.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-20));
        make.right.mas_equalTo(_WeiXinBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-20));
    }];
    
    [_thirdTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(100), 30));
        make.centerY.mas_equalTo(_QQBtn.mas_centerY);
    }];
    
    [_quickLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(200), ADJUST_PERCENT_FLOAT(30)));
        make.bottom.mas_equalTo(_QQBtn.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-30));
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}

/**
 是否隐藏微信
 */
- (void)IsHiddenWX:(BOOL)isHiddenWX
{
    if (isHiddenWX) {
        _WeiXinBtn.hidden = isHiddenWX;
        [_QQBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(55), ADJUST_PERCENT_FLOAT(55)));
            make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-55));
            make.bottom.mas_equalTo(_HelpBtn.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-20));
        }];
    }
}

/**
 点击方法
 tag: 
    105    右下角的帮助图标
    104     QQ
    103     微信
    102     快捷登录
 */
- (void)clickSubViewBtn:(UIButton *)sender
{
    if (self.boomViewBlock) {
        self.boomViewBlock(sender.tag);
    }
}

@end
