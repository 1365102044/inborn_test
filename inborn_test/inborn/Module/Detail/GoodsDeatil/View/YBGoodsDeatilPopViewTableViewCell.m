//
//  YBGoodsDeatilPopViewTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilPopViewTableViewCell.h"

@interface YBGoodsDeatilPopViewTableViewCell ()
@property(nonatomic,strong) UIImageView * icon;
@property(nonatomic,strong) UILabel * lable;

@end

@implementation YBGoodsDeatilPopViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        self.backgroundColor = [UIColor colorWithRed:187 green:191 blue:195 alpha:0.2];
    }else{
        self.backgroundColor = ZJCOLOR.color_c2;
     }
}

- (void)setCellTitelkey:(NSString *)titleKey imageName:(NSString *)imageName
{
    self.icon.image = ZJCURRENTIMAGE(IMAGEFILEPATH_DETAIL, imageName, ZJProjectLoadImageDefault);
    self.lable.text = titleKey;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.icon = [[UIImageView alloc]init];
        [self addSubview:self.icon];
        
        self.lable = [[UILabel alloc]init];
        _lable.textColor = ZJCOLOR.color_c0;
        _lable.font = SYSTEM_REGULARFONT(14);
        [self addSubview:_lable];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.icon.frame = CGRectMake(12, 0, 16, 16);
    self.lable.frame = CGRectMake(self.icon.right+ADJUST_PERCENT_FLOAT(10), 0, 100, self.height);
    self.icon.centerY = self.centerY;
    self.lable.centerY = self.centerY;
    
}
@end
