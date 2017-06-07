//
//  ZJWaveAnimationView.h
//  Project
//
//  Created by 郑键 on 17/2/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WavesBlock)(CGRect myFrame);

/**
 动画类型

 - ZJWaveAnimationTypeNone:             无类型
 - ZJWaveAnimationTypeSin:              单条线
 - ZJWaveAnimationTypeDouble:           双线
 */
typedef NS_ENUM(NSUInteger, ZJWaveAnimationType) {
    ZJWaveAnimationTypeNone,
    ZJWaveAnimationTypeSin,
    ZJWaveAnimationTypeDouble,
};

/**
 动画方向

 - Left:                                从左向右
 - Right:                               右向左
 */
typedef NS_ENUM(NSUInteger, ZJWaveAnimationDirection) {
    Left,
    Right,
};

@interface ZJWaveAnimationView : UIView

@property (nonatomic , assign)CGRect imageFrame;


/**
 水波动画view创建
 
 @param animationType                   动画类型
 @param waterLineY                      线段y             例子:0
 @param waveAmplitude                   振幅              例子:3.0
 @param waveCycle                       波浪周期           例子:1.0
 @param realWaveColor                   后层波浪颜色
 @param maskWaveColor                   前层波浪颜色（当动画类型为1条线时，masWaveColor传nil）
 @param direction                       动画方向
 @param frame                           frame
 @param extend                          扩展参数暂时传nil
 @return                                随波动画view实例
 */
+ (instancetype)creatAnimationViewWithAnimationType:(ZJWaveAnimationType)animationType
                                         waterLineY:(CGFloat)waterLineY
                                      waveAmplitude:(CGFloat)waveAmplitude
                                          waveCycle:(CGFloat)waveCycle
                                      realWaveColor:(UIColor *)realWaveColor
                                      maskWaveColor:(UIColor *)maskWaveColor
                                          direction:(ZJWaveAnimationDirection)direction
                                              frame:(CGRect)frame
                                             extend:(id)extend;

/**
 停止水波动画
 */
- (void)stopWaveAnimation;

/**
 开始水波动画
 */
- (void)startWaveAnimation;

@end
