//
//  ZJBaseTableViewCell.m
//  inborn
//
//  Created by 郑键 on 17/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTableViewCell.h"

@implementation ZJBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.bottomSpacingLineView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.contentView addSubview:self.bottomSpacingLineView];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.bottomSpacingLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        make.bottom.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.5f);
    }];
}

- (ZJBaseView *)bottomSpacingLineView
{
    if (!_bottomSpacingLineView) {
        _bottomSpacingLineView                  = [[ZJBaseView alloc] init];
        _bottomSpacingLineView.backgroundColor  = ZJCOLOR.color_c16;
    }
    return _bottomSpacingLineView;
}

@end
