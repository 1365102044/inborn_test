//
//  YBComposeHomePageGoodPartCell.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewCell.h"
@class YBGoodPartModel;
@class YBComposeHomePageGoodPartCell;

/**
 *  goodPartCell
 */
UIKIT_EXTERN NSString * const YBComposeHomePageGoodPartCellReuseIdentifier;

@protocol YBComposeHomePageGoodPartCellDelegate <NSObject>

/**
 选中的商品配件

 @param composeHomePageGoodPartCell             composeHomePageGoodPartCell
 @param button                                  button
 @param currentModel                            currentModel
 */
- (void)composeHomePageGoodPartCell:(YBComposeHomePageGoodPartCell *)composeHomePageGoodPartCell
                             button:(UIButton *)button
                       currentModel:(YBGoodPartModel *)currentModel;

@end


@interface YBComposeHomePageGoodPartCell : ZJBaseCollectionViewCell

/**
 模型
 */
@property (nonatomic, strong) YBGoodPartModel *goodPartModel;

/**
 <#descrption#>
 */
@property (nonatomic, weak) id<YBComposeHomePageGoodPartCellDelegate> delegate;

@end
