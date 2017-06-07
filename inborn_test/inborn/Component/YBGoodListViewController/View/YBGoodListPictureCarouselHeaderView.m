//
//  YBGoodListPictureCarouselHeaderView.m
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListPictureCarouselHeaderView.h"
#import "YBPictureCarouselView.h"
#import "YBGoodListAdsModel.h"

@interface YBGoodListPictureCarouselHeaderView() <SDCycleScrollViewDelegate>

/**
 图片轮播
 */
@property (nonatomic, strong) YBPictureCarouselView *pictureCarouselView;

@end

@implementation YBGoodListPictureCarouselHeaderView

- (void)setAdsModelArray:(NSArray<YBGoodListAdsModel *> *)adsModelArray
{
    _adsModelArray = adsModelArray;
    
    /**
     *  赋值
     */
    _pictureCarouselView.imageURLStringsGroup = self.adsImageUrlStringArray;
}

#pragma mark - 代理

#pragma mark <SDCycleScrollViewDelegate>

/**
 *  点击图片回调
 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView
   didSelectItemAtIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(goodListPictureCarouselHeaderView:index:adModel:)]) {
        [self.delegate goodListPictureCarouselHeaderView:self index:index adModel:nil];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)setupCustomUI
{
    _pictureCarouselView                        = [YBPictureCarouselView cycleScrollViewWithFrame:self.bounds
                                                                                         delegate:nil
                                                                                 placeholderImage:[UIImage imageWithColor:ZJCOLOR.color_c0]];
    _pictureCarouselView.autoScrollTimeInterval = 4.f;
    _pictureCarouselView.delegate               = self;
    NSArray *imageArray                         = ZJIMAGE(IMAGEFILEPATH_HOMEPAGE,
                                                          @"home_bannertip",
                                                          ZJProjectLoadImageDefault);
    _pictureCarouselView.currentPageDotImage    = imageArray.firstObject;
    _pictureCarouselView.pageDotImage           = imageArray.lastObject;
    [self addSubview:_pictureCarouselView];
}

@end
