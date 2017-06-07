//
//  ZJWaveAnimationView.m
//  Project
//
//  Created by 郑键 on 17/2/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJWaveAnimationView.h"

@interface ZJWaveAnimationView()

/**
 *  线段y
 */
@property (nonatomic, assign) CGFloat waterLineY;

/**
 *  波浪振幅
 */
@property (nonatomic, assign) CGFloat waveAmplitude;

/**
 *  波浪周期
 */
@property (nonatomic, assign) CGFloat waveCycle;

/**
 *  实浪颜色
 */
@property (nonatomic, strong) UIColor *realWaveColor;
/**
 *  遮罩浪颜色
 */
@property (nonatomic, strong) UIColor *maskWaveColor;

/**
 *  定时器
 */
@property (nonatomic, strong) CADisplayLink *timer;

/**
 *  动画类型
 */
@property (nonatomic, assign) ZJWaveAnimationType type;

/**
 *  动画方向
 */
@property (nonatomic, assign) ZJWaveAnimationDirection direction;

/**
 *  firstWave
 */
@property (nonatomic, strong) CAShapeLayer *firstWaveLayer;

/**
 *  secondWave
 */
@property (nonatomic, strong) CAShapeLayer *secondWaveLayer;

/**
 *  控制振幅增长或减小
 */
@property (nonatomic, assign) BOOL increase;

@end

@implementation ZJWaveAnimationView

#pragma mark - Zero.AnimationControl

- (void)startWaveAnimation
{
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(animated)];
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopWaveAnimation
{
    [self.timer invalidate];
    self.timer                  = nil;
}

- (void)animated
{
    if (self.increase) {
        _waveAmplitude          += 0.02;
    }else{
        _waveAmplitude          -= 0.02;
    }
    
    
    if (_waveAmplitude <= 1) {
        self.increase           = YES;
    }
    
    if (_waveAmplitude >= 1.5) {
        self.increase           = NO;
    }
    
    _waveCycle                  += 0.05;
    
    [self wave];
}

#pragma mark - First.LifeCycle

/**
 水波动画view创建
 
 @param animationType                   动画类型
 @param waterLineY                      线段y
 @param waveAmplitude                   振幅
 @param waveCycle                       波浪周期
 @param realWaveColor                   实浪颜色
 @param maskWaveColor                   遮罩浪颜色
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
                                             extend:(id)extend
{
    ZJWaveAnimationView *waveAnimtaionView          = [[ZJWaveAnimationView alloc] initWithFrame:frame];
    waveAnimtaionView.type                          = animationType;
    waveAnimtaionView.waterLineY                    = waterLineY;
    waveAnimtaionView.waveAmplitude                 = waveAmplitude;
    waveAnimtaionView.waveCycle                     = waveCycle;
    waveAnimtaionView.realWaveColor                 = realWaveColor;
    waveAnimtaionView.maskWaveColor                 = maskWaveColor;
    waveAnimtaionView.direction                     = direction;
    [waveAnimtaionView setUpCustomUI];
    return waveAnimtaionView;
}

#pragma mark - Second.SetupCustomUI

-(void)setUpCustomUI
{
    [self.layer addSublayer:self.firstWaveLayer];
    if (self.type == ZJWaveAnimationTypeDouble) {
        [self.layer addSublayer:self.secondWaveLayer];
    }
}

- (void)wave
{
    /**
     *  绘制第一条正弦线
     */
    CGMutablePathRef frontPath          = CGPathCreateMutable();
    float frontY                        = _waterLineY;
    CGPathMoveToPoint(frontPath, NULL, 0, frontY);
    
    /**
     *  绘制第二条余弦线
     */
    CGMutablePathRef backPath           = CGPathCreateMutable();
    float backY                         = _waterLineY;
    CGPathMoveToPoint(backPath, NULL, 0, backY);
    
    for(float x = 0; x <= self.bounds.size.width; x++){
       
        if (self.direction == Left) {
            frontY                      = _waveAmplitude * sin( x/180*M_PI + 4*_waveCycle/M_PI ) * 5 + _waterLineY;
            backY                       = _waveAmplitude * cos( x/180*M_PI + 3*_waveCycle/M_PI ) * 5 + _waterLineY;
        }else if (self.direction == Right) {
            frontY                      = _waveAmplitude * sin( x/180*M_PI - 4*_waveCycle/M_PI ) * 5 + _waterLineY;
            backY                       = _waveAmplitude * cos( x/180*M_PI - 3*_waveCycle/M_PI ) * 5 + _waterLineY;
        }
        CGPathAddLineToPoint(frontPath, nil, x, frontY);
        CGPathAddLineToPoint(backPath, nil, x, backY);
    }
    
    CGPathAddLineToPoint(frontPath, nil, self.bounds.size.width, self.bounds.size.height);
    CGPathAddLineToPoint(frontPath, nil, 0, self.bounds.size.height);
    CGPathAddLineToPoint(frontPath, nil, 0, _waterLineY);
    CGPathCloseSubpath(frontPath);
    self.firstWaveLayer.path            = frontPath;
    
    CGPathAddLineToPoint(backPath, nil, self.bounds.size.width, self.bounds.size.height);
    CGPathAddLineToPoint(backPath, nil, 0, self.bounds.size.height);
    CGPathAddLineToPoint(backPath, nil, 0, _waterLineY);
    CGPathCloseSubpath(backPath);
    self.secondWaveLayer.path           = backPath;
    
    CGPathRelease(frontPath);
    CGPathRelease(backPath);
}

#pragma mark - Third.Lazyload

- (CAShapeLayer *)secondWaveLayer
{
    if (!_secondWaveLayer) {
        _secondWaveLayer                    = [CAShapeLayer layer];
        //设置闭环的颜色
        _secondWaveLayer.fillColor          = self.maskWaveColor.CGColor;
        //设置边缘线的颜色
        //_secondWaveLayer.strokeColor      = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
        _secondWaveLayer.lineWidth          = 4.0;
        _secondWaveLayer.strokeStart        = 0.0;
        _secondWaveLayer.strokeEnd          = 0.8;
    }
    return _secondWaveLayer;
}

- (CAShapeLayer *)firstWaveLayer
{
    if (!_firstWaveLayer) {
        _firstWaveLayer                     = [CAShapeLayer layer];
        //设置闭环的颜色
        _firstWaveLayer.fillColor           = self.realWaveColor.CGColor;
        //设置边缘线的颜色
        //_firstWaveLayer.strokeColor       = [UIColor blueColor].CGColor;
        //设置边缘线的宽度
        _firstWaveLayer.lineWidth           = 4.0;
        _firstWaveLayer.strokeStart         = 0.0;
        _firstWaveLayer.strokeEnd           = 0.8;
    }
    return _firstWaveLayer;
}

@end
