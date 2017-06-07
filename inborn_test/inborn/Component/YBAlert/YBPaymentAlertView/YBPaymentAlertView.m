//
//  YBPaymentAlertView.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentAlertView.h"
#import "YBCertifiedPaymentAlertView.h"
#import "YBAttributedStringLabel.h"
#import "YBStringTool.h"
#import "YBOrderModel.h"
#import "YBPaymentServiceSignModel.h"
#import "YBRightImageButton.h"
#import "YBBankCardModel.h"
#import "YBVerCodeTextField.h"
#import "YBPaymentService.h"
#import "MOFSPickerManager.h"
#import "ZJTimerManager.h"
#import "YBPaymentViewModel.h"
#import "YBTopAlert.h"

@interface YBPaymentAlertView()

/**
 弹窗内容视图
 */
@property (nonatomic, strong) YBCertifiedPaymentAlertView *alerView;

/**
 YBOrderModel
 */
@property (nonatomic, strong) YBOrderModel *orderModel;

/**
 paymentSingModel
 */
@property (nonatomic, strong) YBPaymentServiceSignModel *paymentSingModel;

/**
 bankCardModel
 */
@property (nonatomic, strong) NSArray *bankCardModelArray;

/**
 ZJEventCallBackBlock
 */
@property (nonatomic, copy) ZJEventCallBackBlock callBackBlock;

/**
 倒计时60s
 */
@property (nonatomic, assign) CGFloat countDownTime;

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBPaymentViewModel *paymentViewModel;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *currentBankId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *currentVerCode;

/**
 <#descrption#>
 */
@property (nonatomic, weak) YBCertifiedPaymentAlertView *certifiedPaymentAlertView;

@end

@implementation YBPaymentAlertView

#pragma mark - First.通知

- (void)textDidChange:(NSNotification *)no
{
    YBLog(@"%@", no);
    UITextField *textField = (UITextField *)no.object;
    if (textField.text.length == 0
        || [textField.text isEqualToString:@""]) {
        self.certifiedPaymentAlertView.surePayButton.alpha = 0;
        self.certifiedPaymentAlertView.loadMessageButton.alpha = 1.f;
    }else{
        if (textField.text.length >= 6) {
            textField.text = [textField.text substringToIndex:6];
        }else{
            self.certifiedPaymentAlertView.surePayButton.alpha = 1.f;
            self.certifiedPaymentAlertView.loadMessageButton.alpha = 0.f;
        }
    }
    
    self.currentVerCode = textField.text;
}

- (void)timerCountDown:(NSNotification *)no
{
    [self.alerView.loadMessageButton setTitle:[NSString stringWithFormat:@"%.0fs", self.countDownTime--]
                                     forState:UIControlStateNormal];
    YBLog(@"%@", self.alerView.loadMessageButton.titleLabel.text);
    if (self.countDownTime <= 0) {
        [[ZJTimerManager shareTimer] stopTimer];
        self.alerView.loadMessageButton.enabled = YES;
        [self.alerView.loadMessageButton setTitle:ZJSTRING(TEXTFIELD_FUNCBUTTON_SMS_STRINGKEY)
                                         forState:UIControlStateNormal];
    }
}

- (void)willChangeKeyboardFrame:(NSNotification *)no
{
    YBLog(@"%@", no.userInfo);
    
    /**
     *  键盘弹出frame
     */
    CGRect frame = [no.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    /**
     *  动画时长
     */
    CGFloat duration = [no.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    if (frame.origin.y >= SCREEN_HEIGHT) {
        [self.alerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(319.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(300.f));
            make.centerY.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
        }];
    }else{
        [self.alerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(319.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(300.f));
            make.centerY.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-70.f));
        }];
    }
    
    [UIView animateWithDuration:duration animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (finished) {
            self.alerView.alpha = 1;
        }
    }];
}

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

