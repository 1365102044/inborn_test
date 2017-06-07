//
//  YBCertifiedPaymentChangePhoneNumberController.m
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentChangePhoneNumberController.h"
#import "YBCertifiedPaymentVerifyPhoneNumber.h"
#import "YBBankCardModel.h"

@interface YBCertifiedPaymentChangePhoneNumberController ()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *bankNameLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *bankCardNumberLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *phoneNumberTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet ZJBaseView *phoneNumberView;
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeightCons;


@end

@implementation YBCertifiedPaymentChangePhoneNumberController

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
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    self.bankNameLabel.textColor = ZJCOLOR.color_c4;
    self.bankNameLabel.font = SYSTEM_REGULARFONT(14.f);
    self.bankNameLabel.text = ZJSTRING(@"银行卡名");
    
    self.bankCardNumberLabel.textColor = ZJCOLOR.color_c4;
    self.bankCardNumberLabel.font = SYSTEM_REGULARFONT(14.f);
    self.bankCardNumberLabel.text = [NSString stringWithFormat:@"**** **** **** %@",
                                     self.bankCardModel.bankName];
    
    self.phoneNumberTitleLabel.textColor = ZJCOLOR.color_c5;
    self.phoneNumberTitleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.phoneNumberTitleLabel.text = ZJSTRING(@"手机号");
    
    self.phoneNumberTextField.font = SYSTEM_REGULARFONT(13.f);
    self.phoneNumberTextField.placeholder = ZJSTRING(@"请输入新的手机号码");
    self.phoneNumberTextField.textAlignment = NSTextAlignmentRight;
    
    self.bottomLineView.backgroundColor = ZJCOLOR.color_c16;
    
    YBCertifiedPaymentVerifyPhoneNumber *verifyPhoneNumber = [[YBCertifiedPaymentVerifyPhoneNumber alloc] init];
    verifyPhoneNumber.type = YBCertifiedPaymentVerifyPhoneNumberChange;
    verifyPhoneNumber.paymentViewModel = self.paymentViewModel;
    [self addChildViewController:verifyPhoneNumber];
    [self.view addSubview:verifyPhoneNumber.view];
    [verifyPhoneNumber.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.phoneNumberView.mas_bottom);
    }];
    
    self.topMarginCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.viewHeightCons.constant = ADJUST_PERCENT_FLOAT(36.f);
}

#pragma mark - Seventh.懒加载

@end
