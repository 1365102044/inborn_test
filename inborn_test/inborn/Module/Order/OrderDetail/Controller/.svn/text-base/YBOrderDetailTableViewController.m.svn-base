//
//  YBOrderDetailTableViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailTableViewController.h"
#import "YBOrderDetailViewModel.h"
#import "YBOrderDetailStepHeaderView.h"
#import "YBOrderDetailDefaultCell.h"
#import "YBOrderDetailStatusCell.h"
#import "YBOrderDetailLogisticsCell.h"
#import "YBOrderDetailUserInformationCell.h"
#import "YBOrderDetailCell.h"
#import "YBOrderDetailAmontDetailCell.h"
#import "YBOrderDetailPickAddressCell.h"
#import "ZJBaseTableView.h"
#import "ZJBaseBarButtonItem.h"
#import "JXTAlertManagerHeader.h"
#import "YBTopAlert.h"
#import "YBPaymentController.h"
#import "ZJTimerManager.h"
#import "YBApplyRefundViewController.h"
#import "YBPaymentRecordViewController.h"
#import "MQCustomerServiceManager.h"
#import "YBLogisticsViewController.h"
#import "YBStringTool.h"
#import "YBPublicConfigure_LocalData.h"
#import "YBGoodsDeatilImageViewController.h"
#import "YBGoodsDeatilViewController.h"
#import "YBPaymentResultController.h"
#import "YBOrderListViewController.h"
#import "ZJBaseNavigationController.h"
#import "YBMeMainViewController.h"
#import "YBGoodsDeatilImageViewController.h"
#import "YBGoodsDeatilViewController.h"
#import "YBRefundDeatilViewController.h"
#import "YBPickupCodeViewController.h"
#import "YBOrderDetailModel.h"
#import "YBMessageOrderNewsListViewController.h"

@interface YBOrderDetailTableViewController ()<UITableViewDataSource, UITableViewDelegate>

/**
 视图模型
 */
@property (nonatomic, strong) YBOrderDetailViewModel *orderDetailViewModel;

/**
 content
 */
@property (nonatomic, strong) ZJBaseTableView *contentTableView;

/**
 底部功能视图
 */
@property (nonatomic, strong) ZJBaseView *bottomFuncView;

/**
 取消订单按钮
 */
@property (nonatomic, weak) YBDefaultButton *cancelButton;

/**
 来源控制器
 */
@property (nonatomic, weak) UIViewController *sourceController;

@end

@implementation YBOrderDetailTableViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setOrderDetailViewModel:(YBOrderDetailViewModel *)orderDetailViewModel
{
    _orderDetailViewModel = orderDetailViewModel;
    
    /**
     *  刷新界面
     */
    [self.contentTableView reloadData];
    
    /**
     *  如果是未支付的，则显示
     */
    if (orderDetailViewModel.orderDetailModel.detailsShowStatus == 10) {
        self.cancelButton.hidden = NO;
    }else{
        self.cancelButton.hidden = YES;
    }
    
    /**
     *  配置底部视图
     */
    [self.orderDetailViewModel setupBottomFuncView:self.bottomFuncView];
    [self hiddenMaskView];
}

#pragma mark - Third.点击事件

