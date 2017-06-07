//
//  YBPaymentViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentViewModel.h"
#import "YBPaymentService.h"
#import "YBStringTool.h"
#import "YBPaymentServiceSignModel.h"
#import "YBPaymentManager.h"
#import "YBPaymentAlertView.h"
#import "User_LocalData.h"
#import "YBCertifiedPaymentBindBankCardController.h"
#import "YBBankCardModel.h"
#import "YBTopAlert.h"
#import "YBPenToPayController.h"
#import "YBCertifiedPaymentBankCardListTableViewController.h"
#import "YBPaymentResultController.h"
#import "YBPaymentServiceSignModel.h"
#import "YBPaymentResultModel.h"

@interface YBPaymentViewModel()

/**
 当前选中的按钮
 */
@property (nonatomic, strong) YBDefaultButton *currentPaymentTypeButton;

/**
 当前预支付返回签名参数
 */
@property (nonatomic, strong) YBPaymentServiceSignModel *paymentServiceSignModel;

/**
 <#descrption#>
 */
@property (nonatomic, weak) UIViewController *sourceViewController;

@end

@implementation YBPaymentViewModel

#pragma mark - 通知

/**
 接收到回到前台通知
 
 @param no no 通知参数
 */
- (void)paymentCallBack:(NSNotification *)no
{
    if (!self.canLoadPaymentResult) {
        return;
    }
    [[YBPaymentService share] queryPaymentResultWithPaymentId:self.paymentServiceSignModel.paymentId
                                                         type:@"1"
                                                  paymentType:[NSString stringWithFormat:@"%zd", self.paymentType]
                                                      orderId:self.paymentModel.orderId
                                                      success:^(id objc, id requestInfo) {
                                                          
                                                          YBPaymentResultModel *paymentResultModel = [YBPaymentResultModel modelWithDictionary:objc[@"data"]];
                                                          
                                                          if (![paymentResultModel.paymentResult isEqualToString:@"NOTPAY"]) {
                                                              
                                                              [self paymentResultWithSender:@(ZJProjectPaymentResultSuccess) sourceController:self.sourceViewController signModel:self.paymentServiceSignModel];
                                                          }else{
                                                              
                                                          }
                                                          
    } fail:^(id error, id requestInfo) {
        
    }];
}

