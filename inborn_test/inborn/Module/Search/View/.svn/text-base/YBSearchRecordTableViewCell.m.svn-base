//
//  YBSearchRecordTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/3/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSearchRecordTableViewCell.h"

@interface YBSearchRecordTableViewCell ()

{
    ZJBaseImageView *iconImageView;
    YBDefaultLabel  *titleLable;
    ZJBaseImageView *clearImageView;
}

@end

@implementation YBSearchRecordTableViewCell

/**
 移除该条记录
 */
- (void)moveWithIndex:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(removeWithTitle:)]) {
        [self.delegate removeWithTitle:titleLable.text];
    }
}

/**
 赋值
 */
-(void)setSearchTitle:(NSString *)searchTitle
{
    titleLable.text = searchTitle;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSubViewUI];
        [self setSubViewContrans];
    }
    return self;
}

- (void)setSubViewUI
{
    iconImageView                           = [[ZJBaseImageView alloc]init];
    iconImageView.image                     = ZJCURRENTIMAGE(IMAGEFILEPATH_SEARCH, @"Rectangle 2", ZJProjectLoadImageDefault);
    [self.contentView addSubview:iconImageView];
    
    titleLable                              = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                                   text:@""
                                                              textColor:ZJCOLOR.color_c5];
    [self.contentView addSubview:titleLable];
    
    clearImageView                          = [[ZJBaseImageView alloc]init];
    clearImageView.image                    = ZJCURRENTIMAGE(IMAGEFILEPATH_SEARCH, @"login_close_n", ZJProjectLoadImageDefault);
    clearImageView.userInteractionEnabled   = YES;
    [self.contentView addSubview:clearImageView];
    
    UITapGestureRecognizer *moveIndex = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(moveWithIndex:)];
    [clearImageView addGestureRecognizer:moveIndex];
    
}

- (void)setSubViewContrans
{
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(20),
                                        ADJUST_PERCENT_FLOAT(20)));
    }];
    
    [clearImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-20));
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(20),
                                        ADJUST_PERCENT_FLOAT(20)));
    }];
    
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(iconImageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.right.mas_equalTo(clearImageView.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        make.centerY.mas_equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView);
    }];
}


@end
