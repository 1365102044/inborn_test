//
//  YBComposeHomePageGoodPartCell.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageGoodPartCell.h"
#import "YBGoodPartModel.h"

/**
 *  goodPartCell
 */
NSString * const YBComposeHomePageGoodPartCellReuseIdentifier            = @"YBComposeHomePageGoodPartCellReuseIdentifier";

@interface YBComposeHomePageGoodPartCell()

/**
 商品配件按钮
 */
@property (strong, nonatomic) YBDefaultButton *partButton;

@end

@implementation YBComposeHomePageGoodPartCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setGoodPartModel:(YBGoodPartModel *)goodPartModel
{
    _goodPartModel = goodPartModel;
    
    [self.partButton setTitle:goodPartModel.goodsPart
                     forState:UIControlStateNormal];
    [self.partButton setTitle:goodPartModel.goodsPart
                     forState:UIControlStateSelected];
    
    self.partButton.selected = goodPartModel.goodsPartStatus;
    if (goodPartModel.goodsPartStatus) {
        self.partButton.titleLabel.font = SYSTEM_REGULARFONT(12.f);
    }else{
        self.partButton.titleLabel.font = SYSTEM_LIGHTFONT(12.f);
    }
}

#pragma mark - Third.点击事件

- (void)partButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.partButton.titleLabel.font = SYSTEM_REGULARFONT(12.f);
    }else{
        self.partButton.titleLabel.font = SYSTEM_LIGHTFONT(12.f);
    }
    self.goodPartModel.goodsPartStatus = sender.selected;
    
    if ([self.delegate respondsToSelector:@selector(composeHomePageGoodPartCell:button:currentModel:)]) {
        [self.delegate composeHomePageGoodPartCell:self button:sender currentModel:self.goodPartModel];
    }
}

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
    
    [self.partButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [self.contentView addSubview:self.partButton];
}

#pragma mark - Seventh.懒加载

- (YBDefaultButton *)partButton
{
    if (!_partButton) {
        _partButton                 = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@"测试"
                                                                                  titleColor:ZJCOLOR.color_c17
                                                                                   titleFont:SYSTEM_LIGHTFONT(12.f)
                                                                               imageFilePath:IMAGEFILEPATH_SCREEN
                                                                                  imageNamed:@"screen_selected_btn"
                                                                                        type:ZJProjectButtonSetBackgroundImage
                                                                                      target:self
                                                                                    selector:@selector(partButtonClick:)];
    }
    return _partButton;
}

@end
