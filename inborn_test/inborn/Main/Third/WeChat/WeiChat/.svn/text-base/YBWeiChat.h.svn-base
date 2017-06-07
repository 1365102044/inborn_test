//
//  YBWeiChat.h
//  inborn
//
//  Created by 刘文强 on 2017/3/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
@protocol YBWeChatManagerDelegate <NSObject>

@optional

- (void)managerDidRecvGetMessageReq:(GetMessageFromWXReq *)request;

- (void)managerDidRecvShowMessageReq:(ShowMessageFromWXReq *)request;

- (void)managerDidRecvLaunchFromWXReq:(LaunchFromWXReq *)request;

- (void)managerDidRecvMessageResponse:(SendMessageToWXResp *)response;

- (void)managerDidRecvAuthResponse:(SendAuthResp *)response;

- (void)managerDidRecvAddCardResponse:(AddCardToWXCardPackageResp *)response;

- (void)managerDidRecvChooseCardResponse:(WXChooseCardResp *)response;

- (void)managerDidPayResponse:(PayResp *)response;

@end

@interface YBWeiChat : NSObject

/**
 代理
 */
@property (nonatomic, assign) id<YBWeChatManagerDelegate> delegate;

+ (instancetype)share;

/**
 注册微信
 */
- (void)reginsterWX;

/**
 微信登录
 */
- (BOOL)weiChatLogin;

/**
 是否安装 微信
 @return 微信已安装返回YES，未安装返回NO。
 */
- (BOOL)isInstallWeiChat;

/**
 发起微信
 @param url url
 @return 返回状态
 */
- (BOOL)handleOpenURL:(NSURL *)url;

@end
