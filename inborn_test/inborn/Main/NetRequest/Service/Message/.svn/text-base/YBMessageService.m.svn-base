//
//  YBMessageService.m
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageService.h"

@interface YBMessageService ()
{
    NSURLSessionTask *_mineAccountInfoTask;
}
@end

@implementation YBMessageService

+ (instancetype)share
{
    static dispatch_once_t t;
    static YBMessageService *service           = nil;
    dispatch_once(&t, ^{
        service                             = [[YBMessageService alloc] init];
    });
    return service;
}

/**
 *  获取消息未读数
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageListNureadNewsNmuberInforSuccess:(ZJNetRequestSuccessBlock)successBlock
                                              fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    
    /**
     *  请求并获取task
     */
    __weak YBMessageService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETMESSAGECENTERLISTNUREADNEWSNUMBER_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
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
 *  取消获取消息未读数
 */
- (void)cancelgetMessageListNureadNewsNmuberInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mineAccountInfoTask];
}


/**
 *  获取订单消息列表
 *  pageSize	string	是	没有大小
 *  curPage	string	是	当前页
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageOrderListInforWith:(NSInteger)pageSize
                             curPage:(NSInteger)curPage
                             Success:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (curPage) param[@"curPage"] = @(curPage);
    if (pageSize) param[@"pageSize"] = @(pageSize);
    /**
     *  请求并获取task
     */
    __weak YBMessageService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETMESSAGEOREDERNEWSLISTDATA_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:param
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
 *  取消获取订单消息列表
 */
- (void)cancelgetMessageOrderListInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mineAccountInfoTask];
}


/**
 *  获取系统消息列表
 *  pageSize	string	是	没有大小
 *  curPage	string	是	当前页
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageSystemNewsListInforWith:(NSInteger)pageSize
                                  curPage:(NSInteger)curPage
                                  Success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock
{
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (curPage) param[@"curPage"] = @(curPage);
    if (pageSize) param[@"pageSize"] = @(pageSize);
    /**
     *  请求并获取task
     */
    __weak YBMessageService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETMESSAGESYSTEMNEWSLISTDATA_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:param
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
 *  取消获取系统消息列表
 */
- (void)cancelgetMessageSystemNewsListInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mineAccountInfoTask];
}


/**
 *  获取鉴定订单消息列表
 *  pageSize	string	是	没有大小
 *  curPage	string	是	当前页
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageAppraisalNewsListInforWith:(NSInteger)pageSize
                                     curPage:(NSInteger)curPage
                                     Success:(ZJNetRequestSuccessBlock)successBlock
                                        fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (curPage) param[@"curPage"] = @(curPage);
    if (pageSize) param[@"pageSize"] = @(pageSize);
    /**
     *  请求并获取task
     */
    __weak YBMessageService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETMESSAGEAPPRAISALORDERNEWSLISTDATA_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:param
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
 *  取消获取鉴定订单消息列表
 */
- (void)cancelgetMessageAppraisalNewsListInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mineAccountInfoTask];
}



/**
 *  获取担保金订单消息列表
 *  pageSize	string	是	没有大小
 *  curPage	string	是	当前页
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageDepositNewsListInforWith:(NSInteger)pageSize
                                     curPage:(NSInteger)curPage
                                     Success:(ZJNetRequestSuccessBlock)successBlock
                                        fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (curPage) param[@"curPage"] = @(curPage);
    if (pageSize) param[@"pageSize"] = @(pageSize);
    /**
     *  请求并获取task
     */
    __weak YBMessageService *weakSelf                      = self;
    _mineAccountInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETMESSAGEDESPOSITORDERNEWSLISTDATA_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:param
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
 *  取消获取担保金订单消息列表
 */
- (void)cancelgetMessageDespositNewsListInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mineAccountInfoTask];
}
@end
