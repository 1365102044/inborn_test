//
//  YBBaiDu.m
//  inborn
//
//  Created by 郑键 on 17/3/14.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBBaiDu.h"

/**
 *  系统&第三方库
 */
#import <BaiduMobStat/BaiduMobStat.h>

@implementation YBBaiDu

/**
 注册百度SDK
 */
+ (void)registerBaiDu
{
    YBBaiDu *baiDu                                      = [YBBaiDu new];
    [baiDu startBaiduMobileStat];
}

/**
 *  启动百度移动统计
 */
- (void)startBaiduMobileStat
{
    /**
     *  若应用是基于iOS 9系统开发，需要在程序的info.plist文件中添加一项参数配置，确保日志正常发送，配置如下：
     *  NSAppTransportSecurity(NSDictionary):
     *  NSAllowsArbitraryLoads(Boolen):YES
     *  详情参考本Demo的BaiduMobStatSample-Info.plist文件中的配置
     */
    BaiduMobStat* statTracker                           = [BaiduMobStat defaultStat];
    
    /**
     *  此处(startWithAppId之前)可以设置初始化的可选参数，具体有哪些参数，可详见BaiduMobStat.h文件，例如：
     */
    statTracker.shortAppVersion                         = APPVERSION;
//    statTracker.enableDebugOn                           = YES;
    [statTracker startWithAppId:STYTEM_THIRD_BAIDU_STATISTICS_APPKEY];
}

@end
