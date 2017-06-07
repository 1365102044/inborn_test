//
//  ZJLoginAndRegisterService.m
//  inborn
//
//  Created by 郑键 on 17/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJLoginAndRegisterService.h"

@interface ZJLoginAndRegisterService()
{
    NSURLSessionTask *_registerLoadMessageCodeTask;
    NSURLSessionTask *_registerTask;
    NSURLSessionTask *_loginTask;
    NSURLSessionTask *_quickLoginTask;
    NSURLSessionTask *_quickLoginLoadMessageCodeTask;
    NSURLSessionTask *_qqLoginTask;
    NSURLSessionTask *_unbindQQTask;
    NSURLSessionTask *_weChatLoginTask;
    NSURLSessionTask *_unbindWeChatTask;
    NSURLSessionTask *_forgetPwdLoadMessageCodeTask;
    NSURLSessionTask *_forgetPwdFirstTask;
    NSURLSessionTask *_forgetPwdSecondTask;
    NSURLSessionTask *_thirdLoginVerPhoneTask;
    NSURLSessionTask *_thirdNeverRegisterBindTask;
    NSURLSessionTask *_thirdLoginLoadMessageCodeTask;
    NSURLSessionTask *_thirdLoginAlreadyRegisterBindTask;
}
@end

@implementation ZJLoginAndRegisterService

+ (instancetype)share{
    static dispatch_once_t t;
    static ZJLoginAndRegisterService *service       = nil;
    dispatch_once(&t, ^{
        service                                     = [[ZJLoginAndRegisterService alloc] init];
    });
    return service;
}

/**
 *  注册获取验证码
 *
 *  @param phone                手机号（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)registerLoadMessageCodeWithPhone:(NSString *)phone
                                 success:(ZJNetRequestSuccessBlock)successBlock
                                    fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _registerLoadMessageCodeTask                    = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_LOADMESSAGECODE_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消注册获取验证码网络请求
 */
- (void)cancelRegisterLoadMessageCodeNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_registerLoadMessageCodeTask];
}

/**
 *  注册
 *
 *  @param phone                手机号（必传）
 *  @param smsCode              短信验证码（必传）
 *  @param prodBids             会员浏览商品记录（非必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)registerWithPhone:(NSString *)phone
                  smsCode:(NSString *)smsCode
                 prodBids:(NSString *)prodBids
                  success:(ZJNetRequestSuccessBlock)successBlock
                     fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone
        || !smsCode) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"smsCode":!smsCode ? @"" : smsCode}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"smsCode":smsCode,
                                                        @"prodBids":!prodBids ? @"" : prodBids};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _registerTask                                   = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_REIGSTER_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消注册网络请求
 */
- (void)cancelRegisterNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_registerTask];
}

/**
 *  登录
 *
 *  @param phone                手机号（必传）
 *  @param password             密码（必传）
 *  @param prodBids             会员浏览商品记录（非必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)loginWithPhone:(NSString *)phone
              password:(NSString *)password
              prodBids:(NSString *)prodBids
               success:(ZJNetRequestSuccessBlock)successBlock
                  fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone
        || !password) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"password":!password ? @"" : password}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"password":[password ex_sha1String],
                                                        @"prodBids":!prodBids ? @"" : prodBids};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _loginTask                                      = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_LOGIN_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消登录网络请求
 */
- (void)cancelLoginNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_loginTask];
}

/**
 *  快捷登录网络请求
 *
 *  @param phone                手机号（必传）
 *  @param smsCode              短信验证码（必传）
 *  @param prodBids             会员浏览商品记录（非必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)quickLoginWithPhone:(NSString *)phone
                    smsCode:(NSString *)smsCode
                   prodBids:(NSString *)prodBids
                    success:(ZJNetRequestSuccessBlock)successBlock
                       fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone
        || !smsCode) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"smsCode":!smsCode ? @"" : smsCode}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"smsCode":smsCode,
                                                        @"prodBids":!prodBids ? @"" : prodBids};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _quickLoginTask                                 = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_QUICKLOGIN_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消快捷登录网络请求
 */
- (void)cancelQuickLoginNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_quickLoginTask];
}

/**
 *  快捷登录获取验证码请求
 *
 *  @param phone                手机号（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)quickLoginLoadMessageCodeWithPhone:(NSString *)phone
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _quickLoginLoadMessageCodeTask                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_QUICKLOGIN_LOADMESSAGECODE_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消快捷登录获取验证码网络请求
 */
