//
//  YBGoodDeatilSeactionCell.m
//  inborn
//
//  Created by 刘文强 on 2017/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodDeatilSeactionCell.h"

@interface YBGoodDeatilSeactionCell()

{
    UILabel *titleLable;
    UILabel *descLable;
    ZJBaseView *line;
}

@end

@implementation YBGoodDeatilSeactionCell

-(void)setGoodsSpecListModel:(YBGoodsSpecListModel *)goodsSpecListModel
{
    _goodsSpecListModel = goodsSpecListModel;
    
    titleLable.text = goodsSpecListModel.attrName;
    descLable.text = goodsSpecListModel.attrValueName;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI
{
    titleLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13)
                                          text:@""
                                     textColor:ZJCOLOR.color_c5];
    descLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13)
                                         text:@""
                                    textColor:ZJCOLOR.color_c4];
    line        = [[ZJBaseView alloc]init];
    line.backgroundColor = ZJCOLOR.color_c16;
    [self addSubview:line];
    [self addSubview:titleLable];
    [self addSubview:descLable];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(25));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(60), self.height-6));
        make.centerY.mas_equalTo(self);
    }];
    
    [descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(15));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-30));
        make.centerY.mas_equalTo(titleLable.centerY);
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(28));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
    }];
}
@end
