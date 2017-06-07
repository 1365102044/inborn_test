//
//  YBDefaultTableViewCell.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBDefaultTableViewCell.h"

@implementation YBDefaultTableViewCell

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    YBLog(@"%@", sender);
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

#pragma mark - Sixth.界面配置

/**
 配置UI界面
 */
- (void)setupCustomUI
{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.funcButton];
    [self.contentView addSubview:self.accessImageView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ADJUST_PERCENT_FLOAT(12.f));
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.funcButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(3.f));
        make.centerY.mas_equalTo(self.titleLabel);
        make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(16.f));
    }];
    
    [self.accessImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-10.f));
        make.centerY.mas_equalTo(self.contentView);
        make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(22.f));
    }];
}

#pragma mark - Seventh.懒加载

- (YBDefaultLabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel                             = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14.f)
                                                                           text:@"测试文字"
                                                                      textColor:ZJCOLOR.color_c4];
    }
    return _titleLabel;
}

- (YBDefaultButton *)funcButton
{
    if (!_funcButton) {
        _funcButton                             = [YBDefaultButton buttonImageWithImageFilePath:@""
                                                                                     imageNamed:@""
                                                                                           type:ZJProjectButtonSetImageDefault
                                                                                         target:self
                                                                                       selector:@selector(buttonClick:)];
    }
    return _funcButton;
}

- (ZJBaseImageView *)accessImageView
{
    if (!_accessImageView) {
        _accessImageView                        = [[ZJBaseImageView alloc] init];
        _accessImageView.image                  = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC,
                                                                 @"public_moreitem_n",
                                                                 ZJProjectLoadImageDefault);
    }
    return _accessImageView;
}
@end
