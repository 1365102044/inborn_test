//
//  YXOffLineNotificationController.m
//  inbid-ios
//
//  Created by 郑键 on 16/10/31.
//  Copyright © 2016年 胤讯. All rights reserved.
//

#import "YXOffLineNotificationController.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "YBLoginViewController.h"
#import "ZJBaseNavigationController.h"
#import "AppDelegate.h"
//#import "YXMyAccountNetRequestTool.h"
#import "YBPublicConfigure_LocalData.h"
#import "User_LocalData.h"
@interface YXOffLineNotificationController ()
/**
 提示label
 */
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;

@end

@implementation YXOffLineNotificationController

#pragma mark - 响应

-(void)setLoginStatus:(NSInteger)LoginStatus
{
    _LoginStatus = LoginStatus;
    
    NSString *AlearStr ;
    if (LoginStatus ==3) {
        
        AlearStr = @"登录失效，请重新登录。\n如需帮助请致电 ";
        self.tipsLabel.numberOfLines = 0;
        self.tipsLabel.textAlignment = NSTextAlignmentCenter;
    }else if (LoginStatus==6)
    {
        AlearStr = @"    您的账号在另一部手机登录，如非本人操作，则密码可能已经泄露，建议立即修改密码。如需帮助请致电 ";
    }
    NSMutableParagraphStyle *paragraphStyle2 = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle2.lineSpacing = 6;
    NSString *phonestr = [YBPublicConfigure_LocalData share].customerPhone;
    NSString *psText = [NSString stringWithFormat:@"%@%@", AlearStr,phonestr];
    NSMutableAttributedString *attributes2 = [[NSMutableAttributedString alloc] initWithString:psText];
    NSDictionary *allAttributes = @{
                                    NSFontAttributeName:[UIFont systemFontOfSize:11],
                                    NSParagraphStyleAttributeName:paragraphStyle2
                                    };
    [attributes2 addAttributes:allAttributes range:NSMakeRange(0, psText.length)];
    [attributes2 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:150.0/255.0 green:193.0/255.0 blue:243.0/255.0 alpha:1.0] range:NSMakeRange(psText.length-phonestr.length, [phonestr length])];
    
    self.tipsLabel.attributedText = attributes2;
    [self.tipsLabel yb_addAttributeTapActionWithStrings:@[phonestr] delegate:self];
}


/**
 退出按钮点击事件
 
 @param sender 退出按钮
 */
- (IBAction)backButtonClick:(UIButton *)sender
{
    [self popHomeViewController];
}

/**
 重新登录按钮点击事件
 
 @param sender 重新登录按钮
 */
- (IBAction)reLoginButtonClick:(UIButton *)sender
{
    loginTypeEnum type = generalLoginType;
    if ([User_LocalData getUserData].realphone.length != 0
        && [User_LocalData getUserData].realphone != nil){
        type = haveAcountLoginType;
    }
    //** 弹出登录界面 */
    YBLoginViewController *loginVC = [YBLoginViewController creatLoginViewControllerWithType:type
                                                                                      extend:@{@"formVC":@"droppedaccount"}];
    ZJBaseNavigationController *navi = [[ZJBaseNavigationController alloc] initWithRootViewController:loginVC];
    loginVC.againloginsecusshiddentabbarblock = ^{
        [self popHomeViewController];
    };
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)popHomeViewController
{
    self.view.hidden = YES;
    
    UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    ZJBaseNavigationController *baseNavigationController = tabBarController.childViewControllers[0];
    tabBarController.selectedIndex = 0;
    [baseNavigationController dismissViewControllerAnimated:YES completion:nil];
    [baseNavigationController popToRootViewControllerAnimated:YES];
    
    UITabBarController *tabbar = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    for (ZJBaseNavigationController *nav in tabbar.childViewControllers) {
        [nav popToRootViewControllerAnimated:YES];
    }
}

/**
 电话号码点击事件
 
 @param string 点击的电话号码
 @param range  范围
 @param index  下标
 */
- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
{
    //打电话
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",string];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

/**
 获取当前屏幕中的控制器
 
 @return 屏幕中间的控制器
 */
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

#pragma mark - 控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //** 配置界面 */
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    /**
     在登录页面 不登录直接返回的通知
     */
    [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(popHomeViewController) name:@"dismissDroplineViewController" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.view endEditing:YES];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"dismissDroplineViewController" object:nil];
}



@end
