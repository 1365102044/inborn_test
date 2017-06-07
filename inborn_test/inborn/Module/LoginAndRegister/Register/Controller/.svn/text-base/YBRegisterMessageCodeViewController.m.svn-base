//
//  YBRegisterMessageCodeViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRegisterMessageCodeViewController.h"
#import "YBAttributedStringLabel.h"
#import "YBRegisterMessageCodeTopView.h"
#import "ZJLoginAndRegisterService.h"
#import "YBResetPassWordViewController.h"
#import "User_LocalData.h"
#import "ZJBaseNavigationController.h"
#import "YBMeMainViewController.h"
#import "YBTopAlert.h"

@interface YBRegisterMessageCodeViewController ()<YBVerCodeTextFieldDelegate>

//@property (strong ,nonatomic) YBAttributedStringLabel * boomLable;
@property(nonatomic,strong) YBRegisterMessageCodeTopView * messageCodeTopView;
@property(nonatomic,strong) NSString * phoneStr;
@property(nonatomic,assign)  sourceVcType sourVcType;
@property(nonatomic,strong) YBTopAlert * TopAlert;
/**
  第三方登录过来的手机号 是否注册过，YES: 注册; NO: 未注册
 */
@property(nonatomic,assign) BOOL  isRegisterBool;

/**
  登录过来  openid
 */
@property(nonatomic,strong) NSString * openid;
/**
 保存naviBar的图片
 */
@property (nonatomic, strong) UIImage *defaultNaviBarImage;

/**
 保存naviBar背景图片
 */
@property (nonatomic, strong) UIImage *defaultNaviBarBackgroundImage;

@end

@implementation YBRegisterMessageCodeViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

/**
 第三方登录 重写获取验证码 （绑定）
 */
- (void)reGetThirdLoginMessageCodeReuest
{
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    
    [[ZJLoginAndRegisterService share] thirdLoginLoadMessageCodeWithPhone:_phoneStr
                                                                     type:((_sourVcType == thridQQLoginType || _sourVcType == thridQQBindType) ? @"2":@"1")
                                                                  success:^(id objc, id requestInfo) {
                                                                      YBLog(@"-- 第三方登录 重写获取验证码--%@--%@",objc,requestInfo);
                                                                      [self.messageCodeTopView StarTimer];
                                                                  } fail:^(id error, id requestInfo) {
                                                                      YBLog(@"-er- 第三方登录 重写获取验证码--%@--%@",error,requestInfo);
                                                                  }];
}

/**
 忘记密码的重新获取短信验证吗
 */
- (void)reGetForgetMessageCodeRequest
{
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    [[ZJLoginAndRegisterService share] forgetPwdLoadMessageCodeWithPhone:_phoneStr
                                                                 success:^(id objc, id requestInfo) {
          YBLog(@"--忘记密码重新获取验证码--%@--%@",objc,requestInfo);
                                                                  [self.messageCodeTopView StarTimer];
    } fail:^(id error, id requestInfo) {
          YBLog(@"-er-忘记密码重新获取验证码--%@--%@",error,requestInfo);
    }];
}

/**
 注册的重新获取验证码
 */
- (void)reGetRegisterMessageCodeRequest
{
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    [[ZJLoginAndRegisterService share] registerLoadMessageCodeWithPhone:_phoneStr
                                                                success:^(id objc, id requestInfo) {
                                                                    YBLog(@"--组册重新获取验证码--%@--%@",objc,requestInfo);
                                                                    [self.messageCodeTopView StarTimer];
                                                                } fail:^(id error, id requestInfo) {
                                                                    YBLog(@"-er-组册重新获取验证码--%@--%@",error,requestInfo);
                                                                    
                                                                }];
}

- (void)clickAggerment:(UITapGestureRecognizer *)tap
{
    YBLog(@"服务协议");
}

#pragma mark - Fourth.代理方法
/**
 验证码的代理方法
 */
- (void)verCodeTextField:(YBVerCodeTextField *)verificationCodeInputView
    verificationCodeText:(NSString *)verificationCodeText
{
    if (self.sourVcType == registerType) [self reginsterRequestWithMessageCode:verificationCodeText];
    else if (self.sourVcType == forgetpasswordType) [self forgetPassWordRequestWithMessCode:verificationCodeText];
    else if (self.sourVcType == thridQQLoginType||
             self.sourVcType == thridWXLoginType||
             self.sourVcType == thridQQBindType||
             self.sourVcType==thridWXBindType) [self thirdLoginWithMessCode:verificationCodeText];
    
}

