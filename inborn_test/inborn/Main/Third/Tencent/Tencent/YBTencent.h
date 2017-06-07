//
//  YBTencent.h
//  inborn
//
//  Created by 刘文强 on 2017/3/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TencentOpenAPI/TencentOAuth.h>


/**
 * \brief TencentLoginDelegate iOS Open SDK 1.3 API回调协议
 *
 * 第三方应用实现登录的回调协议
 */
@protocol YBTencentLoginDelegate <NSObject>

@required

/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin;

/**
 * 登录失败后的回调
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled;

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork;

@optional
/**
 * 登录时权限信息的获得
 */
- (NSArray *)getAuthorizedPermissions:(NSArray *)permissions withExtraParams:(NSDictionary *)extraParams;

/**
 * unionID获得
 */
- (void)didGetUnionID;

@end

@interface YBTencent : NSObject<TencentLoginDelegate>

@property(nonatomic,weak) id<YBTencentLoginDelegate> YBTenceLoginDelegate;

@property(nonatomic,strong) TencentOAuth * tencentOAuth;

+ (instancetype)share;

/**
 * 判断用户手机上是否安装手机QQ
 * \return YES:安装 NO:没安装
 */
- (BOOL)isInstallTencent;

/**
 QQ登录
 */
-(void)TencentLogin;

/**
 @param url url
 @return 返回状态
 */
- (BOOL)TencenhandleOpenURL:(NSURL *)url;

/**
 获取openid
 */
- (NSString *)getOpenId;

/**
 获取token
 */
- (NSString *)getToken;
@end
