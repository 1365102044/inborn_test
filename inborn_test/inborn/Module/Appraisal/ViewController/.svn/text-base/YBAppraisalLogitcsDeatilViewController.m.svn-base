//
//  YBAppraisalLogitcsDeatilViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAppraisalLogitcsDeatilViewController.h"

@interface YBAppraisalLogitcsDeatilViewController ()

@property(nonatomic,strong) UIWebView * webview;

@property(nonatomic,strong) NSString * logitcsComtype;
@property(nonatomic,strong) NSString * postid;

@end

@implementation YBAppraisalLogitcsDeatilViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

+ (instancetype)creatAppraisalLogitcsDeatilWithpostid:(NSString *)postid type:(NSString *)type extend:(id)extend
{
    YBAppraisalLogitcsDeatilViewController *viewcontroller  = [[YBAppraisalLogitcsDeatilViewController alloc]init];
    viewcontroller.logitcsComtype                           = type;
    viewcontroller.postid                                   = postid;
    return viewcontroller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZJCOLOR.color_c12;
    self.title = @"物流详情";
    [self.view addSubview:self.webview];
    
//    _postid = @"402422288338";
//    _logitcsComtype = @"56";
    NSString *urlstr = [NSString stringWithFormat:@"https://m.kuaidi100.com/index_all.html?type=%@&postid=%@&callbackurl=%@",_logitcsComtype,_postid,@"com.bjInborn"];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlstr]]];
    
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (UIWebView *)webview {
    if (!_webview) {
        _webview = [[UIWebView alloc]initWithFrame:self.view.bounds];
    }
    return _webview;
}

@end
