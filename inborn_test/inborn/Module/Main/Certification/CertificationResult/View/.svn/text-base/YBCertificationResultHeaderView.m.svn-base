//
//  YBCertificationResultHeaderView.m
//  inborn
//
//  Created by 郑键 on 17/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertificationResultHeaderView.h"

@implementation YBCertificationResultHeaderView

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupCustomUI];
    }
    return self;
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    _titleLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14.f)
                                           text:@"实名认证状态"
                                      textColor:ZJCOLOR.color_c0];
    _titleLabel.backgroundColor = ZJCOLOR.color_c6;
    [self.contentView addSubview:_titleLabel];
    
    ZJBaseImageView *logoImageView = [[ZJBaseImageView alloc] init];
    logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                         @"authentication_photo_bg",
                                         ZJProjectLoadImageDefault);
    [self.contentView addSubview:logoImageView];
    
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(26.f));
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(104.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(109.f));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(logoImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(16.f));
        make.centerX.mas_equalTo(logoImageView);
    }];
    
    ZJBaseView *bgView = [[ZJBaseView alloc] init];
    bgView.backgroundColor = ZJCOLOR.color_c6;
    self.backgroundView = bgView;
}

#pragma mark - Seventh.懒加载

@end
