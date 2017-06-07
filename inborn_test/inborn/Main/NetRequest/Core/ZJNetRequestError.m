//
//  ZJNetRequestError.m
//  Project
//
//  Created by 郑键 on 17/2/15.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJNetRequestError.h"

@implementation ZJNetRequestError

- (instancetype)initWithDomain:(NSErrorDomain)domain
                          code:(NSInteger)code
                      userInfo:(NSDictionary *)dict
{
    if (self == [super initWithDomain:domain code:code userInfo:dict]) {
        [self customErrorWithDomain:domain
                               code:code
                           userInfo:dict];
    }
    return self;
}

- (void)customErrorWithDomain:(NSErrorDomain)domain
                         code:(NSInteger)code
                     userInfo:(NSDictionary *)dict
{

}

/**
 *  原项目方法，在上面👆👆👆方法中重构
 */
+ (NSString *)errorWithCode:(NSInteger)errorCode
{
    NSString *err = nil;
    if (errorCode) {
        switch (errorCode) {
            case ZJProjectNetRequestErrorDefault:
                return @"数据返回失败，请重试。";
                break;
            case ZJProjectNetRequestErrorTimeOut:
                return @"请求超时，请重试。";
                break;
            case ZJProjectNetRequestErrorNoServer:
                return @"无法与服务器建立连接，请重试。";
                break;
            case ZJProjectNetRequestErrorNoNetwork:
                return @"网络不给力，请检查网络连接。";
                break;
            default:
                return @"数据返回失败，请重试。";
                break;
        }
    }
    
    return err;
}

@end
