//
//  YBDefaultTableViewCell.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTableViewCell.h"

@interface YBDefaultTableViewCell : ZJBaseTableViewCell

/**
 titleLabel
 */
@property (nonatomic, strong) YBDefaultLabel *titleLabel;

/**
 funcButton
 */
@property (nonatomic, strong) YBDefaultButton *funcButton;

/**
 accessView
 */
@property (nonatomic, strong) ZJBaseImageView *accessImageView;

/**
 配置UI界面
 */
- (void)setupCustomUI;

@end
