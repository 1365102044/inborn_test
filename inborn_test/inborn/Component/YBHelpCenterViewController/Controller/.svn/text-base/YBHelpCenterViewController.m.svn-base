//
//  YBHelpCenterViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBHelpCenterViewController.h"
#import <WebKit/WebKit.h>
#import "ZJBaseBarButtonItem.h"

@interface YBHelpCenterViewController () <WKNavigationDelegate>

@property(nonatomic,strong) WKWebView * helpWebView;

@end

@implementation YBHelpCenterViewController

- (void)buttonClick:(UIButton *)sender
{
    if ([self.helpWebView canGoBack]) {
        [self.helpWebView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)loadView
{
    self.helpWebView = [[WKWebView alloc] initWithFrame:SCREEN_RECT];
    self.helpWebView.navigationDelegate = self;
    self.view = self.helpWebView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"帮助中心";
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    NSString *URL ;
    URL = [NSString stringWithFormat:@"%@/help/help.html;source=ios",BASE_M_URL];
    NSURL *url = [NSURL URLWithString:URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.helpWebView loadRequest:request];
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

@end
