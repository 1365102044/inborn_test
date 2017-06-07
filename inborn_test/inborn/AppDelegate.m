//
//  AppDelegate.m
//  inborn
//
//  Created by 郑键 on 17/3/14.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "AppDelegate.h"
#import "ZJBaseTabBarController.h"
#import "ZJThirdManager.h"
#import "YBJPush.h"
#import <UserNotifications/UserNotifications.h>
#import "ZJBaseTabBarController.h"
#import "ZJBaseNavigationController.h"
#import "ZJBaseWindow.h"
#import "YBWeiChat.h"
#import "YBTencent.h"
#import "YBPaymentManager.h"

@interface AppDelegate ()<JPUSHRegisterDelegate, UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /**
     *  加载根控制器
     */
    [self loadRootViewController];
    
    /**
     *  加载第三方SDK
     */
    [ZJThirdManager registerThird:launchOptions];
    
    /**
     *  配置全局样式
     */
    [self setupProjectAppearance];
    
    return YES;
}

/**
 *  配置全局样式
 */
- (void)setupProjectAppearance
{
    [[UITextField appearance] setTintColor:ZJCOLOR.color_c6];
}

/**
 *  加载根控制器
 */
- (void)loadRootViewController
{
    _window                                     = [[ZJBaseWindow alloc] initWithFrame:SCREEN_RECT];
    ZJBaseTabBarController *tabBarController    = [[ZJBaseTabBarController alloc] init];
    _tabBarController = tabBarController;
    [_window setRootViewController:tabBarController];
    [_window makeKeyAndVisible];
}

/**
 *  上传极光devicetoken
 */
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [YBJPush registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    YBLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

#pragma mark- JPUSHRegisterDelegate
/**
 * 当程序在前台时, 收到推送弹出的通知
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center
        willPresentNotification:(UNNotification *)notification
          withCompletionHandler:(void (^)(NSInteger))completionHandler
{
    NSDictionary *userInfo = notification.request.content.userInfo;
    if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]){
        [JPUSHService handleRemoteNotification:userInfo];
    }
}

/**
 程序关闭后, 通过点击推送弹出的通知
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center
 didReceiveNotificationResponse:(UNNotificationResponse *)response
          withCompletionHandler:(void (^)())completionHandler
{
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]){
        [JPUSHService handleRemoteNotification:userInfo];
        /**
         *  type为500时为客服消息推送，在此走客服消息处理分之，不予订单推送一起处理
         */
        if ([userInfo[@"type"] isEqualToString:@"500"]) {
//            [[YXChatViewManger sharedChatviewManger] handleNotificationMessageWithUserInfo:userInfo];
        }else{
            [[YBJPush shareManager] pushViewControllerWithNotiUserInfor:userInfo];
        }
    }
    /**
     *系统要求执行这个方法
     */
    completionHandler();
}

/**
    Required, iOS 7 Support
 */
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive){
        [[YBJPush shareManager] pushViewControllerWithNotiUserInfor:userInfo];
    }
}

/**
 Required,For systems with less than or equal to iOS6
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [JPUSHService handleRemoteNotification:userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    if ([YXWeChatPayManager sharedManager].navigationControllerArray.count >= 2
//        && self.status == AppDelegateDidBecomeActiveQueryGoodStatus) {
//        UINavigationController *controller = [YXWeChatPayManager sharedManager].navigationControllerArray.firstObject;
//        [controller dismissViewControllerAnimated:NO completion:nil];
//    }
//    [[YXWeChatPayManager sharedManager].navigationControllerArray removeObjectAtIndex:0];
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService setBadge:0];
//    [SVProgressHUD dismiss];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [application setApplicationIconBadgeNumber:0];
    [JPUSHService setBadge:0];
//    [MQManager openMeiqiaService];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    if (self.status != AppDelegateDidBecomeActiveQueryGoodStatus) return;
    //** 发送通知 */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"paymentCallBackFromeWX" object:nil userInfo:nil];

}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.

}


-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [[YBWeiChat share] handleOpenURL:url];
}
// 9.0之前的
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [self OpenWithURL:url];
}
// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    return  [self OpenWithURL:url];
}
/**
 支付宝 微信 支付回调的openURL
 platformId=wechat 分享 聊天界面
 oauth  微信登录
 qzapp  qq 登录
 */
- (BOOL)OpenWithURL:(NSURL *)url
{
    if ([url.host isEqualToString:@"safepay"]) {
        
        [[YBPaymentManager sharedManager] openUrlCallBackAlipay:url];
        self.status = AppDelegateDidBecomeActiveWXCallBacked;
        
        return YES;
        
    }else if ([url.host isEqualToString:@"pay"]) {
        
        self.status = AppDelegateDidBecomeActiveWXCallBacked;
        return [[YBPaymentManager sharedManager] openUrlCallBackWeChat:url];
        
        
    }else if([url.host isEqualToString:@"oauth"] || [url.host isEqualToString:@"platformId=wechat"]){

        return [[YBWeiChat share] handleOpenURL:url];
        
    }else if ([url.host isEqualToString:@"qzapp"]){
        
        return [[YBTencent share] TencenhandleOpenURL:url];
        
    }else{
        
        return YES;
    }
}

@end
