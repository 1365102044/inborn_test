//
//  YBCertifiedHelpMessageCodeHelpController.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedHelpMessageCodeHelpController.h"
#import "YBAttributedStringLabel.h"

@interface YBCertifiedHelpMessageCodeHelpController ()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *marginLineView;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *tipsContentLabel;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *titleLabelMarginConsArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginLineTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginLineBottomMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsContentLabelBottomMarginCons;


@end

@implementation YBCertifiedHelpMessageCodeHelpController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    self.navigationItem.title = ZJSTRING(@"认证支付");
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    self.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.titleLabel.textColor = ZJCOLOR.color_c4;
    
    self.marginLineView.backgroundColor = ZJCOLOR.color_c16;
    
    [self.tipsContentLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                   @"content" : ZJSTRING(@"1、请确认该预留手机号是否为当前使用的手机号。\n2、请检查短信是否被安全软件拦截。\n3、由于运营商网络问题，可能存在短信延迟，请耐心等待或稍后重试。\n4、若银行预留手机号已停用，请联系银行客服处理。\n5、获取更多帮助，请致电胤宝客服xxxxx"),
                                                                   @"size" : SYSTEM_REGULARFONT(12.f),
                                                                   @"lineSpacing": @0}]];
    
    self.view.layer.cornerRadius = 3.5f;
    self.view.layer.masksToBounds = YES;
}

#pragma mark - Seventh.懒加载

@end
