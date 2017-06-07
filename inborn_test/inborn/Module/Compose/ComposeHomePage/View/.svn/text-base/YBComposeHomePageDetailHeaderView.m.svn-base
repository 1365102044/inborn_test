//
//  YBComposeHomePageDetailHeaderView.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageDetailHeaderView.h"
#import "YBPlaceHolderTextView.h"

/**
 *  detailHeader
 */
NSString * const YBComposeHomePageDetailHeaderViewReuseIdentifier        = @"YBComposeHomePageDetailHeaderViewReuseIdentifier";

@interface YBComposeHomePageDetailHeaderView()

/**
 描述输入框
 */
@property (nonatomic, strong) YBPlaceHolderTextView *detailTextView;

@end

@implementation YBComposeHomePageDetailHeaderView

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setUserInputText:(NSString *)userInputText
{
    _userInputText = userInputText;
    
    self.detailTextView.text = userInputText;
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.detailTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [self addSubview:self.detailTextView];
}

#pragma mark - Seventh.懒加载

- (YBPlaceHolderTextView *)detailTextView
{
    if (!_detailTextView) {
        _detailTextView                 = [[YBPlaceHolderTextView alloc] init];
        _detailTextView.placeholderFont = SYSTEM_REGULARFONT(12.f);
        _detailTextView.placeholderColor = ZJCOLOR.color_c5;
        _detailTextView.lineMargin = 10.f;
        _detailTextView.placeholder = @"描述一下你的宝贝吧：\n如是否有破损等";
    }
    return _detailTextView;
}

@end
