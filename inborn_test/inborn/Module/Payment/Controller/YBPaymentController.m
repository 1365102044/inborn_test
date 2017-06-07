//
//  YBPaymentController.m
//  inborn
//
//  Created by 郑键 on 17/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentController.h"
#import "YBPaymentViewModel.h"
#import "YBAttributedStringLabel.h"
#import "ZJBaseBarButtonItem.h"
#import "YBGoodsDeatilNaviMoreView.h"
#import "MQCustomerServiceManager.h"
#import "JXTAlertManagerHeader.h"
#import "ZJBaseNavigationController.h"
#import "YBOrderDetailTableViewController.h"
#import "YBMeMainViewController.h"
#import "LLPaySdk.h"
#import "YBMyComposedListViewController.h"

@interface YBPaymentController ()

/**
 viewModel
 */
@property (nonatomic, strong) YBPaymentViewModel *paymentViewModel;

/**
 支付按钮
 */
@property (nonatomic, strong) YBDefaultButton *paymentButton;

/**
 当前的indexPath
 */
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@property (strong, nonatomic) IBOutletCollection(YBDefaultLabel) NSArray *firstSectionTitleLabelArray;
@property (strong, nonatomic) IBOutletCollection(ZJBaseLabel) NSArray *firstSectionDetailLabelArray;

@property (strong, nonatomic) IBOutletCollection(ZJBaseLabel) NSArray *secondSectionTitleLabelArray;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *secondSectionDetailLabel;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *applyPayIconImageView;
@property (strong, nonatomic) IBOutletCollection(YBDefaultButton) NSArray *selectedButtonArray;
@property (strong, nonatomic) IBOutletCollection(ZJBaseImageView) NSArray *logoImageViewArray;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *bottomLineArray;

/**
 支付方式缓存标志
 */
@property (nonatomic, assign) BOOL paymentTypeFlag;

@end

@implementation YBPaymentController

#pragma mark - Second.赋值

- (void)setPaymentViewModel:(YBPaymentViewModel *)paymentViewModel
{
    _paymentViewModel = paymentViewModel;
    
    [self setupFirstSection];
    [self setupSecondSection];
    [self.tableView reloadData];
    
    if (!self.paymentTypeFlag) {
        [self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:1]];
        self.paymentTypeFlag = YES;
    }
    
    [self hiddenMaskView];
}

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    NSString *cancelOrderTimeString;
    if (self.paymentViewModel.paymentModel.isPayedDeposit
        && [self.paymentViewModel.paymentModel.isPayedDeposit isEqualToString:@"1"]) {
        cancelOrderTimeString = @"48小时";
    }else{
        if (self.paymentViewModel.paymentModel.alreadyPayAmount.longLongValue > 0) {
            cancelOrderTimeString = @"48小时";
        }else{
            if (self.paymentViewModel.paymentEventType == ZJProjectPaymentEventIdentifyCost
                || self.paymentViewModel.paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
                cancelOrderTimeString = @"48小时";
            }else{
                cancelOrderTimeString = @"30分钟";
            }
        }
    }
    
    NSString *tipsText = [NSString stringWithFormat:@"您确定要放弃支付吗？下单后%@内未完成支付，订单将被取消，请您尽快支付。可在",
                          cancelOrderTimeString];
    
    if (self.paymentViewModel.paymentEventType == ZJProjectPaymentEventIdentifyCost
        || self.paymentViewModel.paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
        tipsText = [NSString stringWithFormat:@"%@可在我的-我的发布-立即支付再次支付。", tipsText];
    }else{
        tipsText = [NSString stringWithFormat:@"%@我的-我购买的-待付款中再次支付。", tipsText];
    }
    
    [self jxt_showAlertWithTitle:ZJSTRING(@"提示")
                         message:tipsText
               appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
        
                   alertMaker.
                   addActionDefaultTitle(ZJSTRING(@"放弃")).
                   addActionCancelTitle(ZJSTRING(@"继续支付"));
                   
                   alertMaker.view.tintColor = ZJCOLOR.color_c6;
                   
    } actionsBlock:^(NSInteger buttonIndex,
                     UIAlertAction * _Nonnull action,
                     JXTAlertController * _Nonnull alertSelf) {
        
        if (buttonIndex == 1) {
            
        }
        
        if (buttonIndex == 0) {
            NSArray *viewControllerArray = self.navigationController.childViewControllers;
            __block BOOL haveOrderDetail = NO;
            [viewControllerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                              NSUInteger idx,
                                                              BOOL * _Nonnull stop) {
                
                if ([obj isKindOfClass:[YBOrderDetailTableViewController class]]
                    || [obj isKindOfClass:[YBMyComposedListViewController class]]) {
                    [self.navigationController popToViewController:viewControllerArray[idx] animated:YES];
                    *stop = YES;
                    haveOrderDetail = YES;
                }
            }];
            
            if (!haveOrderDetail) {
                
                /**
                 *  跳转订单详情
                 */
                YBOrderDetailTableViewController *orderDetailTableViewController = [YBOrderDetailTableViewController orderDetailTableViewControllerWithOrderId:self.paymentViewModel.orderId extend:self];
                [self.navigationController pushViewController:orderDetailTableViewController animated:YES];
            }
        }
    }];
}

