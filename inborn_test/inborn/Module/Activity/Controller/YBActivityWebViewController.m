//
//  YBActivityWebViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBActivityWebViewController.h"

@interface YBActivityWebViewController () <WKNavigationDelegate>

@end

@implementation YBActivityWebViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error
{
    [SVProgressHUD dismiss];
    [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                              tipsString:@"暂无数据"
                             buttonTitle:nil];    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    YBLog(@"13");
    [SVProgressHUD dismiss];
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    YBLog(@"13");
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    YBLog(@"13");
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView.navigationDelegate = self;
    self.navigationItem.title = self.adTitle;
    
    if ([self.adUrl isEqualToString:@""]
        || self.adUrl.length == 0
        || [self.adUrl isEqualToString:@"#"]) {
        
        [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                  tipsString:@"暂无数据"
                                 buttonTitle:nil];
        
    }else{
        [SVProgressHUD show];
        NSURL *url = [NSURL URLWithString:self.adUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
