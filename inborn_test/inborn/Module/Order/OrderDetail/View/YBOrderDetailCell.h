//
//  YBOrderDetailCell.h
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailBaseCell.h"
#import "YBMySellOutModel.h"
/**
 *  YBOrderDetailCell
 */
UIKIT_EXTERN NSString * const YBOrderDetailCellReuseIdentifier;

@interface YBOrderDetailCell : YBOrderDetailBaseCell
/**
 我的卖出订单详情
 */
@property(nonatomic,strong) YBMySellOutModel * sellOutdataModle;
@end
