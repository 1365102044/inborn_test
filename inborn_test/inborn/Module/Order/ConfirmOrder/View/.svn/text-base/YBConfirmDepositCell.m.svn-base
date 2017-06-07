//
//  YBConfirmDepositCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmDepositCell.h"
#import "YBAttributedStringLabel.h"
#import "YBConfirmOrderModel.h"
#import "YBStringTool.h"

/**
 *  YBConfirmDepositCell
 */
NSString * const YBConfirmDepositCellReuseIdentifier                             = @"YBConfirmDepositCellReuseIdentifier";

@interface YBConfirmDepositCell()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *detailLabel;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *depositLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailLabelLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;

@end

@implementation YBConfirmDepositCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel
{
    [super setConfirmOrderModel:confirmOrderModel];
    
    /**
     *  根据数据配置界面
     */
    [self.depositLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                               @"content" : @"¥",
                                                               @"size" : SYSTEM_REGULARFONT(12.f),
                                                               @"lineSpacing": @0},
                                                             @{@"color" : ZJCOLOR.color_c4,
                                                               @"content" : [[YBStringTool share] strmethodCommaWith:confirmOrderModel.depositPrice],
                                                               @"size" : SYSTEM_REGULARFONT(13.f),
                                                               @"lineSpacing": @0}]];
    
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    /**
     *  配置界面
     */
    self.titleLabel.textColor = ZJCOLOR.color_c4;
    self.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.titleLabel.text = ZJSTRING(@"需付定金");
    
    self.detailLabel.textColor = ZJCOLOR.color_c5;
    self.detailLabel.font = SYSTEM_REGULARFONT(12.f);
    self.detailLabel.text = ZJSTRING(@"下单后需在48小时之内支付尾款");
    
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.detailLabelLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