- (instancetype)init
{
    if (self == [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(paymentCallBack:)
                                                     name:@"paymentCallBackFromeWX"
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"paymentCallBackFromeWX" object:nil];
}

- (NSString *)paymentTypeName
{
    if (!_paymentTypeName) {
        
        if (self.paymentType == ZJProjectPaymentCertified) {
            _paymentTypeName = ZJSTRING(@"认证支付");
        }
        
        if (self.paymentType == ZJProjectPaymentWeChat) {
            _paymentTypeName = ZJSTRING(@"微信支付");
        }
        
        if (self.paymentType == ZJProjectPaymentAlipay) {
            _paymentTypeName = ZJSTRING(@"支付宝支付");
        }
        
        if (self.paymentType == ZJProjectPaymentApplePay) {
            _paymentTypeName = ZJSTRING(@"Apple Pay");
        }
    }
    return _paymentTypeName;
}

- (NSString *)paymentLogoImageNamed
{
    if (!_paymentLogoImageNamed) {
        
        if (self.paymentType == ZJProjectPaymentCertified) {
            _paymentLogoImageNamed = @"order_lianlian_icon";
        }
        
        if (self.paymentType == ZJProjectPaymentWeChat) {
            _paymentLogoImageNamed = @"order_wechatpay_icon";
        }
        
        if (self.paymentType == ZJProjectPaymentAlipay) {
            _paymentLogoImageNamed = @"order_alipay_icon";
        }
        
        if (self.paymentType == ZJProjectPaymentApplePay) {
            _paymentLogoImageNamed = @"order_applepay_icon";
        }
    }
    return _paymentLogoImageNamed;
}

- (NSArray<NSDictionary *> *)dataArray
{
    if (!_dataArray) {
        
        YBPaymentModel *section1row1Model = [[YBPaymentModel alloc] init];
        section1row1Model.title = ZJSTRING(@"订单号");
        section1row1Model.detailTitle = self.paymentModel.orderId;
        section1row1Model.textColor = ZJCOLOR.color_c4;
        section1row1Model.font = SYSTEM_REGULARFONT(14.f);
        section1row1Model.detailTextColor = ZJCOLOR.color_c4;
        section1row1Model.detailTextFont = SYSTEM_REGULARFONT(14.f);
        
        YBPaymentModel *section1row2Model = [[YBPaymentModel alloc] init];
        section1row2Model.title = ZJSTRING(@"商品名称");
        section1row2Model.detailTitle = self.paymentModel.prodName;
        section1row2Model.textColor = ZJCOLOR.color_c5;
        section1row2Model.font = SYSTEM_REGULARFONT(14.f);
        section1row2Model.detailTextColor = ZJCOLOR.color_c4;
        section1row2Model.detailTextFont = SYSTEM_REGULARFONT(14.f);
        
        YBPaymentModel *section1row3Model = [[YBPaymentModel alloc] init];
        section1row3Model.title = ZJSTRING(@"订单总金额");
        section1row3Model.detailTitle = [[YBStringTool share] strmethodCommaWith:self.paymentModel.totalAmount];
        section1row3Model.textColor = ZJCOLOR.color_c5;
        section1row3Model.font = SYSTEM_REGULARFONT(14.f);
        section1row3Model.detailTextColor = ZJCOLOR.color_c4;
        section1row3Model.detailTextFont = SYSTEM_REGULARFONT(14.f);
        
        YBPaymentModel *section1row4Model = [[YBPaymentModel alloc] init];
        section1row4Model.title = ZJSTRING(@"应付金额");
        section1row4Model.detailTitle = [[YBStringTool share] strmethodCommaWith:self.paymentModel.payAmount];
        section1row4Model.textColor = ZJCOLOR.color_c5;
        section1row4Model.font = SYSTEM_REGULARFONT(14.f);
        section1row4Model.detailTextColor = ZJCOLOR.color_c4;
        section1row4Model.detailTextFont = SYSTEM_REGULARFONT(14.f);
        
        YBPaymentModel *section2row1Model = [[YBPaymentModel alloc] init];
        section2row1Model.title = ZJSTRING(@"选择支付方式");
        section2row1Model.textColor = ZJCOLOR.color_c4;
        section2row1Model.font = SYSTEM_REGULARFONT(14.f);
        section2row1Model.detailTextColor = ZJCOLOR.color_c5;
        section2row1Model.detailTextFont = SYSTEM_REGULARFONT(12.f);
        
        YBPaymentModel *section2row2Model = [[YBPaymentModel alloc] init];
        section2row2Model.title = ZJSTRING(@"认证支付");
        section2row2Model.textColor = ZJCOLOR.color_c4;
        section2row2Model.font = SYSTEM_REGULARFONT(14.f);
        section2row2Model.detailTextColor = ZJCOLOR.color_c5;
        section2row2Model.detailTextFont = SYSTEM_REGULARFONT(12.f);
        section2row2Model.logoImageFilePath = IMAGEFILEPATH_ORDER;
        section2row2Model.logoImageNamed = @"order_lianlian_icon";
        
        YBPaymentModel *section2row3Model = [[YBPaymentModel alloc] init];
        section2row3Model.title = ZJSTRING(@"支付宝支付");
        section2row3Model.textColor = ZJCOLOR.color_c4;
        section2row3Model.font = SYSTEM_REGULARFONT(14.f);
        section2row3Model.detailTextColor = ZJCOLOR.color_c5;
        section2row3Model.detailTextFont = SYSTEM_REGULARFONT(12.f);
        section2row3Model.logoImageFilePath = IMAGEFILEPATH_ORDER;
        section2row3Model.logoImageNamed = @"order_alipay_icon";
        
        YBPaymentModel *section2row4Model = [[YBPaymentModel alloc] init];
        section2row4Model.title = ZJSTRING(@"Apple Pay");
        section2row4Model.textColor = ZJCOLOR.color_c4;
        section2row4Model.font = SYSTEM_REGULARFONT(14.f);
        section2row4Model.logoImageFilePath = IMAGEFILEPATH_ORDER;
        section2row4Model.logoImageNamed = @"order_applepay_icon";
        section2row4Model.isApplyPay = YES;
        
        YBPaymentModel *section2row5Model = [[YBPaymentModel alloc] init];
        section2row5Model.title = ZJSTRING(@"微信支付");
        section2row5Model.textColor = ZJCOLOR.color_c4;
        section2row5Model.font = SYSTEM_REGULARFONT(14.f);
        section2row5Model.detailTextColor = ZJCOLOR.color_c5;
        section2row5Model.detailTextFont = SYSTEM_REGULARFONT(12.f);
        section2row5Model.logoImageFilePath = IMAGEFILEPATH_ORDER;
        section2row5Model.logoImageNamed = @"order_wechatpay_icon";
        
        YBPaymentModel *section2row6Model = [[YBPaymentModel alloc] init];
        section2row6Model.title = ZJSTRING(@"网银支付");
        section2row6Model.textColor = ZJCOLOR.color_c4;
        section2row6Model.font = SYSTEM_REGULARFONT(14.f);
        section2row6Model.detailTextColor = ZJCOLOR.color_c5;
        section2row6Model.detailTextFont = SYSTEM_REGULARFONT(12.f);
        section2row6Model.logoImageFilePath = IMAGEFILEPATH_ORDER;
        section2row6Model.logoImageNamed = @"order_netpay_icon";
        
        _dataArray = @[@{@"data":@[section1row1Model,
                                   section1row2Model,
                                   section1row3Model,
                                   section1row4Model]},
                       @{@"data":@[section2row1Model,
                                   section2row2Model,
                                   section2row3Model,
                                   section2row4Model,
                                   section2row5Model,
                                   section2row6Model]}];
    }
    return _dataArray;
}

- (NSArray<NSDictionary *> *)penToPayDataArray
{
    if (!_penToPayDataArray) {
        
        YBPaymentModel *section1row1Model = [[YBPaymentModel alloc] init];
        section1row1Model.title = ZJSTRING(@"订单号");
        section1row1Model.detailTitle = self.paymentModel.orderId;
        section1row1Model.textColor = ZJCOLOR.color_c4;
        section1row1Model.font = SYSTEM_REGULARFONT(14.f);
        section1row1Model.detailTextColor = ZJCOLOR.color_c4;
        section1row1Model.detailTextFont = SYSTEM_REGULARFONT(14.f);
        
        YBPaymentModel *section1row2Model = [[YBPaymentModel alloc] init];
        section1row2Model.title = ZJSTRING(@"订单总金额");
        section1row2Model.textColor = ZJCOLOR.color_c5;
        section1row2Model.font = SYSTEM_REGULARFONT(14.f);
        section1row2Model.detailTextColor = ZJCOLOR.color_c4;
        section1row2Model.detailTextFont = SYSTEM_REGULARFONT(14.f);
        section1row2Model.totalAmount = self.paymentModel.totalAmount;
        
        YBPaymentModel *section2row1Model = [[YBPaymentModel alloc] init];
        section2row1Model.title = ZJSTRING(@"支付方式");
        section2row1Model.textColor = ZJCOLOR.color_c4;
        section2row1Model.font = SYSTEM_REGULARFONT(14.f);
        
        YBPaymentModel *section2row2Model = [[YBPaymentModel alloc] init];
        section2row2Model.title = [NSString stringWithFormat:@"%@",
                                   self.paymentTypeName];
        section2row2Model.textColor = ZJCOLOR.color_c4;
        section2row2Model.font = SYSTEM_REGULARFONT(14.f);
        
        YBPaymentModel *section2row3Model = [[YBPaymentModel alloc] init];
        section2row3Model.title = ZJSTRING(@"本次分笔金额");
        section2row3Model.detailTitle = ZJSTRING(@"¥");
        section2row3Model.textColor = ZJCOLOR.color_c5;
        section2row3Model.font = SYSTEM_REGULARFONT(12.f);
        section2row3Model.detailTextColor = ZJCOLOR.color_c4;
        section2row3Model.detailTextFont = SYSTEM_REGULARFONT(32.f);
        
        YBPaymentModel *section2row4Model = [[YBPaymentModel alloc] init];
        section2row4Model.title = [NSString stringWithFormat:@"剩余应付金额"];
        section2row4Model.detailTitle = ZJSTRING(@"全部支付");
        section2row4Model.textColor = ZJCOLOR.color_c5;
        section2row4Model.font = SYSTEM_REGULARFONT(12.f);
        section2row4Model.detailTextColor = ZJCOLOR.color_c4;
        section2row4Model.detailTextFont = SYSTEM_REGULARFONT(12.f);
        
        _penToPayDataArray = @[@{@"data":@[section1row1Model,
                                           section1row2Model]},
                               @{@"data":@[section2row1Model,
                                           section2row2Model,
                                           section2row3Model,
                                           section2row4Model]}];
    }
    return _penToPayDataArray;
}

/**
 选择支付方式
 
 @param button              button
 @param indexPath           indexPath
 @param callBackBlock       callBackBlock
 */
- (void)selectedPaymentTypeButton:(YBDefaultButton *)button
                        indexPath:(NSIndexPath *)indexPath
                    callBackBlock:(ZJEventCallBackBlock)callBackBlock
{
    if (self.currentPaymentTypeButton == button) {
        return;
    }
    button.selected = !button.selected;
    self.currentPaymentTypeButton.selected = !self.currentPaymentTypeButton.selected;
    
    self.paymentType = button.tag;
    
    self.currentPaymentTypeButton = button;
    callBackBlock(nil);
}

/**
 支付信息
 
 @param successCallBack 成功
 @param failureCallBack 失败
 */
- (void)payInfoSuccessCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
               failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    /**
     *  当前支持的事务类型，由于枚举值对应服务器字段，直接转为字符串即可
     *  目前只支持订单和鉴定费，后续需修改枚举值
     */
    
    NSString *payId;
    if (self.paymentEventType == ZJProjectPaymentEventOrder) {
        payId = self.orderId;
    }else if (self.paymentEventType == ZJProjectPaymentEventIdentifyCost
              || self.paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
        payId = self.goodsId;
    }
    
    [[YBPaymentService share] payInfoWithOrderId:payId
                                            type:[NSString stringWithFormat:@"%zd", self.paymentEventType]
                                         success:^(id objc, id requestInfo) {
                                             
                                             YBPaymentViewModel *tempViewModel = [self payInfoSuccessWithObjc:objc];
                                             tempViewModel.paymentEventType = self.paymentEventType;
                                             tempViewModel.paymentMehtod = self.paymentMehtod;
                                             tempViewModel.currentPaymentTypeButton = self.currentPaymentTypeButton;
                                             tempViewModel.paymentType = self.paymentType;
                                             successCallBack(tempViewModel);
                                             
                                         } fail:^(id error, id requestInfo) {
                                             
                                             YBLog(@"%@\n%@", error, requestInfo);
                                             
                                         }];
}

