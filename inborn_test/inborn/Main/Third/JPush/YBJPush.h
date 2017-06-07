//
//  YBJPush.h
//  inborn
//
//  Created by 刘文强 on 2017/3/14.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "JPUSHService.h"

@interface YBJPush : NSObject<JPUSHRegisterDelegate>

//@property(nonatomic,weak) id<YBJPushDelegate>  JPushDelegate;

/**
 *  获取单利对象
 *
 *  @return 极光单利对象
 */
+ (YBJPush *)shareManager;

/**
 *  注册推送
 */
- (void)reginsterJPushServiceWithOptions:(NSDictionary *)launchOptions;

/**
 *  向服务器上报Device Token
 *
 *  @param deviceToken 设备token值
 */
+ (void)registerDeviceToken:(NSData *)deviceToken;

/**
 *  处理收到的APNS消息，向服务器上报收到APNS消息
 */
+ (void)handleRemoteNotification:(NSDictionary *)userInfo;

/**
 *  设置 tag值和别名
 *  tag值 是标志唯一设备
 *  alias 是标志一类用户
 */
+ (void)setAlias:(NSString *)alias;


/**
 跳转到各个对应的控制器
 */
- (void)pushViewControllerWithNotiUserInfor:(NSDictionary *)userInfor;

@end

