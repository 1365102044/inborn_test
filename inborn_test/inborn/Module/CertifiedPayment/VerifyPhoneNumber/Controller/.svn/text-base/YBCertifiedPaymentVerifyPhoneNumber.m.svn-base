//
//  YBCertifiedPaymentVerifyPhoneNumber.m
//  inborn
//
//  Created by 郑键 on 17/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentVerifyPhoneNumber.h"
#import "YBPaymentServiceSignModel.h"
#import "YBPaymentService.h"
#import "ZJTimerManager.h"
#import "YBTopAlert.h"
#import "YBBankCardModel.h"
#import "YBPaymentResultController.h"
#import "YBPaymentViewModel.h"
#import "YBPaymentManager.h"

@interface YBCertifiedPaymentVerifyPhoneNumber ()

/**
 倒计时60s
 */
@property (nonatomic, assign) CGFloat countDownTime;

/**
 <#descrption#>
 */
@property (nonatomic, strong) NSTimer *timer;

@property (weak, nonatomic) IBOutlet ZJBaseView *tipsView;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *tipsImageView;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *tipsLabel;
@property (weak, nonatomic) IBOutlet ZJBaseView *messageCodeView;
@property (weak, nonatomic) IBOutlet UITextField *messageCodeTextField;
@property (weak, nonatomic) IBOutlet YBDefaultButton *sendMessageCodeButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsImageViewLeftMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *tipsImageViewWidthHeightConsArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageCodeViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *sendMessageCodeButtonRightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *messageCodeTextFieldLeftMarginCons;

@end

@implementation YBCertifiedPaymentVerifyPhoneNumber

#pragma mark - First.通知

- (void)timerCountDown:(NSNotification *)no
{
    [self.sendMessageCodeButton setTitle:[NSString stringWithFormat:@"%.0fs", self.countDownTime--]
                                forState:UIControlStateNormal];
    YBLog(@"%@", self.sendMessageCodeButton.titleLabel.text);
    if (self.countDownTime <= 0) {
        [[ZJTimerManager shareTimer] stopTimer];
        self.sendMessageCodeButton.enabled = YES;
        [self.sendMessageCodeButton setTitle:ZJSTRING(TEXTFIELD_FUNCBUTTON_SMS_STRINGKEY)
                                    forState:UIControlStateNormal];
    }
}

#pragma mark - Second.赋值

/**
 获取验证码
 
 @param sender sender
 */
- (IBAction)loadMessageCodeButtonClick:(YBDefaultButton *)sender
{
    if (self.type == YBCertifiedPaymentVerifyPhoneNumberChange) {
        
        /**
         *  发起获取验证码请求
         */
        [[YBPaymentService share] certifiedGetCodeWithBankCardId:self.bankCardModel.customId
                                                         bindMob:self.phoneNumber
                                                         success:^(id objc, id requestInfo) {
                                                             
                                                             YBLog(@"%@\n%@", objc, requestInfo);
                                                             self.paymentServiceSignModel = [YBPaymentServiceSignModel modelWithDictionary:objc[@"data"]];
                                                             
                                                         } fail:^(id error, id requestInfo) {
                                                             
                                                             YBLog(@"%@\n%@", error, requestInfo);
                                                             [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"错误")
                                                                                                     tipsStringKey:@"获取验证码失败"
                                                                                                              type:YBTopAlertError
                                                                                                eventCallBackBlock:^(id sender) {
                                                                                                    
                                                                                                }];
                                                         }];
        
    }else{
        
        /**
         *  获取验证码
         */
        [[YBPaymentService share] certifiedPayPreWithOrderId:self.paymentViewModel.orderId
                                                 paymentType:[NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentType]
                                                   transType:[NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentEventType]
                                                   isPartPay:[NSString stringWithFormat:@"%zd", self.paymentViewModel.isPartPay]
                                                isDepositPay:[NSString stringWithFormat:@"%zd", self.paymentViewModel.isDepositPay]
                                                   payAmount:self.paymentViewModel.payAmont
                                                    acctName:self.acctName
                                                      cardNo:self.bankCardModel.bank_cardNo
                                                        idNo:self.idNo
                                                     bindMob:self.phoneNumber
                                                  bankCardId:nil
                                                     success:^(id objc, id requestInfo) {
                                                         
                                                         YBLog(@"%@\n%@", objc, requestInfo);
                                                         self.paymentServiceSignModel = [YBPaymentServiceSignModel modelWithDictionary:objc[@"data"]];
                                                         [self startCountDonw];
                                                         
                                                     } fail:^(id error, id requestInfo) {
                                                         
                                                         YBLog(@"%@\n%@", error, requestInfo);
                                                         [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"错误")
                                                                                                 tipsStringKey:@"获取验证码失败"
                                                                                                          type:YBTopAlertError
                                                                                            eventCallBackBlock:^(id sender) {
                                                                                                
                                                                                            }];
                                                         
                                                     }];
        
    }
    
}

