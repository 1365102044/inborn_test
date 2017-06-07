//
//  YBOrderDetailAmontDetailCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailAmontDetailCell.h"
#import "YBAttributedStringLabel.h"
#import "YBStringTool.h"
#import "YBOrderDetailViewModel.h"

/**
 *  YBOrderDetailAmontDetailCell
 */
NSString * const YBOrderDetailAmontDetailCellReuseIdentifier = @"YBOrderDetailAmontDetailCellReuseIdentifier";

@interface YBOrderDetailAmontDetailCell()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *amontTitleLabel;
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

@implementation YBOrderDetailAmontDetailCell

- (void)setOrderDetailModel:(YBOrderDetailModel *)orderDetailModel
{
    [super setOrderDetailModel:orderDetailModel];
    
    /**
     *  根据数据配置界面
     */
    [self.titleDetailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                   @"content" : @"¥",
                                                                   @"size" : SYSTEM_REGULARFONT(12.f),
                                                                   @"lineSpacing": @0},
                                                                 @{@"color" : ZJCOLOR.color_c4,
                                                                   @"content" : [[YBStringTool share] strmethodCommaWith:orderDetailModel.orderTotalAmount ? orderDetailModel.orderTotalAmount : @""],
                                                                   @"size" : SYSTEM_REGULARFONT(13.f),
                                                                   @"lineSpacing": @0}]];
    self.freightDetailLabel.text = [NSString stringWithFormat:@"¥%@",
                                    [[YBStringTool share] strmethodCommaWith:[NSString stringWithFormat:@"%f", orderDetailModel.logisticsMoney.floatValue + orderDetailModel.insuredMoney.floatValue]]];
    self.activityDetailLabel.text = [NSString stringWithFormat:@"- ¥%@",
                                     [[YBStringTool share] strmethodCommaWith:orderDetailModel.discountMoney]];
    self.alreadyPaymentDetailLabel.text = [NSString stringWithFormat:@"- ¥%@",
                                           [[YBStringTool share] strmethodCommaWith:orderDetailModel.alreadyPayAmount]];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    /**
     *  配置界面
     */
    self.amontTitleLabel.textColor = ZJCOLOR.color_c4;
    self.amontTitleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.amontTitleLabel.text = ZJSTRING(@"订单总金额");
    
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

@end
