//
//  YBPaymentResultController.m
//  inborn
//
//  Created by 郑键 on 17/4/11.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentResultController.h"
#import "YBAttributedStringLabel.h"
#import "YBPaymentModel.h"
#import "YBStringTool.h"
#import "YBOrderDetailTableViewController.h"
#import "ZJBaseNavigationController.h"
#import "YBMeMainViewController.h"
#import "YBPaymentViewModel.h"
#import "YBOrderDetailTableViewController.h"
#import "YBPaymentController.h"
#import "YBPaymentService.h"
#import "YBPaymentResultModel.h"
#import "ZJBaseBarButtonItem.h"
#import "JXTAlertManagerHeader.h"
#import "YBGoodsDeatilViewController.h"
#import "YBGoodsDeatilImageViewController.h"
#import "YBMyComposedListViewController.h"
#import "YBOrderListViewController.h"

@interface YBPaymentResultController ()

/**
 当前支付方式
 */
@property (nonatomic, assign) ZJProjectPaymentEventType paymentEventType;

/**
 YBPaymentResultModel
 */
@property (nonatomic, strong) YBPaymentResultModel *paymentResultModel;

/**
 YBPaymentModel
 */
@property (nonatomic, strong) YBPaymentModel *currentPaymentModel;

/**
 viewModel
 */
@property (nonatomic, strong) YBPaymentViewModel *currentPaymentViewModel;

@property (weak, nonatomic) IBOutlet ZJBaseImageView *logoImageView;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *tipsLabel;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *paymentTypeLabel;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *amontLabel;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *unpayAmont;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *tipsDetailLabel;
@property (weak, nonatomic) IBOutlet YBDefaultButton *firstButton;
@property (weak, nonatomic) IBOutlet YBDefaultButton *secondButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerViewHeightCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *centerViewLabelMarginConsArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerViewTopMarginCons;

/**
 类型
 */
@property (nonatomic, assign) YBPaymentResultControllerType type;

@end

@implementation YBPaymentResultController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setPaymentResultModel:(YBPaymentResultModel *)paymentResultModel
{
    _paymentResultModel = paymentResultModel;
    
    [self setupCustomUI];
    [self hiddenMaskView];
}

#pragma mark - Third.点击事件

- (IBAction)buttonClick:(UIButton *)sender
{
    YBLog(@"%zd", self.navigationController.childViewControllers.count);
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"查看订单详情")]) {
        
        NSArray *viewControllerArray = self.navigationController.childViewControllers;
        __block BOOL haveOrderDetail = NO;
        [viewControllerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
            
            if ([obj isKindOfClass:[YBOrderDetailTableViewController class]]) {
                [self.navigationController popToViewController:viewControllerArray[idx] animated:YES];
                *stop = YES;
                haveOrderDetail = YES;
            }
            
        }];
        
        if (!haveOrderDetail) {
            
            YBOrderDetailTableViewController *orderDetailTableViewController = [YBOrderDetailTableViewController orderDetailTableViewControllerWithOrderId:self.currentPaymentModel.orderId extend:self];
            [self.navigationController pushViewController:orderDetailTableViewController animated:YES];
            
        }
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"继续支付")]) {
        
        /**
         *  其他支付方式
         */
        NSArray *viewControllerArray = self.navigationController.childViewControllers;
        [viewControllerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
            
            if ([obj isKindOfClass:[YBPaymentController class]]) {
                [self.navigationController popToViewController:viewControllerArray[idx] animated:YES];
                *stop = YES;
            }
            
        }];
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"去首页逛逛")]) {
        
        if ([self.navigationController.childViewControllers.firstObject isKindOfClass:[YBGoodsDeatilViewController class]]
            || [self.navigationController.childViewControllers.firstObject isKindOfClass:[YBGoodsDeatilImageViewController class]]) {
            
            self.tabBarController.selectedIndex = 0;
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            self.tabBarController.selectedIndex = 0;
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
    
    if ([sender.titleLabel.text isEqualToString:@"查看我发布的"]) {
        NSArray *viewControllerArray = self.navigationController.childViewControllers;
        [viewControllerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
            
            if ([obj isKindOfClass:[YBMyComposedListViewController class]]) {
                [self postNotificationWithExtend:nil];
                [self.navigationController popToViewController:viewControllerArray[idx] animated:YES];
                *stop = YES;
            }
            
        }];
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"查看我的鉴定")]) {
        
        /**
         *  跳转鉴定列表
         */
        YBOrderListViewController *listViewController = [YBOrderListViewController creatOrderListViewControllerWithCutrtentIndex:0
                                                                                                                 OrderListVcType:AppraisalOrderType
                                                                                                                          Extend:nil];
        listViewController.sourceController = self;
        [self.navigationController pushViewController:listViewController
                                             animated:YES];
        
    }
}

