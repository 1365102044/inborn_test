//
//  YBTencent.m
//  inborn
//
//  Created by 刘文强 on 2017/3/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBTencent.h"

@interface YBTencent ()<TencentSessionDelegate>

@end

@implementation YBTencent

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    static YBTencent *instance;
    dispatch_once(&onceToken, ^{
        instance = [[YBTencent alloc]init];
    });
    return instance;
}

/**
 * 判断用户手机上是否安装手机QQ
 * \return YES:安装 NO:没安装
 */
- (BOOL)isInstallTencent
{
    return  [TencentOAuth iphoneQQInstalled];
}

/**
 QQ登录
 */
-(void)TencentLogin
{
    self.tencentOAuth = [[TencentOAuth alloc] initWithAppId:STYTEM_THIRD_TENCEOPEN_APPKEY_PRO andDelegate:self];
    self.tencentOAuth.redirectURI = @"www.qq.com";
    NSArray * permissions = [NSArray arrayWithObjects:@"get_user_info",@"get_simple_userinfo", @"add_t", nil];
    [self.tencentOAuth authorize:permissions inSafari:NO];
}


/**
 获取openid
 */
- (NSString *)getOpenId
{
    return self.tencentOAuth.openId;
}

/**
 获取token
 */
- (NSString *)getToken
{
    return self.tencentOAuth.accessToken;
}

/**
 @param url url
 @return 返回状态
 */
- (BOOL)TencenhandleOpenURL:(NSURL *)url
{
    return  [TencentOAuth HandleOpenURL:url];
}

/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{
    if ([self.YBTenceLoginDelegate respondsToSelector:@selector(tencentDidLogin)]) {
        [self.YBTenceLoginDelegate tencentDidLogin];
    }
}

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    if ([self.YBTenceLoginDelegate respondsToSelector:@selector(tencentDidNotLogin:)]) {
        [self.YBTenceLoginDelegate tencentDidNotLogin:cancelled];
    }
}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{
    if ([self.YBTenceLoginDelegate respondsToSelector:@selector(tencentDidNotNetWork)]) {
        [self.YBTenceLoginDelegate tencentDidNotNetWork];
    }
}

@end