/**
 第三方登录 对验证码的校验
    type                 1表示微信。2表示QQ（必传）
    openid               QQ用户openid（必传）
 */
- (void)thirdLoginWithMessCode:(NSString *)MessageCode
{
    NSString *loginType;
    if (self.sourVcType == thridQQLoginType || _sourVcType == thridQQBindType) loginType = @"2";
    else if (self.sourVcType == thridWXLoginType||_sourVcType == thridWXBindType) loginType = @"1";
    
    if (_sourVcType == thridWXBindType ||_sourVcType == thridQQBindType) {
        self.isRegisterBool = YES;
    }

    if (!self.isRegisterBool) {
        /**
         第三方登录-未注册绑定请求
         */
        [[ZJLoginAndRegisterService share] thirdNeverRegisterBindWithPhone:_phoneStr
                                                                      type:loginType
                                                                    openid:_openid
                                                                   smsCode:MessageCode
                                                                  prodBids:[[[User_LocalData alloc] init]
                                                                            getBrowseRecordGoodsId]
                                                                   success:^(id objc, id requestInfo) {
                                                                       
                                                                       [self handleReginsterOrThirdLogin:objc requestInfo:requestInfo];
                                                                   } fail:^(id error, id requestInfo) {
                                                                       
                                                                   }];
    }else{
        /**
         第三方登录-已注册绑定
         */
        [[ZJLoginAndRegisterService share] thirdLoginAlreadyRegisterBindWithPhone:_phoneStr
                                                                             type:loginType
                                                                           openid:_openid
                                                                          smsCode:MessageCode
                                                                         prodBids:[[[User_LocalData alloc] init]
                                                                                   getBrowseRecordGoodsId]
                                                                          success:^(id objc, id requestInfo) {
                                                                              
                                                                              [self handleReginsterOrThirdLogin:objc requestInfo:requestInfo];
                                                                          } fail:^(id error, id requestInfo) {
                                                                              
                                                                          }];
    }
}

 /**
 忘记密码 对验证码的验证
 */
- (void)forgetPassWordRequestWithMessCode:(NSString *)MessageCode
{
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    [[ZJLoginAndRegisterService share] forgetPwdFirstWithPhone:_phoneStr
                                                       smsCode:MessageCode
                                                       success:^(id objc, id requestInfo) {
                                                           
        [self.navigationController pushViewController:[YBResetPassWordViewController
                                                       creatReSetPassWordViewControllerWithPhone:_phoneStr
                                                       messageCode:MessageCode
                                                       Extend:nil]
                                             animated:YES];
    } fail:^(id error, id requestInfo) {
        
    }];
}

/**
 注册 对验证码的验证
 */
- (void)reginsterRequestWithMessageCode:(NSString *)MessageCode
{
    if ([_phoneStr ex_isEmpty]) {
        [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                     tipsStringKey:ALERT_TIPS_PHONE_EMPTY_STRINGKEY
                                              type:YBTopAlertError
                                eventCallBackBlock:^(id sender) {}];
        return;
    }
    [[ZJLoginAndRegisterService share] registerWithPhone:_phoneStr
                                                 smsCode:MessageCode
                                                prodBids:[[[User_LocalData alloc] init]
                                                          getBrowseRecordGoodsId]
                                                 success:^(id objc, id requestInfo) {
                                                     [self.TopAlert showAlertWithTitleStringKey:ALERT_TITLE_SUCCESS_STRINGKEY
                                                                                  tipsStringKey:ALERT_TIPS_REGISTERSUCCESS_STRINGKEY
                                                                                           type:YBTopAlertSuccess
                                                                             eventCallBackBlock:^(id sender) {
                                                                                 
                                                                             }];
                                                     
                                                     [self handleReginsterOrThirdLogin:objc requestInfo:requestInfo];
                                                     
                                                 } fail:^(id error, id requestInfo) {
                                                     
                                                 }];

}

/**
 注册成功，第三方登录成功结果的统一处理
 */