/**
 支付成功通知
 
 @param extend extend 暂传nil
 */
- (void)postNotificationWithExtend:(id)extend
{
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:PAY_RESULT_SUCCESS_NOTIFICATION object:nil userInfo:nil];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

/**
 初始化支付结果控制器
 
 @param type                    type
 @param orderModel              orderModel
 @param paymentEventType        paymentEventType
 @param extend                  extend
 @return                        支付结果控制器
 */
+ (instancetype)paymentResultControllerWithType:(YBPaymentResultControllerType)type
                                     orderModel:(YBOrderModel *)orderModel
                               paymentEventType:(ZJProjectPaymentEventType)paymentEventType
                                         extend:(id)extend
{
    YBPaymentResultController *paymentResultController      = [[YBPaymentResultController alloc] init];
    paymentResultController.currentPaymentModel             = (YBPaymentModel *)orderModel;
    paymentResultController.type                            = type;
    paymentResultController.paymentEventType                = paymentEventType;
    if (extend
        && [extend isKindOfClass:[YBPaymentViewModel class]]) {
        paymentResultController.currentPaymentViewModel = (YBPaymentViewModel *)extend;
    }
    return paymentResultController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showMaskView];
    [self loadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    ZJBaseBarButtonItem *backButtonItem                 = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_back"
                                                                                                     callBack:^(id sender) {
                                                                                                         
                                                                                                         
                                                                                                         if (self.paymentEventType == ZJProjectPaymentEventIdentifyCost) {
                                                                                                             
                                                                                                             /**
                                                                                                              *  担保金/鉴定费
                                                                                                              */
                                                                                                             NSArray *viewControllerArray = self.navigationController.childViewControllers;
                                                                                                             [viewControllerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                                                                                                                               NSUInteger idx,
                                                                                                                                                               BOOL * _Nonnull stop) {
                                                                                                                 
                                                                                                                 if ([obj isKindOfClass:[YBMyComposedListViewController class]]) {
                                                                                                                     [self postNotificationWithExtend:nil];
                                                                                                                     [self.navigationController popToViewController:viewControllerArray[idx] animated:YES];
                                                                                                                     *stop = YES;
                                                                                                                 }
                                                                                                                 
                                                                                                             }];
                                                                                                             
                                                                                                         }else if (self.paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
                                                                                                             YBOrderListViewController *listViewController = [YBOrderListViewController creatOrderListViewControllerWithCutrtentIndex:0
                                                                                                                                                                                                                      OrderListVcType:AppraisalOrderType
                                                                                                                                                                                                                               Extend:nil];
                                                                                                             listViewController.sourceController = self;
                                                                                                             [self.navigationController pushViewController:listViewController
                                                                                                                                                  animated:YES];
                                                                                                         }else{
                                                                                                             NSArray *viewControllerArray = self.navigationController.childViewControllers;
                                                                                                             __block BOOL haveOrderDetail = NO;
                                                                                                             [viewControllerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                                                                                                                               NSUInteger idx,
                                                                                                                                                               BOOL * _Nonnull stop) {
                                                                                                                 
                                                                                                                 if ([obj isKindOfClass:[YBOrderDetailTableViewController class]]) {
                                                                                                                     [self.navigationController popToViewController:viewControllerArray[idx] animated:YES];
                                                                                                                     *stop = YES;
                                                                                                                     haveOrderDetail = YES;
                                                                                                                 }
                                                                                                                 
                                                                                                             }];
                                                                                                             
                                                                                                             if (!haveOrderDetail) {
                                                                                                                 
                                                                                                                 YBOrderDetailTableViewController *orderDetailTableViewController = [YBOrderDetailTableViewController orderDetailTableViewControllerWithOrderId:self.currentPaymentModel.orderId extend:self];
                                                                                                                 [self.navigationController pushViewController:orderDetailTableViewController animated:YES];
                                                                                                                 
                                                                                                             }
                                                                                                         }
                                                                                                         
                                                                                                     }];
    backButtonItem.offSet = YES;
    self.navigationItem.leftBarButtonItem     = backButtonItem;
}

