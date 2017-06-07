//
//  YBWeiChat.m
//  inborn
//
//  Created by 刘文强 on 2017/3/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBWeiChat.h"
#import "WXApi.h"
#import "WXApiObject.h"

static NSString *kAuthScope = @"snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact";



@interface YBWeiChat ()<WXApiDelegate>

@end
@implementation YBWeiChat

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static YBWeiChat *weichat;
    dispatch_once(&onceToken, ^{
        weichat = [[YBWeiChat alloc]init];
    });
    return weichat;
}

/**
 注册微信
 */
- (void)reginsterWX
{
    //** 向微信注册支持的文件类型 */
    UInt64 typeFlag = MMAPP_SUPPORT_TEXT | MMAPP_SUPPORT_PICTURE | MMAPP_SUPPORT_LOCATION | MMAPP_SUPPORT_VIDEO |MMAPP_SUPPORT_AUDIO | MMAPP_SUPPORT_WEBPAGE | MMAPP_SUPPORT_DOC | MMAPP_SUPPORT_DOCX | MMAPP_SUPPORT_PPT | MMAPP_SUPPORT_PPTX | MMAPP_SUPPORT_XLS | MMAPP_SUPPORT_XLSX | MMAPP_SUPPORT_PDF;
    
    [WXApi registerAppSupportContentFlag:typeFlag];

    //** appID&描述 */
    [WXApi registerApp:STYTEM_THIRD_WECHAT_APPKEY_PRO];
}

/**
 发起微信
 @param url url
 @return 返回状态
 */
- (BOOL)handleOpenURL:(NSURL *)url
{
    [WXApi handleOpenURL:url delegate:self];
    return YES;
}

/**
 微信登录
 */
- (BOOL)weiChatLogin
{
    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope = kAuthScope;
    req.state = [self getRandomNumber:1 to:9999];
    req.openID = STYTEM_THIRD_WECHAT_APPKEY_PRO;
    return  [WXApi sendReq:req];
}

-(NSString *)getRandomNumber:(int)from to:(int)to
{
    return [NSString stringWithFormat:@"%d",(int)(from + (arc4random() % (to - from + 1)))];
}

/**
 是否安装 微信
 @return 微信已安装返回YES，未安装返回NO。
 */
- (BOOL)isInstallWeiChat
{
    return [WXApi isWXAppInstalled];
}


#pragma mark <WXApiDelegate>

- (void)onResp:(BaseResp *)resp
{
    //**微信分享**/
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        if (_delegate
            && [_delegate respondsToSelector:@selector(managerDidRecvMessageResponse:)]) {
            SendMessageToWXResp *sendMessageResp = (SendMessageToWXResp *)resp;
            [_delegate managerDidRecvMessageResponse:sendMessageResp];
        }
    }
    
    //**微信登录**/
    if ([resp isKindOfClass:[SendAuthResp class]]) {
        if (_delegate
            && [_delegate respondsToSelector:@selector(managerDidRecvAuthResponse:)]) {
            SendAuthResp *authResp = (SendAuthResp *)resp;
            [_delegate managerDidRecvAuthResponse:authResp];
        }
    }
    
    //** 返回PayResp 类型 */
    if ([resp isKindOfClass:[PayResp class]]) {
        if (!_delegate) return;
        if ([_delegate respondsToSelector:@selector(managerDidPayResponse:)]) {
            PayResp *payResp = (PayResp *)resp;
            [_delegate managerDidPayResponse:payResp];
        }
    }
}

- (void)onReq:(BaseReq *)req
{
    //** 返回PayResp 类型 */
    if ([req isKindOfClass:[PayResp class]]) {
        if (!_delegate) return;
        if ([_delegate respondsToSelector:@selector(managerDidPayResponse:)]
            && _delegate) {
            PayResp *payReq = (PayResp *)req;
            [_delegate managerDidPayResponse:payReq];
        }
    }
}

@end
