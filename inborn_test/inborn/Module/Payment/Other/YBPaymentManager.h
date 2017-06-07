//
//  YBPaymentManager.h
//  inborn
//
//  Created by 郑键 on 17/3/31.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YBPaymentServiceSignModel;
@class YBPaymentModel;

@interface YBPaymentManager : NSObject

+ (instancetype)sharedManager;

/**
 发起微信支付
 
 @param serviceSingModel            服务器签名参数
 @param callBack                    回调
 */
- (BOOL)weChatPayServiceSingModel:(YBPaymentServiceSignModel *)serviceSingModel
                         callBack:(ZJEventCallBackBlock)callBack;

/**
 发起支付宝支付
 
 @param serviceSingString           服务器签名参数
 @param callBack                    回调
 */
- (void)aliPayServiceSingString:(NSString *)serviceSingString
                       callBack:(ZJEventCallBackBlock)callBack;

/**
 发起苹果支付
 
 @param serviceSingString           服务器签名参数
 @param callBack                    回调
 */
- (void)applePayServiceSingString:(NSString *)serviceSingString
                 sourceController:(UIViewController *)sourceController
                         callBack:(ZJEventCallBackBlock)callBack;

/**
 发起连连认证支付
 
 @param paymentModel                商品数据
 @param souceController             来源控制器
 @param callBack                    回调
 */
- (void)lianlianPayPaymentModel:(YBPaymentModel *)paymentModel
                souceController:(UIViewController *)souceController
                       callBack:(ZJEventCallBackBlock)callBack;

/**
 发起网银扫码支付

 @param paymentModel                商品数据
 @param souceController             来源控制器
 @param callBack                    回调
 */
- (void)webPayPaymentModel:(YBPaymentModel *)paymentModel
           souceController:(UIViewController *)souceController
                  callBack:(ZJEventCallBackBlock)callBack;

/**
 支付宝 支付结果 回调处理操作
 */
- (void)openUrlCallBackAlipay:(NSURL *)url;

/**
 微信 支付结果 回调处理操作
 */
- (BOOL)openUrlCallBackWeChat:(NSURL *)url;

@end
