//
//  YBGoodListViewCell.m
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListViewCell.h"
#import "YBAttributedStringLabel.h"

@interface YBGoodListViewCell()

/**
 图片
 */
@property (nonatomic, strong) ZJBaseImageView *goodImageView;

/**
 商品名称
 */
@property (nonatomic, strong) ZJBaseLabel *titleLabel;

/**
 描述Label
 */
@property (nonatomic, strong) YBAttributedStringLabel *detailAttributedStringLabel;

@end

@implementation YBGoodListViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)setupCustomUI
{
    ZJBaseView *bottomView                  = [[ZJBaseView alloc] init];
    [bottomView addSubview:self.titleLabel];
    [bottomView addSubview:self.detailAttributedStringLabel];
    [self.contentView addSubview:self.goodImageView];
    [self.contentView addSubview:bottomView];
}

- (YBAttributedStringLabel *)detailAttributedStringLabel
{
    if (!_detailAttributedStringLabel) {
        _detailAttributedStringLabel        = [[YBAttributedStringLabel alloc] init];
    }
    return _detailAttributedStringLabel;
}

- (ZJBaseLabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel                         = [[ZJBaseLabel alloc] init];
    }
    return _titleLabel;
}

- (ZJBaseImageView *)goodImageView
{
    if (!_goodImageView) {
        _goodImageView                      = [[ZJBaseImageView alloc] init];
    }
    return _goodImageView;
}

@end
