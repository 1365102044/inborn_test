//
//  YBOrderDetailPickAddressCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailPickAddressCell.h"
#import "YBAttributedStringLabel.h"
#import "YBOrderDetailModel.h"

/**
 *  YBOrderDetailPickAddressCell
 */
NSString * const YBOrderDetailPickAddressCellReuseIdentifier = @"YBOrderDetailPickAddressCellReuseIdentifier";

@interface YBOrderDetailPickAddressCell()

/**
 titleLabel
 */
@property (nonatomic, strong) YBDefaultLabel *pickupTitleLabel;

/**
 内容label
 */
@property (nonatomic, strong) YBAttributedStringLabel *contentLabel;

@end

@implementation YBOrderDetailPickAddressCell

- (void)setOrderDetailModel:(YBOrderDetailModel *)orderDetailModel
{
    [super setOrderDetailModel:orderDetailModel];
    
    self.pickupTitleLabel.text = ZJSTRING(@"提货人信息");
    NSString *idCard;
    if ([orderDetailModel.addrIdcard isKindOfClass:[NSNull class]]
        || [orderDetailModel.addrIdcard isEqualToString:@"(null)"]
        || !orderDetailModel.addrIdcard) {
        idCard = @"";
    }else{
        idCard = orderDetailModel.addrIdcard;
    }
    NSString *contentString = [NSString stringWithFormat:@"%@  %@\n%@",
                               orderDetailModel.addrName,
                               orderDetailModel.addrMobile,
                               idCard];
    [self.contentLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                               @"content" : contentString,
                                                               @"size" : SYSTEM_REGULARFONT(12.f),
                                                               @"lineSpacing": @(ADJUST_PERCENT_FLOAT(10.f))}]];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)setupCustomUI
{
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.pickupTitleLabel];
    
    [self.pickupTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(19.f));
        make.left.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(13.f));
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.pickupTitleLabel);
        make.top.mas_equalTo(self.pickupTitleLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(14.f));
        make.bottom.mas_greaterThanOrEqualTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-1.f));
    }];
}

- (YBDefaultLabel *)pickupTitleLabel
{
    if (!_pickupTitleLabel) {
        _pickupTitleLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13.f)
                                                     text:@"配送方式："
                                                textColor:ZJCOLOR.color_c4];
    }
    return _pickupTitleLabel;
}

- (YBAttributedStringLabel *)contentLabel
{
    if (!_contentLabel) {
        
        _contentLabel = [[YBAttributedStringLabel alloc] init];
        [_contentLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                               @"content" : @"自提地址：\n贵宾专线：\n营业时间：",
                                                               @"size" : SYSTEM_LIGHTFONT(13.f),
                                                               @"lineSpacing": @10}]];
    }
    return _contentLabel;
}

@end
