//
//  YBGoodsDeatilTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilTableViewCell.h"

@interface YBGoodsDeatilTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titlelable;

@property (weak, nonatomic) IBOutlet UILabel *contentlable;

@end

@implementation YBGoodsDeatilTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titlelable.textColor = ZJCOLOR.color_c4;
    self.contentlable.textColor = ZJCOLOR.color_c5;
    
}
-(void)setGoodsSpecListModel:(YBGoodsSpecListModel *)goodsSpecListModel
{
    _goodsSpecListModel = goodsSpecListModel;
    self.titlelable.text = goodsSpecListModel.attrName;
    self.contentlable.text = goodsSpecListModel.attrValueName;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"YBGoodsDeatilTableViewCell" owner:nil options:nil].lastObject;
    }
    return self;
}

@end
