//
//  YBGoodListPictureCarouselHeaderView.h
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionReusableView.h"
@class YBGoodListAdsModel;
@class YBGoodListPictureCarouselHeaderView;

@protocol YBGoodListPictureCarouselHeaderViewDelegate <NSObject>

- (void)goodListPictureCarouselHeaderView:(YBGoodListPictureCarouselHeaderView *)goodListPictureCarouselHeaderView
                                    index:(NSInteger)index
                                  adModel:(YBGoodListAdsModel *)adModel;

@end

@interface YBGoodListPictureCarouselHeaderView : ZJBaseCollectionReusableView

/**
 YBGoodListAdsModel
 */
@property (nonatomic, strong) NSArray<YBGoodListAdsModel *> *adsModelArray;

/**
 adsImageUrlStringArray
 */
@property (nonatomic, strong) NSArray<NSString *> *adsImageUrlStringArray;

/**
 <#descrption#>
 */
@property (nonatomic, weak) id<YBGoodListPictureCarouselHeaderViewDelegate> delegate;

@end
