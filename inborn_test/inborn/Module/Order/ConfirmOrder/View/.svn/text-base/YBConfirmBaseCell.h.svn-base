//
//  YBConfirmBaseCell.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTableViewCell.h"
@class YBConfirmOrderModel;
@class YBConfirmBaseCell;

@protocol YBConfirmBaseCellDelegate <NSObject>

/**
 cell上的按钮的点击事件

 @param confirmBaseCell     confirmBaseCell
 @param button              button
 */
- (void)confirmBaseCell:(YBConfirmBaseCell *)confirmBaseCell
                 button:(UIButton *)button;

@end

@interface YBConfirmBaseCell : ZJBaseTableViewCell

/**
 代理
 */
@property (nonatomic, weak) id<YBConfirmBaseCellDelegate> delegate;

/**
 数据
 */
@property (nonatomic, strong) YBConfirmOrderModel *confirmOrderModel;

/**
 赋值方法

 @param confirmOrderModel confirmOrderModel 
 */
- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel;

@end
