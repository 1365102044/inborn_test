//
//  YBVoiceTipsView.m
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBVoiceTipsView.h"

@interface YBVoiceTipsView()

/**
 <#descrption#>
 */
@property (nonatomic, strong) ZJBaseImageView *tipsImageView;

/**
 <#descrption#>
 */
@property (nonatomic, strong) NSArray<ZJBaseImageView *> *voiceImageViewsArray;

@end

@implementation YBVoiceTipsView

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        ZJBaseImageView *tipsImageView = [[ZJBaseImageView alloc] initWithImage:ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                                                                               @"message_sound_bg",
                                                                                               ZJProjectLoadImageDefault)];
        _tipsImageView = tipsImageView;
        [self addSubview:tipsImageView];
        [tipsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 1; ++i) {
            
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"message_volume%02zd_bg", i + 1]];
            ZJBaseImageView *imageView = [[ZJBaseImageView alloc] initWithImage:image];

            imageView.alpha = 1.f;
            [self addSubview:imageView];
            [tempArray addObject:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-30));
                make.bottom.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-50));
                make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(26.f));
                make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(43.f));
            }];
            
        }
        
        self.voiceImageViewsArray = tempArray.copy;
    }
    return self;
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

#pragma mark - Eighth.Other

/**
 设置提示图片
 
 @param isCancel 是否是取消
 */
- (void)setTipsImageWithIsCancel:(BOOL)isCancel
{
    if (isCancel) {
        self.tipsImageView.image        = ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                                         @"message_sound_bg",
                                                         ZJProjectLoadImageDefault);
        [self.voiceImageViewsArray enumerateObjectsUsingBlock:^(ZJBaseImageView * _Nonnull obj,
                                                                NSUInteger idx,
                                                                BOOL * _Nonnull stop) {
            
            obj.alpha = 1.f;
        }];
    }else{
        self.tipsImageView.image        = ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                                         @"message_soundoff_bg",
                                                         ZJProjectLoadImageDefault);
        [self.voiceImageViewsArray enumerateObjectsUsingBlock:^(ZJBaseImageView * _Nonnull obj,
                                                                NSUInteger idx,
                                                                BOOL * _Nonnull stop) {
            obj.alpha = 0;
        }];
    }
}

/**
 设置声音等级
 
 @param number number
 */
- (void)setVoiceValueWithNumber:(NSInteger)number
{
    self.voiceImageViewsArray.firstObject.image = [UIImage imageNamed:[NSString stringWithFormat:@"message_volume%02zd_bg", number]];
    
}

@end
