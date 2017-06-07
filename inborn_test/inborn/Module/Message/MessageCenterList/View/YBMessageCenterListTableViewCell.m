//
//  YBMessageCenterListTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageCenterListTableViewCell.h"

@interface YBMessageCenterListTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImageview;

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *descLable;

@property (weak, nonatomic) IBOutlet UILabel *numberLable;

@end

@implementation YBMessageCenterListTableViewCell

-(void)setNuReadNumber:(NSInteger)nuReadNumber
{
    if (nuReadNumber == 0) {
        return;
    }
    self.numberLable.hidden = NO;
    self.numberLable.text = [NSString stringWithFormat:@"%.0ld",(long)nuReadNumber];
}

- (void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    _leftImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"message_%@_icon",dataArr[0]]];
    self.nameLable.text = dataArr[0];
    
    if (dataArr.count<1) {
        return;
    }
    self.descLable.text = dataArr[1];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.numberLable.layer.cornerRadius = 7.5;
    self.numberLable.layer.masksToBounds = YES;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"YBMessageCenterListTableViewCell" owner:nil options:nil] lastObject];
        
    }
    return self;
}

@end
