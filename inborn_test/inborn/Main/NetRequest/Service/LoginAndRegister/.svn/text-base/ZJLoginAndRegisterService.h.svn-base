//
//  ZJLoginAndRegisterService.h
//  inborn
//
//  Created by 郑键 on 17/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface ZJLoginAndRegisterService : ZJBaseService

/**
 *  注册获取验证码
 *
 *  @param phone                手机号（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)registerLoadMessageCodeWithPhone:(NSString *)phone
                                 success:(ZJNetRequestSuccessBlock)successBlock
                                    fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消注册获取验证码网络请求
 */
- (void)cancelRegisterLoadMessageCodeNetRequest;

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
                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消注册网络请求
 */
- (void)cancelRegisterNetRequest;

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
                  fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消登录网络请求
 */
- (void)cancelLoginNetRequest;

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
                       fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消快捷登录网络请求
 */
- (void)cancelQuickLoginNetRequest;

/**
 *  快捷登录获取验证码请求
 *
 *  @param phone                手机号（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)quickLoginLoadMessageCodeWithPhone:(NSString *)phone
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消快捷登录获取验证码网络请求
 */
- (void)cancelQuickLoginLoadMessageCodeNetRequest;

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
                     fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消APP QQ登录请求
 */
- (void)cancelQQLoginNetRequest;

/**
 *  QQ解除绑定网络请求
 *
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)unbindQQSuccess:(ZJNetRequestSuccessBlock)successBlock
                   fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消QQ解除绑定网络请求
 */
- (void)cancelUnbindQQNetRequest;

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
                       fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消app 微信网络请求
 */
- (void)cancelWeChatLoginNetRequest;

/**
 *  微信解除绑定请求
 *
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)unbindWeChatSuccess:(ZJNetRequestSuccessBlock)successBlock
                       fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消微信解除绑定网络请求
 */
- (void)cancelUnbindWeChatNetRequest;

/**
 *  忘记密码获取验证码请求
 *
 *  @param phone                手机号（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)forgetPwdLoadMessageCodeWithPhone:(NSString *)phone
                                  success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消忘记密码获取验证码网络请求
 */
- (void)cancelForgetPwdLoadMessageCodeNetRequest;

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
                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消忘记密码第一步网络请求
 */
- (void)cancelForgetPwdFirstNetRequest;

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
                            fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消忘记密码第二步网络请求
 */
- (void)cancelForgetPwdSecondNetRequest;

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
                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消第三方登录-校验手机号网络请求
 */
- (void)cancelThirdLoginVerPhoneNetRequest;

/**
 *  第三方登录-未注册绑定请求
 *
 *  @param phone                手机号（必传）
 *  @param type                 1表示微信。2表示QQ（必传）
 *  @param openid               QQ用户openid（必传）
 *  @param smsCode              短信验证码（必传）
 *  @param prodBids             会员浏览记录（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)thirdNeverRegisterBindWithPhone:(NSString *)phone
                                   type:(NSString *)type
                                 openid:(NSString *)openid
                                smsCode:(NSString *)smsCode
                               prodBids:(NSString *)prodBids
                                success:(ZJNetRequestSuccessBlock)successBlock
                                   fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消第三方登录-未注册绑定网络请求
 */
- (void)cancelThirdNeverRegisterBindNetRequest;

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
                                      fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消第三方登录-获取验证码网络请求
 */
- (void)cancelThirdLoginLoadMessageCodeWNetRequest;

/**
 *  第三方登录-已注册绑定
 *
 *  @param phone                手机号（必传）
 *  @param type                 1表示微信。2表示QQ（必传）
 *  @param openid               QQ用户openid（必传）
 *  @param smsCode              短信验证码（必传）
 *  @param prodBids             会员浏览记录（必传）
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)thirdLoginAlreadyRegisterBindWithPhone:(NSString *)phone
                                          type:(NSString *)type
                                        openid:(NSString *)openid
                                       smsCode:(NSString *)smsCode
                                      prodBids:(NSString *)prodBids
                                       success:(ZJNetRequestSuccessBlock)successBlock
                                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消第三方登录-已注册绑定网络请求
 */
- (void)cancelThirdLoginAlreadyRegisterBindNetRequest;


/**
 *  首页扫码,PC登录
 *
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)homepageScanPCLoginUrl:(NSString *)urlsuccess:(ZJNetRequestSuccessBlock)successBlock
                                          fail:(ZJNetRequestFailureBlock)failBlock;


@end
