//
//  ZJBaseViewController.m
//  Project
//
//  Created by 郑键 on 17/1/10.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJBaseViewController.h"
#import "YBPhoneNumberTextField.h"
#import "YBMessageCodeTextField.h"
#import "YBPasswordTextField.h"
#import "YBTopAlert.h"
#import "YBAttributedStringLabel.h"
#import "YBSearchBarView.h"
#import "YBVerCodeTextField.h"
#import "YBSearchResultListViewController.h"
#import "YBConfirmOrderViewController.h"
#import "YBPaymentController.h"
#import "YBPenToPayController.h"
#import "YBCertifiedPaymentChangePhoneNumberController.h"
#import "YBRealNameAndBindBankCardController.h"
#import "YBPaymentAlertView.h"
#import "YBOrderModel.h"
#import "YBOrderDetailTableViewController.h"
#import "YBPaymentResultController.h"
#import "ZJProjectSizeFatory.h"

@interface ZJBaseViewController ()

/**
 蒙版空视图
 */
@property (nonatomic, strong) ZJBaseImageView *logoImageView;

/**
 tipsLabel
 */
@property (nonatomic, strong) YBAttributedStringLabel *tipsLabel;

/**
 funcButton
 */
@property (nonatomic, strong) YBDefaultButton *funcButton;

@end

@implementation ZJBaseViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)tempViewButtonClick:(UIButton *)sender
{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    YBConfirmOrderViewController *vc = [YBConfirmOrderViewController confirmOrderViewControllerWithGoodId:@"567054300018134"
    //                                                                                                   extend:nil];
   // YBOrderDetailTableViewController *vc = [YBOrderDetailTableViewController orderDetailTableViewControllerWithOrderId:@"912354385951016" extend:nil];
   // YBPaymentController *paymentController = [YBPaymentController paymentControllerWithOrderId:@"442354385956485" paymentMethod:ZJProjectPaymentMethodAll paymentEventType:ZJProjectPaymentEventOrder extend:nil];
    
//    YBPaymentController *vc = [YBPaymentController paymentControllerWithOrderId:@"657754385943537"
//                                                                  paymentMethod:ZJProjectPaymentMethodAll
//                                                               paymentEventType:ZJProjectPaymentEventOrder
//                                                                         extend:nil];;
    //[self.navigationController pushViewController:vc animated:YES];
//    YBOrderModel *orderModel = [[YBOrderModel alloc] init];
//    orderModel.unpaidAmount = @"23423400";
//    [[YBPaymentAlertView sharedAlert] showAlertWithOrderModel:orderModel eventCallBackBlock:^(id sender) {
//        
//    }];
    //[self.navigationController pushViewController:paymentController animated:YES];

//    [self.navigationController pushViewController:vc animated:YES];

//    YBPaymentResultController *resultController = [YBPaymentResultController paymentResultControllerWithType:YBPaymentResultControllerError orderModel:nil extend:nil];
//    [self.navigationController pushViewController:resultController animated:YES];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    YBPhoneNumberTextField *textField = [YBPhoneNumberTextField textFieldWithEndEditingCallBackBlock:^(UITextField *textField) {
    //
    //    }];
    //    [self.view addSubview:textField];
    //    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.right.left.mas_equalTo(self.view);
    //        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(50.f));
    //        make.top.mas_equalTo(100);
    //    }];
    //
    //    YBMessageCodeTextField *textField2 = [YBMessageCodeTextField textFieldMessageCodeWithEndEditingCallBackBlock:^(UITextField *textField) {
    //
    //    } loadMessageCodeButtonCallBack:^(id sender) {
    //
    //    }];
    //    [self.view addSubview:textField2];
    //    [textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.right.height.mas_equalTo(textField);
    //        make.top.mas_equalTo(textField.mas_bottom);
    //    }];
    
    //    YBAttributedStringLabel *attrLable = [[YBAttributedStringLabel alloc] init];
    //    [self.view addSubview:attrLable];
    //    [attrLable mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.mas_equalTo(self.view);
    //    }];
    //    [attrLable setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c1,
    //                                                       @"content" : @"测试内容1测试内容1测试内容1测试内容1测试内容1测试内容1",
    //                                                       @"size" : SYSTEM_FONT(12),
    //                                                       @"lineSpacing": @20.f},
    //                                                     @{@"color" : ZJCOLOR.color_c2,
    //                                                       @"content" : @"测试内容2测试内容2测试内容2测试内容2测试内容2测试内容2测试内容2",
    //                                                       @"size" : SYSTEM_REGULARFONT(12),
    //                                                       @"lineSpacing": @20.f},]];
    
    
    //    YBVerCodeTextField *verCodeTextField = [[YBVerCodeTextField alloc] init];
    //    [self.view addSubview:verCodeTextField];
    //    [verCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.mas_equalTo(self.view);
    //        make.left.right.mas_equalTo(self.view);
    //        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44));
    //    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self hiddenMaskView];
    [SVProgressHUD dismiss];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
}

#pragma mark - Sixth.界面配置

/**
 展示空页面

 @param imageNamed imageNamed
 @param tipsString tipsString
 */
- (void)showTempViewWithLogoImageNamed:(NSString *)imageNamed
                            tipsString:(NSString *)tipsString
                           buttonTitle:(NSString *)buttonTitle
{
    [self showMaskView];
    self.logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_BLANK,
                                              imageNamed,
                                              ZJProjectLoadImageDefault);
    [self.tipsLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                            @"content" : tipsString,
                                                            @"size" : SYSTEM_MEDIUMFONT(14.f),
                                                            @"lineSpacing": @16.f,
                                                            @"alignment":@"1"}]];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.logoImageView.alpha        = 1.f;
        self.tipsLabel.alpha            = 1.f;
        if (buttonTitle) {
            self.funcButton.alpha           = 1.f;
            [self.funcButton setTitle:ZJSTRING(buttonTitle)
                             forState:UIControlStateNormal];
        }
        
    } completion:^(BOOL finished) {
        
    }];
}

