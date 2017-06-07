//
//  YBScanViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/5/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJScanningController.h"

/**
 loginScanType,                 登录
 webPayScanType,                网页支付
 logisticsScanType              物流的条形码
 */
typedef NS_ENUM(NSInteger, UseScanVcEnum) {
    loginScanType,
    webPayScanType,
    logisticsScanType
};
/**
 扫描快递条码回调
 
 @param zBarViewController 扫码控制器
 @param text               识别文字
 */

typedef void(^GetFormPCPayUrlBlock)(NSString *URL);
typedef void(^scanResultStrBlock)(NSString *scanResultStr);

@interface YBScanViewController : ZJScanningController
@property(nonatomic,copy) GetFormPCPayUrlBlock  formePCPayurlBlock;


+ (instancetype)creatScanViewControllerWithUseEnum:(UseScanVcEnum)UseEnum
                                     scanResultStr:(scanResultStrBlock)scanResultStr
                                            extend:(id)extend;

@end
