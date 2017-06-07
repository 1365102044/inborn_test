//
//  YBSelectedListAlertCell.m
//  inborn
//
//  Created by 郑键 on 17/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSelectedListAlertCell.h"
#import "YBSelectedListAlertModel.h"

@interface YBSelectedListAlertCell()

/**
 titleLabel
 */
@property (nonatomic, strong) ZJBaseLabel *titleLabel;

/**
 iconImageView
 */
@property (nonatomic, strong) ZJBaseImageView *iconImageView;

/**
 bgView
 */
@property (nonatomic, strong) ZJBaseView *bgView;

@end

@implementation YBSelectedListAlertCell

- (void)setAlertModel:(YBSelectedListAlertModel *)alertModel
{
    _alertModel = alertModel;
    
    self.titleLabel.text                    = alertModel.titleString;
    self.iconImageView.image                = alertModel.iconImage;
    
    self.alertModel.selected ? [self resetSubViewsStatusWithTextColor:ZJCOLOR.color_c6
                                                                 font:SYSTEM_REGULARFONT(13.f)
                                                      backgroundColor:ZJCOLOR.color_c18] :
    [self resetSubViewsStatusWithTextColor:ZJCOLOR.color_c5
                                      font:SYSTEM_LIGHTFONT(13.f)
                           backgroundColor:ZJCOLOR.color_c0];
}

- (void)resetSubViewsStatusWithTextColor:(UIColor *)textColor
                                    font:(UIFont *)font
                         backgroundColor:(UIColor *)backgroundColor
{
    self.titleLabel.textColor = textColor;
    self.titleLabel.font = font;
    self.bgView.backgroundColor = backgroundColor;
    self.titleLabel.backgroundColor = self.bgView.backgroundColor;
    if (self.alertModel.selected) {
        self.iconImageView.alpha = 1.f;
    }else{
        self.iconImageView.alpha = 0.f;
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)setupCustomUI
{
    self.backgroundView         = self.bgView;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.iconImageView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-20.f));
        make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(20.f));
    }];
    
    self.bottomSpacingLineView.hidden = YES;
}

- (ZJBaseLabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel             = [[ZJBaseLabel alloc] init];
        _titleLabel.textColor   = ZJCOLOR.color_c5;
        _titleLabel.font        = SYSTEM_LIGHTFONT(13.f);
    }
    return _titleLabel;
}

- (ZJBaseImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView          = [[ZJBaseImageView alloc] init];
        _iconImageView.image    = ZJCURRENTIMAGE(IMAGEFILEPATH_SCREEN,
                                                 @"screen_selected_icon",
                                                 ZJProjectLoadImageDefault);
        _iconImageView.alpha   = 0.f;
    }
    return _iconImageView;
}

- (ZJBaseView *)bgView
{
    if (!_bgView) {
        _bgView                 = [[ZJBaseView alloc] init];
    }
    return _bgView;
}

@end
