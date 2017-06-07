//
//  YBCertifiedPaymentBindBankCardController.m
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBindBankCardController.h"
#import "YBAttributedStringLabel.h"
#import "User_LocalData.h"
#import "YBRealNameAndBindBankCardController.h"
#import "YBCertifiedPaymentVerifyPhoneNumber.h"
#import "YBCertifiedPaymentBindBankCardViewModel.h"
#import "YBPaymentService.h"
#import "YBPaymentServiceSignModel.h"
#import "YBTopAlert.h"
#import "YBAgreementViewController.h"
#import "YBSupportBankCardListController.h"

@interface YBCertifiedPaymentBindBankCardController () <UITextFieldDelegate>

/**
 type
 */
@property (nonatomic, assign) YBCertifiedPaymentBindBankCardControllerType type;

/**
 下一步按钮
 */
@property (nonatomic, strong) YBDefaultButton *nextButton;

/**
 YBCertifiedPaymentBindBankCardViewModel
 */
@property (nonatomic, strong) YBCertifiedPaymentBindBankCardViewModel *certifiedPaymentBindBankCardViewModel;

/**
 paymentViewModel
 */
@property (nonatomic, strong) YBPaymentViewModel *paymentViewModel;

@property (weak, nonatomic) IBOutlet ZJBaseView *tipsView;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *tipsImageView;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *tipsLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *firstTitleLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *firstDetailLabel;
@property (weak, nonatomic) IBOutlet UIView *firstBottomMarginLine;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *secdonTitleLabel;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *otherTipsFuncLabel;
@property (weak, nonatomic) IBOutlet ZJBaseView *firstView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherTipsFuncLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherTipsFuncLabelLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secdonViewTopMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstViewTopMarginCons;


@end

@implementation YBCertifiedPaymentBindBankCardController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)funcButtonClick:(UIGestureRecognizer *)tap
{
    if (self.type == YBCertifiedPaymentBindBankCardControllerBankCard) {
        YBSupportBankCardListController *supportBankCardListController = [YBSupportBankCardListController new];
        [self.navigationController pushViewController:supportBankCardListController animated:YES];
    }
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerPhone) {
        YBAgreementViewController *agreementViewController = [YBAgreementViewController new];
        [self.navigationController pushViewController:agreementViewController animated:YES];
    }
}

