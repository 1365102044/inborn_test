//
//  YBPaymentService.m
//  inborn
//
//  Created by 郑键 on 17/3/31.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentService.h"

@interface YBPaymentService()
{
    NSURLSessionTask *_payInfoTask;
    NSURLSessionTask *_payPreTask;
    NSURLSessionTask *_certifiedPayPreTask;
    NSURLSessionTask *_certifiedPayBankListTask;
    NSURLSessionTask *_certifiedPayBankInfoTask;
    NSURLSessionTask *_certifiedPayCheckTask;
    NSURLSessionTask *_certifiedDelBankTask;
    NSURLSessionTask *_certifiedGetCodeTask;
    NSURLSessionTask *_certifiedModifyCheckTask;
    NSURLSessionTask *_queryPaymentResultTask;
}

@end

@implementation YBPaymentService

+ (instancetype)share{
    static dispatch_once_t t;
    static YBPaymentService *service          = nil;
    dispatch_once(&t, ^{
        service                             = [[YBPaymentService alloc] init];
    });
    return service;
}

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
                      fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([[NSString stringWithFormat:@"%@", orderId] ex_isEmpty]
        || [type ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId,
                                                                        @"type":!type ? @"" : type}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"id":orderId,
                              @"type":type};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                 = self;
    _payInfoTask                               = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_PAYINFO_URL
                                                                                                      requestNetworkType:ZJProjectNetRequestPost
                                                                                                              parameters:parames
                                                                                                         timeoutInterval:SEVRIES_TIMEOUT
                                                                                                            successBlock:^(id objc, id requestInfo) {
                                                                                                                [SVProgressHUD dismiss];
                                                                                                                [weakSelf handleRequestSuccess:objc
                                                                                                                                  requestModel:requestInfo
                                                                                                                                      sucBlock:successBlock
                                                                                                                                     failBlock:failBlock];
                                                                                                            }
                                                                                                            failureBlock:^(id error, id requestInfo) {
                                                                                                                [SVProgressHUD dismiss];
                                                                                                                [weakSelf handleRequestFailed:error
                                                                                                                                 requestModel:requestInfo
                                                                                                                                    failBlock:failBlock];
                                                                                                            }];
}

/**
 *  取消确认订单网络请求
 */
- (void)cancelPayInfoNetRequest;
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_payInfoTask];
}

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
                     fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([orderId ex_isEmpty]
        || [paymentType ex_isEmpty]
        || [transType ex_isEmpty]
        || [isPartPay ex_isEmpty]
        || [isDepositPay ex_isEmpty]
        || [channelType ex_isEmpty]
        || [payAmount ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId,
                                                                        @"paymentType":!paymentType ? @"" : paymentType,
                                                                        @"transType":!transType ? @"" : transType,
                                                                        @"isPartPay":!isPartPay ? @"" : isPartPay,
                                                                        @"isDepositPay":!isDepositPay ? @"" : isDepositPay,
                                                                        @"channelType":!channelType ? @"" : channelType,
                                                                        @"payAmount":!payAmount ? @"" : payAmount,}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId,
                              @"paymentType":paymentType,
                              @"transType":transType,
                              @"isPartPay":isPartPay,
                              @"isDepositPay":isDepositPay,
                              @"channelType":channelType,
                              @"payAmount":payAmount};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                   = self;
    _payPreTask                                         = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_PAYPRE_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:parames
                                                                                                                  timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                     successBlock:^(id objc, id requestInfo) {
                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                         [weakSelf handleRequestSuccess:objc
                                                                                                                                           requestModel:requestInfo
                                                                                                                                               sucBlock:successBlock
                                                                                                                                              failBlock:failBlock];
                                                                                                                     }
                                                                                                                     failureBlock:^(id error, id requestInfo) {
                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                         [weakSelf handleRequestFailed:error
                                                                                                                                          requestModel:requestInfo
                                                                                                                                             failBlock:failBlock];
                                                                                                                     }];
}

/**
 *  取消预支付网络请求
 */
