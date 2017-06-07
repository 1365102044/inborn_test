//
//  YBOrderDetailBaseCell.m
//  inborn
//
//  Created by 郑键 on 17/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailBaseCell.h"
#import "YBOrderDetailModel.h"

@implementation YBOrderDetailBaseCell

- (void)setOrderDetailModel:(YBOrderDetailModel *)orderDetailModel
{
    _orderDetailModel = orderDetailModel;
    
    if (orderDetailModel.hiddenBottomMarginLine) {
        self.bottomSpacingLineView.hidden = YES;
    }else{
        self.bottomSpacingLineView.hidden = NO;
    }
}

@end
