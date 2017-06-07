//
//  ZJBaseModel.h
//  Project
//
//  Created by 郑键 on 17/3/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJBaseModel : NSObject

//** =========================================================================================== */
//** ==========================================辅助属性========================================= */
//** =========================================================================================== */

/**
 当cell重设Frame时，单行刷新导致的重新计算问题
 */
@property (nonatomic, assign) BOOL canRestFrame;

/**
 倒计时计算时间
 */
@property (nonatomic, assign) NSTimeInterval surplusBidTime;

/**
 倒计时

 @return 倒计时时间
 */
- (NSString *)countDownString;

@end