- (YBPaymentViewModel *)payInfoSuccessWithObjc:(id)objc
{
    YBPaymentModel *paymentModel            = [YBPaymentModel modelWithDictionary:objc[@"data"]];
    YBPaymentViewModel *paymentViewModel    = [[YBPaymentViewModel alloc] init];
    paymentViewModel.orderId                = paymentModel.orderId;
    paymentViewModel.goodsId                = self.goodsId;
    paymentViewModel.paymentType            = self.paymentType;
    paymentViewModel.paymentEventType       = self.paymentEventType;
    paymentViewModel.paymentMehtod          = self.paymentMehtod;
    paymentViewModel.paymentModel           = paymentModel;
    
    return paymentViewModel;
}

/**
 *  支付
 *
 *  @param amont 金额
 */
- (void)payAmont:(NSString *)amont sourceController:(UIViewController *)sourceController
{
    /**
     *  区分当前支付的方式
     *  预支付请求
     *  发起请求
     */
    self.payAmont = amont;
    [[YBPaymentService share] payPreWithOrderId:self.paymentModel.orderId
                                    paymentType:[NSString stringWithFormat:@"%zd", self.paymentType]
                                      transType:[NSString stringWithFormat:@"%zd", self.paymentEventType]
                                      isPartPay:[NSString stringWithFormat:@"%zd", self.isPartPay]
                                   isDepositPay:[NSString stringWithFormat:@"%zd", self.isDepositPay]
                                    channelType:@"1"
                                      payAmount:amont
                                        success:^(id objc, id requestInfo) {
                                            YBLog(@"%@\n%@", objc, requestInfo);
                                            YBPaymentServiceSignModel *signModel = [YBPaymentServiceSignModel modelWithDictionary:objc[@"data"]];
                                            self.paymentServiceSignModel = signModel;
                                            [self startPaymentWithServiceSignModel:signModel sourceController:sourceController];
                                        } fail:^(id error, id requestInfo) {
                                            YBLog(@"%@\n%@", error, requestInfo);
                                        }];
}