- (void)paymentButtonClick:(UIButton *)sender
{
    /**
     *  去支付点击事件，判断当前支付方式是否需要跳转分笔支付页面
     */
    if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodAll
        || self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDefault) {
        
        /**
         *  发起支付请求
         *  当为认证支付时，调用认证支付的预支付接口
         */
        if (self.currentIndexPath.section == 1
            && self.currentIndexPath.row == 1) {
            
            [self.paymentViewModel certifiedPayAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            
        }else if (self.currentIndexPath.section == 1
                  && self.currentIndexPath.row == 5) {
            
            /**
             *  网银支付
             */
            [self.paymentViewModel startUnionPaySourceController:self];
            
        }else{
            
            [self.paymentViewModel payAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            
        }
        
    }else if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDeposit) {
        
        /**
         *  支付定金
         *  判断当前是支付定金还是定金余款
         */
        
        /**
         *  发起支付请求
         *  当为认证支付时，调用认证支付的预支付接口
         */
        if (self.currentIndexPath.section == 1
            && self.currentIndexPath.row == 1) {
            
            [self.paymentViewModel certifiedPayAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            
        }else{
            
            [self.paymentViewModel payAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            
        }
        
    }else if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodPen) {
        
        if (self.paymentViewModel.paymentModel.payAmount.integerValue <= 200000) {
            
            if (self.currentIndexPath.section == 1
                && self.currentIndexPath.row == 1) {
                
                [self.paymentViewModel certifiedPayAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
                
            }else{
                
                [self.paymentViewModel payAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            }
            
        }else{
            [self.paymentViewModel penPayAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
        }
        
    }else if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDepositBalance_All) {
        
        /**
         *  支付定金
         *  定金余款全额
         */
        
        /**
         *  发起支付请求
         *  当为认证支付时，调用认证支付的预支付接口
         */
        if (self.currentIndexPath.section == 1
            && self.currentIndexPath.row == 1) {
            
            [self.paymentViewModel certifiedPayAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            
        }else if (self.currentIndexPath.section == 1
                  && self.currentIndexPath.row == 5) {
            
            /**
             *  网银支付
             */
            [self.paymentViewModel startUnionPaySourceController:self];
            
        }else{
            
            [self.paymentViewModel payAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            
        }
        
        
    }else if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDepositBalance_part) {
        
        if (self.paymentViewModel.paymentModel.payAmount.integerValue <= 200000) {
            
            if (self.currentIndexPath.section == 1
                && self.currentIndexPath.row == 1) {
                [self.paymentViewModel certifiedPayAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            }else{
                [self.paymentViewModel payAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
            }
            
        }else{
            [self.paymentViewModel penPayAmont:self.paymentViewModel.paymentModel.payAmount sourceController:self];
        }
    }
}

#pragma mark - Fourth.代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  判断各种支付方式的隐藏
     */
    if (indexPath.section == 0) {
        return ADJUST_PERCENT_FLOAT(46.f);
    }else if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            return ADJUST_PERCENT_FLOAT(46.f);
        }else if (indexPath.row == 1) {
            return ADJUST_PERCENT_FLOAT(64.f);
        }else if (indexPath.row == 2) {
            return ADJUST_PERCENT_FLOAT(64.f);
        }else if (indexPath.row == 3) {
            
            /**
             *  判断是否可以进行applePay
             *  canDeviceSupportApplePayPayments
             */
            if ([LLAPPaySDK canDeviceSupportApplePayPayments] == kLLAPPayDeviceSupport) {
                return ADJUST_PERCENT_FLOAT(64.f);
            }else if ([LLAPPaySDK canDeviceSupportApplePayPayments] == kLLAPPayDeviceNotSupport) {
                return ADJUST_PERCENT_FLOAT(0.f);
            }else if ([LLAPPaySDK canDeviceSupportApplePayPayments] == kLLAPPayDeviceVersionTooLow) {
                return ADJUST_PERCENT_FLOAT(64.f);
            }else if ([LLAPPaySDK canDeviceSupportApplePayPayments] == kLLAPPayDeviceNotBindChinaUnionPayCard) {
                return ADJUST_PERCENT_FLOAT(64.f);
            }else{
                return ADJUST_PERCENT_FLOAT(0.f);
            }
            
        }else if (indexPath.row == 4) {
            if (self.paymentViewModel.paymentEventType == ZJProjectPaymentEventIdentifyCost) {
                return ADJUST_PERCENT_FLOAT(64.f);
            }else{
                if (self.paymentViewModel.paymentModel.payAmount.integerValue / 100 < 5000
                    && self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDeposit
                    && self.paymentViewModel.isDepositPay) {
                    return ADJUST_PERCENT_FLOAT(64.f);
                }else{
                    return ADJUST_PERCENT_FLOAT(0.f);
                }
            }
        }else if (indexPath.row == 5) {
            if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDepositBalance_All) {
                if ([self.paymentViewModel.paymentModel.isPayedDeposit isEqualToString:@"1"] ? (self.paymentViewModel.paymentModel.alreadyPayAmount.floatValue - self.paymentViewModel.paymentModel.depositPrice.floatValue == 0) : (self.paymentViewModel.paymentModel.alreadyPayAmount.floatValue == 0)) {
                    return ADJUST_PERCENT_FLOAT(64.f);
                }else{
                    return ADJUST_PERCENT_FLOAT(0.f);
                }
            }else{
                if (self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodAll
                    || self.paymentViewModel.paymentMehtod == ZJProjectPaymentMethodDefault) {
                    if (self.paymentViewModel.paymentEventType == ZJProjectPaymentEventIdentifyCost
                        || self.paymentViewModel.paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
                        return ADJUST_PERCENT_FLOAT(0);
                    }else{
                        return ADJUST_PERCENT_FLOAT(64.f);
                    }
                }else{
                    return ADJUST_PERCENT_FLOAT(0.f);
                }
            }
        }
        
    }else{
        return 0;
    }
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1
        && indexPath.row != 0) {
        
        YBDefaultButton *button = self.selectedButtonArray[indexPath.row - 1];
        YBLog(@"%@--%@", button, indexPath);
        
        [self.paymentViewModel selectedPaymentTypeButton:button
                                               indexPath:indexPath
                                           callBackBlock:^(id sender) {
                                               
                                               /**
                                                *  判断是否跳转分笔支付页面
                                                */
                                               
                                           }];
        self.currentIndexPath = indexPath;
    }
}

#pragma mark - Fifth.控制器生命周期

/**
 初始化手段类型选择控制器
 
 @param orderId                 订单id
 @param paymentMethod           支付方式
 @param extend                  扩展参数（nil）
 @return                        支付手段控制器
 */
+ (instancetype)paymentControllerWithOrderId:(NSString *)orderId
                               paymentMethod:(ZJProjectPaymentMethod)paymentMethod
                            paymentEventType:(ZJProjectPaymentEventType)paymentEventType
                                      extend:(id)extend
{
    YBPaymentController *paymentController      = [[YBPaymentController alloc] init];
    YBPaymentViewModel *paymentViewModel        = [[YBPaymentViewModel alloc] init];
    
    paymentViewModel.orderId                    = orderId;
    paymentViewModel.paymentEventType           = paymentEventType;
    paymentViewModel.paymentMehtod              = paymentMethod;
    
    if (paymentEventType == ZJProjectPaymentEventOrder) {
        paymentViewModel.orderId = orderId;
    }else if (paymentEventType == ZJProjectPaymentEventIdentifyCost
              || paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
        paymentViewModel.goodsId = orderId;
    }
    
    [paymentViewModel payInfoSuccessCallBack:^(id model) {
        paymentController.paymentViewModel = (YBPaymentViewModel *)model;
    } failureCallBack:^(id error) {
        
    }];
    
    return paymentController;
}

- (instancetype)init
{
    if (self == [super init]) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:NSStringFromClass([YBPaymentController class])
                                                     bundle:nil];
        self = [sb instantiateInitialViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
    
    /**
     *  配置底边线
     */
    [self.bottomLineArray enumerateObjectsUsingBlock:^(ZJBaseView *  _Nonnull obj,
                                                       NSUInteger idx,
                                                       BOOL * _Nonnull stop) {
        obj.backgroundColor = ZJCOLOR.color_c16;
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.paymentButton.hidden = NO;
    [self showMaskView];
    
    /**
     *  网络请求
     */
    [self.paymentViewModel payInfoSuccessCallBack:^(id model) {
        self.paymentViewModel = (YBPaymentViewModel *)model;
        self.paymentViewModel.canLoadPaymentResult = YES;
    } failureCallBack:^(id error) {
        
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    YBDefaultButton *button = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                 imageNamed:@"public_back"
                                                                       type:ZJProjectButtonSetImageDefault
                                                                     target:self
                                                                   selector:@selector(buttonClick:)];
    ZJBaseBarButtonItem *backButtonItem = [[ZJBaseBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem     = backButtonItem;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.paymentButton.hidden = YES;
    self.paymentViewModel.canLoadPaymentResult = NO;
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    self.tableView.backgroundColor = ZJCOLOR.color_c12;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(-20.f, 0, 44.f, 0);
    self.navigationItem.title = ZJSTRING(@"胤宝收银台");
    
    ZJBaseBarButtonItem *rightButtonItem                = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_more"
                                                                                                     callBack:^(id sender) {
                                                                                                         
                                                                                                         [self clickRightItem];
                                                                                                     }];
    self.navigationItem.rightBarButtonItem              = rightButtonItem;
}

/**
 点击 更多rightitem
 */
- (void)clickRightItem
{
    [[YBGoodsDeatilNaviMoreView share] addMoreViewWithOrigin:CGPointMake(ADJUST_PERCENT_FLOAT(SCREEN_WIDTH-30),
                                                                         ADJUST_PERCENT_FLOAT(65))
                                                       Width:ADJUST_PERCENT_FLOAT(115)
                                                      Height:ADJUST_PERCENT_FLOAT(40)
                                                   Direction:WBArrowDirectionUp3
                                                      sourVC:self
                                                     dataArr:@[@"联系客服",]
                                                    ImageArr:@[@"details_message_kefu_icon"]
                                                  cellHeight:40
                                              clickCellBlcok:^(NSInteger row) {
                                                  
                                                  [[MQCustomerServiceManager  share] showCustomerServiceWithViewController:self];
                                                  [[MQCustomerServiceManager share] sendUrlMessage:[NSString stringWithFormat:@"商品名称：%@\n订单编号：%@",
                                                                                                    self.paymentViewModel.paymentModel.prodName,
                                                                                                    self.paymentViewModel.paymentModel.orderId]];
                                                  
                                              }];
    [[YBGoodsDeatilNaviMoreView share] popView];
    
}
- (void)setupFirstSection
{
    /**
     *  配置1组数据
     */
    NSArray *section1TempArray = self.paymentViewModel.dataArray.firstObject[@"data"];
    [self.firstSectionTitleLabelArray enumerateObjectsUsingBlock:^(ZJBaseLabel *  _Nonnull obj,
                                                                   NSUInteger idx,
                                                                   BOOL * _Nonnull stop) {
        YBPaymentModel *model = section1TempArray[idx];
        YBDefaultLabel *detailLabel = self.firstSectionDetailLabelArray[idx];
        
        obj.textColor = model.textColor;
        obj.font = model.font;
        obj.text = model.title;
        
        detailLabel.textColor = model.detailTextColor;
        detailLabel.font = model.detailTextFont;
        if (idx >= 2) {
            YBAttributedStringLabel *attrLabel = (YBAttributedStringLabel *)detailLabel;
            [attrLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                               @"content" : @"¥",
                                                               @"size" : SYSTEM_REGULARFONT(12.f),
                                                               @"lineSpacing": @0},
                                                             @{@"color" : model.detailTextColor,
                                                               @"content" : model.detailTitle ? model.detailTitle : @"",
                                                               @"size" : model.detailTextFont,
                                                               @"lineSpacing": @0}]];
        }else{
            detailLabel.text = model.detailTitle;
        }
    }];
}

- (void)setupSecondSection
{
    /**
     *  配置2组数据
     */
    NSArray *section2TempArray = self.paymentViewModel.dataArray.lastObject[@"data"];
    [self.secondSectionTitleLabelArray enumerateObjectsUsingBlock:^(ZJBaseLabel *  _Nonnull obj,
                                                                    NSUInteger idx,
                                                                    BOOL * _Nonnull stop) {
        YBPaymentModel *model = section2TempArray[idx];
        
        obj.textColor = model.textColor;
        obj.font = model.font;
        
        if (idx == 0) {
            obj.text = model.title;
            self.secondSectionDetailLabel.text = model.detailTitle;
            self.secondSectionDetailLabel.textColor = model.detailTextColor;
            self.secondSectionDetailLabel.font = model.detailTextFont;
            return;
        }
        
        ZJBaseImageView *logoImageView = self.logoImageViewArray[idx - 1];
        logoImageView.image = ZJCURRENTIMAGE(model.logoImageFilePath,
                                             model.logoImageNamed,
                                             ZJProjectLoadImageDefault);
        YBDefaultButton *selectedButton = self.selectedButtonArray[idx - 1];
        selectedButton.userInteractionEnabled = NO;
        [selectedButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_ORDER,
                                                @"order_select_n",
                                                ZJProjectLoadImageDefault)
                        forState:UIControlStateNormal];
        [selectedButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_ORDER,
                                                @"order_select_h",
                                                ZJProjectLoadImageDefault)
                        forState:UIControlStateSelected];
        
        obj.text = model.title;
        if (model.isApplyPay) {
            self.applyPayIconImageView.hidden = NO;
            self.applyPayIconImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_ORDER,
                                                              @"order_yinlian_icon",
                                                              ZJProjectLoadImageDefault);
            return;
        }
        
    }];
}

#pragma mark - Seventh.懒加载

- (YBDefaultButton *)paymentButton
{
    if (!_paymentButton) {
        
        /**
         *  配置底部按钮
         */
        _paymentButton = [YBDefaultButton buttonFourthWithTitleStringKey:@"去支付"
                                                              titleColor:ZJCOLOR.color_c0
                                                               titleFont:SYSTEM_REGULARFONT(18.f)
                                                                  target:self
                                                                selector:@selector(paymentButtonClick:)];
        [SYSTEM_KEYWINDOW addSubview:_paymentButton];
        [_paymentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(SYSTEM_KEYWINDOW);
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
        }];
        
    }
    return _paymentButton;
}

@end
