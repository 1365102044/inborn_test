//
//  YBGoodListCell.h
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewCell.h"
@class YBGoodListGoodModel;
@class YBGoodListCell;

@protocol YBGoodListCellDelegate <NSObject>

/**
 cell上按钮点击事件

 @param goodListCell            goodListCell
 @param sender                  sender
 */
- (void)goodListCell:(YBGoodListCell *)goodListCell button:(UIButton *)sender;

@end

@interface YBGoodListCell : ZJBaseCollectionViewCell

/**
 YBGoodListGoodModel
 */
@property (nonatomic, strong) YBGoodListGoodModel *goodModel;

/**
 代理
 */
@property (nonatomic, weak) id<YBGoodListCellDelegate> delegate;

@end