/**
 发起支付请求
 
 @param signModel signModel
 */
- (void)startPaymentWithServiceSignModel:(YBPaymentServiceSignModel *)signModel
                        sourceController:(UIViewController *)sourceController
{
    self.sourceViewController = sourceController;
    if (self.paymentType == ZJProjectPaymentWeChat) {
        
        /**
         *  当前方法会返回是否发起支付成功
         */
        [[YBPaymentManager sharedManager] weChatPayServiceSingModel:signModel
                                                           callBack:^(id sender) {
                                                               
                                                               [self paymentResultWithSender:sender sourceController:sourceController signModel:signModel];
                                                               
                                                           }];
    }
    
    if (self.paymentType == ZJProjectPaymentAlipay) {
        [[YBPaymentManager sharedManager] aliPayServiceSingString:signModel.content
                                                         callBack:^(id sender) {
                                                             
                                                            [self paymentResultWithSender:sender sourceController:sourceController signModel:signModel];
                                                             
                                                         }];
    }
    
    if (self.paymentType == ZJProjectPaymentApplePay) {
        [[YBPaymentManager sharedManager] applePayServiceSingString:signModel.content
                                                   sourceController:sourceController callBack:^(id sender) {
                                                       
                                                       [self paymentResultWithSender:sender sourceController:sourceController signModel:signModel];
                                                   }];
    }
    
    if (self.paymentType == ZJProjectPaymentUnionPay) {
    }
}