+ (instancetype)sharedAlert
{
    static id alertInstance                 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertInstance                       = [[self alloc] initWithFrame:CGRectMake(0,
                                                                                     0,
                                                                                     SCREEN_WIDTH,
                                                                                     SCREEN_HEIGHT)];
    });
    return alertInstance;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    YBCertifiedPaymentAlertView *alertView = [[YBCertifiedPaymentAlertView alloc] init];
    _certifiedPaymentAlertView = alertView;
    alertView.callBackBlock = ^(id sender) {
        
        UIView *view = (UIView *)sender;
        
        /**
         *  关闭
         */
        if (view.tag == 1001) {
            if (self.callBackBlock) {
                self.callBackBlock(view);
            }
            [self hiddenAlert];
        }
        
        /**
         *  提示功能
         */
        if (view.tag == 1002) {
            if (self.callBackBlock) {
                self.callBackBlock(view);
            }
        }
        
        /**
         *  银行卡按钮
         */
        if (view.tag == 1003) {
            
            [self.alerView registerFirstRespond];
            NSMutableArray *tempArray = [NSMutableArray array];
            [self.bankCardModelArray enumerateObjectsUsingBlock:^(YBBankCardModel *  _Nonnull obj,
                                                                  NSUInteger idx,
                                                                  BOOL * _Nonnull stop) {
                [tempArray addObject:obj.bankName];
            }];
            [tempArray addObject:ZJSTRING(@"选择其他银行支付")];
            
            [[MOFSPickerManager shareManger] showPickerViewWithDataArray:tempArray.copy
                                                                     tag:1
                                                                   title:@"选择银行卡支付"
                                                             cancelTitle:@"取消"
                                                             commitTitle:@"完成"
                                                             commitBlock:^(NSString *string) {
                                                                 
                                                                 [self.alerView becomeFirstRespond];
                                                                 if ([string isEqualToString:@"选择其他银行支付"]) {
                                                                     
                                                                     /**
                                                                      *  回调
                                                                      */
                                                                     if (self.callBackBlock) {
                                                                         self.callBackBlock(view);
                                                                     }
                                                                     
                                                                 }else{
                                                                     
                                                                     /**
                                                                      *  修改支付银行信息
                                                                      */
                                                                     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"bankName contains %@", string];
                                                                     YBBankCardModel *bankCardModel = [self.bankCardModelArray filteredArrayUsingPredicate:predicate].firstObject;
                                                                     self.currentBankId = bankCardModel.customId;
                                                                     [self.alerView.bankCardButton setTitle:[NSString stringWithFormat:@"%@：%@(尾号%@)",
                                                                                                             bankCardModel.bankName,
                                                                                                             bankCardModel.cardType,
                                                                                                             bankCardModel.cardNo]
                                                                                                   forState:UIControlStateNormal];
                                                                     
                                                                 }
                                                                 
                                                             } cancelBlock:^{
                                                                 
                                                                 [self.alerView becomeFirstRespond];
                                                             }];
        }
        
        /**
         *  获取验证码
         */
        if (view.tag == 1004) {
            
            [self startCountDonw];
            /**
             *  调起支付alert界面，并发起认证支付预支付
             */
            [[YBPaymentService share] certifiedPayPreWithOrderId:self.paymentViewModel.orderId
                                                     paymentType:[NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentType]
                                                       transType:[NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentEventType]
                                                       isPartPay:[NSString stringWithFormat:@"%zd", self.paymentViewModel.isPartPay]
                                                    isDepositPay:[NSString stringWithFormat:@"%zd", self.paymentViewModel.isDepositPay]
                                                       payAmount:self.paymentViewModel.payAmont
                                                        acctName:@""
                                                          cardNo:@""
                                                            idNo:@""
                                                         bindMob:@""
                                                      bankCardId:self.currentBankId
                                                         success:^(id objc, id requestInfo) {
                                                             
                                                             self.paymentSingModel = [YBPaymentServiceSignModel modelWithDictionary:objc[@"data"]];
                                                             YBLog(@"%@\n%@", objc, requestInfo);
                                                             
                                                         } fail:^(id error, id requestInfo) {
                                                             
                                                             YBLog(@"%@\n%@", error, requestInfo);
                                                             
                                                         }];
        }
        
        /**
         *  输入完成回调
         */
        if (view.tag == 1005) {
            
//            YBVerCodeTextField *verCodeTextField = (YBVerCodeTextField *)view;
//            
//            if (!self.paymentSingModel.token
//                || !verCodeTextField.inputVerificationCodeTextField.text
//                || !self.paymentSingModel.no_order
//                || verCodeTextField.inputVerificationCodeTextField.text.length == 0) {
//                
//                [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
//                                                        tipsStringKey:@"短信验证码错误"
//                                                                 type:YBTopAlertError eventCallBackBlock:^(id sender) {
//                                                                     
//                                                                 }];
//                
//                return;
//            }
        }
        
        /**
         *  确认支付
         */
        if (view.tag == 1006) {
            
            [[YBPaymentService share] certifiedPayCheckWithToken:self.paymentSingModel.token
                                                      verifyCode:self.currentVerCode
                                                       paymentId:self.paymentSingModel.no_order
                                                       payAmount:[NSString stringWithFormat:@"%.0f", self.paymentSingModel.money_order.floatValue * 100]
                                                         success:^(id objc, id requestInfo) {
                                                             
                                                             if (self.callBackBlock) {
                                                                 self.callBackBlock(self.paymentSingModel);
                                                             }
                                                             [self hiddenAlert];
                                                             
                                                         } fail:^(id error, id requestInfo) {
                                                             YBLog(@"%@\n%@", error, requestInfo);
                                                             [self.alerView checkFailed];
                                                         }];
        }
        
    };
    
    [self addSubview:alertView];
    alertView.alpha = 0;
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self);
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(319.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(300.f));
    }];
    _alerView = alertView;
}

