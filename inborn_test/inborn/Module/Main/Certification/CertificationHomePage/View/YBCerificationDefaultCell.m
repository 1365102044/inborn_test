//
//  YBCerificationDefaultCell.m
//  inborn
//
//  Created by 郑键 on 17/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCerificationDefaultCell.h"

@interface YBCerificationDefaultCell()

@end

@implementation YBCerificationDefaultCell

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
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.titleLabel.textColor = ZJCOLOR.color_c4;
}

#pragma mark - Seventh.懒加载

@end
