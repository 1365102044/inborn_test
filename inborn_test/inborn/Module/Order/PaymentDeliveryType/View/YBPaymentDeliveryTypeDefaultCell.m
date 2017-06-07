//
//  YBPaymentDeliveryTypeDefaultCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentDeliveryTypeDefaultCell.h"
#import "YBPaymentDliveryTypeModel.h"

@interface YBPaymentDeliveryTypeDefaultCell()

@end

@implementation YBPaymentDeliveryTypeDefaultCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setPaymentDeliveryTypeModel:(YBPaymentDliveryTypeModel *)paymentDeliveryTypeModel
{
    [super setPaymentDeliveryTypeModel:paymentDeliveryTypeModel];
    
    /**
     *  界面赋值
     */
    [self.titleButton setTitle:paymentDeliveryTypeModel.title
                      forState:UIControlStateNormal];
    [self.titleButton setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_SCREEN,
                                                @"screen_selected_btn",
                                                 ZJProjectLoadImageDefault).firstObject forState:UIControlStateNormal];
    [self.titleButton setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_SCREEN,
                                                 @"screen_selected_btn",
                                                 ZJProjectLoadImageDefault).lastObject forState:UIControlStateSelected];
    self.titleButton.selected = paymentDeliveryTypeModel.isSelected;
}

#pragma mark - Third.点击事件

- (IBAction)buttonClick:(ZJBaseButton *)sender
{
    sender.selected = !sender.selected;
    self.paymentDeliveryTypeModel.isSelected = sender.selected;
    self.titleButton.titleLabel.font = sender.selected ? SYSTEM_REGULARFONT(12.f) : SYSTEM_LIGHTFONT(12.f);
    
    if ([self.delegate respondsToSelector:@selector(paymentDeliveryTypeBaseCell:button:)]) {
        [self.delegate paymentDeliveryTypeBaseCell:self button:sender];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    /**
     *  配置界面
     */
    self.titleButton.titleLabel.font = SYSTEM_LIGHTFONT(12.f);
    [self.titleButton setTitleColor:ZJCOLOR.color_c17
                           forState:UIControlStateNormal];
    [self.titleButton setTitleColor:ZJCOLOR.color_c6
                           forState:UIControlStateSelected];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
