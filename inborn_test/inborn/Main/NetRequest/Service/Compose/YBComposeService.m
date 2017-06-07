//
//  YBComposeService.m
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeService.h"

@interface YBComposeService()
{
    NSURLSessionTask *_getGoodBranceTask;
    NSURLSessionTask *_composeGoodsInfoTask;
    NSURLSessionTask *_delImageTask;
    NSURLSessionTask *_composeTask;
    NSURLSessionTask *_composeListTask;
    NSURLSessionTask *_delGoodTask;
    NSURLSessionTask *_offShelveTask;
    NSURLSessionTask *_refreshGoodTimeTask;
    NSURLSessionTask *_refreshShelveTask;
    NSURLSessionTask *_refundDepositTask;
    NSURLSessionTask *_queryGoodsTask;
}

@end

@implementation YBComposeService

+ (instancetype)share{
    static dispatch_once_t t;
    static YBComposeService *service       = nil;
    dispatch_once(&t, ^{
        service                         = [[YBComposeService alloc] init];
    });
    return service;
}

/**
 *  获取商品品牌列表
 *
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)getGoodBranceSuccess:(ZJNetRequestSuccessBlock)successBlock
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
    NSDictionary *params                = @{};
    
    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _getGoodBranceTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_GOODBRANCE_URL
                                                                                                     requestNetworkType:ZJProjectNetRequestPost
                                                                                                             parameters:params
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
 *  取消获取商品品牌列表请求
 */
- (void)cancelGetGoodBranceNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_getGoodBranceTask];
}

/**
 *  获取商品发布信息
 *
 *  @param goodsId             商品编号
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)composeGoodsInfoWithGoodsId:(NSString *)goodsId
                            success:(ZJNetRequestSuccessBlock)successBlock
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
    NSDictionary *params                = @{@"goodsId":goodsId ? goodsId : @""};
    
    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _getGoodBranceTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_COMPOSEINFO_URL
                                                                                                     requestNetworkType:ZJProjectNetRequestPost
                                                                                                             parameters:params
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
 *  取消获取商品发布信息请求
 */
- (void)cancelComposeGoodsInfoNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_composeGoodsInfoTask];
}

/**
 *  删除图片网络请求
 *
 *  @param urlString           图片地址
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)delImageWithImageUrlString:(NSString *)urlString
                           success:(ZJNetRequestSuccessBlock)successBlock
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
    NSDictionary *params                = @{@"filename":urlString ? urlString : @""};
    
    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _delImageTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PUBLICK_DELIMAGE_URL
                                                                                                requestNetworkType:ZJProjectNetRequestPost
                                                                                                        parameters:params
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
 *  取消删除图片网络请求
 */
- (void)cancelDelImageNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_delImageTask];
}

/**
 *  发布/修改商品
 *
 *  @param goodsId              被修改商品编号
 *  @param sellerDesc           卖家描述
 *  @param sellerBuyPrice       卖家入手价格(单位:分)
 *  @param sellerPsychicPrice   卖家理想价格 (是字符串填什么传什么)
 *  @param sellerGoodsParts     卖家商品配件(多个用逗号隔开,如:发票,保修卡)
 *  @param brandId              品牌编号 传编号不是名称
 *  @param prodImages          	修改后所有上传图片返回信息逗号连接一起
 *  @param videoUrl             视频地址
 *  @param pubImgRandNum        商品图片随机数
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)composeWithGoodsId:(NSString *)goodsId
                sellerDesc:(NSString *)sellerDesc
            sellerBuyPrice:(NSString *)sellerBuyPrice
        sellerPsychicPrice:(NSString *)sellerPsychicPrice
          sellerGoodsParts:(NSString *)sellerGoodsParts
                   brandId:(NSString *)brandId
                prodImages:(NSString *)prodImages
                  videoUrl:(NSString *)videoUrl
             pubImgRandNum:(NSString *)pubImgRandNum
                   success:(ZJNetRequestSuccessBlock)successBlock
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
    NSMutableDictionary *params         = [NSMutableDictionary dictionary];
    NSString *urlString;
    if (goodsId) {
        
        [params setObject:goodsId forKey:@"goodsId"];
        [params setObject:sellerDesc forKey:@"sellerDesc"];
        [params setObject:sellerBuyPrice ? sellerBuyPrice : @"" forKey:@"sellerBuyPrice"];
        [params setObject:sellerPsychicPrice ? sellerPsychicPrice : @"" forKey:@"sellerPsychicPrice"];
        [params setObject:sellerGoodsParts ? sellerGoodsParts : @"" forKey:@"sellerGoodsParts"];
        [params setObject:brandId forKey:@"brandId"];
        [params setObject:prodImages forKey:@"prodImages"];
        [params setObject:videoUrl ? videoUrl : @"" forKey:@"videoUrl"];
        [params setObject:pubImgRandNum forKey:@"pubImgRandNum"];
        
        urlString = COMPOSE_COMPOSEEDIT_URL;
    }else{
        [params setObject:sellerDesc forKey:@"sellerDesc"];
        [params setObject:sellerBuyPrice ? sellerBuyPrice : @"" forKey:@"sellerBuyPrice"];
        [params setObject:sellerPsychicPrice ? sellerPsychicPrice : @"" forKey:@"sellerPsychicPrice"];
        [params setObject:sellerGoodsParts ? sellerGoodsParts : @"" forKey:@"sellerGoodsParts"];
        [params setObject:brandId forKey:@"brandId"];
        [params setObject:prodImages forKey:@"prodImages"];
        [params setObject:videoUrl ? videoUrl : @"" forKey:@"videoUrl"];
        [params setObject:pubImgRandNum forKey:@"pubImgRandNum"];
        
        urlString = COMPOSE_COMPOSE_URL;
    }
    
    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _composeTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:urlString
                                                                                                requestNetworkType:ZJProjectNetRequestPost
                                                                                                        parameters:params
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
 *  取消发布/修改商品网络请求
 */
