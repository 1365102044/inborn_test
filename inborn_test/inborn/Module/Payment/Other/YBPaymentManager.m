//
//  YBPaymentManager.m
//  inborn
//
//  Created by 郑键 on 17/3/31.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentManager.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
#import "YBTopAlert.h"
#import "YBPaymentServiceSignModel.h"
#import "LLPaySdk.h"
#import "YBPaymentService.h"
#import "YBPaymentResultController.h"
#import "YXWebPagePayViewController.h"
#import "YBPaymentModel.h"
#import "AppDelegate.h"

@interface YBPaymentManager() <WXApiDelegate, LLPaySdkDelegate>

/**
 回调
 */
@property (nonatomic, copy) ZJEventCallBackBlock callBackBlock;

@end

@implementation YBPaymentManager

/**
 获取单利
 
 @return 对象
 */
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static YBPaymentManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YBPaymentManager alloc] init];
    });
    return instance;
}

/**
 发起微信支付
 
 @param serviceSingModel            服务器签名参数
 @param callBack                    回调
 */
- (BOOL)weChatPayServiceSingModel:(YBPaymentServiceSignModel *)serviceSingModel
                         callBack:(ZJEventCallBackBlock)callBack;
{
    __weak AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.status = AppDelegateDidBecomeActiveQueryGoodStatus;
    self.callBackBlock = callBack;
    /**
     *  调起微信支付
     */
    PayReq* req             = [[PayReq alloc] init];
    req.partnerId           = serviceSingModel.partnerId;
    req.prepayId            = serviceSingModel.prepayId;
    req.nonceStr            = serviceSingModel.nonceStr;
    req.timeStamp           = serviceSingModel.timeStamp.intValue;
    req.package             = serviceSingModel.packageStr;
    req.sign                = serviceSingModel.sign;
    
    return [WXApi sendReq:req];
}

/**
 发起支付宝支付
 
 @param serviceSingString           服务器签名参数
 @param callBack                    回调
 */
- (void)aliPayServiceSingString:(NSString *)serviceSingString
                       callBack:(ZJEventCallBackBlock)callBack
{
    __weak AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.status = AppDelegateDidBecomeActiveQueryGoodStatus;
    self.callBackBlock = callBack;
    NSString *appScheme = @"Alipay.com.bjInborn";
    [[AlipaySDK defaultService] payOrder:serviceSingString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
        [self handleAlipayCallBack:resultDic];
    }];
}

/**
 发起苹果支付
 
 @param serviceSingString           服务器签名参数
 @param callBack                    回调
 */
- (void)applePayServiceSingString:(NSString *)serviceSingString
                 sourceController:(UIViewController *)sourceController
                         callBack:(ZJEventCallBackBlock)callBack
{
    __weak AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.status = AppDelegateDidBecomeActiveNone;
    [LLAPPaySDK sharedSdk].sdkDelegate = self;
    [[LLAPPaySDK sharedSdk] payWithTraderInfo:[serviceSingString ex_dictionaryToJsonString]
                             inViewController:sourceController];
    self.callBackBlock = callBack;
}

/**
 发起连连认证支付
 
 @param paymentModel                商品数据
 @param souceController             来源控制器
 @param callBack                    回调
 */
- (void)lianlianPayPaymentModel:(YBPaymentModel *)paymentModel
                souceController:(UIViewController *)souceController
                       callBack:(ZJEventCallBackBlock)callBack
{
    __weak AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.status = AppDelegateDidBecomeActiveNone;
    self.callBackBlock = callBack;
    /**
     *  判断是否有银行卡
     *  判断是否进行实名认证
     */
    [[YBPaymentService share] certifiedPayBankListSuccess:^(id objc, id requestInfo) {
        YBLog(@"%@\n%@", objc, requestInfo);
    } fail:^(id error, id requestInfo) {
        YBLog(@"%@\n%@", error, requestInfo);
    }];
}

/**
 发起网银扫码支付
 
 @param paymentModel                商品数据
 @param souceController             来源控制器
 @param callBack                    回调
 */
- (void)webPayPaymentModel:(YBPaymentModel *)paymentModel
           souceController:(UIViewController *)souceController
                  callBack:(ZJEventCallBackBlock)callBack
{
    __weak AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.status = AppDelegateDidBecomeActiveNone;
    YXWebPagePayViewController *webPageViewController = [YXWebPagePayViewController CreatwebPagePayVCwithordernumber:
                                                         paymentModel.orderId
                                                                                                           goodsName:paymentModel.prodName
                                                                                                       orderAllprice:paymentModel.totalAmount
                                                                                                      shouldPayprice:paymentModel.payAmount
                                                                                                             orderId:paymentModel.orderId
                                                                                                           orderType:1
                                                                                                              extend:nil];
    self.callBackBlock = callBack;
    [souceController.navigationController pushViewController:webPageViewController animated:YES];
}

