//
//  YBPaymentDeliveryTypeDefaultHeaderView.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentDeliveryTypeDefaultHeaderView.h"
#import "YBPaymentDliveryTypeModel.h"

@interface YBPaymentDeliveryTypeDefaultHeaderView()

@property (weak, nonatomic) IBOutlet ZJBaseView *topSpacingView;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (weak, nonatomic) IBOutlet ZJBaseView *bottomMarginLineView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpacingViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelTopCons;

@end

@implementation YBPaymentDeliveryTypeDefaultHeaderView

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setPaymentDeliveryTypeModel:(YBPaymentDliveryTypeModel *)paymentDeliveryTypeModel
{
    _paymentDeliveryTypeModel = paymentDeliveryTypeModel;
    
    self.titleLabel.text = paymentDeliveryTypeModel.title;
}


#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = ZJCOLOR.color_c0;
    self.bottomMarginLineView.backgroundColor = ZJCOLOR.color_c16;
    self.topSpacingView.backgroundColor = ZJCOLOR.color_c12;
    
    self.titleLabel.textColor = ZJCOLOR.color_c4;
    self.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.topSpacingViewHeightCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    self.labelTopCons.constant = ADJUST_PERCENT_FLOAT(16.f);
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