- (void)setupCustomUI
{
    self.navigationItem.title = ZJSTRING(@"订单支付结果页");
    
    self.tipsLabel.font = SYSTEM_MEDIUMFONT(16.f);
    self.tipsLabel.textColor = ZJCOLOR.color_c4;
    
    self.logoImageViewWidthCons.constant = ADJUST_PERCENT_FLOAT(147.f);
    self.logoImageViewHeightCons.constant = ADJUST_PERCENT_FLOAT(120.f);
    self.tipsLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(30.f);
    [self.centerViewLabelMarginConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                      NSUInteger idx,
                                                                      BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(12.f);
    }];
    self.firstButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(32.f);
    self.secondButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(24.f);
    self.buttonHeightCons.constant =ADJUST_PERCENT_FLOAT(44.f);
    self.buttonWidthCons.constant = ADJUST_PERCENT_FLOAT(226.f);
    
    [self.paymentTypeLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                   @"content" : ZJSTRING(@"支付方式："),
                                                                   @"size" : SYSTEM_REGULARFONT(14.f),
                                                                   @"lineSpacing": @0},
                                                                 @{@"color" : ZJCOLOR.color_c6,
                                                                   @"content" : [self.currentPaymentViewModel paymentTypeName],
                                                                   @"size" : SYSTEM_REGULARFONT(13.f),
                                                                   @"lineSpacing": @0}]];
    [self.amontLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                             @"content" : ZJSTRING(@"支付金额："),
                                                             @"size" : SYSTEM_REGULARFONT(14.f),
                                                             @"lineSpacing": @0},
                                                           @{@"color" : ZJCOLOR.color_c6,
                                                             @"content" : [NSString stringWithFormat:@"¥%@",
                                                                           [[YBStringTool share] strmethodCommaWith:self.paymentResultModel.payAmt]],
                                                             @"size" : SYSTEM_REGULARFONT(13.f),
                                                             @"lineSpacing": @0}]];
    
    if ([self.paymentResultModel.paymentResult isEqualToString:@"SUCCESS"]) {
        
        self.topViewHeightCons.constant = ADJUST_PERCENT_FLOAT(220.f);
        self.logoImageViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(52.f);
        self.centerViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(18.f);
        self.logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_BLANK,
                                                  @"blank_success_bg",
                                                  ZJProjectLoadImageDefault);
        
        self.tipsLabel.text = ZJSTRING(@"已成功付款！");
        
        if ([self.paymentResultModel.showStatus isEqualToString:@"1"]) {
            
            /**
             *  全部支付
             */
            self.centerViewHeightCons.constant = ADJUST_PERCENT_FLOAT(50.f);
            if (self.paymentEventType == ZJProjectPaymentEventIdentifyCost) {
                
                /**
                 *  担保金/鉴定费
                 */
                
                [self setupButtonWithTitle:@"查看我的鉴定" otherTitle:@"去首页逛逛"];
            }else if (self.paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
                [self setupButtonWithTitle:@"查看我发布的" otherTitle:@"去首页逛逛"];
            }else{
                [self setupButtonWithTitle:@"查看订单详情" otherTitle:@"去首页逛逛"];
            }
            
        }else if ([self.paymentResultModel.showStatus isEqualToString:@"2"]
                  || [self.paymentResultModel.showStatus isEqualToString:@"3"]) {
        
            /**
             *  分笔一次支付
             */
            self.centerViewHeightCons.constant = ADJUST_PERCENT_FLOAT(146.f);
            
            if ([self.paymentResultModel.showStatus isEqualToString:@"2"]) {
                [self setupButtonWithTitle:@"查看订单详情" otherTitle:@"继续支付"];
            }else{
                [self setupButtonWithTitle:@"查看订单详情" otherTitle:nil];
                self.tipsDetailLabel.hidden = YES;
            }
            
            [self.unpayAmont setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                     @"content" : ZJSTRING(@"剩余应付金额："),
                                                                     @"size" : SYSTEM_REGULARFONT(14.f),
                                                                     @"lineSpacing": @0},
                                                                   @{@"color" : ZJCOLOR.color_c6,
                                                                     @"content" :  [NSString stringWithFormat:@"¥%@",
                                                                                    [[YBStringTool share] strmethodCommaWith:self.paymentResultModel.orderPayAmount]],
                                                                     @"size" : SYSTEM_REGULARFONT(13.f),
                                                                     @"lineSpacing": @0}]];
            [self.tipsDetailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                                          @"content" : ZJSTRING(@"剩余应付金额需在下单后48小时内完成支付，如未支付，订单将关闭"),
                                                                          @"size" : SYSTEM_REGULARFONT(14.f),
                                                                          @"lineSpacing": @ADJUST_PERCENT_FLOAT(10.f),
                                                                          @"alignment":@"1"}]];
            self.tipsDetailLabel.numberOfLines = 2;
            
        }else if ([self.paymentResultModel.showStatus isEqualToString:@"4"]
                  || [self.paymentResultModel.showStatus isEqualToString:@"5"]
                  || [self.paymentResultModel.showStatus isEqualToString:@"6"]){
        
            self.centerViewHeightCons.constant = ADJUST_PERCENT_FLOAT(146.f);
            
            /**
             *  定金支付
             */
            if ([self.paymentResultModel.showStatus isEqualToString:@"6"]) {
                [self setupButtonWithTitle:@"查看订单详情" otherTitle:nil];
                self.tipsDetailLabel.hidden = YES;
            }else{
                [self setupButtonWithTitle:@"查看订单详情" otherTitle:@"继续支付"];
            }
            
            [self.unpayAmont setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                     @"content" : ZJSTRING(@"剩余尾款："),
                                                                     @"size" : SYSTEM_REGULARFONT(14.f),
                                                                     @"lineSpacing": @0},
                                                                   @{@"color" : ZJCOLOR.color_c6,
                                                                     @"content" : [NSString stringWithFormat:@"¥%@",
                                                                                   [[YBStringTool share] strmethodCommaWith:self.paymentResultModel.orderPayAmount]],
                                                                     @"size" : SYSTEM_REGULARFONT(13.f),
                                                                     @"lineSpacing": @0}]];
            [self.tipsDetailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                                          @"content" : ZJSTRING(@"剩余尾款需在下单后48小时内完成支付，如未及时支付订单将关闭，已付定金不予退还。"),
                                                                          @"size" : SYSTEM_REGULARFONT(14.f),
                                                                          @"lineSpacing": @ADJUST_PERCENT_FLOAT(10.f),
                                                                          @"alignment":@"1"}]];
            self.tipsDetailLabel.numberOfLines = 3;
            
        }
        
    }else if ([self.paymentResultModel.paymentResult isEqualToString:@"FAIL"]) {
        
        self.topViewHeightCons.constant = ADJUST_PERCENT_FLOAT(260.f);
        self.logoImageViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(92.f);
        self.centerViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(0.f);
        self.centerViewHeightCons.constant = ADJUST_PERCENT_FLOAT(0.f);
        
        self.logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_BLANK,
                                                  @"blank_fail_bg",
                                                  ZJProjectLoadImageDefault);
        self.tipsLabel.text = ZJSTRING(@"对不起，支付失败了！");
        if (self.paymentEventType == ZJProjectPaymentEventIdentifyCost) {
            
            /**
             *  担保金/鉴定费
             */
            [self setupButtonWithTitle:@"查看我的鉴定" otherTitle:@"继续支付"];
        }else if (self.paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
            [self setupButtonWithTitle:@"查看我发布" otherTitle:@"继续支付"];
        }else{
            [self setupButtonWithTitle:@"查看订单详情" otherTitle:@"继续支付"];
        }
    }
}

