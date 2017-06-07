//
//  YBScanPCPayTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBScanPCPayTableViewCell.h"
#import "YBStringTool.h"
@interface YBScanPCPayTableViewCell ()


@end

@implementation YBScanPCPayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setTitleStr:(NSString *)titlestr desctr:(NSString *)descstr
{
    self.titleLable.text = titlestr;
    self.descLable.text = descstr;
    
    if ([titlestr isEqualToString:@"订单编号"]) {
        self.titleLable.textColor = ZJCOLOR.color_c4;
    }else if([titlestr isEqualToString:@"订单总金额"] || [titlestr isEqualToString:@"应付金额"] ){
        self.descLable.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:descstr]];
    }
}
@end
