//
//  YBRecorderView.h
//  inborn
//
//  Created by 郑键 on 17/4/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
@class YBRecorderView;

typedef NS_ENUM(NSUInteger, YBRecorderViewType) {
    YBRecorderViewDefault,
    YBRecorderViewBegan,
    YBRecorderViewChangeCancel,
    YBRecorderViewChangeContinue,
    YBRecorderViewEnd,
};

@protocol YBRecorderViewDelegate <NSObject>

//- (NSString *)voiceFilePath;

- (void)recordEnd;

- (void)recordStarted;

- (void)recordCanceld;

- (void)recorderView:(YBRecorderView *)recorderView type:(YBRecorderViewType)type extend:(id)extend;

- (void)recorderView:(YBRecorderView *)recorderView changeVoiceValue:(NSInteger)value;

@end

@interface YBRecorderView : ZJBaseView

@property (nonatomic, weak) id<YBRecorderViewDelegate> delegate;

@property (nonatomic, strong, readonly) UILabel *tipLabel;

- (void)changeVolumeLayerDiameter:(CGFloat)dia;

@end