- (void)cancelButtonClick:(UIButton *)sender
{/**
  *  弹窗
  */
    [self jxt_showActionSheetWithTitle:nil
                               message:nil
                     appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                         
                         alertMaker.addActionCancelTitle(ZJSTRING(@"取消"));
                         alertMaker.addActionDefaultTitle(ZJSTRING(@"我不想要了"));
                         alertMaker.addActionDefaultTitle(ZJSTRING(@"支付遇到问题，无法支付"));
                         alertMaker.addActionDefaultTitle(ZJSTRING(@"其他原因"));
                         
                         [alertMaker setAlertDidShown:^{
                             
                         }];
                         alertMaker.alertDidDismiss = ^{
                             
                         };
                         
                         alertMaker.view.tintColor = ZJCOLOR.color_c4;
                         
                     } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                         
                         if (buttonIndex == 0) {
                             
                             /**
                              *  取消
                              */
                             
                         } else if (buttonIndex == 1) {
                             
                             /**
                              *  我不想要了
                              */
                             [self.orderDetailViewModel cancelOrderWithReason:@"我不想要了" successCallBackBlock:^(id model) {
                                 
                                 /**
                                  *  退回订单成功
                                  */
                                 [self loadData];
                                 [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"恭喜你") tipsStringKey:ZJSTRING(@"订单取消成功") type:YBTopAlertSuccess eventCallBackBlock:^(id sender) {
                                     
                                 }];
                                 
                             } failureCallBack:^(id error) {
                                 
                                 /**
                                  *  退回订单失败
                                  */
                             }];
                             
                         } else if (buttonIndex == 2) {
                             
                             /**
                              *  支付遇到问题，无法支付
                              */
                             [self.orderDetailViewModel cancelOrderWithReason:@"支付遇到问题，无法支付" successCallBackBlock:^(id model) {
                                 
                                 /**
                                  *  退回订单成功
                                  */
                                 [self loadData];
                                 [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"恭喜你") tipsStringKey:ZJSTRING(@"订单取消成功") type:YBTopAlertSuccess eventCallBackBlock:^(id sender) {
                                     
                                 }];
                                 
                             } failureCallBack:^(id error) {
                                 
                                 /**
                                  *  退回订单失败
                                  */
                             }];
                             
                         }else if (buttonIndex == 3) {
                             
                             /**
                              *  其他原因
                              */
                             [self.orderDetailViewModel cancelOrderWithReason:@"其他原因" successCallBackBlock:^(id model) {
                                 
                                 /**
                                  *  退回订单成功
                                  */
                                 [self loadData];
                                 [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"恭喜你") tipsStringKey:ZJSTRING(@"订单取消成功") type:YBTopAlertSuccess eventCallBackBlock:^(id sender) {
                                     
                                 }];
                                 
                             } failureCallBack:^(id error) {
                                 
                                 /**
                                  *  退回订单失败
                                  */
                             }];
                             
                         }
                         
                     }];
    
}

- (void)buttonClick:(UIButton *)sender
{
    /**
     消息订单列表
     */
    if ([self.sourceController isKindOfClass:[YBMessageOrderNewsListViewController class]]) {
        [self.navigationController popViewControllerAnimated:YES];
        return;
    }
        NSArray *viewControllerArray = self.navigationController.childViewControllers;
        __block BOOL haveOrderList = NO;
        [viewControllerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
            
            if ([obj isKindOfClass:[YBOrderListViewController class]]) {
                [self.navigationController popToViewController:viewControllerArray[idx] animated:YES];
                *stop = YES;
                haveOrderList = YES;
            }
            
        }];
    
        if (!haveOrderList) {
            
            /**
             *  跳转列表
             */
            UITabBarController *tabBarController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            ZJBaseNavigationController *baseNavigationController = tabBarController.childViewControllers.lastObject;
            YBMeMainViewController *mineController = (YBMeMainViewController *)baseNavigationController.childViewControllers.firstObject;
            tabBarController.selectedIndex = tabBarController.childViewControllers.count - 1;
            [mineController directPushToOrderListViewControllerextend:nil];
            [baseNavigationController dismissViewControllerAnimated:YES completion:nil];
        }
}

- (void)tempViewButtonClick:(UIButton *)sender
{
    [super tempViewButtonClick:sender];
    
    [self loadData];
}

