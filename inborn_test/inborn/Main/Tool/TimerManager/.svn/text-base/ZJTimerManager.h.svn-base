//
//  ZJTimerManager.h
//  inborn
//
//  Created by 郑键 on 17/3/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJTimerManager : NSObject

#pragma mark - 初始化

/**
 init获取定时器管理，该对象使用通知接收响应，通知名参照ZJNotificationConst.h
 */

+ (instancetype)shareTimer;

/**
 开始定时器
 */
- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal;

/**
 开始定时器

 @param timeInterVal        调用时间间隔
 @param target              对象
 @param selector            方法
 */
- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal
                            target:(id)target
                          selector:(SEL)selector;

/**
 结束定时器
 */
- (void)stopTimer;

@end
