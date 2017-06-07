//
//  YBCertifiedPaymentAlertView.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentAlertView.h"
#import "YBAttributedStringLabel.h"
#import "YBRightImageButton.h"
#import "YBVerCodeTextField.h"

@interface YBCertifiedPaymentAlertView() <YBVerCodeTextFieldDelegate>

@property (weak, nonatomic) IBOutlet YBDefaultButton *closeButton;
@property (weak, nonatomic) IBOutlet YBDefaultButton *titleButton;
@property (weak, nonatomic) IBOutlet YBDefaultButton *otherFuncButton;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *marginLinesArray;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeButtonLeftMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *closeButtonHeightWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherFuncButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherFuncButtonRightMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *otherFuncButtonHeightWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMarginLineTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginLineLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginLineRightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *amontLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bankCardButtonTopMarginCons;

@end

@implementation YBCertifiedPaymentAlertView

#pragma mark <YBVerCodeTextFieldDelegate>

- (void)verCodeTextField:(YBVerCodeTextField *)verificationCodeInputView
    verificationCodeText:(NSString *)verificationCodeText
{
    self.verCodeTextField.inputVerificationCodeTextField.text = verificationCodeText;
    if (self.callBackBlock) {
        self.callBackBlock(self.verCodeTextField);
    }
}

- (void)loadMessageCodeButtonClick:(UIButton *)sender
{
    if (sender.enabled) {
        if (self.callBackBlock) {
            self.callBackBlock(sender);
        }
    }
}

- (IBAction)tipsButtonClick:(UIButton *)sender
{
    if (self.callBackBlock) {
        self.callBackBlock(sender);
    }
    
}

- (IBAction)closeButtonClick:(UIButton *)sender
{
    if (self.callBackBlock) {
        self.callBackBlock(sender);
    }
}

- (IBAction)bankButtonClick:(UIButton *)sender
{
    if (self.callBackBlock) {
        self.callBackBlock(sender);
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YBCertifiedPaymentAlertView class])
                                             owner:nil
                                           options:nil].lastObject;
        [self setupCustomUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //[self setupCustomUI];
}

- (void)setupCustomUI
{
    [self.closeButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC,
                                              @"public_off_n",
                                              ZJProjectLoadImageDefault) forState:UIControlStateNormal];
    [self.closeButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC,
                                              @"public_off_h",
                                              ZJProjectLoadImageDefault) forState:UIControlStateHighlighted];
    
    [self.titleButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC,
                                              @"public_off_n",
                                              ZJProjectLoadImageDefault) forState:UIControlStateNormal];
    [self.titleButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PAYMENT,
                                              @"",
                                              ZJProjectLoadImageDefault) forState:UIControlStateNormal];
    [self.titleButton setTitle:ZJSTRING(@"认证支付")
                      forState:UIControlStateNormal];
    self.titleButton.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    [self.titleButton setTitleColor:ZJCOLOR.color_c4
                           forState:UIControlStateNormal];
    self.titleButton.userInteractionEnabled = NO;
    
    [self.otherFuncButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PAYMENT,
                                                  @"payment_tips_n",
                                                  ZJProjectLoadImageDefault)
                          forState:UIControlStateNormal];
    [self.otherFuncButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PAYMENT,
                                                  @"payment_tips_h",
                                                  ZJProjectLoadImageDefault)
                          forState:UIControlStateNormal];
    
    [self.bankCardButton setTitleColor:ZJCOLOR.color_c8
                              forState:UIControlStateNormal];
    [self.bankCardButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PAYMENT,
                                                 @"payment_down_icon",
                                                 ZJProjectLoadImageDefault) forState:UIControlStateNormal];
    [self.bankCardButton setTitle:ZJSTRING(@"银行卡")
                         forState:UIControlStateNormal];
    self.bankCardButton.titleLabel.font = SYSTEM_REGULARFONT(12.f);
    
    [self.marginLinesArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
        obj.backgroundColor = ZJCOLOR.color_c12;
    }];
    
    self.closeButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    self.closeButtonLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(15.f);
    [self.closeButtonHeightWidthCons enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                  NSUInteger idx,
                                                                  BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(28.f);
    }];
    self.titleLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(16.f);
    self.otherFuncButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.otherFuncButtonRightMarginCons.constant = ADJUST_PERCENT_FLOAT(15.f);
    [self.otherFuncButtonHeightWidthCons enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                      NSUInteger idx,
                                                                      BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(28.f);
    }];
    self.topMarginLineTopMarginCons.constant = ADJUST_PERCENT_FLOAT(15.f);
    self.marginLineLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(15.f);
    self.marginLineRightMarginCons.constant = ADJUST_PERCENT_FLOAT(15.f);
    self.amontLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(23.f);
    self.bankCardButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(28.f);
    
    self.layer.cornerRadius = ADJUST_PERCENT_FLOAT(14.f);
    self.layer.masksToBounds = YES;
    
    YBDefaultButton *loadMessageButton = [YBDefaultButton buttonFifthWithTitleStringKey:@"获取验证码"
                                                                             titleColor:ZJCOLOR.color_c0
                                                                              titleFont:SYSTEM_REGULARFONT(14.f)
                                                                                 target:self
                                                                               selector:@selector(loadMessageCodeButtonClick:)];
    loadMessageButton.tag = 1004;
    self.loadMessageButton = loadMessageButton;
    [self addSubview:loadMessageButton];
    
    YBDefaultButton *surePay = [YBDefaultButton buttonFifthWithTitleStringKey:@"确认支付"
                                                                   titleColor:ZJCOLOR.color_c0
                                                                    titleFont:SYSTEM_REGULARFONT(14.f)
                                                                       target:self
                                                                     selector:@selector(loadMessageCodeButtonClick:)];
    surePay.tag = 1006;
    surePay.alpha = 0;
    self.surePayButton = surePay;
    [self addSubview:surePay];
    
    YBVerCodeTextField *verCodeTextField = [[YBVerCodeTextField alloc] init];
    verCodeTextField.delegate = self;
    verCodeTextField.tag = 1005;
    self.verCodeTextField = verCodeTextField;
    [self addSubview:verCodeTextField];
    
    [verCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.bankCardButton.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(28.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(32.f));
    }];
    
    [loadMessageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(200.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
        make.top.mas_equalTo(verCodeTextField.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(22.f));
        make.centerX.mas_equalTo(self);
    }];
    
    [surePay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.width.height.mas_equalTo(loadMessageButton);
    }];
    
    [self.titleButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_ORDER,
                                              @"order_lianlian_icon",
                                              ZJProjectLoadImageDefault) forState:UIControlStateNormal];
}



/**
 成为第一响应者
 */
- (void)becomeFirstRespond
{
    [self.verCodeTextField.inputVerificationCodeTextField becomeFirstResponder];
}

/**
 注销第一响应者
 */
- (void)registerFirstRespond
{
    [self.verCodeTextField.inputVerificationCodeTextField resignFirstResponder];
}

/**
 清空用户已输入的验证码
 */
- (void)clearVerCode
{
    [self.verCodeTextField clearVerCode];
}

/**
 验证失败
 */
- (void)checkFailed
{
    self.verCodeTextField.passWordFailed = YES;
}

@end
