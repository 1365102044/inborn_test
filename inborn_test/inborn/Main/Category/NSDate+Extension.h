//
//  NSDate+Extension.h
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  得到当前时间的时间戳,13位毫秒级
 *
 *
 *  @return                 得到时间戳字符串
 */
+ (NSString*)ex_getCurrentTimeStamp;

/**
 *  NSDate时间转换为13位毫秒级时间戳
 *
 *  @param date             时间
 *
 *  @return                 13位毫秒级时间戳
 */
+ (NSString *)ex_convertTimeStampWithDate:(NSDate *)date;

/**
 *  NSDate类型时间转换为需要显示的时间字符串
 *
 *  @param date             NSDate类型时间
 *  @param str              日期格式 如：yyyy年MM月dd日
 *  @param timeZoneStr      时区格式 如：Asia/Shanghai
 *
 *  @return                 得到相应的时间字符串
 */
+ (NSString *)ex_stringWithDate:(NSDate *)date
                formatterString:(NSString *)str
                    timeZoneStr:(NSString *)timeZoneStr;

/**
 *  时间戳字符串转换为需要的时间字符串
 *
 *  @param timeString       时间戳 13位毫秒级
 *  @param str              日期格式 如：yyyy年MM月dd日
 *  @param timeZoneStr      时区格式 如：Asia/Shanghai
 *
 *  @return                 得到相应的时间字符串
 */
+ (NSString *)ex_stringWithDateString:(NSString *)timeString
                      formatterString:(NSString *)str
                          timeZoneStr:(NSString *)timeZoneStr;
 
/**
 *  项目使用，根据该日期返回一个字符串
 *  当天显示：12：35；
 *  前一天显示：昨天；
 *  除当天和昨天的今年日期：7月6日
 *  今年之前的日期：2014年1月23日
 *  @return 返回字符串
 */
- (NSString *)ex_convertNSDate2String;

/**
 *  获取当前日期
 *
 *  @return 返回当前的日期和week
 */
+ (NSString *)ex_getDateAndWeek;

@end