#pragma mark - Third.点击事件

- (void)nextButtonClick:(UIButton *)sender
{
    if ([self.messageCodeTextField.text isEqualToString:@""]
        || self.messageCodeTextField.text.length == 0) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:@"请进行验证码校验"
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        
        return;
    }
    
    if (self.type == YBCertifiedPaymentVerifyPhoneNumberChange) {
        
        [[YBPaymentService share] certifiedModifyCheckWithBankCardId:self.bankCardModel.customId
                                                               token:self.paymentServiceSignModel.token
                                                          verifyCode:self.messageCodeTextField.text
                                                             success:^(id objc, id requestInfo) {
                                                                 
                                                                 YBLog(@"%@\n%@", objc, requestInfo);
                                                                 [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"恭喜你") tipsStringKey:ZJSTRING(@"修改成功") type:YBTopAlertSuccess eventCallBackBlock:^(id sender) {
                                                                     
                                                                 }];
                                                                 [self.navigationController popViewControllerAnimated:YES];
                                                                 
                                                             } fail:^(id error, id requestInfo) {
                                                                 YBLog(@"%@\n%@", error, requestInfo);
                                                                 [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"错误") tipsStringKey:@"获取验证码失败" type:YBTopAlertError eventCallBackBlock:^(id sender) {
                                                                 }];
                                                             }];
        
    }else{
        
        /**
         *  下一步点击事件
         */
        [[YBPaymentService share] certifiedPayCheckWithToken:self.paymentServiceSignModel.token
                                                  verifyCode:self.messageCodeTextField.text
                                                   paymentId:self.paymentServiceSignModel.no_order
                                                   payAmount:[NSString stringWithFormat:@"%.0f", self.paymentServiceSignModel.money_order.floatValue * 100]
                                                     success:^(id objc, id requestInfo) {
                                                         YBLog(@"%@\n%@", objc, requestInfo);
                                                         
                                                         [self paymentResultWithSender:@(ZJProjectPaymentResultSuccess) sourceController:self];
                                                         
                                                     } fail:^(id error, id requestInfo) {
                                                         YBLog(@"%@\n%@", error, requestInfo);
                                                         [self paymentResultWithSender:@(ZJProjectPaymentResultFailed) sourceController:self];
                                                     }];
        
    }
}

/**
 支付结果
 
 @param sender sender
 */