- (void)imageButtonClick:(UIButton *)sender
{
    /**
     *  根据title区分不同按钮点击事件
     */
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"去支付")]) {
        
        YBPaymentController *paymentController = [YBPaymentController paymentControllerWithOrderId:self.orderDetailViewModel.orderDetailModel.orderId
                                                                                     paymentMethod:[self.orderDetailViewModel currentPaymentMethodOrderModel:self.orderDetailViewModel.orderDetailModel]
                                                                                  paymentEventType:ZJProjectPaymentEventOrder
                                                                                            extend:nil];
        [self.navigationController pushViewController:paymentController animated:YES];
        
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"继续支付")]) {
        
        if ([self.sourceController isKindOfClass:[YBPaymentResultController class]]) {
            
            NSArray *viewControllerArray = self.navigationController.childViewControllers;
            [viewControllerArray enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                              NSUInteger idx,
                                                              BOOL * _Nonnull stop) {
                
                if ([obj isKindOfClass:[YBPaymentController class]]) {
                    [self.navigationController popToViewController:viewControllerArray[idx] animated:YES];
                    *stop = YES;
                }
                
            }];
            
            return;
        }
        
        if ([self.orderDetailViewModel currentPaymentMethodOrderModel:self.orderDetailViewModel.orderDetailModel] == ZJProjectPaymentMethodDeposit) {
            
            [self jxt_showActionSheetWithTitle:ZJSTRING(@"分笔余款支付方式选择")
                                       message:nil
                             appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                                 
                                 alertMaker.
                                 addActionDefaultTitle(ZJSTRING(@"全额支付")).
                                 addActionDefaultTitle(ZJSTRING(@"分笔支付")).
                                 addActionCancelTitle(ZJSTRING(@"取消"));
                                 alertMaker.view.tintColor = ZJCOLOR.color_c4;
                                 
                             } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                                 
                                 YBPaymentController *paymentController;
                                 
                                 if (buttonIndex == 0) {
                                     
                                     paymentController = [YBPaymentController paymentControllerWithOrderId:self.orderDetailViewModel.orderDetailModel.orderId
                                                                                             paymentMethod:ZJProjectPaymentMethodDepositBalance_All
                                                                                          paymentEventType:ZJProjectPaymentEventOrder
                                                                                                    extend:nil];
                                     
                                 }else if (buttonIndex == 1) {
                                     
                                     paymentController = [YBPaymentController paymentControllerWithOrderId:self.orderDetailViewModel.orderDetailModel.orderId
                                                                                             paymentMethod:ZJProjectPaymentMethodDepositBalance_part
                                                                                          paymentEventType:ZJProjectPaymentEventOrder
                                                                                                    extend:nil];
                                     
                                 }else if (buttonIndex == 2) {
                                     return;
                                 }
                                 [self.navigationController pushViewController:paymentController animated:YES];
                                 
                             }];
            
        }else{
            
            YBPaymentController *paymentController = [YBPaymentController paymentControllerWithOrderId:self.orderDetailViewModel.orderDetailModel.orderId
                                                                                         paymentMethod:[self.orderDetailViewModel currentPaymentMethodOrderModel:self.orderDetailViewModel.orderDetailModel]
                                                                                      paymentEventType:ZJProjectPaymentEventOrder
                                                                                                extend:nil];
            [self.navigationController pushViewController:paymentController animated:YES];
            
        }
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"联系客服")]) {
        
        [self jxt_showActionSheetWithTitle:ZJSTRING(@"联系客服") message:nil
                         appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                             
                             alertMaker.
                             addActionDefaultTitle(ZJSTRING(@"在线客服")).
                             addActionDefaultTitle(ZJSTRING(@"电话客服")).
                             addActionCancelTitle(ZJSTRING(@"取消"));
                             
                             alertMaker.view.tintColor = ZJCOLOR.color_c4;
                             
                         } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                             
                             if (buttonIndex == 0) {
                                 [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
                                 [[MQCustomerServiceManager share] sendUrlMessage:[NSString stringWithFormat:@"商品名称：%@\n订单编号：%@",
                                                                                   self.orderDetailViewModel.orderDetailModel.goodsName,
                                                                                   self.orderDetailViewModel.orderDetailModel.orderId]];
                                 YBLog(@"%@", [NSString stringWithFormat:@"商品名称：%@\n订单编号：%@",
                                               self.orderDetailViewModel.orderDetailModel.goodsName,
                                               self.orderDetailViewModel.orderDetailModel.orderId]);
                             }
                             
                             if (buttonIndex == 1) {
                                 [YBStringTool CallPhoneWith:self.view phone:[[YBPublicConfigure_LocalData new] customerPhone]];
                             }
                         }];
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"提醒发货")]) {
        
        [self jxt_showAlertWithTitle:ZJSTRING(@"提示")
                             message:ZJSTRING(@"提醒发货成功")
                   appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                       alertMaker.
                       addActionCancelTitle(@"确定");
                       alertMaker.view.tintColor = ZJCOLOR.color_c4;
                   } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                       
                   }];
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"提醒配货")]) {
        
        [self jxt_showAlertWithTitle:ZJSTRING(@"提示")
                             message:ZJSTRING(@"提醒配货成功")
                   appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                       alertMaker.
                       addActionCancelTitle(@"确定");
                       alertMaker.view.tintColor = ZJCOLOR.color_c4;
                   } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                       
                   }];
        
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"查看物流")]) {
        YBLogisticsViewController *logisticsViewController = [YBLogisticsViewController creatLogisticsVCwithorderId:self.orderDetailViewModel.orderId deliveryNum:self.orderDetailViewModel.orderDetailModel.deliveryNum extend:nil];
        [self.navigationController pushViewController:logisticsViewController animated:YES];
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"确认收货")]) {
        
        [self.orderDetailViewModel confirmOrderSuccessCallBackBlock:^(id model) {
            
            /**
             *  刷新界面
             */
            [self loadData];
            
        } failureCallBack:^(id error) {
            
        }];
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"晒单")]) {
        
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"申请退款")]) {
        
        YBApplyRefundViewController *refundVC = [YBApplyRefundViewController creatApplyRefundViewControllerWithrefundAmount:self.orderDetailViewModel.orderDetailModel.refundAmount
                                                                                                                    orderId:self.orderDetailViewModel.orderDetailModel.orderId
                                                                                                                     extend:nil];
        [self.navigationController pushViewController:refundVC animated:YES];
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"退款详情")]) {
        
        YBRefundDeatilViewController *refundDeatilViewController = [YBRefundDeatilViewController creatRefundDeatilVCwithorderId:self.orderDetailViewModel.orderId extend:nil];
        [self.navigationController pushViewController:refundDeatilViewController animated:YES];
    }
    
    if ([sender.titleLabel.text isEqualToString:ZJSTRING(@"查看提货码")]) {
        
        YBPickupCodeViewController *pickupCodeViewController = [[YBPickupCodeViewController alloc] init];
        pickupCodeViewController.orderPickupCode = self.orderDetailViewModel.orderDetailModel.orderPickupCode;
        [self.navigationController pushViewController:pickupCodeViewController
                                             animated:YES];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark <UITableViewDataSource>

/**
 返回组
 
 @param tableView tableView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.orderDetailViewModel.dataArray.count;
}

/**
 返回行
 
 @param tableView tableView
 @param section   section
 
 @return 每组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *tempArray = self.orderDetailViewModel.dataArray[section][@"data"];
    return tempArray.count;
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tempArray                          = self.orderDetailViewModel.dataArray[indexPath.section][@"data"];
    YBOrderDetailModel *orderDetailModel        = tempArray[indexPath.row];
    YBOrderDetailBaseCell *cell                 = [tableView dequeueReusableCellWithIdentifier:orderDetailModel.cellReID
                                                                                  forIndexPath:indexPath];
    cell.orderDetailModel                       = orderDetailModel;
    return cell;
}

/**
 返回组头视图
 
 @param tableView tableView
 @param section section
 @return 组头视图
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0
        && ![self checkOrderIsCancelStatusWith:self.orderDetailViewModel]) {
        
        /**
         *  判断是否需要返回头视图
         *  为取消订单状态时，不展示
         */
        YBOrderDetailStepHeaderView *stepHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:YBOrderDetailStepHeaderViewReuseIdentifier];
        if (!stepHeaderView) {
            stepHeaderView = [[YBOrderDetailStepHeaderView alloc] initWithReuseIdentifier:YBOrderDetailStepHeaderViewReuseIdentifier];
        }
        stepHeaderView.orderDetailViewModel = self.orderDetailViewModel;
        return stepHeaderView;
        
    }else{
        
        ZJBaseView *baseView = [[ZJBaseView alloc] init];
        baseView.backgroundColor = ZJCOLOR.color_c12;
        return baseView;
    }
}

