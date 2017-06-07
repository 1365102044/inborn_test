//
//  ZJBaseLoginAndRegisterViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseLoginAndRegisterViewController.h"
#import "IQKeyboardManager.h"

@interface ZJBaseLoginAndRegisterViewController ()
/**
 保存naviBar的图片
 */
@property (nonatomic, strong) UIImage *defaultNaviBarImage;

/**
 保存naviBar背景图片
 */
@property (nonatomic, strong) UIImage *defaultNaviBarBackgroundImage;

@end

@implementation ZJBaseLoginAndRegisterViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

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
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:self.defaultNaviBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:self.defaultNaviBarImage];
    self.tabBarController.tabBar.hidden = NO;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     点击背景 取消键盘
     */
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (YBTopAlert *)TopAlert
{
    return [YBTopAlert sharedAlert];
}
@end
