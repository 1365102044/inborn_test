//
//  YBMyComposedListCell.h
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBListCell.h"
@class YBGoodModel;
@class YBMyComposedListCell;

/**
 *  YBMyComposedListCell
 */
UIKIT_EXTERN NSString * const YBMyComposedListCellReuseIdentifier;

@protocol YBMyComposedListCellDelegate <NSObject>

- (void)myComposedListCell:(YBMyComposedListCell *)myComposedListCell
                    button:(UIButton *)button;

@end

@interface YBMyComposedListCell : YBListCell

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBGoodModel *goodModel;

/**
 <#descrption#>
 */
@property (nonatomic, weak) id<YBMyComposedListCellDelegate> delegate;

@end
