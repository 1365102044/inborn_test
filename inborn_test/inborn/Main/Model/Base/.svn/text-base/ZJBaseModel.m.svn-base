//
//  ZJBaseModel.m
//  Project
//
//  Created by 郑键 on 17/3/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJBaseModel.h"

@implementation ZJBaseModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return@{@"customId" : @"id"};
}

/**
 倒计时时间
 
 @return 返回倒计时字符串
 */
- (NSString *)countDownString
{
    NSDate *now                 = [NSDate date];
    NSCalendar *calendar        = [NSCalendar currentCalendar];
    
    /**
     *  比较时间
     */
    NSCalendarUnit unit         = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour |
    NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *cmps      = [calendar components:unit
                                              fromDate:[NSDate dateWithTimeIntervalSinceNow:self.surplusBidTime]
                                                toDate:now
                                               options:0];
    
    /**
     *  判断是否有天
     */
    if (cmps.day != 0) {
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",
                (long)self.surplusBidTime/86400,
                (long)self.surplusBidTime%86400/3600,
                (long)self.surplusBidTime%3600/60];
    }else{
        
        /**
         *  判断是否有小时
         */
        if (cmps.hour != 0) {
            return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",
                    (long)self.surplusBidTime%86400/3600,
                    (long)self.surplusBidTime%3600/60,
                    (long)self.surplusBidTime%60];
        }else{
            
            /**
             *  判断是否有分钟
             */
            if (cmps.minute != 0) {
                return [NSString stringWithFormat:@"%02ld:%02ld",
                        (long)self.surplusBidTime%3600/60,
                        (long)self.surplusBidTime%60];
            }else{
                return [NSString stringWithFormat:@"%02ld",
                        (long)self.surplusBidTime%60];
            }
        }
    }
}

@end
