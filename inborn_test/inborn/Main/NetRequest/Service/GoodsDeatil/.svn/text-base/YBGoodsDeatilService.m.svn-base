//
//  YBGoodsDeatilService.m
//  inborn
//
//  Created by 刘文强 on 2017/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilService.h"

@interface YBGoodsDeatilService ()
{
    NSURLSessionTask *_GoodsDeatilInfoTask;
}
@end

@implementation YBGoodsDeatilService

+ (instancetype)share{
    static dispatch_once_t t;
    static YBGoodsDeatilService *service           = nil;
    dispatch_once(&t, ^{
        service                             = [[YBGoodsDeatilService alloc] init];
    });
    return service;
}

/**
 *  获取商品详情A(大图模式)的数据
 *  @param goodsId                 商品编号 (必传)
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getGoodsDeatilBigImageInfoWithgoodsId:(NSString *)goodsId
                                    isPreview:(BOOL)isPreview
                                      Success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  根据服务器携带参数要求判断
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
    NSDictionary *params                            = @{@"goodsId":goodsId};
    
    NSString *urlString;
    if (isPreview) {
        urlString = COMPOSE_PREVIEW_URL;
    }else{
        urlString = GOODS_DEATIL_BIGIMAGE_URL;
    }
    
    /**
     *  请求并获取task
     */
    __weak YBGoodsDeatilService *weakSelf                      = self;
    _GoodsDeatilInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:urlString
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:params
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
 *  取消获取商品详情A(大图模式)的数据
 */
- (void)cancelGetGoodsDeatilBigImageInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_GoodsDeatilInfoTask];
}


/**
 *  获取商品详情B(详细模式)的数据
 *  @param goodsId                 商品编号 (必传)
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getGoodsDeatilInfoWithgoodsId:(NSString *)goodsId
                              Success:(ZJNetRequestSuccessBlock)successBlock
                                 fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  根据服务器携带参数要求判断
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
    NSDictionary *params                            = @{@"goodsId":goodsId};
    
    /**
     *  请求并获取task
     */
    __weak YBGoodsDeatilService *weakSelf                      = self;
    _GoodsDeatilInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GOODS_DEATIL_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:params
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
 *  取消获取商品详情A(大图模式)的数据
 */
- (void)cancelGetGoodsDeatilInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_GoodsDeatilInfoTask];
}

/**
 *  添加关注
 *  @param goodsId                 商品编号 (必传)
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)addCollectGoodsInGoodsDeatilWithgoodsId:(NSString *)goodsId
                                        Success:(ZJNetRequestSuccessBlock)successBlock
                                           fail:(ZJNetRequestFailureBlock)failBlock
{

    /**
     *  根据服务器携带参数要求判断
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
    NSDictionary *params                            = @{@"goodsId":goodsId};
    
    /**
     *  请求并获取task
     */
    __weak YBGoodsDeatilService *weakSelf                      = self;
    _GoodsDeatilInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GOODS_ADDCOLLECT_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:params
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
 *  取消关注
 *  @param goodsId                 商品编号 (必传)
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)cancleCollectGoodsInGoodsDeatilWithgoodsId:(NSString *)goodsId
                                           Success:(ZJNetRequestSuccessBlock)successBlock
                                              fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  根据服务器携带参数要求判断
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
    NSDictionary *params                            = @{@"goodsId":goodsId};
    
    /**
     *  请求并获取task
     */
    __weak YBGoodsDeatilService *weakSelf                      = self;
    _GoodsDeatilInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GOODS_CANCLECOLLECT_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:params
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
 *  猜你喜欢
 goodsId	string	是	当前浏览的商品的id
 curPage	string	是	当前页
 pageSize	string	是	每页大小
 */
- (void)guessLikeGoodsInGoodsDeatilWithgoodsId:(NSString *)goodsId
                                           curPage:(NSInteger )curPage
                                          pageSize:(NSInteger )pageSize
                                           Success:(ZJNetRequestSuccessBlock)successBlock
                                              fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  配置参数
     */
    NSDictionary *params                            = @{@"goodsId":goodsId,
                                                        @"curPage":@(curPage),
                                                        @"pageSize":@(pageSize)};
    
    /**
     *  请求并获取task
     */
    __weak YBGoodsDeatilService *weakSelf                      = self;
    _GoodsDeatilInfoTask                                = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GUESSGOODSLISTDATA_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:params
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


@end
