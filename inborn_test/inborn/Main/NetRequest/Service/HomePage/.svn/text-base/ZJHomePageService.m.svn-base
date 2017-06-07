//
//  ZJHomePageService.m
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJHomePageService.h"

@interface ZJHomePageService()
{
    NSURLSessionTask *_homePageCategoriesTask;
    NSURLSessionTask *_homePageCategoryGoodListTask;
    NSURLSessionTask *_isAddCollectionTask;
    NSURLSessionTask *_addCollectionTask;
    NSURLSessionTask *_cancelCollectionTask;
    NSURLSessionTask *_checkVersionTask;
}

@end

@implementation ZJHomePageService

+ (instancetype)share{
    static dispatch_once_t t;
    static ZJHomePageService *service       = nil;
    dispatch_once(&t, ^{
        service                             = [[ZJHomePageService alloc] init];
    });
    return service;
}


/**
 *  获取首页分类
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getHomePageCategoriesSuccess:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
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
    __weak ZJHomePageService *weakSelf                  = self;
    _homePageCategoriesTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:HOMEPAGE_CATEGORIES_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
                                                                                                                  timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                     successBlock:^(id objc, id requestInfo) {
                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                         [weakSelf handleRequestSuccess:objc
                                                                                                                                           requestModel:requestInfo
                                                                                                                                               sucBlock:successBlock
                                                                                                                                              failBlock:failBlock];
                                                                                                                     }
                                                                                                                     failureBlock:^(id error, id requestInfo) {
                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                         [weakSelf handleRequestFailed:error
                                                                                                                                          requestModel:requestInfo
                                                                                                                                             failBlock:failBlock];
                                                                                                                     }];
    
}

/**
 *  取消首页分类网络请求
 */
- (void)cancelGetHomePageCategoriesNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_homePageCategoriesTask];
}

/**
 *  获取标签对应商品列表
 *
 *  @param tabId               标签id（必传）
 *  @param curPage             页码（必传）
 *  @param sort                排序price_asc,price_desc,collection_desc,browse_desc（非必传）
 *  @param search              搜索条件（非必传）
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getCategoryGoodListWithTabId:(NSString *)tabId
                             curPage:(NSString *)curPage
                                sort:(NSString *)sort
                              search:(NSString *)search
                             success:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!tabId
        || !curPage) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"tabId":!tabId ? @"" : tabId,
                                                                        @"curPage":!curPage ? @"" : curPage}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parameters                            = @{@"tabId":tabId,
                                                            @"curPage":curPage,
                                                            @"sort":sort ? sort : @"",
                                                            @"serach":search ? search : @""};
    
    /**
     *  请求并获取task
     */
    __weak ZJHomePageService *weakSelf                  = self;
    _homePageCategoriesTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:HOMEPAGE_CATEGORYGOODLIST_URL
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
 *  取消分类商品列表网络请求
 */
- (void)cancelGetCategoryGoodListNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_homePageCategoryGoodListTask];
}

/**
 *  获取公共配置数据
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getpublicConfigureInformationSuccess:(ZJNetRequestSuccessBlock)successBlock
                                        fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /*
     *  请求并获取task
     */
    __weak ZJHomePageService *weakSelf                  = self;
    _homePageCategoriesTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PUBLICCONFIGUREINFOR_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:@{}
                                                                                                                  timeoutInterval:SEVRIES_TIMEOUT
                                                                                                                     successBlock:^(id objc, id requestInfo) {
                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                         [weakSelf handleRequestSuccess:objc
                                                                                                                                           requestModel:requestInfo
                                                                                                                                               sucBlock:successBlock
                                                                                                                                              failBlock:failBlock];
                                                                                                                     }
                                                                                                                     failureBlock:^(id error, id requestInfo) {
                                                                                                                         [SVProgressHUD dismiss];
                                                                                                                         [weakSelf handleRequestFailed:error
                                                                                                                                          requestModel:requestInfo
                                                                                                                                             failBlock:failBlock];
                                                                                                                     }];
    
}

/**
 *  取消获取公共配置数据网络请求
 */
- (void)cancelgetpublicInformationNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_homePageCategoriesTask];
}

/**
 *  根据商品的id查看商品是否已经添加到收藏
 *
 *  @param goodsId                 一组商品的id的字符串id1_id2_id3
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)isAddCollectionWithGoodsId:(NSString *)goodsId
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!goodsId) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"goodsId":!goodsId ? @"" : goodsId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parameters                            = @{@"goodsId":goodsId};
    
    /**
     *  请求并获取task
     */
    __weak ZJHomePageService *weakSelf                  = self;
    _isAddCollectionTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PUBLICK_ISADDCOLLECTION_URL
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
 *  取消根据商品的id查看商品是否已经添加到收藏网络请求
 */
- (void)cancelIsAddCollectionNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_isAddCollectionTask];
}

/**
 *  添加收藏
 *
 *  @param goodId                  一组商品的id的字符
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)addCollectionWithGoodId:(NSString *)goodId
                        success:(ZJNetRequestSuccessBlock)successBlock
                           fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!goodId) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"goodId":!goodId ? @"" : goodId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parameters                            = @{@"goodsId":goodId};
    
    /**
     *  请求并获取task
     */
    __weak ZJHomePageService *weakSelf                  = self;
    _addCollectionTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PUBLICK_ADDCOLLECTION_URL
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
 *  取消添加收藏网络请求
 */
- (void)cancelAddCollectionNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_addCollectionTask];
}

/**
 *  取消收藏
 *
 *  @param goodId                  一组商品的id的字符
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)cancelCollectionWithGoodId:(NSString *)goodId
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!goodId) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"goodId":!goodId ? @"" : goodId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parameters                            = @{@"goodsId":goodId};
    
    /**
     *  请求并获取task
     */
    __weak ZJHomePageService *weakSelf                  = self;
    _cancelCollectionTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PUBLICK_CANCELCOLLECTION_URL
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
 *  取消取消收藏网络请求
 */
- (void)cancelCancelCollectionNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_cancelCollectionTask];
}

/**
 *  版本控制
 *
 *  @param currentAppVersion       一组商品的id的字符
 *  @param appType                 渠道 1.iOS
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)checkVersionWithCurrentAppVersion:(NSString *)currentAppVersion
                                  appType:(NSString *)appType
                                  success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if (!currentAppVersion
        || !appType) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"currentAppVersion":!currentAppVersion ? @"" : currentAppVersion,
                                                                        @"appType":!appType ? @"" : appType}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parameters                            = @{@"appVersion":currentAppVersion,
                                                            @"appType":@"1"};
    
    /**
     *  请求并获取task
     */
    __weak ZJHomePageService *weakSelf                  = self;
    _checkVersionTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PUBLICK_CHECKAPPVERSION_URL
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
 *  取消版本控制网络请求
 */
- (void)cancelCheckVersionNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_checkVersionTask];
}

@end
