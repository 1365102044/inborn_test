//
//  UIColor+Extension.h
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 *  随机色（测试使用）
 *
 *  @return 随机的颜色
 */
+ (UIColor *)ex_randomColor;

/**
 *  十六进制转color
 *
 *  @param color 0XFFFFFF 或 #FFFFFF 或 0xFFFFFF  0xFF FF FF
 *  @param alpha 0.0-1.0
 *
 *  @return 传入参数无效返回 clearcolor
 */
+ (UIColor *)ex_colorWithHexString:(NSString *)color
                             alpha:(CGFloat)alpha;

@end
