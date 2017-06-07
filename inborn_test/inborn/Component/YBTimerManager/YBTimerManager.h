//
//  YBTimerManager.h
//  inborn
//
//  Created by 郑键 on 17/3/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTimer.h"

@interface YBTimerManager : ZJBaseTimer

/**
 init获取定时器管理，该对象使用通知接收响应，通知名参照ZJNotificationConst.h
 */

/**
 开始定时器，父类方法，直接调用即可
 */
//- (void)startTimerWithTimeInterVal:(NSTimeInterval)timeInterVal;

/**
 结束定时器，父类方法，直接调用即可
 */
//- (void)stopTimer;

@end