/**
 发起扫码支付

 @param sourceController sourceController
 */
- (void)startUnionPaySourceController:(UIViewController *)sourceController
{
    self.sourceViewController = sourceController;
    [[YBPaymentManager sharedManager] webPayPaymentModel:self.paymentModel
                                         souceController:sourceController
                                                callBack:^(id sender) {
        
    }];
}

/**
 支付结果

 @param sender sender
 */
- (void)paymentResultWithSender:(id)sender
               sourceController:(UIViewController *)sourceController
                      signModel:(YBPaymentServiceSignModel *)signModel
{
    //** =========================================================================================== */
    //** ===============================结果页改用后台接口，暂不处理冗余代码=============================== */
    //** =========================================================================================== */
    ZJProjectPaymentResultType type = (ZJProjectPaymentResultType)[sender integerValue];
    
    if (type == ZJProjectPaymentResultSuccess) {
        YBPaymentResultControllerType type = YBPaymentResultControllerDefault;
        
        if (self.paymentMehtod == ZJProjectPaymentMethodAll) {
            type = YBPaymentResultControllerAll;
        }
        
        if (self.paymentMehtod == ZJProjectPaymentMethodDeposit) {
            type = YBPaymentResultControllerDeposit;
        }
        
        if (self.paymentMehtod == ZJProjectPaymentMethodDepositBalance_All) {
            type = YBPaymentResultControllerDepositBalance_All;
        }
        
        if (self.paymentMehtod == ZJProjectPaymentMethodDepositBalance_part) {
            type = YBPaymentResultControllerDepositBalance_Part;
        }
        
        if (self.paymentMehtod == ZJProjectPaymentMethodPen) {
            type = YBPaymentResultControllerPen;
        }
        //** =========================================================================================== */
        //** ===============================结果页改用后台接口，暂不处理冗余代码=============================== */
        //** =========================================================================================== */
        
        YBPaymentResultController *paymentResultController = [YBPaymentResultController paymentResultControllerWithType:type
                                                                                                             orderModel:self.paymentModel
                                                                                                       paymentEventType:self.paymentEventType
                                                                                                                 extend:self];
        paymentResultController.paymentId = signModel.paymentId;
        [sourceController.navigationController pushViewController:paymentResultController animated:nil];
    }
}