- (void)cancelPayPreNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_payPreTask];
}

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
                              fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([[NSString stringWithFormat:@"%@", orderId] ex_isEmpty]
        || [paymentType ex_isEmpty]
        || [transType ex_isEmpty]
        || [isPartPay ex_isEmpty]
        || [isDepositPay ex_isEmpty]
        || [payAmount ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId,
                                                                        @"paymentType":!paymentType ? @"" : paymentType,
                                                                        @"transType":!transType ? @"" : transType,
                                                                        @"isPartPay":!isPartPay ? @"" : isPartPay,
                                                                        @"isDepositPay":!isDepositPay ? @"" : isDepositPay,
                                                                        @"payAmount":!payAmount ? @"" : payAmount,}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    
    NSDictionary *parames = @{@"orderId":orderId ? orderId : @"",
                              @"paymentType":paymentType ? paymentType : @"",
                              @"transType":transType ? transType : @"",
                              @"isPartPay":isPartPay ? isPartPay : @"",
                              @"isDepositPay":isDepositPay ? isDepositPay : @"",
                              @"acctName":acctName ? acctName : @"",
                              @"cardNo":cardNo ? cardNo : @"",
                              @"idNo":idNo ? idNo : @"",
                              @"bindMob":bindMob ? bindMob : @"",
                              @"bankCardId":bankCardId ? bankCardId : @"",
                              @"payAmount":payAmount ? payAmount : @""};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                           = self;
    _certifiedPayPreTask                                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_CERPAY_PRE_URL
                                                                                                                       requestNetworkType:ZJProjectNetRequestPost
                                                                                                                               parameters:parames
                                                                                                                          timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                             successBlock:^(id objc, id requestInfo) {
                                                                                                                                 [SVProgressHUD dismiss];
                                                                                                                                 [weakSelf handleRequestSuccess:objc
                                                                                                                                                   requestModel:requestInfo
                                                                                                                                                       sucBlock:successBlock
                                                                                                                                                      failBlock:failBlock];
                                                                                                                             }
                                                                                                                             failureBlock:^(id error, id requestInfo) {
                                                                                                                                 [SVProgressHUD dismiss];
                                                                                                                                 [weakSelf handleRequestFailed:error
                                                                                                                                                  requestModel:requestInfo
                                                                                                                                                     failBlock:failBlock];
                                                                                                                             }];
}

/**
 *  取消认证支付预支付网络请求
 */
- (void)cancelCertifiedPayPreNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedPayPreTask];
}

/**
 *  认证支付获取银行卡列表
 *
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedPayBankListSuccess:(ZJNetRequestSuccessBlock)successBlock
                               fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                                   = self;
    _certifiedPayBankListTask                                           = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_CERPAY_BANKCARDLIST_URL
                                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                       parameters:parames
                                                                                                                                  timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                                     successBlock:^(id objc, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestSuccess:objc
                                                                                                                                                           requestModel:requestInfo
                                                                                                                                                               sucBlock:successBlock
                                                                                                                                                              failBlock:failBlock];
                                                                                                                                     }
                                                                                                                                     failureBlock:^(id error, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestFailed:error
                                                                                                                                                          requestModel:requestInfo
                                                                                                                                                             failBlock:failBlock];
                                                                                                                                     }];
    
}

/**
 *  取消认证支付预支付网络请求
 */
- (void)cancelCertifiedPayBankListNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedPayBankListTask];
}

/**
 *  认证支付银行卡信息校验
 *
 *  @param cardNo                   银行卡号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedPayBankInfoWithCardNo:(NSString *)cardNo
                               success:(ZJNetRequestSuccessBlock)successBlock
                                  fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([cardNo ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"cardNo":!cardNo ? @"" : cardNo}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"cardNo":cardNo};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                                   = self;
    _certifiedPayBankInfoTask                                           = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_CERPAY_BANKCARDINFO_URL
                                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                       parameters:parames
                                                                                                                                  timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                                     successBlock:^(id objc, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestSuccess:objc
                                                                                                                                                           requestModel:requestInfo
                                                                                                                                                               sucBlock:successBlock
                                                                                                                                                              failBlock:failBlock];
                                                                                                                                     }
                                                                                                                                     failureBlock:^(id error, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestFailed:error
                                                                                                                                                          requestModel:requestInfo
                                                                                                                                                             failBlock:failBlock];
                                                                                                                                     }];
}

/**
 *  取消认证支付银行卡信息校验网络请求
 */
- (void)cancelCertifiedPayBankInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedPayBankInfoTask];
}

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
                              fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([token ex_isEmpty]
        || [verifyCode ex_isEmpty]
        || [paymentId ex_isEmpty]
        || [payAmount ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"token":!token ? @"" : token,
                                                                        @"verifyCode":!verifyCode ? @"" : verifyCode,
                                                                        @"paymentId":!paymentId ? @"" : paymentId,
                                                                        @"payAmount":!payAmount ? @"" : payAmount}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"token":token ? token : @"",
                              @"verifyCode":verifyCode,
                              @"paymentId":paymentId ? paymentId : @"",
                              @"payAmount":payAmount};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                           = self;
    _certifiedPayCheckTask                                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_CERPAY_PAYCHECK_URL
                                                                                                                         requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                 parameters:parames
                                                                                                                            timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                               successBlock:^(id objc, id requestInfo) {
                                                                                                                                   [SVProgressHUD dismiss];
                                                                                                                                   [weakSelf handleRequestSuccess:objc
                                                                                                                                                     requestModel:requestInfo
                                                                                                                                                         sucBlock:successBlock
                                                                                                                                                        failBlock:failBlock];
                                                                                                                               }
                                                                                                                               failureBlock:^(id error, id requestInfo) {
                                                                                                                                   [SVProgressHUD dismiss];
                                                                                                                                   [weakSelf handleRequestFailed:error
                                                                                                                                                    requestModel:requestInfo
                                                                                                                                                       failBlock:failBlock];
                                                                                                                               }];
}

/**
 *  取消认证支付银行卡信息校验网络请求
 */
- (void)cancelCertifiedPayCheckNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedPayCheckTask];
}

/**
 *  认证支付删除卡
 *
 *  @param bankCardId               银行卡id编号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)certifiedDelBankWithBankCardId:(NSString *)bankCardId
                               success:(ZJNetRequestSuccessBlock)successBlock
                                  fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([bankCardId ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"bankCardId":!bankCardId ? @"" : bankCardId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"bankCardId":bankCardId};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                           = self;
    _certifiedDelBankTask                                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_CERPAY_DELBANK_URL
                                                                                                                        requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                parameters:parames
                                                                                                                           timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                              successBlock:^(id objc, id requestInfo) {
                                                                                                                                  [SVProgressHUD dismiss];
                                                                                                                                  [weakSelf handleRequestSuccess:objc
                                                                                                                                                    requestModel:requestInfo
                                                                                                                                                        sucBlock:successBlock
                                                                                                                                                       failBlock:failBlock];
                                                                                                                              }
                                                                                                                              failureBlock:^(id error, id requestInfo) {
                                                                                                                                  [SVProgressHUD dismiss];
                                                                                                                                  [weakSelf handleRequestFailed:error
                                                                                                                                                   requestModel:requestInfo
                                                                                                                                                      failBlock:failBlock];
                                                                                                                              }];
}

/**
 *  取消认证支付删除卡网络请求
 */
- (void)cancelCertifiedDelBankNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedDelBankTask];
}

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
                                  fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([bankCardId ex_isEmpty]
        || [bindMob ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"bankCardId":!bankCardId ? @"" : bankCardId,
                                                                        @"bindMob":!bindMob ? @"" : bindMob}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"bankCardId":bankCardId,
                              @"bindMob":bindMob};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                           = self;
    _certifiedGetCodeTask                                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_CERPAY_GETCODE_URL
                                                                                                                        requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                parameters:parames
                                                                                                                           timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                              successBlock:^(id objc, id requestInfo) {
                                                                                                                                  [SVProgressHUD dismiss];
                                                                                                                                  [weakSelf handleRequestSuccess:objc
                                                                                                                                                    requestModel:requestInfo
                                                                                                                                                        sucBlock:successBlock
                                                                                                                                                       failBlock:failBlock];
                                                                                                                              }
                                                                                                                              failureBlock:^(id error, id requestInfo) {
                                                                                                                                  [SVProgressHUD dismiss];
                                                                                                                                  [weakSelf handleRequestFailed:error
                                                                                                                                                   requestModel:requestInfo
                                                                                                                                                      failBlock:failBlock];
                                                                                                                              }];
}

/**
 *  取消认证支付修改手机号获取验证码网络请求
 */
- (void)cancelCertifiedGetCodeNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedGetCodeTask];
}

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
                                      fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([bankCardId ex_isEmpty]
        || [token ex_isEmpty]
        || [verifyCode ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"bankCardId":!bankCardId ? @"" : bankCardId,
                                                                        @"token":!token ? @"" : token,
                                                                        @"verifyCode":!verifyCode ? @"" : verifyCode}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"bankCardId":bankCardId,
                              @"token":token,
                              @"verifyCode":verifyCode};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                                   = self;
    _certifiedModifyCheckTask                                           = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_CERPAY_MODIFYPHONECHECK_URL
                                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                       parameters:parames
                                                                                                                                  timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                                     successBlock:^(id objc, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestSuccess:objc
                                                                                                                                                           requestModel:requestInfo
                                                                                                                                                               sucBlock:successBlock
                                                                                                                                                              failBlock:failBlock];
                                                                                                                                     }
                                                                                                                                     failureBlock:^(id error, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestFailed:error
                                                                                                                                                          requestModel:requestInfo
                                                                                                                                                             failBlock:failBlock];
                                                                                                                                     }];
}

