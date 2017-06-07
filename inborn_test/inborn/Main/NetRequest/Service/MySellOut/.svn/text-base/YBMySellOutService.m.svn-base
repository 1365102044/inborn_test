//
//  YBMySellOutService.m
//  inborn
//
//  Created by 刘文强 on 2017/4/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMySellOutService.h"


@interface YBMySellOutService ()
{
    NSURLSessionTask *_mysellouDeatilTask;
    NSURLSessionTask *_mysellouSendGoodsTask;
    NSURLSessionTask *_mysellouCommitSendGoodsTask;
}

@end

@implementation YBMySellOutService

+ (instancetype)share{
    static dispatch_once_t t;
    static YBMySellOutService *service          = nil;
    dispatch_once(&t, ^{
        service                             = [[YBMySellOutService alloc] init];
    });
    return service;
}


/**
 *  我卖出的详情
 *
 *  orderId
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)GetMySellOutDeatilInforWithorderId:(NSString *)orderId
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId ? orderId : @""};
    
    /**
     *  请求并获取task
     */
    __weak YBMySellOutService *weakSelf                 = self;
    _mysellouDeatilTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:MYSELLOUTORDER_DEATIL_URL
                                                                                                               requestNetworkType:ZJProjectNetRequestPost
                                                                                                                       parameters:parames
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
 *  取消我卖出的详情网络请求
 */
- (void)cancelGetMySellOutDeatilInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mysellouDeatilTask];
}



/**
 *  发货页面数据
 *
 *  orderId
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)GetMySellOutSendGoodsInforWithorderId:(NSString *)orderId
                                         success:(ZJNetRequestSuccessBlock)successBlock
                                            fail:(ZJNetRequestFailureBlock)failBlock
{

    [SVProgressHUD show];
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId ? orderId : @""};
    
    /**
     *  请求并获取task
     */
    __weak YBMySellOutService *weakSelf                 = self;
    _mysellouDeatilTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:MYSELLOUTORDER_SENDEDOODSINFOR_URL
                                                                                                                requestNetworkType:ZJProjectNetRequestPost
                                                                                                                        parameters:parames
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
 *  取消发货页面数据网络请求
 */
- (void)cancelGetMySellOutSendGoodsrInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mysellouSendGoodsTask];
}

/**
 *  提交发货 数据
 *  orderId	string	是	订单编号
 *  expIoWay	string	否	快递申请方式，1表示普通快递填单，2表示顺丰打印方式。默认1	1
 *  deliveryNum	string	是	物流单号
 *  expComId	string	是	物流公司编号
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)GetMySellOutCommitSendGoodsInforWithorderId:(NSString *)orderId
                                        deliveryNum:(NSString *)deliveryNum
                                           expComId:(NSString *)expComId
                                            success:(ZJNetRequestSuccessBlock)successBlock
                                               fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    
    /**
     *  配置参数
     */
    NSMutableDictionary *parames = [[NSMutableDictionary alloc]init];
    if (orderId) parames[@"orderId"] = orderId;
    if (deliveryNum) parames[@"deliveryNum"] = deliveryNum ;
    if (expComId) parames[@"expComId"] = expComId;
    parames[@"expIoWay"] = @"1";
    
    /**
     *  请求并获取task
     */
    __weak YBMySellOutService *weakSelf                 = self;
    _mysellouCommitSendGoodsTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMMIT_MYSELLOUTORDER_SENDGOODSINFOR_URL
                                                                                                                requestNetworkType:ZJProjectNetRequestPost
                                                                                                                        parameters:parames
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
 *  取消发提交货数据网络请求
 */
- (void)cancelGetMySellOutCommitSendGoodsInforNetRequest
{
[[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mysellouCommitSendGoodsTask];
}
@end
