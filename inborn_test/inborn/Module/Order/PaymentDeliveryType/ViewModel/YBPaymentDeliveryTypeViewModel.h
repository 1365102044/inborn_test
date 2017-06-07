//
//  YBPaymentDeliveryTypeViewModel.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJOrderViewModel.h"
#import "YBPaymentDliveryTypeModel.h"
#import "YBConfirmOrderViewModel.h"

@interface YBPaymentDeliveryTypeViewModel : ZJOrderViewModel

/**
 订单数据
 */
@property (nonatomic, weak) YBConfirmOrderViewModel *confirmOrderViewModel;

/**
 用户选中的配送方式
 */
@property (nonatomic, copy) NSString *userDeliveryType;

/**
 用户选中的付款方式 支付方式
 */
@property (nonatomic, assign) ZJProjectPaymentMethod userPaymentMethod;

/**
 数据Array
 */
@property (nonatomic, strong) NSArray<NSDictionary *> *dataArray;

/**
 点击配送方式选择
 
 @param button              button
 @param indexPath           indexPath
 @param callBackBlock       callBackBlock
 */
- (void)selectedDeliveryTypeButton:(ZJBaseButton *)button
                         indexPath:(NSIndexPath *)indexPath
                     callBackBlock:(ZJEventCallBackBlock)callBackBlock;

/**
 点击付款方式选择
 
 @param button              button
 @param indexPath           indexPath
 @param callBackBlock       callBackBlock
 */
- (void)selectedPaymentTypeButton:(ZJBaseButton *)button
                        indexPath:(NSIndexPath *)indexPath
                    callBackBlock:(ZJEventCallBackBlock)callBackBlock;

@end
