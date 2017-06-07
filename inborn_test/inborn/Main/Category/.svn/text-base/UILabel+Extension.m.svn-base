//
//  UILabel+Extension.m
//  inborn
//
//  Created by 郑键 on 17/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
/**
 *  设置行距
 */
- (void)setRowSpace:(CGFloat)rowSpace
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = rowSpace;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}
@end
