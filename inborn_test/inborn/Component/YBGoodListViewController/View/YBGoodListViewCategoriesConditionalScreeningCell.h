//
//  YBGoodListViewCategoriesConditionalScreeningCell.h
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewCell.h"
@class YBRightImageButton;

@interface YBGoodListViewCategoriesConditionalScreeningCell : ZJBaseCollectionViewCell

/**
 点击选中后，重置按钮状态
 */
@property (nonatomic, assign) BOOL resetButtonStatus;

/**
 配置选中条件

 @param conditional 选中条件
 */
- (void)setSelectedConditional:(NSString *)conditional;

@end