- (void)nextButtonClick:(UIButton *)sender
{
    if (self.type == YBCertifiedPaymentBindBankCardControllerBankCard) {
        
        [self.certifiedPaymentBindBankCardViewModel bankCardInfoWithCardNumber:self.secondTextField.text
                                                               successCallBack:^(id model) {
                                                                   
                                                                   YBCertifiedPaymentBindBankCardController *bindBankCardController = [YBCertifiedPaymentBindBankCardController certifiedPaymentBindBankCardControllerType:YBCertifiedPaymentBindBankCardControllerPhone extend:self.paymentViewModel];
                                                                   bindBankCardController.bankCardModel = (YBBankCardModel *)model;
                                                                   
                                                                   if ([bindBankCardController.bankCardModel.cardType isEqualToString:@"信用卡"]
                                                                       || [bindBankCardController.bankCardModel.card_type isEqualToString:@"信用卡"]) {
                                                                       
                                                                       [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                                                                               tipsStringKey:@"暂不支持信用卡，请更换储蓄卡"
                                                                                                                        type:YBTopAlertError
                                                                                                          eventCallBackBlock:^(id sender) {
                                                                                                              
                                                                                                          }];
                                                                       
                                                                       return;
                                                                   }
                                                                   
                                                                   bindBankCardController.paymentViewModel = self.paymentViewModel;
                                                                   bindBankCardController.bankCardModel.bank_cardNo = self.secondTextField.text;
                                                                   [self.navigationController pushViewController:bindBankCardController animated:YES];
                                                                   
                                                               } failureCallBack:^(id error) {
                                                                   
                                                               }];
    }
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerPhone) {
        
        /**
         *  验证码
         */
        /**
         *  网络调用预支付网络请求
         */
        [[YBPaymentService share] certifiedPayPreWithOrderId:self.paymentViewModel.orderId
                                                 paymentType:[NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentType]
                                                   transType:[NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentEventType]
                                                   isPartPay:[NSString stringWithFormat:@"%zd", self.paymentViewModel.isPartPay]
                                                isDepositPay:[NSString stringWithFormat:@"%zd", self.paymentViewModel.isDepositPay]
                                                   payAmount:self.paymentViewModel.payAmont
                                                    acctName:nil
                                                      cardNo:self.bankCardModel.bank_cardNo
                                                        idNo:nil
                                                     bindMob:self.secondTextField.text
                                                  bankCardId:nil
                                                     success:^(id objc, id requestInfo) {
                                                         
                                                         YBLog(@"%@\n%@", objc, requestInfo);
                                                         YBPaymentServiceSignModel *model = [YBPaymentServiceSignModel modelWithDictionary: objc[@"data"]];
                                                         YBCertifiedPaymentVerifyPhoneNumber *certifiedPaymentVerifyPhoneNumber = [[YBCertifiedPaymentVerifyPhoneNumber alloc] init];
                                                         certifiedPaymentVerifyPhoneNumber.paymentServiceSignModel = model;
                                                         certifiedPaymentVerifyPhoneNumber.phoneNumber = self.secondTextField.text;
                                                         certifiedPaymentVerifyPhoneNumber.paymentViewModel = self.paymentViewModel;
                                                         certifiedPaymentVerifyPhoneNumber.bankCardModel = self.bankCardModel;
                                                         [self.navigationController pushViewController:certifiedPaymentVerifyPhoneNumber animated:YES];
                                                         
                                                     } fail:^(id error, id requestInfo) {
                                                         
                                                         YBLog(@"%@\n%@", error, requestInfo);
                                                         
                                                     }];
    }
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerBankCardNumber) {
        
        /**
         *  调用验证银行卡接口
         */
        [self.certifiedPaymentBindBankCardViewModel bankCardInfoWithCardNumber:self.secondTextField.text
                                                               successCallBack:^(id model) {
                                                                   
                                                                   YBRealNameAndBindBankCardController *realNameController = [[YBRealNameAndBindBankCardController alloc] init];
                                                                   realNameController.bankCardModel = (YBBankCardModel *)model;
                                                                   
                                                                   if ([realNameController.bankCardModel.cardType isEqualToString:@"信用卡"]
                                                                       || [realNameController.bankCardModel.card_type isEqualToString:@"信用卡"]) {
                                                                       
                                                                       [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                                                                               tipsStringKey:@"暂不支持信用卡，请更换储蓄卡"
                                                                                                                        type:YBTopAlertError
                                                                                                          eventCallBackBlock:^(id sender) {
                                                                                                              
                                                                                                          }];
                                                                       
                                                                       return;
                                                                   }
                                                                   
                                                                   realNameController.bankCardModel.bank_cardNo = self.secondTextField.text;
                                                                   realNameController.paymentViewModel = self.paymentViewModel;
                                                                   realNameController.paymentViewModel = self.paymentViewModel;
                                                                   [self.navigationController pushViewController:realNameController animated:YES];
                                                                   
                                                               } failureCallBack:^(id error) {
                                                                   
                                                               }];
        
    }
}

#pragma mark - Fourth.代理方法

#pragma mark <UITextFieldDelegate>

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string ex_isEmpty]) {
        self.nextButton.enabled = NO;
    }else{
        self.nextButton.enabled = YES;
    }
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerBankCard) {
        
    }
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerPhone) {
        if (string.length >= 11) {
            return NO;
        }else{
            return YES;
        }
    }
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerBankCardNumber) {
        
        
    }
    return YES;
}

#pragma mark - Fifth.控制器生命周期

/**
 创建绑定银行卡控制器
 
 @param type            type
 @param extend          extend
 @return                绑定银行卡控制器
 */
