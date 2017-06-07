//
//  YBScanResultViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/5/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBScanResultViewController.h"
#import <WebKit/WebKit.h>
@interface YBScanResultViewController ()<WKNavigationDelegate>

@property(nonatomic,strong) WKWebView * WebView;

@property(strong,nonatomic) NSString * scanResult;
@end

@implementation YBScanResultViewController

+ (instancetype)creatScanResultVCwthScanResult:(NSString *)scanresult
                                        extend:(id)extend
{
    YBScanResultViewController *vc = [[YBScanResultViewController alloc]init];
    vc.scanResult = scanresult;
    return vc;
}

- (void)loadView
{
    
    if (![self.scanResult ex_isUrlStr]) {
        UILabel *desc = [[UILabel alloc]initWithFrame:SCREEN_RECT];
        desc.textColor = ZJCOLOR.color_c4;
        desc.font = SYSTEM_REGULARFONT(15);
        desc.numberOfLines = 0;
        [self.view addSubview:desc];
        desc.text = _scanResult;
        return;
    }
    self.WebView = [[WKWebView alloc] initWithFrame:SCREEN_RECT];
    self.WebView.navigationDelegate = self;
    self.view = self.WebView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZJCOLOR.color_c12;
    self.title = @"扫描结果";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_scanResult]];
    [self.WebView loadRequest:request];
//    [SVProgressHUD show];
    
    UIButton *leftbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [leftbtn setImage:[UIImage imageNamed:@"public_back_n"] forState:UIControlStateNormal];
    [leftbtn setImage:[UIImage imageNamed:@"public_back_h"] forState:UIControlStateSelected];
    leftbtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [leftbtn addTarget:self action:@selector(gotobackbtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftitem = [[UIBarButtonItem alloc]initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem = leftitem;

}

- (void)gotobackbtn
{
    [self.navigationController popToViewController:self.navigationController.viewControllers[self.navigationController.viewControllers.count-3] animated:YES];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    [SVProgressHUD dismiss];
}

@end