- (BOOL)checkOrderIsCancelStatusWith:(YBOrderDetailViewModel *)orderDetailViewModel
{
    if (orderDetailViewModel.orderDetailModel.detailsShowStatus == 70
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 71
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 72
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 73
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 74
        || orderDetailViewModel.orderDetailModel.detailsShowStatus == 75) {
        return YES;
    }else{
        return NO;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0
        && ![self checkOrderIsCancelStatusWith:self.orderDetailViewModel]) {
        
        /**
         *  需要判断是否展示头视图
         */
        return ADJUST_PERCENT_FLOAT(78.f);
    }else{
        if (section == 0) {
            return ADJUST_PERCENT_FLOAT(0.1f);
        }else{
            return ADJUST_PERCENT_FLOAT(10.f);
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tempArray                      = self.orderDetailViewModel.dataArray[indexPath.section][@"data"];
    YBOrderDetailModel *orderDetailModel    = tempArray[indexPath.row];
    return orderDetailModel.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tempArray                      = self.orderDetailViewModel.dataArray[indexPath.section][@"data"];
    YBOrderDetailModel *orderDetailModel    = tempArray[indexPath.row];
    
    if (indexPath.section == 2
        && indexPath.row == 0
        && orderDetailModel.detailsShowStatus == 10) {
        
        /**
         *  选择支付方式
         */
        [self jxt_showActionSheetWithTitle:ZJSTRING(@"切换支付方式")
                                   message:nil
                         appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                             
                             if (orderDetailModel.isAllowDepositPay == 0) {
                                 
                                 if (orderDetailModel.orderPayType == 1) {
                                     
                                     alertMaker.
                                     addActionDefaultTitle(ZJSTRING(@"分笔支付")).
                                     addActionCancelTitle(ZJSTRING(@"取消"));
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 3) {
                                     
                                     alertMaker.
                                     addActionDefaultTitle(ZJSTRING(@"全额支付")).
                                     addActionCancelTitle(ZJSTRING(@"取消"));
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 4) {
                                     
                                     alertMaker.
                                     addActionDefaultTitle(ZJSTRING(@"全额支付")).
                                     addActionDefaultTitle(ZJSTRING(@"分笔支付")).
                                     addActionCancelTitle(ZJSTRING(@"取消"));
                                 }
                                 
                             }else{
                                 if (orderDetailModel.orderPayType == 1) {
                                     
                                     alertMaker.
                                     addActionDefaultTitle(ZJSTRING(@"定金支付")).
                                     addActionDefaultTitle(ZJSTRING(@"分笔支付")).
                                     addActionCancelTitle(ZJSTRING(@"取消"));
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 2) {
                                     
                                     alertMaker.
                                     addActionDefaultTitle(ZJSTRING(@"全额支付")).
                                     addActionDefaultTitle(ZJSTRING(@"分笔支付")).
                                     addActionCancelTitle(ZJSTRING(@"取消"));
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 3) {
                                     
                                     alertMaker.
                                     addActionDefaultTitle(ZJSTRING(@"全额支付")).
                                     addActionDefaultTitle(ZJSTRING(@"定金支付")).
                                     addActionCancelTitle(ZJSTRING(@"取消"));
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 4) {
                                     
                                     alertMaker.
                                     addActionDefaultTitle(ZJSTRING(@"全额支付")).
                                     addActionDefaultTitle(ZJSTRING(@"定金支付")).
                                     addActionDefaultTitle(ZJSTRING(@"分笔支付")).
                                     addActionCancelTitle(ZJSTRING(@"取消"));
                                 }
                             }
                             
                             alertMaker.view.tintColor = ZJCOLOR.color_c4;
                             
                         } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                             
                             YBLog(@"%zd", buttonIndex);
                             
                             if ([action.title isEqualToString:@"取消"]) {
                                 return;
                             }
                             
                             NSString *paymentType;
                             if (orderDetailModel.isAllowDepositPay == 0) {
                                 
                                 if (orderDetailModel.orderPayType == 1) {
                                     if (buttonIndex == 0) {
                                         paymentType = @"3";
                                     }
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 3) {
                                     if (buttonIndex == 0) {
                                         paymentType = @"1";
                                     }
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 4) {
                                     if (buttonIndex == 0) {
                                         paymentType = @"1";
                                     }else if (buttonIndex == 1) {
                                         paymentType = @"3";
                                     }
                                 }
                                 
                             }else{
                                 if (orderDetailModel.orderPayType == 1) {
                                     if (buttonIndex == 0) {
                                         paymentType = @"2";
                                     }else if (buttonIndex == 1) {
                                         paymentType = @"3";
                                     }
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 2) {
                                     if (buttonIndex == 0) {
                                         paymentType = @"1";
                                     }else if (buttonIndex == 1) {
                                         paymentType = @"3";
                                     }
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 3) {
                                     if (buttonIndex == 0) {
                                         paymentType = @"1";
                                     }else if (buttonIndex == 1) {
                                         paymentType = @"2";
                                     }
                                 }
                                 
                                 if (orderDetailModel.orderPayType == 4) {
                                     if (buttonIndex == 0) {
                                         paymentType = @"1";
                                     }else if (buttonIndex == 1) {
                                         paymentType = @"2";
                                     }else if (buttonIndex == 2) {
                                         paymentType = @"3";
                                     }
                                 }
                             }
                             
                             [self.orderDetailViewModel changePaymentTypeWithPaymentType:paymentType successCallBackBlock:^(id model) {
                                 
                                 /**
                                  *  根据本地数据配置界面
                                  */
                                 self.orderDetailViewModel.orderPayType = paymentType.integerValue;
                                 [self.contentTableView reloadData];
                                 
                             } failureCallBack:^(id error) {
                                 YBLog(@"%@", error);
                             }];
                         }];
    }
    
    if (indexPath.section == 2
        && indexPath.row == 1) {
        
        YBPaymentRecordViewController *recordViewController = [[YBPaymentRecordViewController alloc] init];
        recordViewController.orderId = self.orderDetailViewModel.orderId;
        [self.navigationController pushViewController:recordViewController animated:YES];
    }
    
    if (indexPath.section == 0
        && indexPath.row == 2
        && [orderDetailModel.deliveryType isEqualToString:@"1"]) {
        YBLogisticsViewController *logisticsViewController = [YBLogisticsViewController creatLogisticsVCwithorderId:self.orderDetailViewModel.orderId deliveryNum:self.orderDetailViewModel.orderDetailModel.deliveryNum extend:nil];
        [self.navigationController pushViewController:logisticsViewController animated:YES];
    }
}

