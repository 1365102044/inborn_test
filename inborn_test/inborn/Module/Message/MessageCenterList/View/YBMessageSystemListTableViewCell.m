//
//  YBMessageSystemListTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/9.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageSystemListTableViewCell.h"

@interface YBMessageSystemListTableViewCell ()
{
    UIView      *backBigview;
    UILabel      *contentLable;
}

@end

@implementation YBMessageSystemListTableViewCell

-(void)setDataModel:(YBMessageSystemModel *)dataModel
{
    _dataModel = dataModel;
    
    NSString *des = dataModel.msgTitle;
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:des];
    NSMutableParagraphStyle *styleparag = [[NSMutableParagraphStyle alloc]init];
    styleparag.lineSpacing = 5;
    [atter addAttribute:NSParagraphStyleAttributeName value:styleparag range:NSMakeRange(0, des.length)];
    contentLable.attributedText = atter;
    contentLable.lineBreakMode = NSLineBreakByCharWrapping;
    
    [backBigview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.top.mas_equalTo(self.mas_top).mas_offset(0);
        make.height.mas_offset(dataModel.contentheight);
    }];
    
    [contentLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backBigview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.right.mas_equalTo(backBigview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        make.top.mas_equalTo(backBigview.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.bottom.mas_equalTo(backBigview.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-5));
    }];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = ZJCOLOR.color_c12;
        
        backBigview = [[UIView alloc]init];
        backBigview.layer.cornerRadius = 4;
        backBigview.layer.masksToBounds = YES;
        backBigview.backgroundColor = [UIColor whiteColor];
        [self addSubview:backBigview];
        
        contentLable = [[UILabel alloc]init];
        contentLable.textColor = ZJCOLOR.color_c4;
        contentLable.font = SYSTEM_REGULARFONT(12);
        contentLable.numberOfLines = 0;
        [backBigview addSubview:contentLable];
        
        [backBigview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.top.mas_equalTo(self.mas_top).mas_offset(0);
            make.height.mas_offset(self.height);
        }];
        
        [contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(backBigview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(5));
            make.right.mas_equalTo(backBigview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-5));
            make.top.mas_equalTo(backBigview.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(5));
            make.bottom.mas_equalTo(backBigview.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        }];

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    }

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
