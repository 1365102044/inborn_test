//
//  YBPublicConfigure_LocalData.m
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPublicConfigure_LocalData.h"

@implementation YBPublicConfigure_LocalData

 + (instancetype)share
{
    static dispatch_once_t onceToken;
    static YBPublicConfigure_LocalData *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YBPublicConfigure_LocalData alloc]init];
    });
    return instance;
}

/**
 扫描支付地址
 */
- (NSString *)qrcodePayUrl
{
    if (!_qrcodePayUrl) {
        
        /**
         *  本地取值
         */
        _qrcodePayUrl =  [SYSTEM_USERDEFAULTS objectForKey:@"qrcodePayUrl"];
    }
    return _qrcodePayUrl;
}

/**
 退款手续费率
 */
- (NSString *)commonRefundRatio
{
    if (!_commonRefundRatio) {
        
        /**
         *  本地取值
         */
        _commonRefundRatio =  [SYSTEM_USERDEFAULTS objectForKey:@"commonRefundRatio"];
    }
    return _commonRefundRatio;
}
/**
 自提地址
 */
- (NSString *)consigneeAddress
{
    if (!_consigneeAddress) {
        
        /**
         *  本地取值
         */
        _consigneeAddress =  [SYSTEM_USERDEFAULTS objectForKey:@"consigneeAddress"];
    }
    return _consigneeAddress;
}
/**
 自提营业时间
 */
- (NSString *)businessTime
{
    if (!_businessTime) {
        
        /**
         *  本地取值
         */
        _businessTime =  [SYSTEM_USERDEFAULTS objectForKey:@"businessTime"];
    }
    return _businessTime;
}

/**
 客服联系电话
 */
- (NSString *)customerPhone
{
    if (!_customerPhone) {
        
        /**
         *  本地取值
         */
        _customerPhone =  [SYSTEM_USERDEFAULTS objectForKey:@"customerPhone"];
    }
    return _customerPhone;
}
/**
 自提贵宾专线
 */
- (NSString *)consigneePhone
{
    if (!_consigneePhone) {
        
        /**
         *  本地取值
         */
        _consigneePhone =  [SYSTEM_USERDEFAULTS objectForKey:@"consigneePhone"];
    }
    return _consigneePhone;
}


/**
 存 公共数据
 */
- (void)savePublicConfigureInforWith:(id)objc
{
    if (objc == nil) {
        return;
    }
    
    
    /**
     扫描支付地址
     */
    [SYSTEM_USERDEFAULTS setObject:objc[@"qrcodePayUrl"] forKey:@"qrcodePayUrl"];
    /**
     退款手续费率
     */
    [SYSTEM_USERDEFAULTS setObject:objc[@"commonRefundRatio"] forKey:@"commonRefundRatio"];
    /**
     自提地址
     */
    [SYSTEM_USERDEFAULTS setObject:objc[@"consigneeAddress"] forKey:@"consigneeAddress"];
    /**
     自提营业时间
     */
    [SYSTEM_USERDEFAULTS setObject:objc[@"businessTime"] forKey:@"businessTime"];
    /**
     客服联系电话
     */
    [SYSTEM_USERDEFAULTS setObject:objc[@"customerPhone"] forKey:@"customerPhone"];
    /**
     自提贵宾专线
     */
    [SYSTEM_USERDEFAULTS setObject:objc[@"consigneePhone"] forKey:@"consigneePhone"];
    
}

@end
/**
 {
 -"data": {
 "qrcodePayUrl": "https://test.inborn.com/pay",
 "commonRefundRatio": "0.008",
 "consigneeAddress": "北京市朝阳区望京东路8号锐创国际中心A座20层",
 "businessTime": "10:00-20:00",
 "customerPhone": "010-56591685",
 "consigneePhone": "010-84177113"
 },
 "errorMsg": "",
 "status": "1",
 "v": "2.0"
 }
 */