/**
 *  取消认证支付修改手机号获取验证码网络请求
 */
- (void)cancelCertifiedModifyCheckNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedModifyCheckTask];
}

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
                                   fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([type ex_isEmpty]
        || [paymentType ex_isEmpty]
        || [orderId ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"paymentId":!paymentId ? @"" : paymentId,
                                                                        @"type":!type ? @"" : type,
                                                                        @"paymentType":!paymentType ? @"" : paymentType,
                                                                        @"orderId":!orderId ? @"" : orderId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames;
    if ([paymentId ex_isEmpty]
        || !paymentId) {
        
        parames = @{@"type":type,
                    @"paymentType":paymentType,
                    @"orderId":orderId};
    }else{
        
        parames = @{@"type":type,
                    @"paymentType":paymentType,
                    @"orderId":orderId,
                    @"paymentId":paymentId};
        
    }
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                                   = self;
    _queryPaymentResultTask                                           = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_QUERY_PAYMENT_RESULT_URL
                                                                                                                             requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                     parameters:parames
                                                                                                                                timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                                   successBlock:^(id objc, id requestInfo) {
                                                                                                                                       [SVProgressHUD dismiss];
                                                                                                                                       [weakSelf handleRequestSuccess:objc
                                                                                                                                                         requestModel:requestInfo
                                                                                                                                                             sucBlock:successBlock
                                                                                                                                                            failBlock:failBlock];
                                                                                                                                   }
                                                                                                                                   failureBlock:^(id error, id requestInfo) {
                                                                                                                                       [SVProgressHUD dismiss];
                                                                                                                                       [weakSelf handleRequestFailed:error
                                                                                                                                                        requestModel:requestInfo
                                                                                                                                                           failBlock:failBlock];
                                                                                                                                   }];
    
}

/**
 *  取消查询支付结果网络请求
 */
- (void)cancelQueryPaymentResultNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_queryPaymentResultTask];
}



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
                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([orderId ex_isEmpty]
        || [orderType ex_isEmpty]
        || [clientId ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{                                                                      @"orderId":!orderId ? @"" : orderId,
                                                                                                                                              @"orderType":!orderType ? @"" : orderType,
                                                                                                                                              @"clientId":!clientId ? @"" : clientId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId,
                              @"orderType":orderType,
                              @"clientId":clientId};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                                   = self;
    _certifiedModifyCheckTask                                           = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAY_SCANPAYMENT_URL
                                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                       parameters:parames
                                                                                                                                  timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                                     successBlock:^(id objc, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestSuccess:objc
                                                                                                                                                           requestModel:requestInfo
                                                                                                                                                               sucBlock:successBlock
                                                                                                                                                              failBlock:failBlock];
                                                                                                                                     }
                                                                                                                                     failureBlock:^(id error, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestFailed:error
                                                                                                                                                          requestModel:requestInfo
                                                                                                                                                             failBlock:failBlock];
                                                                                                                                     }];
}

/**
 *  取消扫码支付网络请求
 */
- (void)cancelscanPaymentNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedModifyCheckTask];
}


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
                                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([orderId ex_isEmpty]
        || [orderType ex_isEmpty]
        || [paymentType ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{                                                                      @"orderId":!orderId ? @"" : orderId,
                                                                                                                                              @"orderType":!orderType ? @"" : orderType,
                                                                                                                                              @"paymentType":!paymentType ? @"" :paymentType}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId,
                              @"type":orderType,
                              @"paymentType":paymentType};
    
    /**
     *  请求并获取task
     */
    __weak YBPaymentService *weakSelf                                   = self;
    _certifiedModifyCheckTask                                           = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:SCANPAY_CHECKPAYMENTRESULT_URL
                                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                                       parameters:parames
                                                                                                                                  timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                                     successBlock:^(id objc, id requestInfo) {
                                                                                                                                         
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestSuccess:objc
                                                                                                                                                           requestModel:requestInfo
                                                                                                                                                               sucBlock:successBlock
                                                                                                                                                              failBlock:failBlock];
                                                                                                                                     }
                                                                                                                                     failureBlock:^(id error, id requestInfo) {
                                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                                         [weakSelf handleRequestFailed:error
                                                                                                                                                          requestModel:requestInfo
                                                                                                                                                             failBlock:failBlock];
                                                                                                                                     }];
    
}

/**
 *  取消扫码支付网络请求
 */
- (void)cancelcheckscanPaymentResultInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_certifiedModifyCheckTask];
}
@end