#pragma mark - Sixth.界面配置

- (void)setupButtonWithTitle:(NSString *)title otherTitle:(NSString *)otherTitle
{
    NSArray *imageArray         = ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                          @"public_blank_btn",
                                          ZJProjectLoadImageDefault);
    
    if (otherTitle) {
        self.secondButton.hidden = NO;
        [self.secondButton setBackgroundImage:imageArray.firstObject
                                     forState:UIControlStateNormal];
        [self.secondButton setBackgroundImage:imageArray.lastObject
                                     forState:UIControlStateHighlighted];
        [self.secondButton setTitle:ZJSTRING(otherTitle)
                           forState:UIControlStateNormal];
        [self.secondButton setTitleColor:ZJCOLOR.color_c6
                                forState:UIControlStateNormal];
    }else{
        self.secondButton.hidden = YES;
    }
    
    if (title) {
        self.firstButton.hidden = NO;
        [self.firstButton setBackgroundImage:imageArray.firstObject
                                    forState:UIControlStateNormal];
        [self.firstButton setBackgroundImage:imageArray.lastObject
                                    forState:UIControlStateHighlighted];
        [self.firstButton setTitle:ZJSTRING(title)
                          forState:UIControlStateNormal];
        [self.firstButton setTitleColor:ZJCOLOR.color_c6
                               forState:UIControlStateNormal];
    }else{
        self.firstButton.hidden = YES;
    }
}

