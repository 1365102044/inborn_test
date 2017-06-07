//
//  ZJTimerManager.m
//  inborn
//
//  Created by 郑键 on 17/3/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJTimerManager.h"

@interface ZJTimerManager()

/**
 定时器
 */
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ZJTimerManager

+ (instancetype)shareTimer
{
    static dispatch_once_t onceToken;
    static ZJTimerManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[ZJTimerManager alloc]init];
    });
    return instance;
}

/**
 定时器调用事件

 @param timer timer
 */
- (void)timerAction:(NSTimer *)timer
{
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:TIMER_NOTIFICATION
                                             object:nil
                                           userInfo:nil];
}

/**
 开始定时器 (修改：NSDefaultRunLoopMode -> NSRunLoopCommonModes)
 */
- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal
{
    if (_timer) return;
    _timer = [NSTimer timerWithTimeInterval:timeInterVal
                                     target:self
                                   selector:@selector(timerAction:)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer
                              forMode:NSRunLoopCommonModes];
}

/**
 开始定时器
 
 @param timeInterVal        调用时间间隔
 @param target              对象
 @param selector            方法
 */
- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal
                            target:(id)target
                          selector:(SEL)selector
{
    if (_timer) return;
    _timer = [NSTimer timerWithTimeInterval:timeInterVal
                                     target:target
                                   selector:selector
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer
                              forMode:NSRunLoopCommonModes];
}

/**
 结束定时器
 */
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

@end
