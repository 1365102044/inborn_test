//
//  NSDate+Extension.m
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
 *  得到当前时间的时间戳,13位毫秒级
 *
 *
 *  @return 得到时间戳字符串
 */
+ (NSString *)ex_getCurrentTimeStamp
{
    return [self ex_convertTimeStampWithDate:[NSDate date]];
}

/**
 *  NSDate时间转换为13位毫秒级时间戳
 *
 *  @param date 时间
 *
 *  @return 13位毫秒级时间戳
 */
+ (NSString *)ex_convertTimeStampWithDate:(NSDate *)date
{
    NSString *timeSp                = [NSString stringWithFormat:@"%ld",
                                       (long)[date timeIntervalSince1970] * 1000];
    return timeSp;
}

/**
 *  NSDate类型时间转换为需要显示的时间字符串
 *
 *  @param date             NSDate类型时间
 *  @param str              日期格式 如：yyyy年MM月dd日
 *  @param timeZoneStr      时区格式 如：Asia/Shanghai
 *
 *  @return 得到相应的时间字符串
 */
+ (NSString *)ex_stringWithDate:(NSDate *)date
                formatterString:(NSString *)str
                    timeZoneStr:(NSString *)timeZoneStr
{
    NSDateFormatter *f              = [[NSDateFormatter alloc] init];
    
    [f setDateFormat:str];
    [f setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSString *result                = [f stringFromDate:date];
    return result;
}

/**
 *  时间戳字符串转换为需要的时间字符串
 *
 *  @param timeString 时间戳 13位毫秒级
 *  @param str        日期格式 如：yyyy年MM月dd日
 *
 *  @return 得到相应的时间字符串
 */
+ (NSString *)ex_stringWithDateString:(NSString *)timeString
                      formatterString:(NSString *)str
                          timeZoneStr:(NSString *)timeZoneStr
{
    if ([timeString isEqualToString:@""]
        || timeString.length            ==0
        || [timeString integerValue]    == 0) {
        return @"";
    }
    
    if (timeString.length == 10) {
        timeString = [NSString stringWithFormat:@"%@000",timeString];
    }
    
    NSDateFormatter* formatter          = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:str];//@"yyyy-MM-dd-HHMMss"
    NSDate* date                        = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/1000];
    NSString* result                    = [formatter stringFromDate:date];
    return result;
}

/**
 *  项目使用，根据该日期返回一个字符串
 *  当天显示：12：35；
 *  前一天显示：昨天；
 *  除当天和昨天的今年日期：7月6日
 *  今年之前的日期：2014年1月23日
 *  @return 返回字符串
 */
- (NSString *)ex_convertNSDate2String
{
    //比较和现在时间的差距
    NSDateFormatter *dateFormatter          = [[NSDateFormatter alloc] init];
    
    //格式化为当年
    [dateFormatter setDateFormat:@"yyyy"];
    NSString *theYear                       = [dateFormatter stringFromDate:self];//日期的年
    NSString *currentYear                   = [dateFormatter stringFromDate:[NSDate date]];//当前年
    
    //格式化成当天
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *theDay                        = [dateFormatter stringFromDate:self];//日期的年月日
    NSString *currentDay                    = [dateFormatter stringFromDate:[NSDate date]];//当前年月日
    
    if ([theDay isEqualToString:currentDay]) { //当天
        [dateFormatter setDateFormat:@"HH:mm"];
        return [dateFormatter stringFromDate:self];
    } else if ([[dateFormatter dateFromString:currentDay] timeIntervalSinceDate:[dateFormatter dateFromString:theDay]] == 86400) {//昨天
        return @"昨天";
    } else if ([theYear isEqualToString:currentYear]) { //当年
        [dateFormatter setDateFormat:@"MM月dd日"];
        return [dateFormatter stringFromDate:self];
    } else { //往年
        [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
        return [dateFormatter stringFromDate:self];
    }
}

/**
 *  项目使用，获取当前
 *
 *  @return 返回当前的日期和week
 */
+ (NSString *)ex_getDateAndWeek{
    NSArray *weekdays               = [NSArray arrayWithObjects:
                                       [NSNull null],
                                       @"星期日",
                                       @"星期一",
                                       @"星期二",
                                       @"星期三",
                                       @"星期四",
                                       @"星期五",
                                       @"星期六",
                                       nil];
    NSCalendar *calendar            = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps         = [[NSDateComponents alloc] init];
    NSInteger unitFlags             = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDate *now                     = [NSDate date];
    comps                           = [calendar components:unitFlags fromDate:now];
    return [NSString stringWithFormat:@"%li年%li月%li日 %@",(long)comps.year,(long)comps.month,(long)comps.day,[weekdays objectAtIndex:comps.weekday]];
}

@end