#pragma mark - Fifth.控制器生命周期

/**
 创建订单详情控制器
 
 @param orderId         orderId（订单编号）
 @param extend          extend（扩展参数暂传nil）
 @return                订单详情
 */
+ (instancetype)orderDetailTableViewControllerWithOrderId:(NSString *)orderId
                                                   extend:(id)extend
{
    YBOrderDetailTableViewController *orderTableViewController      = [[YBOrderDetailTableViewController alloc] initWithOrderId:orderId];
    if (extend) {
        orderTableViewController.sourceController = (UIViewController *)extend;
    }
    return orderTableViewController;
}

- (instancetype)initWithOrderId:(NSString *)orderId
{
    YBOrderDetailViewModel *orderDetailViewModel                    = [[YBOrderDetailViewModel alloc] init];
    orderDetailViewModel.orderId                                    = orderId;
    if (self == [super init]) {
        _orderDetailViewModel = orderDetailViewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contentTableView.contentInset = UIEdgeInsetsMake(ADJUST_PERCENT_FLOAT(10.f), 0, ADJUST_PERCENT_FLOAT(120.f), 0);
    
    self.navigationItem.title = ZJSTRING(@"订单详情");
    [self.view addSubview:self.contentTableView];
    [self.view addSubview:self.bottomFuncView];
    [self.bottomFuncView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
    }];
    
    [self registerSubViews];
    
    YBDefaultButton *cancelButton = [YBDefaultButton buttonWithTitleStringKey:@"取消订单"
                                                                 titleColor:ZJCOLOR.color_c4
                                                                  titleFont:SYSTEM_REGULARFONT(14.f)
                                                                     target:self
                                                                   selector:@selector(cancelButtonClick:)];
    self.cancelButton = cancelButton;
    self.navigationItem.rightBarButtonItem = [[ZJBaseBarButtonItem alloc] initWithCustomView:cancelButton];
    [self showMaskView];
    self.myMaskView.frame = CGRectMake(0, 0, self.contentTableView.width, self.contentTableView.height);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadData];
}