/**
 展示请求错误界面
 */
- (void)showBadRequestMaskView
{
    [self showTempViewWithLogoImageNamed:@"blank_net_bg"
                              tipsString:@"糟糕，网络好像出问题了\n点击重新加载重试"
                             buttonTitle:@"重新加载"];
    
    self.tipsLabel.numberOfLines = 2;
    
    NSArray *imageArray         = ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                          @"public_blank_btn",
                                          ZJProjectLoadImageDefault);
    [self.funcButton setTitleColor:ZJCOLOR.color_c6
                          forState:UIControlStateNormal];
    [self.funcButton setBackgroundImage:imageArray.firstObject
                               forState:UIControlStateNormal];
    [self.funcButton setBackgroundImage:imageArray.lastObject
                               forState:UIControlStateHighlighted];
    [self.funcButton setTitle:ZJSTRING(@"重新加载")
                     forState:UIControlStateNormal];
    [self.funcButton setTitleColor:ZJCOLOR.color_c6
                          forState:UIControlStateNormal];
    
    [self.logoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ADJUST_PERCENT_FLOAT(103.5));
    }];
}

#pragma mark - Seventh.懒加载

#pragma mark - Seventh.懒加载

- (ZJBaseView *)myMaskView
{
    if (!_myMaskView) {
        
        _myMaskView = [[ZJBaseView alloc] initWithFrame:CGRectMake(0,
                                                                   64,
                                                                   self.view.width,
                                                                   self.view.height - 64)];
        
        _logoImageView = [[ZJBaseImageView alloc] init];
        _logoImageView.alpha = 0;
        
        _tipsLabel = [[YBAttributedStringLabel alloc] init];
        _tipsLabel.alpha = 0;
        
        _funcButton = [YBDefaultButton buttonSixWithTitleStringKey:@"重新加载"
                                                        titleColor:ZJCOLOR.color_c4
                                                         titleFont:SYSTEM_MEDIUMFONT(14.f)
                                                            target:self
                                                          selector:@selector(tempViewButtonClick:)];
        _funcButton.alpha = 0;
        
        [_myMaskView addSubview:_logoImageView];
        [_myMaskView addSubview:_tipsLabel];
        [_myMaskView addSubview:_funcButton];
        
        [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_myMaskView).mas_offset(ADJUST_PERCENT_FLOAT(104.f));
            make.centerX.mas_equalTo(_myMaskView);
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(147.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(120.f));
        }];
        
        [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_myMaskView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
            make.right.mas_equalTo(_myMaskView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
            make.top.mas_equalTo(_logoImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(30.f));
        }];
        
        [_funcButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_myMaskView);
            make.top.mas_equalTo(_tipsLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(42.f));
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(226.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
        }];
    }
    return _myMaskView;
}

#pragma mark - Eight.Other

- (void)showMaskView
{
    [self.view addSubview:self.myMaskView];
    self.myMaskView.alpha = 1.f;
}

- (void)hiddenMaskView
{
    [UIView animateWithDuration:0.25 animations:^{
        self.myMaskView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.myMaskView removeFromSuperview];
        }
    }];
}
- (void)agrinShow
{
    self.view.alpha  = 1;
    _funcButton.alpha = 1;
    _tipsLabel.alpha = 1;
    _logoImageView.alpha = 1;
}

@end