- (void)handleReginsterOrThirdLogin:(id)objc requestInfo:(id)requestInfo
{
    
    if (_sourVcType == thridWXBindType ||_sourVcType == thridQQBindType) {
        
        [self.navigationController.navigationBar setBackgroundImage:self.defaultNaviBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:self.defaultNaviBarImage];
        [self.navigationController popToRootViewControllerAnimated:NO];
        
        /**
         *  跳转列表
         */
        UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        ZJBaseNavigationController *baseNavigationController = tabBarController.childViewControllers.lastObject;
        YBMeMainViewController *mineController = (YBMeMainViewController *)baseNavigationController.childViewControllers.firstObject;
        tabBarController.selectedIndex = tabBarController.childViewControllers.count - 1;
        [mineController directPushToOrderListViewControllerextend:@"thirdbindvc"];
        
        return;
    }
    
    [SYSTEM_USERDEFAULTS setObject:_phoneStr forKey:@"realphone"];
    
    /**
     *  保存用户信息
     */
    [User_LocalData setUserDataWith:objc[@"data"]];
    
    /**
     *  保存token
     */
    ZJProjectNetRequestInfo *requestInfoModel = (ZJProjectNetRequestInfo *)requestInfo;
    @try {
        [User_LocalData setTokenId:requestInfoModel.responseObject[@"token"]];
    } @catch (NSException *exception) {
    } @finally {
    }
    /**
     登录成功后 返回到原处
     */
    [self.navigationController popToRootViewControllerAnimated:YES];
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"registerorthridloginsuccessnoti" object:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:self.defaultNaviBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:self.defaultNaviBarImage];
    self.tabBarController.tabBar.hidden = NO;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

#pragma mark - Fifth.控制器生命周期

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.defaultNaviBarImage                            = self.navigationController.navigationBar.shadowImage;
    self.defaultNaviBarBackgroundImage                  = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    if (_sourVcType == thridQQBindType ||_sourVcType == thridWXBindType) {
        
        [self reGetThirdLoginMessageCodeReuest];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
}

/**
 初始化
 */
+ (instancetype)creatRegisterMessageCodeViewControllerWithPhone:(NSString *)phone SourceVcType:(sourceVcType)sorucetype Extend:(id)extend;
{
    YBRegisterMessageCodeViewController *viewcontroller = [[YBRegisterMessageCodeViewController alloc]init];
    viewcontroller.phoneStr                             = phone;
    viewcontroller.sourVcType                           = sorucetype;
    if (sorucetype == thridWXLoginType||
        sorucetype == thridQQLoginType ||
        sorucetype == thridQQBindType ||
        sorucetype == thridWXBindType) {
        viewcontroller.openid                               = [extend[@"openid"] ex_isEmpty] ? @"" : extend[@"openid"];
        viewcontroller.isRegisterBool                       = [extend[@"phoneISregister"] isEqualToString:@"register"] ? YES : NO;
    }
    
    return viewcontroller;
}

#pragma mark - Sixth.界面配置
- (void)setUI
{
    [self.view addSubview:self.messageCodeTopView];
    self.messageCodeTopView.CodeTextField.delegate      = self;
    [_messageCodeTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.mas_equalTo(self.view).mas_offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(0);
    }];
}

#pragma mark - Seventh.懒加载
- (YBRegisterMessageCodeTopView *)messageCodeTopView{
    if (!_messageCodeTopView) {
        _messageCodeTopView = [YBRegisterMessageCodeTopView creatReginsterMessageCodeTopView];
        WEAKSELF(self);
        _messageCodeTopView.clickRegerMessageBlock = ^(){
            if (weakself.sourVcType == registerType) [weakself reGetRegisterMessageCodeRequest];
            else if (weakself.sourVcType == forgetpasswordType) [weakself reGetForgetMessageCodeRequest];
            else if (weakself.sourVcType == thridQQLoginType ||
                     weakself.sourVcType == thridWXLoginType ||
                     weakself.sourVcType == thridQQBindType  ||
                     weakself.sourVcType == thridWXBindType) [weakself reGetThirdLoginMessageCodeReuest];
        };
    }
    return _messageCodeTopView;
}

- (YBTopAlert *)TopAlert
{
    return [YBTopAlert sharedAlert];
}
@end
