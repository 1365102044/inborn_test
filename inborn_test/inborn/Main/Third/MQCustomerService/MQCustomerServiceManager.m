//
//  MQCustomerServiceManager.m
//  inborn
//
//  Created by 郑键 on 17/4/10.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "MQCustomerServiceManager.h"
#import "MQChatViewManager.h"
#import  <MeiQiaSDK/MQManager.h>
#import <IQKeyboardManager.h>
#import "YBChatViewController.h"
#import "User_LocalData.h"

/**
 * 网络请求基础URLString
 */
#ifdef DEBUG

#define MEIQIA_APPKEY STYTEM_THIRD_MEIQIA_APPKEY_DEV

#else

#define MEIQIA_APPKEY STYTEM_THIRD_MEIQIA_APPKEY_PRO

#endif

@interface MQCustomerServiceManager()

/**
 聊天控制器
 */
@property (nonatomic, strong) YBChatViewController *chatViewController;

@end

@implementation MQCustomerServiceManager

- (void)sendUrlMessage:(NSString *)urlString
{
    [self.chatViewController sendUrlMessage:urlString];
}

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static MQCustomerServiceManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[MQCustomerServiceManager alloc]init];
    });
    return instance;
}

/**
 注册客服
 */
- (void)registerCustomSever
{
    [MQManager initWithAppkey:MEIQIA_APPKEY completion:^(NSString *clientId, NSError *error) {
        if (!error) {
            
        } else {
            
        }
    }];
}

/**
 展示客服控制器
 
 @param viewController viewController
 */
- (void)showCustomerServiceWithViewController:(UIViewController *)viewController
{
    MQChatViewConfig *chaViewConfig = [MQChatViewConfig sharedConfig];
    chaViewConfig.enableRoundAvatar = YES;
    chaViewConfig.navBarTintColor = ZJCOLOR.color_c4;
    chaViewConfig.incomingMsgTextColor = ZJCOLOR.color_c4;
    chaViewConfig.outgoingMsgTextColor = ZJCOLOR.color_c4;
    chaViewConfig.keepAudioSessionActive = YES;
//    chaViewConfig.chatViewStyle.incomingBubbleImage = [UIImage imageNamed:@"message_chatbox1_bg"];
//    chaViewConfig.chatViewStyle.outgoingBubbleImage = [UIImage imageNamed:@"message_chatbox2_bg"];
    chaViewConfig.incomingBubbleColor = ZJCOLOR.color_c0;
    chaViewConfig.outgoingBubbleColor = ZJCOLOR.color_c23;
    chaViewConfig.navTitleText = @"消息";
    User_LocalData *userLocalData = [User_LocalData new];
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    
    /**
     *  配置用户参数
     */
    if ([User_LocalData getTokenId]) {
        [dictM setObject:userLocalData.nickname ? userLocalData.nickname : @"" forKey:@"name"];
    }else{
        
    }
    UIImage* avatar;
    NSData *headerimage  = [SYSTEM_USERDEFAULTS objectForKey:@"headerimagedata"];
    avatar = [UIImage imageWithData:headerimage];
    if (headerimage == nil) {
        avatar = [UIImage imageNamed:@"ic_default"];
    }
    
    chaViewConfig.outgoingDefaultAvatarImage = [UIImage imageNamed:@"ic_default"];
    chaViewConfig.clientInfo = dictM;
    //chaViewConfig.updateClientInfoUseOverride = YES;

    if (!self.chatViewController) {
        self.chatViewController = [[YBChatViewController alloc] initWithChatViewManager:chaViewConfig];
        self.chatViewController.chatTableView.backgroundColor = ZJCOLOR.color_c12;
    }else{
        
    }
    [viewController.navigationController pushViewController:self.chatViewController animated:YES];
}


@end
