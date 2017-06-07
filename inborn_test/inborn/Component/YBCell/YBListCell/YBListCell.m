//
//  YBListCell.m
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBListCell.h"
#import "YBAttributedStringLabel.h"
#import "YBFuncButtonView.h"

@interface YBListCell()

@end

@implementation YBListCell

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

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    self.bottomSpacingLineView.hidden = YES;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.statusLabel];
    [self.contentView addSubview:self.topMarginLineView];
    [self.contentView addSubview:self.goodImageView];
    [self.contentView addSubview:self.goodDescLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.amontLabel];
    [self.contentView addSubview:self.bottomMarginLineView];
    [self.contentView addSubview:self.otherFuncButtonView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.width.mas_equalTo(self.contentView).multipliedBy(0.6);
    }];
    
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.left.mas_equalTo(self.titleLabel.mas_right);
    }];
    
    [self.topMarginLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.left.mas_equalTo(self.titleLabel);
        make.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];

    [self.goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel);
        make.top.mas_equalTo(self.topMarginLineView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(66.f));
    }];

    [self.goodDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10.f));
        make.top.mas_equalTo(self.goodImageView);
        make.right.mas_equalTo(self.statusLabel);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(36.f));
    }];

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.goodDescLabel);
        make.top.mas_equalTo(self.goodDescLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(15.f));
        make.width.mas_equalTo(self.goodDescLabel).multipliedBy(0.6);
    }];

    [self.amontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.timeLabel);
        make.right.mas_equalTo(self.statusLabel);
        make.left.mas_equalTo(self.timeLabel.mas_right);
    }];

    [self.bottomMarginLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(self.topMarginLineView);
        make.top.mas_equalTo(self.goodImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
    }];

    [self.otherFuncButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.bottomMarginLineView.mas_bottom);
    }];
}

#pragma mark - Seventh.懒加载

- (YBFuncButtonView *)otherFuncButtonView
{
    if (!_otherFuncButtonView) {
        
        _otherFuncButtonView = [[YBFuncButtonView alloc] init];
        
    }
    return _otherFuncButtonView;
}

- (ZJBaseView *)bottomMarginLineView
{
    if (!_bottomMarginLineView) {
        
        _bottomMarginLineView = [[ZJBaseView alloc] init];
        _bottomMarginLineView.backgroundColor = ZJCOLOR.color_c16;
        
    }
    return _bottomMarginLineView;
}

- (YBAttributedStringLabel *)amontLabel
{
    if (!_amontLabel) {
        
        _amontLabel = [[YBAttributedStringLabel alloc] init];
        
    }
    return _amontLabel;
}

- (YBDefaultLabel *)timeLabel
{
    if (!_timeLabel) {
        
        _timeLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12.f)
                                              text:@""
                                         textColor:ZJCOLOR.color_c5];
        
    }
    return _timeLabel;
}

- (YBAttributedStringLabel *)goodDescLabel
{
    if (!_goodDescLabel) {
        
        _goodDescLabel = [[YBAttributedStringLabel alloc] init];
        
    }
    return _goodDescLabel;
}

- (ZJBaseImageView *)goodImageView
{
    if (!_goodImageView) {
        
        _goodImageView = [[ZJBaseImageView alloc] init];
        
    }
    return _goodImageView;
}

- (ZJBaseView *)topMarginLineView
{
    if (!_topMarginLineView) {
        
        _topMarginLineView = [[ZJBaseView alloc] init];
        _topMarginLineView.backgroundColor = ZJCOLOR.color_c16;
        
    }
    return _topMarginLineView;
}

- (YBDefaultLabel *)statusLabel
{
    if (!_statusLabel) {
        
        _statusLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12.f)
                                                text:@""
                                           textColor:ZJCOLOR.color_c6];
        _statusLabel.textAlignment = NSTextAlignmentRight;
    }
    return _statusLabel;
}

- (YBDefaultLabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12.f)
                                               text:@""
                                          textColor:ZJCOLOR.color_c5];
    }
    return _titleLabel;
}

@end
