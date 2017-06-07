//
//  YBAppraisalReportViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAppraisalReportViewController.h"
#import <WebKit/WebKit.h>
#import "User_LocalData.h"
#import "System_LocalData.h"
@interface YBAppraisalReportViewController ()<WKNavigationDelegate>

@property(nonatomic,strong) WKWebView * WebView;

@property(nonatomic,strong) NSString * appraisalId;

@end

@implementation YBAppraisalReportViewController

+ (instancetype)creatAppraisalReportWithappraisalId:(NSString *)appraisalId
                                             extend:(NSString *)extend
{
    YBAppraisalReportViewController *appraisalreportvc = [[YBAppraisalReportViewController alloc]init];
    appraisalreportvc.appraisalId                      = appraisalId;
    return appraisalreportvc;
}

- (void)loadView
{
    self.WebView = [[WKWebView alloc] initWithFrame:SCREEN_RECT];
    self.WebView.navigationDelegate = self;
    self.view = self.WebView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZJCOLOR.color_c12;
    self.title = @"鉴定报告";
    
    NSString *uuid = [[System_LocalData alloc] init].UUID;
    NSString *tokenid = [User_LocalData getTokenId];
    NSString *userid = [tokenid substringFromIndex:uuid.length];
    NSString *newstr = [NSString getUrlStringFromString:userid];
    NSString *url = [NSString stringWithFormat:@"%@/member/appraisalReport.html;appraisalId=%@;tokeId=%@;uuId=%@",BASE_M_URL,_appraisalId,newstr,uuid];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.WebView loadRequest:request];
    [SVProgressHUD show];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    [SVProgressHUD dismiss];
}

@end
