//
//  ZJNetRequestEncyptFatory.m
//  Project
//
//  Created by 郑键 on 17/2/15.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJNetRequestEncyptFatory.h"
#import "System_LocalData.h"
#import "User_LocalData.h"

@implementation ZJNetRequestEncyptFatory

/**
 配置请求头
 
 @param sessionManager sessionManager
 */
+ (void)setRequestHeaderWithSessionManager:(AFHTTPSessionManager *)sessionManager
{
    /**
     *  配置UUID
     */
    [sessionManager.requestSerializer setValue:[[System_LocalData new] UUID]
                            forHTTPHeaderField:@"uuid"];
    /**
     *  如果登录，携带token
     */
    [sessionManager.requestSerializer setValue:[User_LocalData getTokenId] ? [User_LocalData getTokenId] : @""
                            forHTTPHeaderField:@"token"];
}

@end
