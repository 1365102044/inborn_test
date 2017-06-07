//
//  YBPaymentDeliveryTypeTipsCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentDeliveryTypeTipsCell.h"
#import "YBAttributedStringLabel.h"
#import "YBPaymentDliveryTypeModel.h"

@interface YBPaymentDeliveryTypeTipsCell()

@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *tipsLabel;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *marginConsArray;

@end

@implementation YBPaymentDeliveryTypeTipsCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setPaymentDeliveryTypeModel:(YBPaymentDliveryTypeModel *)paymentDeliveryTypeModel
{
    [super setPaymentDeliveryTypeModel:paymentDeliveryTypeModel];
    
    [self.tipsLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                            @"content" : paymentDeliveryTypeModel.title,
                                                            @"size" : SYSTEM_REGULARFONT(12.f),
                                                            @"lineSpacing": @8}]];
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)awakeFromNib
{
    [super awakeFromNib];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载



@end