/**
 *  认证支付
 */
- (void)certifiedPayAmont:(NSString *)amont sourceController:(UIViewController *)sourceController
{
    self.sourceViewController = sourceController;
    /**
     *  调用银行卡列表接口，如果返回银行卡，则打开alert
     *  如果返回银行卡为空，判断是否实名认证过
     */
    self.payAmont = amont;
    [[YBPaymentService share] certifiedPayBankListSuccess:^(id objc, id requestInfo) {
        
        [self handleRequestObj:objc sourceController:sourceController];
        
    } fail:^(id error, id requestInfo) {
        
        YBLog(@"%@\n%@", error, requestInfo);
        
    }];
}

/**
 处理返回数据
 
 @param obj obj
 */
- (void)handleRequestObj:(id)obj sourceController:(UIViewController *)sourceController
{
    NSArray *tempArray = obj[@"data"];
    
    if (tempArray
        && tempArray.count != 0) {
        
        NSMutableArray *tempBankCarModelArray = [NSMutableArray array];
        [tempArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
            [tempBankCarModelArray addObject:[YBBankCardModel modelWithDictionary:obj]];
        }];
        
        YBPaymentServiceSignModel *paymentSingModel = [[YBPaymentServiceSignModel alloc] init];
        paymentSingModel.money_order = self.payAmont;
        [[YBPaymentAlertView sharedAlert] showAlertWithOrderModel:self.paymentModel
                                                 paymentSingModel:paymentSingModel
                                                 paymentViewModel:self
                                               bankCardModelArray:tempBankCarModelArray.copy
                                               eventCallBackBlock:^(id sender) {
                                                   
                                                   if (sender) {
                                                       UIView *view = (UIView *)sender;
                                                       
                                                       if ([sender isKindOfClass:[UIView class]]) {
                                                           
                                                           if (view.tag == 1001) {
                                                               
                                                               /**
                                                                *  关闭
                                                                */
                                                               [self paymentResultWithSender:@(ZJProjectPaymentResultCancel) sourceController:sourceController signModel:paymentSingModel];
                                                               
                                                           }else if (view.tag == 1002) {
                                                               
                                                               /**
                                                                *  跳转银行卡信息界面
                                                                */
                                                               [[YBPaymentAlertView sharedAlert] hiddenAlert];
                                                               YBCertifiedPaymentBankCardListTableViewController *certifiedPaymentBankCardListTableViewController = [[YBCertifiedPaymentBankCardListTableViewController alloc] init];
                                                               [sourceController.navigationController pushViewController:certifiedPaymentBankCardListTableViewController animated:YES];
                                                               
                                                           }else if (view.tag == 1003) {
                                                               
                                                               /**
                                                                *  跳转使用其他银行卡支付绑定
                                                                */
                                                               [[YBPaymentAlertView sharedAlert] hiddenAlert];
                                                               YBCertifiedPaymentBindBankCardController *bindBankCardController = [YBCertifiedPaymentBindBankCardController certifiedPaymentBindBankCardControllerType:YBCertifiedPaymentBindBankCardControllerBankCard extend:self];
                                                               [sourceController.navigationController pushViewController:bindBankCardController animated:YES];
                                                               
                                                           }
                                                           
                                                       }else if ([sender isKindOfClass:[YBPaymentServiceSignModel class]]) {
                                                           
                                                           YBPaymentServiceSignModel *currentPaymentSingModel = (YBPaymentServiceSignModel *)sender;
                                                           
                                                           /**
                                                            *  成功
                                                            */
                                                           [self paymentResultWithSender:@(ZJProjectPaymentResultSuccess) sourceController:sourceController signModel:currentPaymentSingModel];
                                                       
                                                       }
                                                       
                                                   }else{
                                                   }
                                                   
                                               }];
        
    }else{
        
        /**
         *  判断是否是实名认证
         */
        User_LocalData *localData = [User_LocalData new];
        if (localData.idcardStatus.length == 0
            || [localData.idcardStatus isEqualToString:@"0"]
            || [localData.idcardStatus isEqualToString:@"3"]
            || !localData.idcardStatus) {
            
            YBCertifiedPaymentBindBankCardController *bindBankCardController = [YBCertifiedPaymentBindBankCardController certifiedPaymentBindBankCardControllerType:YBCertifiedPaymentBindBankCardControllerBankCardNumber extend:self];
            [sourceController.navigationController pushViewController:bindBankCardController animated:YES];
            
        }else{
            
            YBCertifiedPaymentBindBankCardController *bindBankCardController = [YBCertifiedPaymentBindBankCardController certifiedPaymentBindBankCardControllerType:YBCertifiedPaymentBindBankCardControllerBankCard extend:self];
            [sourceController.navigationController pushViewController:bindBankCardController animated:YES];
        }
    }
}

