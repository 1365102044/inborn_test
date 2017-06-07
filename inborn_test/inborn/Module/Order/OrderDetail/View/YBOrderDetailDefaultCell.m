//
//  YBOrderDetailDefaultCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailDefaultCell.h"
#import "YBOrderDetailViewModel.h"
#import "YBAttributedStringLabel.h"

/**
 *  YBOrderDetailDefaultCell
 */
NSString * const YBOrderDetailDefaultCellReuseIdentifier = @"YBOrderDetailDefaultCellReuseIdentifier";

@interface YBOrderDetailDefaultCell()

/**
 detailLabel
 */
@property (nonatomic, strong) YBAttributedStringLabel *detailTitleLabel;

@end

@implementation YBOrderDetailDefaultCell

- (void)setOrderDetailModel:(YBOrderDetailModel *)orderDetailModel
{
    [super setOrderDetailModel:orderDetailModel];
    
    self.detailTitleLabel.hidden = !orderDetailModel.showDetailLabel;
    self.accessImageView.hidden = !orderDetailModel.showAccessImageView;
    self.bottomSpacingLineView.hidden = orderDetailModel.hiddenBottomMarginLine;
    
    YBLog(@"%zd", orderDetailModel.showAccessImageView);
    
    if (orderDetailModel.showDetailLabel) {
        self.detailTitleLabel.text = orderDetailModel.detailTitle;
    }
    
    if (orderDetailModel.showAccessImageView) {
        [self.detailTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(ADJUST_PERCENT_FLOAT(-38.f)));
        }];
    }else{
        [self.detailTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(ADJUST_PERCENT_FLOAT(-12.f)));
        }];
    }
    
    if (orderDetailModel.showAmont) {
        [self.detailTitleLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                       @"content" : @"¥",
                                                                       @"size" : SYSTEM_REGULARFONT(12.f),
                                                                       @"lineSpacing": @0},
                                                                     @{@"color" : ZJCOLOR.color_c4,
                                                                       @"content" : orderDetailModel.detailTitle ? orderDetailModel.detailTitle : @" ",
                                                                       @"size" : SYSTEM_REGULARFONT(13.f),
                                                                       @"lineSpacing": @0}]];
    }else{
        [self.detailTitleLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                       @"content" : orderDetailModel.detailTitle ? orderDetailModel.detailTitle : @" ",
                                                                       @"size" : SYSTEM_REGULARFONT(13.f),
                                                                       @"lineSpacing": @0}]];
        
    }
    
    if (orderDetailModel.showTime) {
        self.titleLabel.font = SYSTEM_REGULARFONT(12.f);
        self.titleLabel.textColor = ZJCOLOR.color_c5;
        self.titleLabel.text = orderDetailModel.title;
    }else{
        self.titleLabel.font = SYSTEM_REGULARFONT(14.f);
        self.titleLabel.textColor = ZJCOLOR.color_c4;
        self.titleLabel.text = orderDetailModel.title;
    }
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
    [super setupCustomUI];
    
    self.accessImageView.hidden = YES;
    
    [self.contentView addSubview:self.detailTitleLabel];
    [self.detailTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
    }];
}

- (YBAttributedStringLabel *)detailTitleLabel
{
    if (!_detailTitleLabel) {
        _detailTitleLabel = [[YBAttributedStringLabel alloc] init];
    }
    return _detailTitleLabel;
}

@end
