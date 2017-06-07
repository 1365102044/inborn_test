//
//  YBConfirmOrderAmontDetailCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmOrderAmontDetailCell.h"
#import "YBAttributedStringLabel.h"
#import "YBConfirmOrderModel.h"
#import "YBStringTool.h"

/**
 *  YBConfirmOrderAmontDetailCell
 */
NSString * const YBConfirmOrderAmontDetailCellReuseIdentifier                    = @"YBConfirmOrderAmontDetailCellReuseIdentifier";

@interface YBConfirmOrderAmontDetailCell()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *titleDetailLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *freightLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *freightDetailLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *activityLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *activityDetailLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *alreadyPaymentLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *alreadyPaymentDetailLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelLeftSpacingCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSpacingCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *freightLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *freigHtLabelLeftMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *activityAndAlreadyLabelMarginConsArray;


@end

@implementation YBConfirmOrderAmontDetailCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel
{
    [super setConfirmOrderModel:confirmOrderModel];
    
    /**
     *  根据数据配置界面
     */
    [self.titleDetailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                   @"content" : @"¥",
                                                                   @"size" : SYSTEM_REGULARFONT(12.f),
                                                                   @"lineSpacing": @0},
                                                                 @{@"color" : ZJCOLOR.color_c4,
                                                                   @"content" : [[YBStringTool share] strmethodCommaWith:confirmOrderModel.mallPrice ? confirmOrderModel.mallPrice : @""],
                                                                   @"size" : SYSTEM_REGULARFONT(13.f),
                                                                   @"lineSpacing": @0}]];
    self.freightDetailLabel.text = [NSString stringWithFormat:@"+ ¥%@",
                                    [[YBStringTool share] strmethodCommaWith:[NSString stringWithFormat:@"%f", confirmOrderModel.logisticsMoney.floatValue + confirmOrderModel.insuredMoney.floatValue]]];
    self.activityDetailLabel.text = [NSString stringWithFormat:@"- ¥%@",
                                     [[YBStringTool share] strmethodCommaWith:confirmOrderModel.discountMoney]];
    self.alreadyPaymentDetailLabel.text = [NSString stringWithFormat:@"- ¥%@",
                                           [[YBStringTool share] strmethodCommaWith:confirmOrderModel.alreadyPayAmount]];
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
    self.titleLabel.text = ZJSTRING(@"商品总金额");
    
    self.freightLabel.textColor = ZJCOLOR.color_c5;
    self.freightLabel.font = SYSTEM_REGULARFONT(12.f);
    self.freightLabel.text = ZJSTRING(@"运费（含商品保价费）");
    self.freightDetailLabel.textColor = ZJCOLOR.color_c5;
    self.freightDetailLabel.font = SYSTEM_REGULARFONT(12.f);
    
    self.activityLabel.textColor = ZJCOLOR.color_c5;
    self.activityLabel.font = SYSTEM_REGULARFONT(12.f);
    self.activityLabel.text = ZJSTRING(@"活动优惠（包邮）");
    self.activityDetailLabel.textColor = ZJCOLOR.color_c5;
    self.activityDetailLabel.font = SYSTEM_REGULARFONT(12.f);
    
    self.alreadyPaymentLabel.textColor = ZJCOLOR.color_c5;
    self.alreadyPaymentLabel.font = SYSTEM_REGULARFONT(12.f);
    self.alreadyPaymentLabel.text = ZJSTRING(@"已付金额（包邮）");
    self.alreadyPaymentDetailLabel.textColor = ZJCOLOR.color_c5;
    self.alreadyPaymentDetailLabel.font = SYSTEM_REGULARFONT(12.f);
    
    self.titleLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(20.f);
    self.titleLabelLeftSpacingCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.rightSpacingCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.freightLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(16.f);
    self.freigHtLabelLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(27.f);
    [self.activityAndAlreadyLabelMarginConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                              NSUInteger idx,
                                                                              BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(12.f);
    }];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
