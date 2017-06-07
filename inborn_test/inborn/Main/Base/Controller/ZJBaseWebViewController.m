//
//  ZJBaseWebViewController.m
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJBaseWebViewController.h"
#import "ZJBaseBarButtonItem.h"

@interface ZJBaseWebViewController () <WKNavigationDelegate>

@end

@implementation ZJBaseWebViewController

//TODO:切换为第三方或系统WebView

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)loadView
{
    self.webView = [[WKWebView alloc] initWithFrame:SCREEN_RECT];
    self.view = self.webView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /**
     *  配置左侧按钮点击事件
     */
    
    YBDefaultButton *button = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                 imageNamed:@"public_back"
                                                                       type:ZJProjectButtonSetImageDefault
                                                                     target:self
                                                                   selector:@selector(buttonClick:)];
    ZJBaseBarButtonItem *backButtonItem = [[ZJBaseBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem     = backButtonItem;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [SVProgressHUD dismiss];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