//** =========================================================================================== */
//** ===========================================回调结果========================================= */
//** =========================================================================================== */

/**
 支付宝 支付结果 回调处理操作
 */
- (void)openUrlCallBackAlipay:(NSURL *)url
{
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        [self handleAlipayCallBack:resultDic];
    }];
}

/**
 支付宝 支付结果 回调处理操作
 */
-(void)handleAlipayCallBack:(NSDictionary *)resultDic
{
    if ([resultDic[@"resultStatus"] isEqualToString:@"9000"]) {
        /**
         *  成功
         */
        self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultSuccess]);
        
        return;
    }
    
    if ([resultDic[@"resultStatus"] isEqualToString:@"6001"]) {
        /**
         *  用户取消 YXPaymentResultUserCancel
         */
        self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultCancel]);
        
        return;
    }
    
    if (![resultDic[@"resultStatus"] isEqualToString:@"9000"] &&
        ![resultDic[@"resultStatus"] isEqualToString:@"6001"]) {
        
        /**
         *  支付失败
         */
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(ALERT_TITLE_ERROR_STRINGKEY)
                                                tipsStringKey:resultDic[@"result"]
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];

        self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultFailed]);
        
        return;
    }
}

/**
 微信 支付结果 回调处理操作
 */
- (BOOL)openUrlCallBackWeChat:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:self];;
}

/**
 微信回调

 @param resp req
 */
- (void)onResp:(BaseResp *)resp
{
    /**
     *  返回PayResp 类型
     */
    if ([resp isKindOfClass:[PayResp class]]) {
        PayResp *payReq = (PayResp *)resp;
        
        if (payReq.errCode == 0) {
            
            /**
             *  成功
             */
            self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultSuccess]);
            
            return;
        }
        
        if (payReq.errCode == -2) {
            /**
             *  用户取消 YXPaymentResultUserCancel
             */
            self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultCancel]);
            
            return;
        }
        
        if (payReq.errCode == -1) {
            /**
             *  错误--可能的原因：签名错误、未注册APPID、项目设置APPID不正确、注册的APPID与设置的不匹配、其他异常等
             */
            self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultFailed]);
            
            return;
        }
        
    }
}

/**
 *  调用sdk以后的结果回调
 *
 *  @param resultCode 支付结果
 *  @param dic        回调的字典，参数中，ret_msg会有具体错误显示
 */
- (void)paymentEnd:(LLPayResult)resultCode withResultDic:(NSDictionary *)dic
{
    NSString *msg = @"支付异常";
    switch (resultCode) {
        case kLLPayResultSuccess: {
            self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultSuccess]);
        }
            break;
        case kLLPayResultFail: {
            if ([dic[@"ret_code"] isEqualToString:@"0124"]) {
                msg = @"银行卡余额不足";
            }else if ([dic[@"ret_code"] isEqualToString:@"0312"]) {
                msg = @"卡限额超限";
            }else if ([dic[@"ret_code"] isEqualToString:@"0010"]) {
                msg = @"单笔金额超限";
            }else if ([dic[@"ret_code"] isEqualToString:@"0014"]) {
                msg = @"银行交易出错";
            }else{
                msg = @"支付失败";
            }
        }
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(ALERT_TITLE_ERROR_STRINGKEY)
                                                    tipsStringKey:dic[@"ret_msg"]
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
            self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultFailed]);
            break;
        case kLLPayResultCancel: {
            msg = @"支付取消";
            self.callBackBlock([NSString stringWithFormat:@"%zd", ZJProjectPaymentResultCancel]);
        }
            break;
        case kLLPayResultInitError: {
            msg = @"sdk初始化异常";
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(ALERT_TITLE_ERROR_STRINGKEY)
                                                    tipsStringKey:dic[@"ret_msg"]
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
        }
            break;
        case kLLPayResultInitParamError: {

            if ([dic[@"ret_code"] isEqualToString:@"3005"]) {
                
                /**
                 *  未绑卡或系统版本不对
                 */
            }
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(ALERT_TITLE_ERROR_STRINGKEY)
                                                    tipsStringKey:dic[@"ret_msg"]
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
        }
            break;
        default:
            break;
    }
}

@end
