//
//  YBDefaultCollectionViewCell.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewCell.h"
@class YBDefaultCollectionViewCell;

@protocol YBDefaultCollectionViewCellDelegate <NSObject>

/**
 按钮点击事件

 @param defaultCollectionViewCell       defaultCollectionViewCell
 @param button                          button
 */
- (void)defaultCollectionViewCell:(YBDefaultCollectionViewCell *)defaultCollectionViewCell
                           button:(UIButton *)button;

@end


@interface YBDefaultCollectionViewCell : ZJBaseCollectionViewCell

/**
 <#descrption#>
 */
@property (nonatomic, weak) id<YBDefaultCollectionViewCellDelegate> delegate;

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
 bottom SpacingLineView
 */
@property (nonatomic, strong) ZJBaseView *bottomSpacingLineView;

/**
 配置UI界面
 */
- (void)setupCustomUI;

/**
 功能按钮点击事件

 @param sender sender 
 */
- (void)buttonClick:(UIButton *)sender;

@end
