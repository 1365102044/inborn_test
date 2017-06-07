//
//  ZJThirdManager.m
//  Project
//
//  Created by 郑键 on 17/1/22.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJThirdManager.h"
#import "YBBaiDu.h"
#import "YBJPush.h"
#import "YBWeiChat.h"
#import "IQKeyboardManager.h"
#import "YXShareSDKManager.h"
#import "MQCustomerServiceManager.h"

/**
 *  第三方&系统库
 */
#import <UserNotifications/UserNotifications.h>

@interface ZJThirdManager() <UNUserNotificationCenterDelegate>

@property(nonatomic,strong) NSDictionary * launchOptions;

@end

@implementation ZJThirdManager

#pragma mark - 注册第三方工具

/**
 *  注册第三方工具
 *
 *  @param launchOptions 启动参数
 */
+ (void)registerThird:(NSDictionary *)launchOptions
{
    ZJThirdManager *manager                             = [ZJThirdManager new];
    manager.launchOptions                               = launchOptions;
    [manager registerBaiDu];
    [manager registerJPush];
    [manager reginsterWX];
    [manager setKeyBoardManger];
    [manager registerShareSdk];
    [manager mqChatView];
    [manager shareRegister];
}

/**
 注册百度SDK服务
 */
- (void)registerBaiDu
{
    [YBBaiDu registerBaiDu];
}

/**
 注册激光推送
 */
- (void)registerJPush
{
    [[YBJPush shareManager] reginsterJPushServiceWithOptions:self.launchOptions];
}

/**
 微信注册
 */
- (void)reginsterWX
{
    [[YBWeiChat share] reginsterWX];
}

/**
 键盘工具类
 */
- (void)setKeyBoardManger
{
    //关闭设置为NO, 默认值为NO.
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
}

/**
 注册shareSDK
 */
- (void)registerShareSdk
{
    //[[YBShareManger shareShare] registerShareSDK];
}

- (void)mqChatView
{
    [[MQCustomerServiceManager share] registerCustomSever];
}

- (void)shareRegister
{
    [[YXShareSDKManager sharedManager] registerApp];
}

@end