- (void)loadData
{
    [self.orderDetailViewModel loadOrderDetailWithSuccessCallBackBlock:^(id model) {
        
        [super hiddenMaskView];
        self.orderDetailViewModel = (YBOrderDetailViewModel *)model;
        
    } failureCallBack:^(id error) {
        
        /**
         *  如果errorCode == -1009 无网络
         */
        if ([error code] == -1009) {
            [self showBadRequestMaskView];
        }
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[ZJTimerManager shareTimer] stopTimer];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /**
     *  配置左侧按钮点击事件
     */
    YBDefaultButton *button = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                 imageNamed:@"public_back"
                                                                       type:ZJProjectButtonSetImageDefault
                                                                     target:self
                                                                   selector:@selector(buttonClick:)];
    ZJBaseBarButtonItem *backButtonItem = [[ZJBaseBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem     = backButtonItem;
}

#pragma mark - Sixth.界面配置

- (void)registerSubViews
{
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBOrderDetailStepHeaderView class])
                                                      bundle:nil]
    forHeaderFooterViewReuseIdentifier:YBOrderDetailStepHeaderViewReuseIdentifier];
    [self.contentTableView registerClass:[YBOrderDetailDefaultCell class]
                  forCellReuseIdentifier:YBOrderDetailDefaultCellReuseIdentifier];
    [self.contentTableView registerClass:[YBOrderDetailStatusCell class]
                  forCellReuseIdentifier:YBOrderDetailStatusCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBOrderDetailLogisticsCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBOrderDetailLogisticsCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBOrderDetailUserInformationCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBOrderDetailUserInformationCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBOrderDetailCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBOrderDetailCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBOrderDetailAmontDetailCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBOrderDetailAmontDetailCellReuseIdentifier];
    [self.contentTableView registerClass:[YBOrderDetailPickAddressCell class]
                  forCellReuseIdentifier:YBOrderDetailPickAddressCellReuseIdentifier];
}

