//
//  YBConfirmBaseCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmBaseCell.h"
#import "YBConfirmOrderModel.h"

@interface YBConfirmBaseCell()

@end

@implementation YBConfirmBaseCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel
{
    _confirmOrderModel = confirmOrderModel;
    
    self.bottomSpacingLineView.hidden = confirmOrderModel.hiddenBottomLine;
}

@end
