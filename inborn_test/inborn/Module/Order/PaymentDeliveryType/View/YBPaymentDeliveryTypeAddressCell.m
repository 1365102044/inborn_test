//
//  YBPaymentDeliveryTypeAddressCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentDeliveryTypeAddressCell.h"
#import "YBAttributedStringLabel.h"
#import "YBPublicConfigure_LocalData.h"

@interface YBPaymentDeliveryTypeAddressCell()

@property (weak, nonatomic) IBOutlet ZJBaseView *bgView;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *addressLabel;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *bgMarginConsArray;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *addressLabelMarginConsArray;

@end

@implementation YBPaymentDeliveryTypeAddressCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setPaymentDeliveryTypeModel:(YBPaymentDliveryTypeModel *)paymentDeliveryTypeModel
{
    [super setPaymentDeliveryTypeModel:paymentDeliveryTypeModel];
    
    YBPublicConfigure_LocalData *publickLocalData = [[YBPublicConfigure_LocalData alloc] init];
    [self.addressLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                               @"content" : [NSString stringWithFormat:@"自提地址：%@\n贵宾专线：%@\n营业时间：%@",
                                                                             publickLocalData.consigneeAddress,
                                                                             publickLocalData.consigneePhone,
                                                                             publickLocalData.businessTime],
                                                               @"size" : SYSTEM_REGULARFONT(13.f),
                                                               @"lineSpacing": @(ADJUST_PERCENT_FLOAT(10.f))}]];
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.bgView.backgroundColor = ZJCOLOR.color_c18;
    
    [self.addressLabelMarginConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                   NSUInteger idx,
                                                                   BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(12.f);
    }];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
