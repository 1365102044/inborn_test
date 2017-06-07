//
//  YBComposeHomePageImageCell.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewCell.h"
@class YBUploadImageModel;
@class YBComposeHomePageImageCell;

/**
 *  imageCell
 */
UIKIT_EXTERN NSString * const YBComposeHomePageImageCellReuseIdentifier;

@protocol YBComposeHomePageImageCellDelegate <NSObject>

/**
 cell的点击事件

 @param composeHomePageImageCell        composeHomePageImageCell
 @param sender                          点击的按钮
 @param model                           模型
 */
- (void)composeHomePageImageCell:(YBComposeHomePageImageCell *)composeHomePageImageCell
                     clickButton:(UIButton *)sender
                           model:(YBUploadImageModel *)model;

@end

@interface YBComposeHomePageImageCell : ZJBaseCollectionViewCell

/**
 上传图片
 */
@property (nonatomic, strong) YBUploadImageModel *uploadImageModle;

/**
 代理
 */
@property (nonatomic, weak) id<YBComposeHomePageImageCellDelegate> delegate;

@end