#pragma mark - Seventh.懒加载

#pragma mark - Eighth.Other

- (void)loadData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSString *paymentType;
        if (self.currentPaymentViewModel.paymentType == ZJProjectPaymentWeChat) {
            paymentType = @"2";
        }else if (self.currentPaymentViewModel.paymentType == ZJProjectPaymentAlipay) {
            paymentType = @"3";
        }else if (self.currentPaymentViewModel.paymentType == ZJProjectPaymentApplePay) {
            paymentType = @"4";
        }else if (self.currentPaymentViewModel.paymentType == ZJProjectPaymentCertified) {
            paymentType = @"5";
        }else{
            paymentType = @"1";
        }
        
        [[YBPaymentService share] queryPaymentResultWithPaymentId:self.paymentId
                                                             type:[NSString stringWithFormat:@"%zd", self.paymentEventType]
                                                      paymentType:paymentType
                                                          orderId:self.currentPaymentModel.orderId
                                                          success:^(id objc, id requestInfo) {
                                                              
                                                              self.paymentResultModel = [YBPaymentResultModel modelWithDictionary:objc[@"data"]];
                                                              
                                                          } fail:^(id error, id requestInfo) {
                                                              YBLog(@"%@\n%@", error, requestInfo);
                                                          }];
    });
}

@end
