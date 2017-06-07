//
//  YXMyWalletAgreementViewController.m
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/20.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXMyWalletAgreementViewController.h"
#import "YXMyWalletSetPassWordViewController.h"

@interface YXMyWalletAgreementViewController ()
@property(nonatomic,strong) UIWebView * WebView;

@property(nonatomic,assign) BOOL  isShowBoomView;
@end

@implementation YXMyWalletAgreementViewController


+ (instancetype)creatMyWalletAgreementViewControllerWihtIsShowBoomView:(BOOL)isShowBoomView extend:(id)extend
{
    YXMyWalletAgreementViewController *mywalletVC           = [[YXMyWalletAgreementViewController alloc]init];
    mywalletVC.isShowBoomView                               = isShowBoomView;
    return mywalletVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"钱包服务协议";
    self.view.backgroundColor = ZJCOLOR.color_c12;
    self.WebView.backgroundColor = ZJCOLOR.color_c0;
    
    self.WebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"payAccountAgreement" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [self.WebView loadHTMLString:html baseURL:nil];
    [self.view addSubview:self.WebView];
}

- (void)setIsShowBoomView:(BOOL)isShowBoomView
{
    if (isShowBoomView) {
        self.WebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - ADJUST_PERCENT_FLOAT(90) - STATUS_AND_NAVIGATION_HEIGHT)];
        [self setBoomView];
    }
}

-(void)clickNextBtn:(UIButton *)sender
{
    YXMyWalletSetPassWordViewController *wallet = [[YXMyWalletSetPassWordViewController alloc]init];
    [self.navigationController pushViewController:wallet animated:YES];
}

-(void)setBoomView{
    UIView *boomview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - ADJUST_PERCENT_FLOAT(90) - STATUS_AND_NAVIGATION_HEIGHT, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(90))];
    boomview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:boomview];
   
    UIButton *nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(ADJUST_PERCENT_FLOAT(15), ADJUST_PERCENT_FLOAT(5), SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(30), ADJUST_PERCENT_FLOAT(50))];
    [nextBtn addTarget:self action:@selector(clickNextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.titleLabel.font = SYSTEM_REGULARFONT(15.f);
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.backgroundColor = ZJCOLOR.color_c6;
    nextBtn.layer.masksToBounds = YES;
    nextBtn.layer.cornerRadius = 4;
    [boomview addSubview:nextBtn];

    UILabel *desc = [[UILabel alloc]initWithFrame:CGRectMake(nextBtn.left, nextBtn.bottom+ADJUST_PERCENT_FLOAT(8), nextBtn.width, ADJUST_PERCENT_FLOAT(15))];
    desc.text = @"点击下一步即同意钱包服务协议";
    desc.textColor = ZJCOLOR.color_c5;
    desc.textAlignment = NSTextAlignmentCenter;
    desc.font = SYSTEM_REGULARFONT(12.f);
    [boomview addSubview:desc];
}

-(UIWebView *)WebView{
    if (!_WebView) {
        _WebView = [[UIWebView alloc]init];
        _WebView.dataDetectorTypes = UIDataDetectorTypeAll;
        _WebView.backgroundColor = ZJCOLOR.color_c12;
    }
    return _WebView;
}

@end
