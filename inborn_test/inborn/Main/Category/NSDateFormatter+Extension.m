//
//  NSDateFormatter+Extension.m
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "NSDateFormatter+Extension.h"

@implementation NSDateFormatter (Extension)

/**
 *  根据时间格式实例化formatter对象
 *
 *  @param dateFormat 时间格式 如：yyyy-MM-dd HH:mm
 *
 *  @return 标准时间格式
 */
+ (instancetype)ex_dateFormatterWithFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter  = [[self alloc] init];
    dateFormatter.dateFormat        = dateFormat;
    return dateFormatter;
}

@end
