//
//  YBPaymentService.h
//  inborn
//
//  Created by 郑键 on 17/3/31.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface YBPaymentService : ZJBaseService

/**
 *  支付信息请求
 *
 *  @param orderId                  商品id
 *  @param type                     支付事物类型，1商品订单，2鉴定费，3担保费，4我要打款，5保证金
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)payInfoWithOrderId:(NSString *)orderId
                      type:(NSString *)type
                   success:(ZJNetRequestSuccessBlock)successBlock
                      fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消确认订单网络请求
 */
- (void)cancelPayInfoNetRequest;

/**
 *  预支付请求
 *
 *  @param orderId                  商品id
 *  @param paymentType              2微信app支付，3支付宝app支付，4apple pay，5连连app支付
 *  @param transType                支付事物类型，1商品订单，2鉴定费，3担保费，4我要打款，5保证金
 *  @param isPartPay                0表示全额，1表示分笔
 *  @param isDepositPay             是否支付定金，0表示否，1表示是
 *  @param channelType              channelType
 *  @param payAmount                以分为单位 支付金额
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)payPreWithOrderId:(NSString *)orderId
              paymentType:(NSString *)paymentType
                transType:(NSString *)transType
                isPartPay:(NSString *)isPartPay
             isDepositPay:(NSString *)isDepositPay
              channelType:(NSString *)channelType
                payAmount:(NSString *)payAmount
                  success:(ZJNetRequestSuccessBlock)successBlock
                     fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消确认订单网络请求
 */
- (void)cancelPayPreNetRequest;

/**
 *  认证支付预支付请求
 *
 *  @param orderId                  商品id
 *  @param paymentType              2微信app支付，3支付宝app支付，4apple pay，5连连app支付
 *  @param transType                支付事物类型，1商品订单，2鉴定费，3担保费，4我要打款，5保证金
 *  @param isPartPay                0表示全额，1表示分笔
 *  @param isDepositPay             是否支付定金，0表示否，1表示是
 *  @param payAmount                以分为单位 支付金额
 *  @param acctName                 持卡人姓名
 *  @param cardNo                   银行卡号
 *  @param idNo                     身份证号
 *  @param bindMob                  银行卡绑定手机号
 *  @param bankCardId               银行卡列表数据编号 为空时acctName,cardNo,bindMob,idNo必填
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedPayPreWithOrderId:(NSString *)orderId
                       paymentType:(NSString *)paymentType
                         transType:(NSString *)transType
                         isPartPay:(NSString *)isPartPay
                      isDepositPay:(NSString *)isDepositPay
                         payAmount:(NSString *)payAmount
                          acctName:(NSString *)acctName
                            cardNo:(NSString *)cardNo
                              idNo:(NSString *)idNo
                           bindMob:(NSString *)bindMob
                        bankCardId:(NSString *)bankCardId
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消认证支付预支付网络请求
 */
- (void)cancelCertifiedPayPreNetRequest;

/**
 *  认证支付获取银行卡列表
 *
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedPayBankListSuccess:(ZJNetRequestSuccessBlock)successBlock
                               fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消认证支付预支付网络请求
 */
- (void)cancelCertifiedPayBankListNetRequest;

/**
 *  认证支付银行卡信息校验
 *
 *  @param cardNo                   银行卡号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedPayBankInfoWithCardNo:(NSString *)cardNo
                               success:(ZJNetRequestSuccessBlock)successBlock
                                  fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消认证支付银行卡信息校验网络请求
 */
- (void)cancelCertifiedPayBankInfoNetRequest;

/**
 *  支付校验
 *
 *  @param token                    授权码
 *  @param verifyCode               短信验证码
 *  @param paymentId                订单支付编号
 *  @param payAmount                订单支付金额，单位分
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedPayCheckWithToken:(NSString *)token
                        verifyCode:(NSString *)verifyCode
                         paymentId:(NSString *)paymentId
                         payAmount:(NSString *)payAmount
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消认证支付银行卡信息校验网络请求
 */
- (void)cancelCertifiedPayCheckNetRequest;

/**
 *  认证支付删除卡
 *
 *  @param bankCardId               银行卡id编号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedDelBankWithBankCardId:(NSString *)bankCardId
                               success:(ZJNetRequestSuccessBlock)successBlock
                                  fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消认证支付删除卡网络请求
 */
- (void)cancelCertifiedDelBankNetRequest;

/**
 *  认证支付修改手机号获取验证码
 *
 *  @param bankCardId               银行卡id编号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedGetCodeWithBankCardId:(NSString *)bankCardId
                               bindMob:(NSString *)bindMob
                               success:(ZJNetRequestSuccessBlock)successBlock
                                  fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消认证支付修改手机号获取验证码网络请求
 */
- (void)cancelCertifiedGetCodeNetRequest;

/**
 *  认证支付修改手机号获取验证码
 *
 *  @param token                    银行卡id编号
 *  @param verifyCode               验证码
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedModifyCheckWithBankCardId:(NSString *)bankCardId
                                     token:(NSString *)token
                                verifyCode:(NSString *)verifyCode
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消认证支付修改手机号获取验证码网络请求
 */
- (void)cancelCertifiedModifyCheckNetRequest;

/**
 *  查询支付结果
 *
 *  @param paymentId                支付编号，app支付时必填
 *  @param type                     支付事物类型：1商品订单，2鉴定费，3担保费，4我要打款，5保证金
 *  @param orderId                  支付类型：1网银支付，2微信app支付，3支付宝app支付，4apple pay，5连连支付
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)queryPaymentResultWithPaymentId:(NSString *)paymentId
                                   type:(NSString *)type
                            paymentType:(NSString *)paymentType
                                orderId:(NSString *)orderId
                                success:(ZJNetRequestSuccessBlock)successBlock
                                   fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消查询支付结果网络请求
 */
- (void)cancelQueryPaymentResultNetRequest;

/**
 *  扫码支付
 *
 *  @param orderId                 订单号
 *  @param orderType               1商品订单，2鉴定费，3担保费，4我要打款，5保证金
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)scanPaymentWithorderId:(NSString *)orderId
                     orderType:(NSString *)orderType
                      clientId:(NSString *)clientId
                       success:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消扫码支付网络请求
 */
- (void)cancelscanPaymentNetRequest;

/**
 *  PC扫码支付 查询支付结果
 *
 *  @param orderId                 订单编号（保证金编号）
 *  @param type               支付事物类型，1商品订单，2鉴定费，3担保费，4我要打款，5保证金
 *  @param  paymentType     支付类型：1网银支付，2微信app支付，3支付宝app支付，4apple pay，5连连支付
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)checkscanPaymentResultInforWithorderId:(NSString *)orderId
                                     orderType:(NSString *)orderType
                                   paymentType:(NSString *)paymentType
                                       success:(ZJNetRequestSuccessBlock)successBlock
                                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消扫码支付网络请求
 */
- (void)cancelcheckscanPaymentResultInforNetRequest;

@end
