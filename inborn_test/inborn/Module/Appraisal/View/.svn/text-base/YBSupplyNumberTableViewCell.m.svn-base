//
//  YBSupplyNumberTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSupplyNumberTableViewCell.h"
#import "YBAttributedStringLabel.h"

@interface YBSupplyNumberTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *nameandphoneLable;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *addressoridcardLable;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addredeatilHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addressdeatiTop;


@end

@implementation YBSupplyNumberTableViewCell

-(void)setDataModel:(YBAppraisalModel *)dataModel
{
    _dataModel = dataModel;
    self.titleLable.text = ZJSTRING(@"收货人信息");
    
    /**
     发货 地址
     */
    NSString *addresStr;
    if (dataModel.VCType == DeliverGoodsType) {
        self.nameandphoneLable.text = [NSString stringWithFormat:@"%@ %@",dataModel.consigneemodel.consigneeName,dataModel.consigneemodel.consigneeMobile];
        
        addresStr =  [NSString stringWithFormat:@"%@%@%@%@",dataModel.consigneemodel.consigneeProvince,dataModel.consigneemodel.consigneeCity,dataModel.consigneemodel.consigneeCounty,dataModel.consigneemodel.consigneeAddressDetail];
    
    }else{
        self.nameandphoneLable.text = [NSString stringWithFormat:@"%@ %@",dataModel.consigneemodel.consigneeName,dataModel.consigneemodel.consigneeTelephone];
        addresStr = dataModel.consigneemodel.consigneeAddressDetail;
    }
    
    if (addresStr) {
        
        [self.addressoridcardLable setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                           @"content" : addresStr,
                                                                           @"size" : SYSTEM_LIGHTFONT(13.f),
                                                                           @"lineSpacing": @5}]];
    }
    if (self.dataModel.addressHeight > 37) {
        self.addressdeatiTop.constant = 1;
        self.addredeatilHeight.constant = self.dataModel.addressHeight;
    }
    self.addressoridcardLable.numberOfLines = 0;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLable.textColor = ZJCOLOR.color_c4;
    self.titleLable.font = SYSTEM_REGULARFONT(13);
    self.nameandphoneLable.textColor = ZJCOLOR.color_c4;
    self.nameandphoneLable.font = SYSTEM_LIGHTFONT(13);
    self.addressoridcardLable.textColor = ZJCOLOR.color_c4;
    self.addressoridcardLable.font = SYSTEM_LIGHTFONT(13);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"YBSupplyNumberTableViewCell" owner:nil options:nil].lastObject;
        
    }
    return self;
}

@end
