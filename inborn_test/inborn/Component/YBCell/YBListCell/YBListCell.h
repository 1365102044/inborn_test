//
//  YBListCell.h
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTableViewCell.h"
@class YBAttributedStringLabel;
@class YBFuncButtonView;

@interface YBListCell : ZJBaseTableViewCell

/**
 titleLabel
 */
@property (nonatomic, strong) YBDefaultLabel *titleLabel;

/**
 statusLabel
 */
@property (nonatomic, strong) YBDefaultLabel *statusLabel;

/**
 topMarginLineView
 */
@property (nonatomic, strong) ZJBaseView *topMarginLineView;

/**
 goodImageView
 */
@property (nonatomic, strong) ZJBaseImageView *goodImageView;

/**
 desc
 */
@property (nonatomic, strong) YBAttributedStringLabel *goodDescLabel;

/**
 timeLabel
 */
@property (nonatomic, strong) YBDefaultLabel *timeLabel;

/**
 amontLabel
 */
@property (nonatomic, strong) YBAttributedStringLabel *amontLabel;

/**
 bottmMarginLineView
 */
@property (nonatomic, strong) ZJBaseView *bottomMarginLineView;

/**
 otherFuncButtonView
 */
@property (nonatomic, strong) YBFuncButtonView *otherFuncButtonView;

@end
