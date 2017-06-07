//
//  YBRealNameAndBindBankCardController.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRealNameAndBindBankCardController.h"
#import "YBRightImageButton.h"
#import "YBAttributedStringLabel.h"
#import "YBBankCardModel.h"
#import "YBPaymentViewModel.h"
#import "YBPaymentService.h"
#import "YBCertifiedPaymentVerifyPhoneNumber.h"
#import "YBPaymentServiceSignModel.h"
#import "MOFSPickerManager.h"

@interface YBRealNameAndBindBankCardController ()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *cardTypeLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *cardTypeDetailLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *cardInformationLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameDetailTextField;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *documentsTypeLabel;
@property (weak, nonatomic) IBOutlet UITextField *documentsTypeDetailTextField;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *documentsNumberLabel;
@property (weak, nonatomic) IBOutlet UITextField *documentsTextField;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *documentsLimitedLabel;
@property (weak, nonatomic) IBOutlet YBDefaultButton *documentsLimitedDetailButton;
@property (weak, nonatomic) IBOutlet YBRightImageButton *documentsLimitedFoeverButton;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberDetailTextField;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *otherFuncLabel;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *bottomMarginLinesArray;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *topMarginConsArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cardInformationViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherFuncLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherFuncLabelLeftMarginCons;

@end

@implementation YBRealNameAndBindBankCardController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

/**
 *  选择长期点击事件
 */
- (IBAction)foeverButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

/**
 *  选择日期按钮点击
 */
- (IBAction)selectDataButtonClick:(UIButton *)sender
{
    [[MOFSPickerManager shareManger] showDatePickerWithTag:0 commitBlock:^(NSDate *date) {
        [self.documentsLimitedDetailButton setTitle:[NSDate ex_stringWithDate:date
                                                              formatterString:@"yyyy/MM/dd"
                                                                  timeZoneStr:@"Asia/Shanghai"] forState:UIControlStateNormal];
    } cancelBlock:^{
        
    }];
}