+ (instancetype)certifiedPaymentBindBankCardControllerType:(YBCertifiedPaymentBindBankCardControllerType)type
                                                    extend:(id)extend
{
    YBCertifiedPaymentBindBankCardController *certifiedPaymentBindBankCardController    = [[YBCertifiedPaymentBindBankCardController alloc] init];
    certifiedPaymentBindBankCardController.type                                         = type;
    YBCertifiedPaymentBindBankCardViewModel *viewModel                                  = [[YBCertifiedPaymentBindBankCardViewModel alloc] init];
    certifiedPaymentBindBankCardController.certifiedPaymentBindBankCardViewModel        = viewModel;
    if (extend) {
        certifiedPaymentBindBankCardController.paymentViewModel                         = (YBPaymentViewModel *)extend;
    }
    return certifiedPaymentBindBankCardController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    self.view.backgroundColor               = ZJCOLOR.color_c12;
    self.tipsView.backgroundColor           = self.view.backgroundColor;
    self.tipsLabel.font                     = SYSTEM_REGULARFONT(12.f);
    self.tipsLabel.textColor                = ZJCOLOR.color_c5;
    self.tipsLabel.backgroundColor          = self.tipsLabel.backgroundColor;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(funcButtonClick:)];
    self.otherTipsFuncLabel.userInteractionEnabled = YES;
    [self.otherTipsFuncLabel addGestureRecognizer:tap];
    
    self.tipsImageView.image                = ZJCURRENTIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                                             @"authentication_tips_icon",
                                                             ZJProjectLoadImageDefault);
    
    YBDefaultButton *nextButton             = [YBDefaultButton buttonFifthWithTitleStringKey:@"下一步"
                                                                                  titleColor:ZJCOLOR.color_c0
                                                                                   titleFont:SYSTEM_REGULARFONT(14.f)
                                                                                      target:self
                                                                                    selector:@selector(nextButtonClick:)];
    self.nextButton                         = nextButton;
    nextButton.enabled                      = NO;
    [self.view addSubview:nextButton];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.top.mas_equalTo(self.otherTipsFuncLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(30.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
    }];
    
    self.firstTitleLabel.textColor = ZJCOLOR.color_c4;
    self.firstTitleLabel.font = SYSTEM_REGULARFONT(14.f);
    
    self.firstDetailLabel.textColor = ZJCOLOR.color_c4;
    self.firstDetailLabel.font = SYSTEM_REGULARFONT(14.f);
    
    self.firstBottomMarginLine.backgroundColor = ZJCOLOR.color_c16;
    
    self.secdonTitleLabel.textColor = ZJCOLOR.color_c4;
    self.secdonTitleLabel.font = SYSTEM_REGULARFONT(14.f);
    
    self.secondTextField.font = SYSTEM_REGULARFONT(13.f);
    self.secondTextField.textAlignment = NSTextAlignmentRight;
    self.secondTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.secondTextField.delegate = self;
    [self.secondTextField becomeFirstResponder];
    
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.tipsViewHeightCons.constant = ADJUST_PERCENT_FLOAT(32.f);
    self.viewHeightCons.constant = ADJUST_PERCENT_FLOAT(46.f);
    self.otherTipsFuncLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(15.f);
    self.otherTipsFuncLabelLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(14.5);
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerBankCard) {
        
        self.firstTitleLabel.text = ZJSTRING(@"持卡人");
        self.firstDetailLabel.text = [User_LocalData new].name;
        self.secdonTitleLabel.text = ZJSTRING(@"卡号");
        self.secondTextField.placeholder = ZJSTRING(@"请输入卡号");
        self.navigationItem.title               = ZJSTRING(@"认证支付");
        self.tipsLabel.text                     = ZJSTRING(@"请绑定持卡人本人银行卡(仅限储蓄卡)");
        
        [self.otherTipsFuncLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                                         @"content" : ZJSTRING(@"现已支持银行36家，"),
                                                                         @"size" : SYSTEM_REGULARFONT(12.f),
                                                                         @"lineSpacing": @0},
                                                                       @{@"color" : ZJCOLOR.color_c4,
                                                                         @"content" : ZJSTRING(@"点击查看"),
                                                                         @"size" : SYSTEM_REGULARFONT(12.f),
                                                                         @"lineSpacing": @0}]];
    }
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerPhone) {
        
        self.tipsView.hidden = YES;
        self.firstViewTopMarginCons.constant = -self.tipsViewHeightCons.constant + ADJUST_PERCENT_FLOAT(10.f);
        self.firstTitleLabel.text = ZJSTRING(@"卡类型");
        self.firstDetailLabel.text = [NSString stringWithFormat:@"%@ %@", self.bankCardModel.bank_name, self.bankCardModel.card_type];
        self.secdonTitleLabel.text = ZJSTRING(@"手机号");
        self.secondTextField.placeholder = ZJSTRING(@"请输入手机号码");
        self.navigationItem.title = ZJSTRING(@"认证支付");
        
        [self.otherTipsFuncLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                                         @"content" : ZJSTRING(@"同意"),
                                                                         @"size" : SYSTEM_REGULARFONT(12.f),
                                                                         @"lineSpacing": @0},
                                                                       @{@"color" : ZJCOLOR.color_c4,
                                                                         @"content" : ZJSTRING(@"《服务协议》"),
                                                                         @"size" : SYSTEM_REGULARFONT(12.f),
                                                                         @"lineSpacing": @0}]];
    }
    
    if (self.type == YBCertifiedPaymentBindBankCardControllerBankCardNumber) {
        
        self.firstView.hidden = YES;
        self.secdonViewTopMargin.constant = -self.viewHeightCons.constant;
        self.secdonTitleLabel.text = ZJSTRING(@"卡号");
        self.secondTextField.placeholder = ZJSTRING(@"请输入银行卡号");
        self.otherTipsFuncLabel.hidden = YES;
        self.tipsLabel.text                     = ZJSTRING(@"请绑定持卡人本人银行卡(仅限储蓄卡)");
        self.navigationItem.title = ZJSTRING(@"添加银行卡");
    }
}

#pragma mark - Seventh.懒加载

@end