/**
 显示支付弹窗
 
 @param orderModel                                  订单模型
 @param paymentSingModel                            支付模型
 @param paymentViewModel                            支付视图模型
 @param bankCardModelArray                          银行卡列表数组
 @param eventCallBackBlock                          点击事件回调
 */
- (void)showAlertWithOrderModel:(YBOrderModel *)orderModel
               paymentSingModel:(YBPaymentServiceSignModel *)paymentSingModel
               paymentViewModel:(YBPaymentViewModel *)paymentViewModel
             bankCardModelArray:(NSArray *)bankCardModelArray
             eventCallBackBlock:(ZJEventCallBackBlock)eventCallBackBlock
{
    self.orderModel                     = orderModel;
    //self.paymentSingModel               = paymentSingModel;
    self.bankCardModelArray             = bankCardModelArray;
    self.callBackBlock                  = eventCallBackBlock;
    self.paymentViewModel               = paymentViewModel;
    YBBankCardModel *bankCardModel      = bankCardModelArray.firstObject;
    self.currentBankId                  = bankCardModel.customId;
    
    /**
     *  界面赋值
     */
    [self.alerView.amontLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                      @"content" : ZJSTRING(@"支付金额："),
                                                                      @"size" : SYSTEM_REGULARFONT(18.f),
                                                                      @"lineSpacing": @0},
                                                                    @{@"color" : ZJCOLOR.color_c6,
                                                                      @"content" : @"¥",
                                                                      @"size" : SYSTEM_REGULARFONT(20.f),
                                                                      @"lineSpacing": @0},
                                                                    @{@"color" : ZJCOLOR.color_c6,
                                                                      @"content" : [[YBStringTool share] strmethodCommaWith:[NSString stringWithFormat:@"%f", paymentSingModel.money_order.floatValue]],
                                                                      @"size" : SYSTEM_REGULARFONT(20.f),
                                                                      @"lineSpacing": @0}]];
    [self.alerView.bankCardButton setTitle:[NSString stringWithFormat:@"%@：%@(尾号%@)",
                                            bankCardModel.bankName,
                                            bankCardModel.cardType,
                                            bankCardModel.cardNo]
                                  forState:UIControlStateNormal];
    
    self.alpha = 0;
    [super showAlert];
    [self startAnimation];
    [self registerNotification];
    [self.alerView becomeFirstRespond];
}

/**
 隐藏弹窗
 */
- (void)hiddenAlert
{
    [self.alerView clearVerCode];
    [self endAnimation];
    [self removeNotification];
    [[ZJTimerManager shareTimer] stopTimer];
    self.alerView.loadMessageButton.enabled = YES;
    [self.alerView.loadMessageButton setTitle:ZJSTRING(TEXTFIELD_FUNCBUTTON_SMS_STRINGKEY)
                                     forState:UIControlStateNormal];
    
    self.currentVerCode = @"";
    self.certifiedPaymentAlertView.surePayButton.alpha = 0;
    self.certifiedPaymentAlertView.loadMessageButton.alpha = 1.f;
}

- (void)startAnimation
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1.f;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)endAnimation
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        if (finished) {
            [super hiddenAlert];
        }
    }];
}

#pragma mark - Sixth.界面配置

- (void)removeNotification
{
    /**
     *  移除监听
     */
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self
                                         name:UIKeyboardWillChangeFrameNotification
                                       object:nil];
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self
                                         name:UITextFieldTextDidChangeNotification
                                       object:nil];
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self
                                         name:TIMER_NOTIFICATION
                                       object:nil];
}

- (void)registerNotification
{
    /**
     *  添加监听键盘弹出
     */
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(willChangeKeyboardFrame:)
                                      name:UIKeyboardWillChangeFrameNotification
                                    object:nil];
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(textDidChange:)
                                      name:UITextFieldTextDidChangeNotification
                                    object:nil];
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(timerCountDown:)
                                      name:TIMER_NOTIFICATION
                                    object:nil];
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
    [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1.f];
    self.alerView.loadMessageButton.enabled = NO;
    self.countDownTime = 60.f;
}

@end