- (void)nextButtonClick:(UIButton *)sender
{
    /**
     *  网络调用预支付网络请求
     */
    [[YBPaymentService share] certifiedPayPreWithOrderId:self.paymentViewModel.orderId
                                             paymentType:[NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentType]
                                               transType:[NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentEventType]
                                               isPartPay:[NSString stringWithFormat:@"%zd", self.paymentViewModel.isPartPay]
                                            isDepositPay:[NSString stringWithFormat:@"%zd", self.paymentViewModel.isDepositPay]
                                               payAmount:self.paymentViewModel.payAmont
                                                acctName:self.nameDetailTextField.text
                                                  cardNo:self.bankCardModel.bank_cardNo
                                                    idNo:self.documentsTextField.text
                                                 bindMob:self.phoneNumberDetailTextField.text
                                              bankCardId:nil
                                                 success:^(id objc, id requestInfo) {
                                                     
                                                     YBLog(@"%@\n%@", objc, requestInfo);
                                                     YBPaymentServiceSignModel *model = [YBPaymentServiceSignModel modelWithDictionary: objc[@"data"]];
                                                     YBCertifiedPaymentVerifyPhoneNumber *certifiedPaymentVerifyPhoneNumber = [[YBCertifiedPaymentVerifyPhoneNumber alloc] init];
                                                     certifiedPaymentVerifyPhoneNumber.paymentViewModel = self.paymentViewModel;
                                                     certifiedPaymentVerifyPhoneNumber.paymentServiceSignModel = model;
                                                     certifiedPaymentVerifyPhoneNumber.phoneNumber = self.phoneNumberDetailTextField.text;
                                                     certifiedPaymentVerifyPhoneNumber.acctName = self.nameDetailTextField.text;
                                                     certifiedPaymentVerifyPhoneNumber.idNo = self.documentsTextField.text;
                                                     certifiedPaymentVerifyPhoneNumber.bankCardModel = self.bankCardModel;

                                                     [self.navigationController pushViewController:certifiedPaymentVerifyPhoneNumber animated:YES];
                                                     
                                                 } fail:^(id error, id requestInfo) {
                                                     
                                                     YBLog(@"%@\n%@", error, requestInfo);
                                                     
                                                 }];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    self.cardTypeLabel.textColor = ZJCOLOR.color_c4;
    self.cardTypeLabel.font = SYSTEM_REGULARFONT(14.f);
    self.cardTypeLabel.text = ZJSTRING(@"卡类型");
    
    self.cardTypeDetailLabel.textColor = ZJCOLOR.color_c4;
    self.cardTypeDetailLabel.font = SYSTEM_REGULARFONT(14.f);
    self.cardTypeDetailLabel.text = [NSString stringWithFormat:@"%@ %@", self.bankCardModel.bank_name, self.bankCardModel.card_type];
    
    self.cardInformationLabel.textColor = ZJCOLOR.color_c4;
    self.cardInformationLabel.font = SYSTEM_REGULARFONT(14.f);
    self.cardInformationLabel.text = ZJSTRING(@"请填写银行预留信息");
    
    self.nameLabel.textColor = ZJCOLOR.color_c4;
    self.nameLabel.font = SYSTEM_REGULARFONT(14.f);
    self.nameLabel.text = ZJSTRING(@"姓名");
    
    self.nameDetailTextField.font = SYSTEM_REGULARFONT(13.f);
    self.nameDetailTextField.placeholder = ZJSTRING(@"请输入姓名");
    self.nameDetailTextField.textAlignment = NSTextAlignmentRight;
    
    self.documentsTypeLabel.textColor = ZJCOLOR.color_c4;
    self.documentsTypeLabel.font = SYSTEM_REGULARFONT(14.f);
    self.documentsTypeLabel.text = ZJSTRING(@"证件类型");
    
    self.documentsTypeDetailTextField.font = SYSTEM_REGULARFONT(13.f);
    self.documentsTypeDetailTextField.text = ZJSTRING(@"身份证");
    self.documentsTypeDetailTextField.textAlignment = NSTextAlignmentRight;
    self.documentsTypeDetailTextField.userInteractionEnabled = NO;
    
    self.documentsNumberLabel.textColor = ZJCOLOR.color_c4;
    self.documentsNumberLabel.font = SYSTEM_REGULARFONT(14.f);
    self.documentsNumberLabel.text = ZJSTRING(@"证件号");
    
    self.documentsTextField.font = SYSTEM_REGULARFONT(13.f);
    self.documentsTextField.placeholder = ZJSTRING(@"请输入证件号");
    self.documentsTextField.textAlignment = NSTextAlignmentRight;
    
    self.documentsLimitedLabel.textColor = ZJCOLOR.color_c4;
    self.documentsLimitedLabel.font = SYSTEM_REGULARFONT(14.f);
    self.documentsLimitedLabel.text = ZJSTRING(@"证件有效期");
    
    [self.documentsLimitedDetailButton setTitle:ZJSTRING(@"年/月/日")
                                       forState:UIControlStateNormal];
    self.documentsLimitedDetailButton.titleLabel.font = SYSTEM_REGULARFONT(13.f);
    [self.documentsLimitedDetailButton setTitleColor:ZJCOLOR.color_c5
                                            forState:UIControlStateNormal];
    
    [self.documentsLimitedFoeverButton setTitleColor:ZJCOLOR.color_c5
                                            forState:UIControlStateNormal];
    [self.documentsLimitedFoeverButton setTitle:ZJSTRING(@"长期")
                                       forState:UIControlStateNormal];
    
    [self.documentsLimitedFoeverButton setImage:ZJIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                                        @"authentication_right",
                                                        ZJProjectLoadImageDefault).firstObject
                                       forState:UIControlStateNormal];
    [self.documentsLimitedFoeverButton setImage:ZJIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                                        @"authentication_right",
                                                        ZJProjectLoadImageDefault).lastObject
                                       forState:UIControlStateSelected];
    
    self.documentsLimitedFoeverButton.titleLabel.font = SYSTEM_REGULARFONT(12.f);
    
    self.phoneNumberLabel.textColor = ZJCOLOR.color_c4;
    self.phoneNumberLabel.font = SYSTEM_REGULARFONT(14.f);
    self.phoneNumberLabel.text = ZJSTRING(@"手机号");
    
    self.phoneNumberDetailTextField.font = SYSTEM_REGULARFONT(13.f);
    self.phoneNumberDetailTextField.placeholder = ZJSTRING(@"请输入手机号");
    self.phoneNumberDetailTextField.textAlignment = NSTextAlignmentRight;
    self.phoneNumberDetailTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.otherFuncLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                                 @"content" : ZJSTRING(@"点击下一步即代表同意"),
                                                                 @"size" : SYSTEM_REGULARFONT(12.f),
                                                                 @"lineSpacing": @0},
                                                               @{@"color" : ZJCOLOR.color_c4,
                                                                 @"content" : ZJSTRING(@"《服务协议》"),
                                                                 @"size" : SYSTEM_REGULARFONT(12.f),
                                                                 @"lineSpacing": @0}]];
    
    YBDefaultButton *nextButton             = [YBDefaultButton buttonFifthWithTitleStringKey:@"下一步"
                                                                                  titleColor:ZJCOLOR.color_c0
                                                                                   titleFont:SYSTEM_REGULARFONT(14.f)
                                                                                      target:self
                                                                                    selector:@selector(nextButtonClick:)];
    [self.view addSubview:nextButton];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.top.mas_equalTo(self.otherFuncLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(30.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
    }];
    
    YBDefaultLabel *safeTipsLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12.f)
                                                             text:@"信息加密处理，仅限于银行认证！"
                                                        textColor:ZJCOLOR.color_c5];
    [self.view addSubview:safeTipsLabel];
    [safeTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(nextButton.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(20.f));
    }];
    
    [self.bottomMarginLinesArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj,
                                                              NSUInteger idx,
                                                              BOOL * _Nonnull stop) {
        obj.backgroundColor = ZJCOLOR.color_c16;
    }];
    
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    [self.topMarginConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(10.f);
    }];
    self.viewHeightCons.constant = ADJUST_PERCENT_FLOAT(46.f);
    self.cardInformationViewHeightCons.constant = ADJUST_PERCENT_FLOAT(36.f);
    safeTipsLabel.backgroundColor = self.view.backgroundColor;
    
    self.navigationItem.title = ZJSTRING(@"认证支付");
}

#pragma mark - Seventh.懒加载

@end