- (void)cancelComposeNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_composeTask];
}

/**
 *  发布列表
 *
 *  @param curPage             当前页
 *  @param pageSize            页面大小
 *  @param goodsType           商品类型
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)composeListWithCurPage:(NSString *)curPage
                      pageSize:(NSString *)pageSize
                     goodsType:(NSString *)goodsType
                       success:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock
{
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    
    /**
     *  配置参数
     */
    NSMutableDictionary *params         = [NSMutableDictionary dictionary];
    [params setObject:curPage forKey:@"curPage"];
    [params setObject:pageSize forKey:@"pageSize"];
    [params setObject:goodsType forKey:@"goodsType"];
    
    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _composeListTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_COMPOSELIST_URL
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
 *  取消发布列表请求
 */
- (void)cancelComposeListNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_composeListTask];
}

/**
 *  删除商品
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)delGoodWithGoodsId:(NSString *)goodsId
                   success:(ZJNetRequestSuccessBlock)successBlock
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
    NSMutableDictionary *params         = [NSMutableDictionary dictionary];
    [params setObject:goodsId forKey:@"goodsId"];
    
    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _delGoodTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_DELGOOD_URL
                                                                                                   requestNetworkType:ZJProjectNetRequestPost
                                                                                                           parameters:params
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
 *  取消删除商品请求
 */
- (void)cancelDelGoodNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_delGoodTask];
}

/**
 *  商品下架
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)offShelveWithGoodsId:(NSString *)goodsId
                     success:(ZJNetRequestSuccessBlock)successBlock
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
    NSMutableDictionary *params         = [NSMutableDictionary dictionary];
    [params setObject:goodsId forKey:@"goodsId"];
    
    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _offShelveTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_OFFSHELVE_URL
                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                       parameters:params
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
 *  取消商品下架请求
 */
- (void)cancelOffShelveNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_offShelveTask];
}

/**
 *  商品重新上架
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)refreshShelveWithGoodsId:(NSString *)goodsId
                         success:(ZJNetRequestSuccessBlock)successBlock
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
    NSMutableDictionary *params         = [NSMutableDictionary dictionary];
    [params setObject:goodsId forKey:@"goodsId"];

    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _refreshShelveTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_REFRESHSHELVE_URL
                                                                                                 requestNetworkType:ZJProjectNetRequestPost
                                                                                                         parameters:params
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
 *  取消商品重新上架请求
 */
- (void)cancelRefreshShelveNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_refreshShelveTask];
}

/**
 *  商品延期/顶一下
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)refreshGoodTimeWithGoodsId:(NSString *)goodsId
                           success:(ZJNetRequestSuccessBlock)successBlock
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
    NSMutableDictionary *params         = [NSMutableDictionary dictionary];
    [params setObject:goodsId forKey:@"goodsId"];

    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _refreshGoodTimeTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_REFRESHGOODTIME_URL
                                                                                                 requestNetworkType:ZJProjectNetRequestPost
                                                                                                         parameters:params
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
 *  取消商品延期/顶一下请求
 */
- (void)cancelRefreshGoodTimeNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_refreshGoodTimeTask];
}

/**
 *  申请退担保金
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)refundDepositWithGoodsId:(NSString *)goodsId
                         success:(ZJNetRequestSuccessBlock)successBlock
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
    NSMutableDictionary *params         = [NSMutableDictionary dictionary];
    [params setObject:goodsId forKey:@"goodsId"];

    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _refundDepositTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_REFUNDDEPOSIT_URL
                                                                                                       requestNetworkType:ZJProjectNetRequestPost
                                                                                                               parameters:params
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
 *  取消申请担保金请求
 */
- (void)cancelRefundDepositNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_refundDepositTask];
}

/**
 *  我发布的查看单个商品
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)queryGoodsWithGoodsId:(NSString *)goodsId
                      success:(ZJNetRequestSuccessBlock)successBlock
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
    NSMutableDictionary *params         = [NSMutableDictionary dictionary];
    [params setObject:goodsId forKey:@"goodsId"];
    
    /**
     *  请求并获取task
     */
    __weak YBComposeService *weakSelf   = self;
    _queryGoodsTask                        = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMPOSE_QUERYGOODS_URL
                                                                                                     requestNetworkType:ZJProjectNetRequestPost
                                                                                                             parameters:params
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
 *  取消我发布的查看单个商品请求
 */
- (void)cancelQueryGoodsNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_queryGoodsTask];
}

@end
