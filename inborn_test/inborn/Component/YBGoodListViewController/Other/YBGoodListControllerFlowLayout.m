//
//  YBGoodListControllerFlowLayout.m
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListControllerFlowLayout.h"

/**
 *  默认的列数
 */
static const NSInteger YBDefaultColumnCount             = 2;

/**
 *  每一列之间的间距
 */
static const CGFloat YBDefaultColumnMargin              = 10;

/**
 *  每一行之间的间距
 */
static const CGFloat YBDefaultRowMargin                 = 10;

/**
 *  边缘间距
 */
static const UIEdgeInsets YBDefaultEdgeInsets           = {10, 10, 10, 10};

@interface YBGoodListControllerFlowLayout()

/**
 *  存放所有cell的布局属性
 */
@property (nonatomic, strong) NSMutableArray *attrsArray;

/**
 *  存放所有列的当前高度
 */
@property (nonatomic, strong) NSMutableArray *columnHeights;

/**
 *  内容的高度
 */
@property (nonatomic, assign) CGFloat contentHeight;

/**
 *  保存最大max值得数据
 */
@property (nonatomic, strong)NSMutableArray *maxHeightArray;

@property (nonatomic, strong) NSMutableArray *indexPathsToAnimate;

- (CGFloat)rowMargin;
- (CGFloat)columnMargin;
- (NSInteger)columnCount;
- (UIEdgeInsets)edgeInsets;


@end

@implementation YBGoodListControllerFlowLayout

#pragma mark - 常见数据处理
- (CGFloat)rowMargin
{
    
    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterflowLayout:)]) {
        return [self.delegate rowMarginInWaterflowLayout:self];
    } else {
        return YBDefaultRowMargin;
    }
}

- (CGFloat)columnMargin
{
    if ([self.delegate respondsToSelector:@selector(columnMarginInWaterflowLayout:)]) {
        return [self.delegate columnMarginInWaterflowLayout:self];
    } else {
        return YBDefaultColumnMargin;
    }
}

- (NSInteger)columnCount
{
    if ([self.delegate respondsToSelector:@selector(columnCountInWaterflowLayout:)]) {
        return [self.delegate columnCountInWaterflowLayout:self];
    } else {
        return YBDefaultColumnCount;
    }
}

- (UIEdgeInsets)edgeInsets
{
    if ([self.delegate respondsToSelector:@selector(edgeInsetsInWaterflowLayout:)]) {
        return [self.delegate edgeInsetsInWaterflowLayout:self];
    } else {
        return YBDefaultEdgeInsets;
    }
}

#pragma mark - 懒加载

- (NSMutableArray *)maxHeightArray
{
    if (!_maxHeightArray) {
        _maxHeightArray = [NSMutableArray array];
    }
    return _maxHeightArray;
}

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

/**
 * 初始化
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    self.contentHeight = 0;
    
    /**
     *  清除以前计算的所有高度
     */
    [self.columnHeights removeAllObjects];
    [self.maxHeightArray removeAllObjects];
    
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(self.edgeInsets.top)];
    }
    
    /**
     *  清除之前所有的布局属性
     */
    [self.attrsArray removeAllObjects];
    
    /**
     *  开始创建每一个cell对应的布局属性
     */
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < count; i++) {
        
        /**
         *  创建位置
         */
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        /**
         *  获取indexPath位置cell对应的布局属性
         */
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

/**
 * 决定cell的排布
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    /**
     *  计算组头高度
     */
    NSArray *indexPaths = [self indexPathForSupplementaryViewsOfKind:UICollectionElementKindSectionHeader InRect:rect];
    for(NSIndexPath *indexPath in indexPaths){
        
        /**
         *  计算对应的LayoutAttributes
         */
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                            atIndexPath:indexPath];
        [self.attrsArray addObject:attributes];
    }
    
    return self.attrsArray;
}

/**
 * 返回indexPath位置cell对应的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  创建布局属性
     */
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    /**
     *  collectionView的宽度
     */
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    /**
     *  headerView高度
     */
    CGFloat headerHeight = [self.delegate collectionViewLayout:self
                         heightForSupplementaryViewAtIndexPath:[NSIndexPath indexPathForItem:0
                                                                                   inSection:0]];
    
    /**
     *  设置布局属性的frame
     */
    CGFloat w = (collectionViewW - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1) * self.columnMargin) / self.columnCount;
    
    CGFloat h = [self.delegate waterflowLayout:self heightForItemAtIndexPath:indexPath itemWidth:w];
    
    /**
     *  找出高度最短的那一列
     */
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < self.columnCount; i++) {
        
        /**
         *  取得第i列的高度
         */
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = self.edgeInsets.left + destColumn * (w + self.columnMargin);
    CGFloat y = minColumnHeight;
    
    if (y != self.edgeInsets.top) {
        y += self.rowMargin;
    }else{
        y += headerHeight;
    }
    attrs.frame = CGRectMake(x, y, w, h);
    
    /**
     *  更新最短那列的高度
     */
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    
    /**
     *  获取最高的数据
     */
    [self.maxHeightArray addObject: @(CGRectGetMaxY(attrs.frame))];
    
    /**
     *  记录内容的高度
     */
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    if (self.delegate) {
        [self.delegate returenMaxHeight:self.contentHeight];
    }
    return attrs;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}


- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind
                                                                                                                  withIndexPath:indexPath];
    
    /**
     *  计算LayoutAttributes
     */
    if([elementKind isEqualToString:UICollectionElementKindSectionHeader]){
        CGFloat width = self.collectionView.bounds.size.width;
        CGFloat height = [self.delegate collectionViewLayout:self heightForSupplementaryViewAtIndexPath:indexPath];
        CGFloat x = 0;
        CGFloat y = 0;
        attributes.frame = CGRectMake(x, y, width, height);
        attributes.zIndex = 1024;
    }
    return attributes;
}

/**
 *  计算目标rect中含有的某类SupplementaryView
 */
- (NSMutableArray<NSIndexPath *> *)indexPathForSupplementaryViewsOfKind:(NSString *)kind InRect:(CGRect)rect
{
    NSMutableArray<NSIndexPath *> *indexPaths = [NSMutableArray array];
    if([kind isEqualToString:UICollectionElementKindSectionHeader]){
        
        /**
         *  在这个瀑布流自定义布局中，只有一个位于列表顶部的SupplementaryView
         */
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        
        /**
         *  如果当前区域可以看到SupplementaryView，则返回
         */
        [indexPaths addObject:indexPath];
    }
    return indexPaths;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
