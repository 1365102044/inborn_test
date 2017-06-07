//
//  YBAgreementViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/18.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAgreementViewController.h"
#import <WebKit/WebKit.h>
#import "ZJBaseBarButtonItem.h"

@interface YBAgreementViewController () <WKNavigationDelegate>

@property(nonatomic,strong) WKWebView * agreementWebView;

@end

@implementation YBAgreementViewController

- (void)buttonClick:(UIButton *)sender
{
    if ([self.agreementWebView canGoBack]) {
        [self.agreementWebView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)loadView
{
    self.agreementWebView = [[WKWebView alloc] initWithFrame:SCREEN_RECT];
    self.agreementWebView.navigationDelegate = self;
    self.view = self.agreementWebView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"用户协议";
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    NSString *URL ;
    URL = [NSString stringWithFormat:@"%@/inbornAgreement.html;source=ios",BASE_M_URL];
    NSURL *url = [NSURL URLWithString:URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.agreementWebView loadRequest:request];
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
