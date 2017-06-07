//
//  YBOrderDetailStatusCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailStatusCell.h"
#import "YBAttributedStringLabel.h"
#import "YBOrderDetailViewModel.h"

/**
 *  YBOrderDetailStatusCell
 */
NSString * const YBOrderDetailStatusCellReuseIdentifier = @"YBOrderDetailStatusCellReuseIdentifier";

@interface YBOrderDetailStatusCell()

/**
 titleLabel
 */
@property (nonatomic, strong) YBDefaultLabel *statustitleLabel;

/**
 detailLabel
 */
@property (nonatomic, strong) YBAttributedStringLabel *detailLabel;

@end

@implementation YBOrderDetailStatusCell

- (void)conutDown:(NSNotification *)no
{
    NSDictionary *dict = no.userInfo;
    NSString *string = [self.orderDetailModel.detailTitle stringByReplacingOccurrencesOfString:@"   " withString:dict[@"countDownString"]];
    YBLog(@"%@\n%@", dict, string);
    [self.detailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : string ? string : @"值为空",
                                                              @"size" : SYSTEM_REGULARFONT(14.f),
                                                              @"lineSpacing": @11.f,
                                                              @"alignment":@"1"}]];
    
}

- (void)setOrderDetailModel:(YBOrderDetailModel *)orderDetailModel
{
    [super setOrderDetailModel:orderDetailModel];
    
    self.statustitleLabel.text = orderDetailModel.title;
    [self.detailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : orderDetailModel.detailTitle ? orderDetailModel.detailTitle : @" ",
                                                              @"size" : SYSTEM_REGULARFONT(14.f),
                                                              @"lineSpacing": @11.f,
                                                              @"alignment":@"1"}]];
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
    [self.contentView addSubview:self.statustitleLabel];
    [self.contentView addSubview:self.detailLabel];
    
    [self.statustitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(27.f));
        make.left.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(22.f));
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.statustitleLabel);
        make.top.mas_equalTo(self.statustitleLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(17.f));
        make.bottom.mas_greaterThanOrEqualTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-27.f));
    }];
    
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(conutDown:)
                                      name:ORDER_ORDERDETAIL_NOTIFICATION
                                    object:nil];
}

- (void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:ORDER_ORDERDETAIL_NOTIFICATION object:nil];
}

- (YBDefaultLabel *)statustitleLabel
{
    if (!_statustitleLabel) {
        _statustitleLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(22.f)
                                                     text:@"已付款"
                                                textColor:ZJCOLOR.color_c4];
        _statustitleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _statustitleLabel;
}

- (YBAttributedStringLabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[YBAttributedStringLabel alloc] init];
        _detailLabel.text = ZJSTRING(@"平台xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        _detailLabel.numberOfLines = 0;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.backgroundColor = [UIColor clearColor];
    }
    return _detailLabel;
}

@end
