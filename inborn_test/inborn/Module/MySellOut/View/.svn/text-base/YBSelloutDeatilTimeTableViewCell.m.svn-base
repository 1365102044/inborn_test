//
//  YBSelloutDeatilTimeTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSelloutDeatilTimeTableViewCell.h"

@interface YBSelloutDeatilTimeTableViewCell ()

@property(nonatomic,strong) YBDefaultLabel * titleLable;

@end

@implementation YBSelloutDeatilTimeTableViewCell



 -(void)setDesc:(NSString *)desc
{
    self.titleLable.text   = desc;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self ==  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        [self addSubview:self.titleLable];
        [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(15));
        }];
    }
    return self;
}

- (YBDefaultLabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12)
                                               text:@""
                                          textColor:ZJCOLOR.color_c5];
    }
    return _titleLable;
}

@end
