//
//  YBGoodListControllerFlowLayout.h
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YBGoodListControllerFlowLayout;

@protocol YBGoodListControllerFlowLayoutDelegate <NSObject>

@required
- (CGFloat)waterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout
  heightForItemAtIndexPath:(NSIndexPath *)indexPath
                 itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout;
- (CGFloat)columnMarginInWaterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout;
- (CGFloat)rowMarginInWaterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout;
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(YBGoodListControllerFlowLayout *)waterflowLayout;
- (CGFloat)collectionViewLayout:(YBGoodListControllerFlowLayout *)waterflowLayout heightForSupplementaryViewAtIndexPath:(NSIndexPath *)indexPath;
/**
 详情页面需要拿到最大高度，动态设置cell的高度
 */
- (void)returenMaxHeight:(CGFloat )height;

@end



@interface YBGoodListControllerFlowLayout : UICollectionViewFlowLayout

/**
 *  代理
 */
@property (nonatomic, weak) id<YBGoodListControllerFlowLayoutDelegate> delegate;

/**
 *  列数
 */
@property (nonatomic, assign) NSInteger colCount;

@end
