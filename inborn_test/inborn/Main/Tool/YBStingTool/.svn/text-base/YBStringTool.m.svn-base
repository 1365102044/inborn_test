//
//  YBStringTool.m
//  inborn
//
//  Created by 刘文强 on 2017/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBStringTool.h"

@implementation YBStringTool

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static YBStringTool *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YBStringTool alloc]init];
    });
    return instance;
}

/**
 金额 逗号 分割(内部 分->元)
 */
-(NSString*)strmethodCommaWith:(NSString *)price
{
    NSString *tempricestr;
    if (price==nil) return nil;
    if ([price isKindOfClass:[NSString class]]) {
        tempricestr = [NSString stringWithFormat:@"%.2f",[price floatValue]/100];
    }else {
        tempricestr = [NSString stringWithFormat:@"%@",price];
    }
    NSMutableString *pricestr = tempricestr.mutableCopy;
    NSRange range = [pricestr rangeOfString:@"."];
    NSInteger index = 0;
    if (range.length >0) {
        
        index = range.location;
    }else{
        
        index = pricestr.length;
    }
    while ((index-3) > 0) {
        index-=3;
        [pricestr insertString:@"," atIndex:index];
    }
    return pricestr;
}

/**
 打电话
 */
+(void)CallPhoneWith:(UIView*)backview phone:(NSString *)phone
{
    //打开电话
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [backview addSubview:callWebview];

}


/**
 获取到的毫秒->需要到时间格式
 timestyle 时间格式 字符 @“yyyy-MM-dd hh:mm”
 */
- (NSString *)returnTimeStrformeTimestr:(NSString *)str timestyle:(NSString *)timestyle
{
    NSDate *timedate = [NSDate dateWithTimeIntervalSince1970:([str doubleValue] / 1000.0)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:timestyle];
    NSString *time = [formatter stringFromDate:timedate];
    return time;
}
@end
