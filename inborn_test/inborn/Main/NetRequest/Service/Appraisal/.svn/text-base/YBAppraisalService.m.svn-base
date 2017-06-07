//
//  YBAppraisalService.m
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAppraisalService.h"

@interface YBAppraisalService ()
{
    NSURLSessionTask *_appraisalListTask;
    NSURLSessionTask *_GetCommitLogisticsTask;
    NSURLSessionTask *_AppraisalCommitLogisticsinforTask;
    NSURLSessionTask *_AppraisalApplyReturnTask;
    NSURLSessionTask *_AppraisalConfirmReturnTask;
    NSURLSessionTask *_AppraisalReportTask;
    
}

@end

@implementation YBAppraisalService


+ (instancetype)share{
    static dispatch_once_t t;
    static YBAppraisalService *service          = nil;
    dispatch_once(&t, ^{
        service                             = [[YBAppraisalService alloc] init];
    });
    return service;
}


/**
 *  我的鉴定列表
 *
 *  identifyType		1:全部 2待送鉴3鉴定中4已通过5未通过
 *  curPage
 *  pageSize
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalListInforWithidentifyType:(NSInteger)identifyType
                                   curPage:(NSInteger)curPage
                                  pageSize:(NSInteger)pageSize
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"curPage":@(curPage),
                              @"pageSize":@(pageSize),
                              @"identifyType":@(identifyType)};
    
    /**
     *  请求并获取task
     */
    __weak YBAppraisalService *weakSelf                 = self;
    _appraisalListTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:APPRAISAL_LIST_URL
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
 *  取消鉴定列表网络请求
 */
- (void)cancelgetAppraisalListInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_appraisalListTask];
}


/**
 *  鉴定获取提交物流页面信息接口
 *
 *  appraisalId
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)GetCommitLogiticsInforWithappraisalId:(NSString *)appraisalId
                                      success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([appraisalId ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"appraisalId":!appraisalId ? @"" : appraisalId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"appraisalId":appraisalId};
    
    /**
     *  请求并获取task
     */
    __weak YBAppraisalService *weakSelf                 = self;
    _GetCommitLogisticsTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:APPRAISALGETCOMMOTLOGICTSINFOR_URL
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
 *  取消鉴定获取提交物流页面信息接口网络请求
 */
- (void)cancelgetGetCommitLogiticsInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_GetCommitLogisticsTask];
}


/**
 *  鉴定提交物流接口
 *
 *  appraisalId	string	是	鉴定id	3
 *  expComId	string	是	快递公司id	57
 *  deliveryNum	string	是	快递单号
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalCommitLogiticsInforWithappraisalId:(NSString *)appraisalId
                                           expComId:(NSString *)expComId
                                        deliveryNum:(NSString *)deliveryNum
                                            success:(ZJNetRequestSuccessBlock)successBlock
                                               fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];

    NSMutableDictionary *parames = [[NSMutableDictionary alloc]init];
    if (appraisalId) parames[@"appraisalId"] = appraisalId;
    if (deliveryNum) parames[@"deliveryNum"] = deliveryNum;
    if (expComId) parames[@"expComId"] = expComId;
    
    /**
     *  请求并获取task
     */
    __weak YBAppraisalService *weakSelf                 = self;
    _AppraisalCommitLogisticsinforTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:APPRAISALCOMMITLLOGITSCINFOR_URL
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
 *  取消鉴定提交物流接口网络请求
 */
- (void)cancelgetAppraisalCommitLogiticsInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_AppraisalCommitLogisticsinforTask];
}




/**
 *  鉴定申请退回请求页面信息接口
 *
 *  goodsId	string	是	商品编号
 *  depotId	string	是	仓库编号
 *  deliveryType	string	是	是否需要配送：1需要（快递），0不需要（自提）
 *  refundType	string	是	退回类型：1鉴定退回，2未售出退回
 *  addressId	string	是	地址 id
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalApplyReturnWithappraisalId:(NSString *)appraisalId
                                    success:(ZJNetRequestSuccessBlock)successBlock
                                       fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([appraisalId ex_isEmpty]){
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"appraisalId":!appraisalId ? @"" : appraisalId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"goodsId":appraisalId ? appraisalId : @""};
    
    /**
     *  请求并获取task
     */
    __weak YBAppraisalService *weakSelf                 = self;
    _AppraisalApplyReturnTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:APPRAISALAPPLYQUESTINFOR_URL
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
 *  取消鉴定申请退回请求页面信息接口网络请求
 */
- (void)cancelAppraisalApplyReturnNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_AppraisalApplyReturnTask];
}


/**
 *  鉴定确认退回接口
 *
 *  goodsId         商品编号
 *  deliveryType    1需要（快递），0不需要（自提）	1
 *  addressId		地址id
 *  depotId         仓库编号
 *  refundType      退回类型：1鉴定退回，2未售出退回
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalConfirmReturnWithappraisalId:(NSString *)appraisalId
                                    addressId:(NSString *)addressId
                                 deliveryType:(NSString *)deliveryType
                                      depotId:(NSString *)depotId
                                   refundType:(NSString *)refundType
                                      success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];

    NSMutableDictionary *parames = [[NSMutableDictionary alloc]init];
    if (appraisalId) parames[@"goodsId"] = appraisalId;
    if (addressId) parames[@"addressId"] = addressId;
    if (depotId)  parames[@"depotId"] = depotId;
    if (refundType)  parames[@"refundType"] = refundType;
    parames[@"deliveryType"] = deliveryType;
    
    /**
     *  请求并获取task
     */
    __weak YBAppraisalService *weakSelf                 = self;
    _AppraisalConfirmReturnTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:APPRAISALAPPLYCOMFORT_URL
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
 *  取消鉴定确认退回接口网络请求
 */
- (void)cancelAppraisalConfirmReturnNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_AppraisalConfirmReturnTask];
}


/**
 *  鉴定鉴定报告
 *
 *  appraisalId	string	是	鉴定id	3
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalReportWithappraisalId:(NSString *)appraisalId
                               success:(ZJNetRequestSuccessBlock)successBlock
                                  fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([appraisalId ex_isEmpty]){
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"appraisalId":!appraisalId ? @"" : appraisalId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"appraisalId":appraisalId};
    
    /**
     *  请求并获取task
     */
    __weak YBAppraisalService *weakSelf                 = self;
    _AppraisalReportTask                                  = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:APPRAISALREPORTINFOR_URL
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
 *  取消鉴定鉴定报告接口网络请求
 */
- (void)cancelAppraisalReportNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_AppraisalReportTask];
}

@end
