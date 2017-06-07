//
//  YBPaymentViewModel.h
//  inborn
//
//  Created by 郑键 on 17/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJPaymentViewModel.h"
#import "YBPaymentModel.h"
@class YBPaymentServiceSignModel;

@interface YBPaymentViewModel : ZJPaymentViewModel

/**
 商品id
 */
@property (nonatomic, copy) NSString *goodsId;

/**
 是否开启支付回调监听
 */
@property (nonatomic, assign) BOOL canLoadPaymentResult;

/**
 即将支付的金额
 */
@property (nonatomic, copy) NSString *payAmont;

/**
 判断是否是分笔支付
 */
@property (nonatomic, assign) BOOL isPartPay;

/**
 判断是否是定金支付
 */
@property (nonatomic, assign) BOOL isDepositPay;

/**
 订单支付infoModle
 */
@property (nonatomic, strong) YBPaymentModel *paymentModel;

/**
 订单id
 */
@property (nonatomic, copy) NSString *orderId;

/**
 当前选中的支付类型
 */
@property (nonatomic, assign) ZJProjectPaymentType paymentType;

/**
 当前选中的支付类型名称
 */
@property (nonatomic, copy) NSString *paymentTypeName;

/**
 当前选中支付类型的图片名
 */
@property (nonatomic, copy) NSString *paymentLogoImageNamed;

/**
 当前支付事件
 */
@property (nonatomic, assign) ZJProjectPaymentEventType paymentEventType;

/**
 当前的支付手段
 */
@property (nonatomic, assign) ZJProjectPaymentMethod paymentMehtod;

/**
 支付方式界面数据
 */
@property (nonatomic, strong) NSArray<NSDictionary *> *dataArray;

/**
 分笔支付界面数据
 */
@property (nonatomic, strong) NSArray<NSDictionary *> *penToPayDataArray;

/**
 支付信息

 @param successCallBack 成功
 @param failureCallBack 失败
 */
- (void)payInfoSuccessCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
               failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack;

/**
 选择支付方式

 @param button              button
 @param indexPath           indexPath
 @param callBackBlock       callBackBlock
 */
- (void)selectedPaymentTypeButton:(YBDefaultButton *)button
                        indexPath:(NSIndexPath *)indexPath
                    callBackBlock:(ZJEventCallBackBlock)callBackBlock;

/**
 *  支付
 *
 *  @param amont 金额
 */
- (void)payAmont:(NSString *)amont sourceController:(UIViewController *)sourceController;

/**
 *  认证支付
 */
- (void)certifiedPayAmont:(NSString *)amont
         sourceController:(UIViewController *)sourceController;

/**
 *  分笔支付
 */
- (void)penPayAmont:(NSString *)amont
   sourceController:(UIViewController *)sourceController;

/**
 发起扫码支付
 
 @param sourceController sourceController
 */
- (void)startUnionPaySourceController:(UIViewController *)sourceController;

@end