- (void)paymentResultWithSender:(id)sender sourceController:(UIViewController *)sourceController
{
    //** =========================================================================================== */
    //** ===============================结果页改用后台接口，暂不处理冗余代码=============================== */
    //** =========================================================================================== */
    ZJProjectPaymentResultType type = (ZJProjectPaymentResultType)[sender integerValue];
    
    if (type == ZJProjectPaymentResultSuccess) {
        YBPaymentResultControllerType type = YBPaymentResultControllerDefault;
        
        if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodAll) {
            type = YBPaymentResultControllerAll;
        }
        
        if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDeposit) {
            type = YBPaymentResultControllerDeposit;
        }
        
        if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDepositBalance_All) {
            type = YBPaymentResultControllerDepositBalance_All;
        }
        
        if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDepositBalance_part) {
            type = YBPaymentResultControllerDepositBalance_Part;
        }
        
        if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodPen) {
            type = YBPaymentResultControllerPen;
        }
        //** =========================================================================================== */
        //** ===============================结果页改用后台接口，暂不处理冗余代码=============================== */
        //** =========================================================================================== */
        
        YBPaymentResultController *paymentResultController = [YBPaymentResultController paymentResultControllerWithType:type
                                                                                                             orderModel:self.paymentViewModel.paymentModel paymentEventType:self.paymentViewModel.paymentEventType
                                                                                                                 extend:self.paymentViewModel];
        paymentResultController.paymentId = self.paymentServiceSignModel.paymentId;
        [sourceController.navigationController pushViewController:paymentResultController animated:nil];
    }
    
    if (type == ZJProjectPaymentResultFailed) {
        YBPaymentResultController *paymentResultController = [YBPaymentResultController paymentResultControllerWithType:YBPaymentResultControllerError
                                                                                                             orderModel:self.paymentViewModel.paymentModel paymentEventType:self.paymentViewModel.paymentEventType
                                                                                                                 extend:self.paymentViewModel];
        paymentResultController.paymentId = self.paymentServiceSignModel.paymentId;
        [sourceController.navigationController pushViewController:paymentResultController animated:nil];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = ZJSTRING(@"验证手机号码");
    [self setupCustomUI];
    
    if (self.type == YBCertifiedPaymentVerifyPhoneNumberVer
        || self.type == YBCertifiedPaymentVerifyPhoneNumberDefault) {
        [self startCountDonw];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
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
    
    self.messageCodeView.backgroundColor    = ZJCOLOR.color_c0;
    self.messageCodeTextField.font          = SYSTEM_REGULARFONT(13.f);
    self.messageCodeTextField.placeholder   = ZJSTRING(@"填写验证码");
    
    [self.sendMessageCodeButton setTitle:ZJSTRING(@"获取验证码")
                                forState:UIControlStateNormal];
    [self.sendMessageCodeButton setTitleColor:ZJCOLOR.color_c4
                                     forState:UIControlStateNormal];
    self.sendMessageCodeButton.titleLabel.font = SYSTEM_REGULARFONT(13.f);
    
    self.tipsImageView.image                = ZJCURRENTIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                                             @"authentication_tips_icon",
                                                             ZJProjectLoadImageDefault);
    
    YBDefaultButton *nextButton             = [YBDefaultButton buttonFifthWithTitleStringKey:@"下一步"
                                                                                  titleColor:ZJCOLOR.color_c0
                                                                                   titleFont:SYSTEM_REGULARFONT(14.f)
                                                                                      target:self
                                                                                    selector:@selector(nextButtonClick:)];
    [self.view addSubview:nextButton];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.top.mas_equalTo(self.messageCodeView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(30.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
    }];
    
    self.tipsViewHeightCons.constant = ADJUST_PERCENT_FLOAT(32.f);
    [self.tipsImageViewWidthHeightConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                         NSUInteger idx,
                                                                         BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(12.f);
    }];
    self.messageCodeTextFieldLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.messageCodeViewHeightCons.constant = ADJUST_PERCENT_FLOAT(44.f);
    self.sendMessageCodeButtonRightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    
    if (self.type == YBCertifiedPaymentVerifyPhoneNumberChange) {
        self.tipsLabel.text                     = @"本次操作需要短信认证，请输入收到的短信验证码";
        
    }else{
        self.tipsLabel.text                     = [NSString stringWithFormat:@"本次操作需要短信认证，请输入%@收到的短信验证码",
                                                   self.phoneNumber];
    }
}

#pragma mark - Seventh.懒加载

#pragma mark - Eight.Other

/**
 开始倒计时
 */
- (void)startCountDonw
{
    /**
     *  倒计时
     */
    _timer = [NSTimer timerWithTimeInterval:1.f
                                     target:self
                                   selector:@selector(timerCountDown:)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer
                              forMode:NSDefaultRunLoopMode];
    self.sendMessageCodeButton.enabled = NO;
    self.countDownTime = 60.f;
}

@end
