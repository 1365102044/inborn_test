//
//  YBLikeAndRecordListTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLikeAndRecordListTableViewCell.h"
#import "YBStringTool.h"
@interface YBLikeAndRecordListTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *goodsImageview;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLable;
@property (weak, nonatomic) IBOutlet UILabel *goodsDescLable;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLable;
@property (weak, nonatomic) IBOutlet UIButton *xiangshiBtn;


@end

@implementation YBLikeAndRecordListTableViewCell

-(void)setDataModel:(YBLikeAndRecordModel *)DataModel
{
    _DataModel = DataModel;
    
    [_goodsImageview sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, _DataModel.goodsImage)] placeholderImage:[UIImage imageNamed:@""]];
    
    _goodsNameLable.text = DataModel.brandName;
    _goodsDescLable.text = DataModel.sellerDesc;
    _goodsPriceLable.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:DataModel.goodsPrice]];
    if (DataModel.goodsPrice == nil || DataModel.goodsPrice.length == 0) {
        _goodsPriceLable.text = [NSString stringWithFormat:@"¥--"];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 找相似的事件
 */
- (IBAction)clickXiangsiBtn:(id)sender {
    
    if (self.clickCellBlock) {
        self.clickCellBlock(1,sender,_DataModel);
    }
}
/**
 更多的事件
 */
- (IBAction)clickMoreBtn:(id)sender {
    if (self.clickCellBlock) {
        self.clickCellBlock(2,sender,_DataModel);
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        self = [[NSBundle mainBundle] loadNibNamed:@"YBLikeAndRecordListTableViewCell" owner:self options:nil].lastObject;
        
        self.xiangshiBtn.layer.masksToBounds = YES;
        self.xiangshiBtn.layer.cornerRadius = 10;
        self.xiangshiBtn.layer.borderColor = ZJCOLOR.color_c6.CGColor;
        self.xiangshiBtn.layer.borderWidth = 1;
        
    }
    return self;
}
@end
