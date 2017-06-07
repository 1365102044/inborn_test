//
//  YBPublicConfigure_LocalData.h
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "Base_LocalData.h"

@interface YBPublicConfigure_LocalData : Base_LocalData

+ (instancetype)share;

/**
 扫描支付地址
 */
@property(nonatomic,copy) NSString * qrcodePayUrl;
/**
 退款手续费率
 */
@property(nonatomic,copy) NSString * commonRefundRatio;
/**
 自提地址
 */
@property(nonatomic,copy) NSString * consigneeAddress;
/**
 自提营业时间
 */
@property(nonatomic,copy) NSString * businessTime;
/**
 客服联系电话
 */
@property(nonatomic,copy) NSString * customerPhone;
/**
 自提贵宾专线
 */
@property(nonatomic,copy) NSString * consigneePhone;



//** =========================================================================================== */
//** =========================================app的公共配置数据======================================== */
//** =========================================================================================== */

/**
 存 公共数据
 */
- (void)savePublicConfigureInforWith:(id)objc;


@end
