//
//  YBStringTool.h
//  inborn
//
//  Created by 刘文强 on 2017/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YBStringTool : NSObject

+ (instancetype)share;

/**
 金额 逗号 分割(内部 分->元)
 */
-(NSString*)strmethodCommaWith:(NSString *)price;

/**
 打电话
 */
+(void)CallPhoneWith:(UIView*)backview phone:(NSString *)phone;

/**
 获取到的毫秒->需要到时间格式
 timestyle 时间格式 字符 @“yyyy-MM-dd hh:mm”
 */
- (NSString *)returnTimeStrformeTimestr:(NSString *)str timestyle:(NSString *)timestyle;

@end
