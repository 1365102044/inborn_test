//
//  YBCertificationResultDefaultCell.m
//  inborn
//
//  Created by 郑键 on 17/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertificationResultDefaultCell.h"

@interface YBCertificationResultDefaultCell()

@end

@implementation YBCertificationResultDefaultCell

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
    }];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.titleLabel.textColor = ZJCOLOR.color_c4;
    self.funcButton.hidden = YES;
    self.accessImageView.hidden = YES;
    
    [self.contentView addSubview:self.detailLabel];
}

- (YBDefaultLabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13.f)
                                                text:@"测试"
                                           textColor:ZJCOLOR.color_c4];
    }
    return _detailLabel;
}

@end
