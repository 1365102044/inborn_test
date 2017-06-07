//
//  YBGoodListViewCategoriesCell.m
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListViewCategoriesCell.h"
#import "YBGoodListViewCategoriesModel.h"

@interface YBGoodListViewCategoriesCell()

/**
 topView
 */
@property (nonatomic, strong) ZJBaseImageView *topView;

/**
 iconImageView
 */
@property (nonatomic, strong) ZJBaseImageView *iconImageView;

/**
 titleLabel
 */
@property (nonatomic, strong) YBDefaultLabel *textLabel;

@end

@implementation YBGoodListViewCategoriesCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setCategoriesModel:(YBGoodListViewCategoriesModel *)categoriesModel
{
    _categoriesModel = categoriesModel;
    
    categoriesModel.isSelected ? [self changeStatusWithTitleColor:ZJCOLOR.color_c4
                                                        titleFont:SYSTEM_REGULARFONT(12.f)
                                                          bgImage:ZJCURRENTIMAGE(IMAGEFILEPATH_HOMEPAGE,
                                                                                 @"home_center_bg",
                                                                                 ZJProjectLoadImageDefault)
                                                       isSelected:YES] :
    [self changeStatusWithTitleColor:ZJCOLOR.color_c5
                           titleFont:SYSTEM_LIGHTFONT(12.f)
                             bgImage:ZJCURRENTIMAGE(IMAGEFILEPATH_HOMEPAGE,
                                                    @"home_center_bg2",
                                                    ZJProjectLoadImageDefault)
                          isSelected:NO];
    
    /**
     *  赋值界面
     */
    self.textLabel.text         = categoriesModel.tabTitle;
}

/**
 改变控件状态
 
 @param titleColor      titleColor
 @param titleFont       titleFont
 @param bgImage         bgImage
 @param isSelected      是否选中
 */
- (void)changeStatusWithTitleColor:(UIColor *)titleColor
                         titleFont:(UIFont *)titleFont
                           bgImage:(UIImage *)bgImage
                        isSelected:(BOOL)isSelected
{
    self.topView.image              = bgImage;
    self.textLabel.textColor        = titleColor;
    self.textLabel.font             = titleFont;
    
    if (isSelected) {
        self.iconImageView.image    = ZJIMAGE(IMAGEFILEPATH_HOMEPAGE,
                                              self.categoriesModel.iconChecked,
                                              ZJProjectLoadImageDefault).lastObject;
    }else{
        self.iconImageView.image    = ZJIMAGE(IMAGEFILEPATH_HOMEPAGE,
                                              self.categoriesModel.iconChecked,
                                              ZJProjectLoadImageDefault).firstObject;
    }
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

#pragma mark - Sixth.界面配置

/**
 配置界面
 */
- (void)setupCustomUI
{
    _topView                                            = [[ZJBaseImageView alloc] init];
    _topView.image                                      = ZJCURRENTIMAGE(IMAGEFILEPATH_HOMEPAGE,
                                                                         @"home_center_bg2",
                                                                         ZJProjectLoadImageDefault);
    
    _iconImageView                                      = [[ZJBaseImageView alloc] init];
    
    _textLabel                                          = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12.f)
                                                                                   text:@"测试文字"
                                                                              textColor:ZJCOLOR.color_c4];
    _textLabel.backgroundColor                          = [UIColor clearColor];
    _textLabel.textAlignment                            = NSTextAlignmentCenter;
    
    [self.contentView addSubview:_topView];
    [_topView addSubview:_iconImageView];
    [self.contentView addSubview:_textLabel];
    
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(8.f));
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-8.f));
        make.top.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(11.f));
        make.height.mas_equalTo(_topView.mas_width);
    }];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(_topView);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(28.f));
        make.width.mas_equalTo(_iconImageView.mas_height);
    }];
    
    [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(_topView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10.f));
    }];
}

#pragma mark - Seventh.懒加载

@end