#pragma mark - Seventh.懒加载

- (ZJBaseView *)bottomFuncView
{
    if (!_bottomFuncView) {
        
        _bottomFuncView = [[ZJBaseView alloc] init];
        
        YBDefaultButton *imageButton1 = [[YBDefaultButton alloc] init];
        [imageButton1 addTarget:self
                         action:@selector(imageButtonClick:)
               forControlEvents:UIControlEventTouchUpInside];
        [_bottomFuncView addSubview:imageButton1];
        
        YBDefaultButton *imageButton2 = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_ORDERDETAIL
                                                                           imageNamed:@""
                                                                                 type:ZJProjectButtonSetBackgroundImage
                                                                               target:self
                                                                             selector:@selector(imageButtonClick:)];
        [_bottomFuncView addSubview:imageButton2];
        
        YBDefaultButton *imageButton3 = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_ORDERDETAIL
                                                                           imageNamed:@""
                                                                                 type:ZJProjectButtonSetBackgroundImage
                                                                               target:self
                                                                             selector:@selector(imageButtonClick:)];
        [_bottomFuncView addSubview:imageButton3];
        
        [imageButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_bottomFuncView);
            make.right.mas_equalTo(_bottomFuncView).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(84.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(28.f));
        }];
        
        [imageButton2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageButton1);
            make.right.mas_equalTo(imageButton1.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-18));
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(84.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(28.f));
        }];
        
        [imageButton3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageButton2);
            make.right.mas_equalTo(imageButton2.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-18));
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(84.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(28.f));
        }];
        
        CAShapeLayer *layer                                 = [[CAShapeLayer alloc] init];
        UIBezierPath *path                                  = [UIBezierPath bezierPathWithRect:CGRectMake(0,
                                                                                                          0,
                                                                                                          _bottomFuncView.width,
                                                                                                          1.f)];
        layer.path                                          = path.CGPath;
        layer.fillColor                                     = ZJCOLOR.color_c16.CGColor;
        [_bottomFuncView.layer addSublayer:layer];
    }
    return _bottomFuncView;
}

- (ZJBaseTableView *)contentTableView
{
    if (!_contentTableView) {
        
        _contentTableView = [[ZJBaseTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _contentTableView.backgroundColor = ZJCOLOR.color_c12;
        _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _contentTableView.dataSource = self;
        _contentTableView.delegate = self;
        
    }
    return _contentTableView;
}

@end
