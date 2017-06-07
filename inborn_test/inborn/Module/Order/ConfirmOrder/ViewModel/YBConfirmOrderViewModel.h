//
//  YBConfirmOrderViewModel.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJOrderViewModel.h"
#import "YBConfirmOrderModel.h"
#import "YBAddressAndPickPersonModel.h"

@interface YBConfirmOrderViewModel : ZJOrderViewModel

/**
 确认订单计算的应付价格
 */
@property (nonatomic, copy) NSString *currentPrice;

/**
 用户输入的身份证号
 */
@property (nonatomic, copy) NSString *userInputIdCardNumber;

/**
 *  用户选中的支付方式
 */
@property (nonatomic, assign) ZJProjectPaymentMethod userCurrentPaymentMethod;

/**
 *  订单数据
 */
@property (nonatomic, strong) YBConfirmOrderModel *orderModel;

/**
 *  数据
 *  key: data
 *  value: YBConfirmOrderModel Array
 */
@property (nonatomic, strong) NSArray<NSDictionary *> *dataModelArray;

/**
 *  配置用户选中的地址
 *
 *  @param addressModel 地址模型
 */
- (void)setupUserSelectedAddressModel:(YBAddressAndPickPersonModel *)addressModel;

/**
 *  配置用户从列表选中地址
 *
 *  @param addressModel             地址模型
 *  @param successCallBack          成功
 */
- (void)setupFromListUserSelectedAddressModel:(YBAddressAndPickPersonModel *)addressModel
                              successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack;

/**
 *  配置用户选中地配送及支付方式
 *
 *  @param deliveryType             用户选中的配送方式
 *  @param paymentMethod            用户选中的支付方式
 *  @param successCallBack          成功
 */
- (void)setupUserSelectedDeliveryType:(NSString *)deliveryType
                        paymentMethod:(ZJProjectPaymentMethod)paymentMethod
                      successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack;

/**
 *  确认订单网络请求
 *
 *  @param goodId              商品id
 *  @param successCallBack     成功
 *  @param failureCallBack     失败
 */
- (void)confirmOrderWithGoodId:(NSString *)goodId
               successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
               failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 *  生成订单网络请求
 *
 *  @param successCallBack     成功
 *  @param failureCallBack     失败
 */
- (void)creatOrderSuccessCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
                  failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 *  设置用户身份证号
 *
 *  @param idNumber                idNumber
 *  @param successCallBack         «成功
 *  @param failureCallBack         失败
 */
- (void)setupUserIdNumber:(NSString *)idNumber
          successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
          failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

@end