- (void)cancelQuickLoginLoadMessageCodeNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_quickLoginLoadMessageCodeTask];
}

/**
 *  APP QQ登录请求
 *
 *  @param openId               QQ登录时获取的openId（必传）
 *  @param token                access token（必传）
 *  @param prodBids             会员浏览商品记录（非必传）
 *  @param display              是否h5登录（非必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)qqLoginWithOpenid:(NSString *)openId
                    token:(NSString *)token
                 prodBids:(NSString *)prodBids
                  display:(NSString *)display
                  success:(ZJNetRequestSuccessBlock)successBlock
                     fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!openId
        || !token) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"openId":!openId ? @"" : openId,
                                                                        @"token":!token ? @"" : token}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"openId":openId,
                                                        @"token":token,
                                                        @"prodBids":!prodBids ? @"" : prodBids,
                                                        @"display":!display ? @"" : display};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _qqLoginTask                                    = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_THIRD_QQ_LOGIN_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消APP QQ登录请求
 */
- (void)cancelQQLoginNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_qqLoginTask];
}

/**
 *  QQ解除绑定网络请求
 *
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)unbindQQSuccess:(ZJNetRequestSuccessBlock)successBlock
                   fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSDictionary *params                                = @{};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf          = self;
    _unbindQQTask                                       = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_THIRD_QQ_UNBUNDLED_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:params
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
 *  取消QQ解除绑定网络请求
 */
- (void)cancelUnbindQQNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_unbindQQTask];
}

/**
 *  APP 微信请求
 *
 *  @param code                 app微信登录时需要获取的code（必传）
 *  @param prodBids             会员浏览商品记录（非必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)weChatLoginWithCode:(NSString *)code
                   prodBids:(NSString *)prodBids
                    success:(ZJNetRequestSuccessBlock)successBlock
                       fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!code) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"code":!code ? @"" : code}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"code":code,
                                                        @"prodBids":!prodBids ? @"" : prodBids};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _weChatLoginTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_THIRD_WECHAT_LOGIN_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消app 微信网络请求
 */
- (void)cancelWeChatLoginNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_weChatLoginTask];
}

/**
 *  微信解除绑定请求
 *
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)unbindWeChatSuccess:(ZJNetRequestSuccessBlock)successBlock
                       fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _unbindWeChatTask                               = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_THIRD_WECHAT_UNBUNDLED_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消微信解除绑定网络请求
 */
- (void)cancelUnbindWeChatNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_unbindWeChatTask];
}

/**
 *  忘记密码获取验证码请求
 *
 *  @param phone                手机号（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)forgetPwdLoadMessageCodeWithPhone:(NSString *)phone
                                  success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _forgetPwdLoadMessageCodeTask                   = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_FORGETPWD_LOADMESSAGECODE_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消忘记密码获取验证码网络请求
 */
- (void)cancelForgetPwdLoadMessageCodeNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_forgetPwdLoadMessageCodeTask];
}

/**
 *  忘记密码第一步请求
 *
 *  @param phone                手机号（必传）
 *  @param smsCode              短信验证码（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)forgetPwdFirstWithPhone:(NSString *)phone
                        smsCode:(NSString *)smsCode
                        success:(ZJNetRequestSuccessBlock)successBlock
                           fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone
        || !smsCode) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"smsCode":!smsCode ? @"" : smsCode}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"smsCode":smsCode};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _forgetPwdFirstTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_FORGETPWD_FIRST_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消忘记密码第一步网络请求
 */
- (void)cancelForgetPwdFirstNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_forgetPwdFirstTask];
}

/**
 *  忘记密码第二步请求
 *
 *  @param phone                手机号（必传）
 *  @param smsCode              短信验证码（必传）
 *  @param newPassWord          新密码（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)forgetPwdSecondWithPhone:(NSString *)phone
                         smsCode:(NSString *)smsCode
                     newPassWord:(NSString *)newPassWord
                         success:(ZJNetRequestSuccessBlock)successBlock
                            fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone
        || !smsCode
        || !newPassWord) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"smsCode":!smsCode ? @"" : smsCode,
                                                                        @"newPassWord":!newPassWord ? @"" : newPassWord}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"verifyCode":smsCode,
                                                        @"newPassWord":[newPassWord ex_sha1String]};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _forgetPwdSecondTask                            = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_FORGETPWD_SECOND_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消忘记密码第二步网络请求
 */
- (void)cancelForgetPwdSecondNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_forgetPwdSecondTask];
}

/**
 *  第三方登录-校验手机号请求
 *
 *  @param phone                手机号（必传）
 *  @param type                 1表示微信。2表示QQ（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)thirdLoginVerPhoneWithPhone:(NSString *)phone
                               type:(NSString *)type
                            success:(ZJNetRequestSuccessBlock)successBlock
                               fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone
        || !type) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"type":!type ? @"" : type}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"type":type};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _thirdLoginVerPhoneTask                         = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_THIRD_VERPHONENUMBER_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消第三方登录-校验手机号网络请求
 */
- (void)cancelThirdLoginVerPhoneNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_thirdLoginVerPhoneTask];
}

/**
 *  第三方登录-未注册绑定请求
 *
 *  @param phone                手机号（必传）
 *  @param type                 1表示微信。2表示QQ（必传）
 *  @param openid               QQ用户openid（必传）
 *  @param smsCode              短信验证码（必传）
 *  @param prodBids             会员浏览记录
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)thirdNeverRegisterBindWithPhone:(NSString *)phone
                                   type:(NSString *)type
                                 openid:(NSString *)openid
                                smsCode:(NSString *)smsCode
                               prodBids:(NSString *)prodBids
                                success:(ZJNetRequestSuccessBlock)successBlock
                                   fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone
        || !type
        || !openid
        || !smsCode) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"openid":!openid ? @"" : openid,
                                                                        @"smsCode":!smsCode ? @"" : smsCode,
                                                                        @"prodBids":!prodBids ? @"" : prodBids,
                                                                        @"type":!type ? @"" : type}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"type":type,
                                                        @"openid":openid,
                                                        @"verifyCode":smsCode,
                                                        @"prodBids":!prodBids ? @"" : prodBids};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _thirdNeverRegisterBindTask                     = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_THIRD_NEVERREGISTERBINDING_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消第三方登录-未注册绑定网络请求
 */
- (void)cancelThirdNeverRegisterBindNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_thirdNeverRegisterBindTask];
}

/**
 *  第三方登录-获取验证码
 *
 *  @param phone                手机号（必传）
 *  @param type                 1微信，2QQ
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)thirdLoginLoadMessageCodeWithPhone:(NSString *)phone
                                      type:(NSString *)type
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"type":!type ? @"" : type}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"type":type};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _thirdLoginLoadMessageCodeTask                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_THIRD_LOADMESSAGECODE_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消第三方登录-获取验证码网络请求
 */
- (void)cancelThirdLoginLoadMessageCodeWNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_thirdLoginLoadMessageCodeTask];
}

/**
 *  第三方登录-已注册绑定
 *
 *  @param phone                手机号（必传）
 *  @param type                 1表示微信。2表示QQ（必传）
 *  @param openid               QQ用户openid（必传）
 *  @param smsCode              短信验证码（必传）
 *  @param prodBids             会员浏览记录
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)thirdLoginAlreadyRegisterBindWithPhone:(NSString *)phone
                                          type:(NSString *)type
                                        openid:(NSString *)openid
                                       smsCode:(NSString *)smsCode
                                      prodBids:(NSString *)prodBids
                                       success:(ZJNetRequestSuccessBlock)successBlock
                                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!phone
        || !type
        || !openid
        || !smsCode) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"phone":!phone ? @"" : phone,
                                                                        @"openid":!openid ? @"" : openid,
                                                                        @"smsCode":!smsCode ? @"" : smsCode,
                                                                        @"prodBids":!prodBids ? @"" : prodBids,
                                                                        @"type":!type ? @"" : type}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"phone":phone,
                                                        @"type":type,
                                                        @"openid":openid,
                                                        @"verifyCode":smsCode,
                                                        @"prodBids":!prodBids ? @"" : prodBids};
    
    /**
     *  请求并获取task
     */
    __weak ZJLoginAndRegisterService *weakSelf      = self;
    _thirdLoginAlreadyRegisterBindTask              = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:LOGINANDREGISTER_ALREADYREIGSTERBINDING_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:params
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
 *  取消第三方登录-已注册绑定网络请求
 */
- (void)cancelThirdLoginAlreadyRegisterBindNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_thirdLoginAlreadyRegisterBindTask];
}



@end
