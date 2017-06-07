//
//  YBHelpService.m
//  inborn
//
//  Created by 郑键 on 17/4/10.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBHelpService.h"

@interface YBHelpService()
{
    NSURLSessionTask *_helpListTask;
}
@end

@implementation YBHelpService

+ (instancetype)share{
    static dispatch_once_t t;
    static YBHelpService *service       = nil;
    dispatch_once(&t, ^{
        service                             = [[YBHelpService alloc] init];
    });
    return service;
}

/**
 *  帮助中心列表请求
 *
 *  @param alias               别名
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)getHelpListWithAlias:(NSString *)alias
                     success:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!alias) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"alias":!alias ? @"" : alias}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parameters                            = @{@"alias":alias};
    
    /**
     *  请求并获取task
     */
    __weak YBHelpService *weakSelf                  = self;
    _helpListTask                                   = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:HELP_LIST_URL
                                                                                                           requestNetworkType:ZJProjectNetRequestPost
                                                                                                                   parameters:parameters
                                                                                                              timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                 successBlock:^(id objc, id requestInfo) {
                                                                                                                     [weakSelf handleRequestSuccess:objc
                                                                                                                                       requestModel:requestInfo
                                                                                                                                           sucBlock:successBlock
                                                                                                                                          failBlock:failBlock];
                                                                                                                 }
                                                                                                                 failureBlock:^(id error, id requestInfo) {
                                                                                                                     [weakSelf handleRequestFailed:error
                                                                                                                                      requestModel:requestInfo
                                                                                                                                         failBlock:failBlock];
                                                                                                                 }];
}

/**
 *  取消示例网络请求
 */
- (void)cancelHelpListNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_helpListTask];
}

@end
