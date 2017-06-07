//
//  UIColor+Extension.m
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

/**
 *  随机色（测试使用）
 *
 *  @return 随机的颜色
 */
+ (UIColor *)ex_randomColor
{
    CGFloat hue                 = ( arc4random() % 256 / 256.0 );
    CGFloat saturation          = ( arc4random() % 128 / 256.0 ) + 0.5;
    CGFloat brightness          = ( arc4random() % 128 / 256.0 ) + 0.5;
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


/**
 *  十六进制转color
 *
 *  @param color 0XFFFFFF 或 #FFFFFF 或 0xFFFFFF  0xFF FF FF
 *  @param alpha 0.0-1.0
 *
 *  @return 传入参数无效返回 clearcolor
 */
+ (UIColor *)ex_colorWithHexString:(NSString *)color
                             alpha:(CGFloat)alpha
{
    NSString *cString       = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }

    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString hasPrefix:@"0x"]
        || [cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end
