//
//  YBCertifiedPaymentBaseViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBaseViewController.h"

@interface YBCertifiedPaymentBaseViewController ()

@property (strong, nonatomic) ZJBaseImageView *logoImageView;
@property (strong, nonatomic) YBDefaultLabel *logoTipsLabel;

@end

@implementation YBCertifiedPaymentBaseViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    
    self.logoImageView = [ZJBaseImageView new];
    self.logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PAYMENT,
                                              @"payment_lianlian_icon",
                                              ZJProjectLoadImageDefault);
    [self.view addSubview:self.logoImageView];
    
    self.logoTipsLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12.f)
                                                  text:@"钱包由“连连支付”提供"
                                             textColor:ZJCOLOR.color_c5];
    self.logoTipsLabel.backgroundColor = ZJCOLOR.color_c12;
    [self.view addSubview:self.logoTipsLabel];
    
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.logoTipsLabel.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-10.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(15.f));
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(95.5));
    }];
    
    [self.logoTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-30.f));
    }];
    
}

#pragma mark - Seventh.懒加载

@end
