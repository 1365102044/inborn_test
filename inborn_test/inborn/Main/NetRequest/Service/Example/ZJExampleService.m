//
//  ZJExampleService.m
//  Project
//
//  Created by 郑键 on 17/2/16.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJExampleService.h"

@interface ZJExampleService()
{
    NSURLSessionTask *_exampleTask;
}
@end

@implementation ZJExampleService

+ (instancetype)share{
    static dispatch_once_t t;
    static ZJExampleService *service       = nil;
    dispatch_once(&t, ^{
        service                         = [[ZJExampleService alloc] init];
    });
    return service;
}

/**
 *  示例网络请求
 *
 *  @param example1            参数1
 *  @param example2            参数2
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)exampleNetRequestWithExample1:(id)example1
                             example2:(id)example2
                              success:(ZJNetRequestSuccessBlock)successBlock
                                 fail:(ZJNetRequestFailureBlock)failBlock
{
//    /**
//     *  TODO:根据服务器携带参数要求判断
//     *  不满足服务器参数要求时，抛出异常
//     */
//    
//    /**
//     *  配置参数
//     */
//    NSDictionary *params                = @{@"example1":example1,
//                                            @"example2":example2};
//    
//    /**
//     *  请求并获取task
//     */
//    __weak ZJExampleService *weakSelf   = self;
//    _exampleTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:HOMEPAGE_GOODLIST_URL
//                                                                                               requestNetworkType:ZJProjectNetRequestPost
//                                                                                                       parameters:params
//                                                                                                  timeoutInterval:20
//                                                                                                     successBlock:^(id objc, id requestInfo) {
//                                                                                                         [weakSelf handleRequestSuccess:objc
//                                                                                                                           requestModel:requestInfo
//                                                                                                                               sucBlock:successBlock
//                                                                                                                              failBlock:failBlock];
//                                                                                                     }
//                                                                                                     failureBlock:^(id error, id requestInfo) {
//                                                                                                         [weakSelf handleRequestFailed:error
//                                                                                                                          requestModel:requestInfo
//                                                                                                                             failBlock:failBlock];
//                                                                                                     }];
}

/**
 *  取消示例网络请求
 */
- (void)cancelExampleNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_exampleTask];
}

@end
