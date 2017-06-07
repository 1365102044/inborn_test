//
//  YBJPush.m
//  inborn
//
//  Created by 刘文强 on 2017/3/14.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBJPush.h"
#import <AdSupport/AdSupport.h>
#import <UserNotifications/UserNotifications.h>
#import "ZJBaseTabBarController.h"
#import "ZJBaseNavigationController.h"
#import "AppDelegate.h"
#import "YBOrderDetailTableViewController.h"
#import "YBMessageOrderNewsListViewController.h"
#import "YBMessageSystemListViewController.h"
/**
 *  是否是线上环境
 */
#ifdef DEBUG
BOOL isProduction = NO;
#else
BOOL isProduction = YES;
#endif

@interface YBJPush ()<JPUSHRegisterDelegate>
{
    AppDelegate * appdelegate;
}
@end

@implementation YBJPush

/**
 获取单利对象

 @return 单利对象
 */
+ (YBJPush *)shareManager
{
    static YBJPush* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YBJPush alloc] init];
    });
    return manager;
}

/**
 注册推送
 */
- (void)reginsterJPushServiceWithOptions:(NSDictionary *)launchOptions
{
    if (iOS10) {
        JPUSHRegisterEntity *entity              = [[JPUSHRegisterEntity alloc]init];
        entity.types                             = UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound;
         id  ApplicationDelegate                 = [[UIApplication sharedApplication]delegate];
        [JPUSHService registerForRemoteNotificationConfig:entity
                                                 delegate:ApplicationDelegate];
    } else if (iOS8) {
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    } else {
        
        [JPUSHService registerForRemoteNotificationTypes:(UNAuthorizationOptionBadge |
                                                          UNAuthorizationOptionSound |
                                                          UNAuthorizationOptionAlert)
                                              categories:nil];
    }
    [JPUSHService setupWithOption:launchOptions
                           appKey:STYTEM_THIRD_JUPSH_APPKEY
                          channel:STYTEM_THIRD_JUPSH_CHANNEL
                 apsForProduction:isProduction
            advertisingIdentifier:nil];
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if (resCode==0) {
            YBLog(@"获取registrationID成功");
            [SYSTEM_USERDEFAULTS setObject:registrationID forKey:@"registrationID"];
        }else{
            YBLog(@"获取registrationID失败");
        }
    }];
    
    appdelegate                         = [[AppDelegate alloc]init];
}

+ (void)registerDeviceToken:(NSData *)deviceToken
{
    [JPUSHService registerDeviceToken:deviceToken];
}

+ (void)handleRemoteNotification:(NSDictionary *)userInfo
{
    [JPUSHService handleRemoteNotification:userInfo];
}


///**
// UIApplicationStateActive 前台运行  UIApplicationStateInactive 未启动app  UIApplicationStateBackground app在后台
// */
//+ (void)handleRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
//{
//    [JPUSHService handleRemoteNotification:userInfo];
//
//    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
//        
//    }
//    else if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive)
//    {
//        [[YBJPush shareManager] PushViewControllerWithNotiUserInfor:userInfo];
//    }else if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground){}
//    
//    completionHandler(UIBackgroundFetchResultNewData);
//}

+ (void)setAlias:(NSString *)alias
{
    [JPUSHService setAlias:alias
          callbackSelector:@selector(tagsAliasCallback:tags:alias:)
                    object:self];
}

/**
 *  极光推送注册服务回掉函数
 */
+ (void)tagsAliasCallback:(int)iResCode
                     tags:(NSSet*)tags
                    alias:(NSString*)alias
{
    NSString * callbackString        = nil;
    callbackString = [NSString stringWithFormat:@"%d, \ntags: %@, \nalias: %@\n",
                                iResCode,
                                [self logSet:tags],
                                alias];
    YBLog(@"TagsAlias回调:%@", callbackString);
}

+ (NSString *)logSet:(NSSet *)dic
{
    if (![dic count]) return nil;
    NSString *tempStr1 = [[dic description] stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    return str;
}


#pragma mark- JPUSHRegisterDelegate

/**
 *  iOS 10 Support 回调
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center
        willPresentNotification:(UNNotification *)notification
          withCompletionHandler:(void (^)(NSInteger))completionHandler
{
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive){
            [[YBJPush shareManager] pushViewControllerWithNotiUserInfor:userInfo];
        }
    }
    completionHandler(UNNotificationPresentationOptionAlert);
}

/**
 iOS 10 Support
 */
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center
 didReceiveNotificationResponse:(UNNotificationResponse *)response
          withCompletionHandler:(void (^)())completionHandler
{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]){
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();
}

- (NSString *)modeString
{
#if DEBUG
    [JPUSHService setLogOFF];
    return @"Development (sandbox)";
#else
    return @"Production";
#endif
}

/**
 跳转到各个对应的控制器
 */
- (void)pushViewControllerWithNotiUserInfor:(NSDictionary *)userInfor
{
    if (!userInfor || userInfor == (id)kCFNull)     return;
    NSString *type                                  = [userInfor objectForKey:@"type"];
    NSString *refId                                 = [userInfor objectForKey:@"refId"];
    NSString *name                                  = [userInfor objectForKey:@"name"];
    
    ZJBaseTabBarController *tabVC = (ZJBaseTabBarController *)SYSTEM_KEYWINDOW.rootViewController;
    ZJBaseNavigationController *pushClassStance = (ZJBaseNavigationController *)tabVC.viewControllers[tabVC.selectedIndex];
    NSString *typeIndex = [type substringToIndex:1];
    
    /*
     @brief 订单
     */
    if ([typeIndex isEqualToString:@"1"]) {
      
//        YBMessageOrderNewsListViewController *orderNewListVC = [[YBMessageOrderNewsListViewController alloc]init];
//        [pushClassStance pushViewController:orderNewListVC animated:YES];
//        YBOrderDetailTableViewController *orderdeatilVC = [YBOrderDetailTableViewController orderDetailTableViewControllerWithOrderId:refId
//                                                                                                                               extend:self];
//        [pushClassStance pushViewController:orderdeatilVC animated:YES];
//        
    }
    
    /*
     @brief 保证金订单
     */
    if ([typeIndex isEqualToString:@"2"]) {
        if ([type isEqualToString:@"201"]) {
            
        } else if ([type isEqualToString:@"202"]||[type isEqualToString:@"203"]) {
            
        } else if ([type isEqualToString:@"204"]||[type isEqualToString:@"205"]) {
            
        } else {
        }
    }
    
    /*
     @brief 鉴定订单
     */
    if ([typeIndex isEqualToString:@"3"]) {
        
    }
    
    /*
     @brief 系统通知
     */
    if ([typeIndex isEqualToString:@"4"]) {
        
//        YBMessageSystemListViewController *systemVC = [[YBMessageSystemListViewController alloc]init];
//        [pushClassStance pushViewController:systemVC animated:YES];
    }
}
/**
 是否通知掉起预鉴定详情
 @return 返回判断结果
 */
- (BOOL)canNoticeSendAuctionInformationWithVcType:(NSString *)vcType
{
//    if ([vcType isEqualToString:@"301"]
//        && appdelegate.status != AppDelegateDidBecomeActiveQueryGoodStatus) {
//        return YES;
//    }
//    if ([vcType isEqualToString:@"302"]
//        && appdelegate.status != AppDelegateDidBecomeActiveQueryGoodStatus ) {
//        return YES;
//    }
    return NO;
}
@end
