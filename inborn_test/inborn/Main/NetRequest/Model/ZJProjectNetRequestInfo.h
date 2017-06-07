//
//  ZJProjectNetRequestInfo.h
//  Project
//
//  Created by 郑键 on 17/2/16.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJProjectNetRequestInfo : NSObject

//** =========================================================================================== */
//** ============================================请求=========================================== */
//** =========================================================================================== */

/**
 请求任务task
 */
@property (nonatomic, strong) NSURLSessionTask *sessionTask;

/**
 请求的URLString
 */
@property (nonatomic, copy) NSString *urlString;

/**
 请求参数
 */
@property (nonatomic, strong) NSDictionary *requestParam;

/**
 请求时间戳
 */
@property (nonatomic, strong) NSString *timeStamp;

//** =========================================================================================== */
//** ============================================响应=========================================== */
//** =========================================================================================== */

/**
 responseObject
 */
@property (nonatomic, strong) id responseObject;

@end
