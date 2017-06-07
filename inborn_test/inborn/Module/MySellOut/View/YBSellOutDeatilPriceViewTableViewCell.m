//
//  YBSellOutDeatilPriceViewTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSellOutDeatilPriceViewTableViewCell.h"
#import "YBStringTool.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "YBAttributedStringLabel.h"
@interface YBSellOutDeatilPriceViewTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *orderallpriceleftlable;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *orderallpricerightlable;

@property (weak, nonatomic) IBOutlet UILabel *shouxuMoneyleftlable;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *shouxumoneyrightlable;

@property (weak, nonatomic) IBOutlet UILabel *discountleftlable;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *discountrightlable;

@property (weak, nonatomic) IBOutlet UILabel *shouldpaymentleftlable;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *shouldpaymentrightlable;

@end

@implementation YBSellOutDeatilPriceViewTableViewCell

-(void)setDataModel:(YBMySellOutModel *)dataModel
{
    _dataModel = dataModel;
    
    self.shouxuMoneyleftlable.text = [NSString stringWithFormat:@"平台服务费 (%ld%%)",[dataModel.commissionRatio integerValue]/100];
    
    /**
     订单总金额
     */
    [self.orderallpricerightlable setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : @"¥",
                                                              @"size" : SYSTEM_REGULARFONT(12.f),
                                                              @"lineSpacing": @0},
                                                            @{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : [[YBStringTool share] strmethodCommaWith:dataModel.orderTotalAmount ? dataModel.orderTotalAmount : @" "],
                                                              @"size" : SYSTEM_REGULARFONT(14.f),
                                                              @"lineSpacing": @0}]];
    
    /**
    平台服务费金额
     */
    [self.shouxumoneyrightlable setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                                          @"content" : @"-¥",
                                                                          @"size" : SYSTEM_REGULARFONT(11.f),
                                                                          @"lineSpacing": @0},
                                                                        @{@"color" : ZJCOLOR.color_c5,
                                                                          @"content" : [[YBStringTool share] strmethodCommaWith:dataModel.platformServiceAmount ? dataModel.platformServiceAmount : @" "],
                                                                          @"size" : SYSTEM_REGULARFONT(12.f),
                                                                          @"lineSpacing": @0}]];
    
    /**
    活动优惠金额
     */
    [self.discountrightlable setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                                          @"content" : @"-¥",
                                                                          @"size" : SYSTEM_REGULARFONT(11.f),
                                                                          @"lineSpacing": @0},
                                                                        @{@"color" : ZJCOLOR.color_c5,
                                                                          @"content" : [[YBStringTool share] strmethodCommaWith:dataModel.discountMoney ? dataModel.discountMoney : @" "],
                                                                          @"size" : SYSTEM_REGULARFONT(12.f),
                                                                          @"lineSpacing": @0}]];
    
    /**
     实收金额
     */
    [self.shouldpaymentrightlable setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                     @"content" : @"¥",
                                                                     @"size" : SYSTEM_REGULARFONT(12.f),
                                                                     @"lineSpacing": @0},
                                                                   @{@"color" : ZJCOLOR.color_c4,
                                                                     @"content" : [[YBStringTool share] strmethodCommaWith:dataModel.receiveAmount ? dataModel.receiveAmount : @" "],
                                                                     @"size" : SYSTEM_REGULARFONT(14.f),
                                                                     @"lineSpacing": @0}]];
    self.orderallpricerightlable.textAlignment = NSTextAlignmentRight;
    self.shouxumoneyrightlable.textAlignment = NSTextAlignmentRight;
    self.discountrightlable.textAlignment = NSTextAlignmentRight;
    self.shouldpaymentrightlable.textAlignment = NSTextAlignmentRight;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.orderallpriceleftlable.text = ZJSTRING(@"订单总金额");
    self.orderallpriceleftlable.textColor = ZJCOLOR.color_c4;
    self.orderallpriceleftlable.font = SYSTEM_REGULARFONT(14);
    self.orderallpricerightlable.textColor = ZJCOLOR.color_c4;
    self.orderallpricerightlable.font = SYSTEM_REGULARFONT(14);

    
    self.shouxuMoneyleftlable.text = ZJSTRING(@"平台服务费（7%）");
    self.shouxuMoneyleftlable.textColor = ZJCOLOR.color_c5;
    self.shouxuMoneyleftlable.font = SYSTEM_REGULARFONT(12);
    self.shouxumoneyrightlable.textColor = ZJCOLOR.color_c5;
    self.shouxumoneyrightlable.font = SYSTEM_REGULARFONT(12);
    
    self.discountleftlable.text = ZJSTRING(@"活动优惠（免鉴定费）");
    self.discountleftlable.textColor = ZJCOLOR.color_c5;
    self.discountleftlable.font = SYSTEM_REGULARFONT(12);
    self.discountrightlable.textColor = ZJCOLOR.color_c5;
    self.discountrightlable.font = SYSTEM_REGULARFONT(12);
    
    self.shouldpaymentleftlable.text = ZJSTRING(@"实收金额");
    self.shouldpaymentleftlable.textColor = ZJCOLOR.color_c4;
    self.shouldpaymentleftlable.font = SYSTEM_REGULARFONT(14);
    self.shouldpaymentrightlable.textColor = ZJCOLOR.color_c4;
    self.shouldpaymentrightlable.font = SYSTEM_REGULARFONT(14);
    

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"YBSellOutDeatilPriceViewTableViewCell" owner:nil options:nil].lastObject;
    }
    return self;
}
@end