/**
 *  分笔支付
 */
- (void)penPayAmont:(NSString *)amont sourceController:(UIViewController *)sourceController
{
    YBPenToPayController *penToPayController = [[YBPenToPayController alloc] init];
    penToPayController.paymentViewModel = self;
    [sourceController.navigationController pushViewController:penToPayController animated:YES];
}

- (BOOL)isPartPay
{
    if (self.paymentEventType == ZJProjectPaymentEventIdentifyCost
        || self.paymentEventType == ZJProjectPaymentEventIdentifyDeposit) {
        
        /**
         *  鉴定费，不存在分笔
         */
        return NO;
    }else{
        
        if (self.paymentEventType == ZJProjectPaymentEventOrder) {
            
            /**
             *  订单支付
             */
            if (self.paymentMehtod == ZJProjectPaymentMethodPen) {
                return YES;
            }
            
            if (self.paymentMehtod == ZJProjectPaymentMethodAll) {
                return NO;
            }
            
            if (self.paymentMehtod == ZJProjectPaymentMethodDeposit) {
                if (self.isDepositPay) {
                    return NO;
                }else{
                    
                    /**
                     *  定金余款
                     */
                    if (self.paymentMehtod == ZJProjectPaymentMethodDepositBalance_All) {
                        return NO;
                    }else{
                        return YES;
                    }
                }
            }
            
            if (self.paymentMehtod == ZJProjectPaymentMethodDepositBalance_All) {
                return NO;
            }else{
                return YES;
            }
        }
        
        /**
         *  其他支付方式时判断是否分笔
         */
    }
    
    return NO;
}

- (BOOL)isDepositPay
{
    if (self.paymentMehtod == ZJProjectPaymentMethodDeposit) {
        if ([self.paymentModel.isPayedDeposit isEqualToString: @"0"]) {
            return YES;
        }else{
            return NO;
        }
    }
    return NO;
}

@end
