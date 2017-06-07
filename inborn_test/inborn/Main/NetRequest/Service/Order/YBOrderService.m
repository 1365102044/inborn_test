//
//  YBOrderService.m
//  inborn
//
//  Created by 郑键 on 17/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderService.h"

@interface YBOrderService()
{
    NSURLSessionTask *_confirmOrderTask;
    NSURLSessionTask *_creatOrderTask;
    NSURLSessionTask *_orderListTask;
    NSURLSessionTask *_orderDetailTask;
    NSURLSessionTask *_cancelOrderTask;
    NSURLSessionTask *_setIdCardTask;
    NSURLSessionTask *_modifyPayTypeTask;
    NSURLSessionTask *_mygoodslogitcsTask;
}

@end

@implementation YBOrderService

+ (instancetype)share{
    static dispatch_once_t t;
    static YBOrderService *service          = nil;
    dispatch_once(&t, ^{
        service                             = [[YBOrderService alloc] init];
    });
    return service;
}


/**
 *  确认订单网络请求
 *
 *  @param goodId              商品id
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)confirmOrderWithGoodId:(NSString *)goodId
                       success:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([goodId ex_isEmpty]) {
        
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
    NSDictionary *parames = @{@"goodsId":goodId};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf                 = self;
    _confirmOrderTask                               = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ORDER_CONFIRM_URL
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
 *  取消确认订单网络请求
 */
- (void)cancelConfirmOrderNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_confirmOrderTask];
}

/**
 生成订单
 
 @param goodId                  商品id
 @param deliveryType            配送方式 1（快递），0（自提）
 @param orderPayType            支付方式1全额支付，2定金支付，3分笔支付，4转账汇款，5订金+刷卡 6.直接支付
 @param addressId               地址编号
 @param channelId               下单渠道：1=IOS,2=android,3=pc,4=M站,5pc直接支付
 @param successBlock            成功
 @param failBlock               失败
 */
- (void)creatOrderWithGoodId:(NSString *)goodId
                deliveryType:(NSString *)deliveryType
                orderPayType:(NSString *)orderPayType
                   addressId:(NSString *)addressId
                   channelId:(NSString *)channelId
                     success:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([goodId ex_isEmpty]
        || [deliveryType ex_isEmpty]
        || [orderPayType ex_isEmpty]
        || [addressId ex_isEmpty]
        || [channelId ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"goodId":!goodId ? @"" : goodId,
                                                                        @"deliveryType":!deliveryType ? @"" : deliveryType,
                                                                        @"orderPayType":!orderPayType ? @"" : orderPayType,
                                                                        @"addressId":!addressId ? @"" : addressId,
                                                                        @"channelId":!channelId ? @"" : channelId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"goodsId":goodId,
                              @"deliveryType":deliveryType,
                              @"orderPayType":orderPayType,
                              @"addressId":addressId,
                              @"channelId":channelId};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf             = self;
    _creatOrderTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ORDER_CREAT_URL
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
 *  取消生成订单网络请求
 */
- (void)cancelCreatOrderNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_creatOrderTask];
}

/**
 *  我买到的订单列表网络请求
 *
 *  @param curPage	string	是	分页参数，初始为1
 *  @param pageSize	string	是	每页条数	10
 *  @param listType	string	是	类型，0表示全部，1表示待付款，2表示待发货，3表示待收货，4表示待确认，5表示已成交，6表示已取消
 *  @param orderListVcType  订单列表类型： MyBuyOrderType                 我买到的
 AppraisalOrderType             鉴定的
 MySellOutOrderType             我卖出的
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)getOrderListInforWithcurPage:(NSInteger)curPage
                            pageSize:(NSInteger)pageSize
                            listType:(NSInteger)listType
                     orderListVcType:(OrderListVcType)orderListVcType
                             success:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock
{
    NSString *URLStr;
    NSMutableDictionary *parames = [[NSMutableDictionary alloc]init];
    parames[@"curPage"] = @(curPage);
    parames[@"pageSize"]  = @(pageSize);
    if (orderListVcType == AppraisalOrderType) {
        URLStr =    APPRAISAL_LIST_URL;
        parames[@"identifyType"] = @(listType + 1);
    }else if(orderListVcType == MyBuyOrderType){
        URLStr =    MYBUYORDERLISTDATA_URL;
        parames[@"listType"] = @(listType);
    }else if (orderListVcType == MySellOutOrderType){
        URLStr =    MYSELLOUTORDER_LIST_URL;
        parames[@"listType"] = @(listType);
    }else if (orderListVcType == MyGoodsOrderType){
        
        /**
         listType  类型，1表示全部，2表示已入库，2表示已出库
         */
        URLStr = MYGOODSDATA_LIST_URL;
        parames[@"listType"] = @(listType + 1);
    }
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf             = self;
    _orderListTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:URLStr
                                                                                                      requestNetworkType:ZJProjectNetRequestPost
                                                                                                              parameters:parames
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
 *  取消订单列表网络请求
 */
- (void)cancelgetOrderListInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_orderListTask];
}

/**
 *  订单详情数据
 *
 *  @param orderId                  订单id
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)orderDetailWithOrderId:(NSString *)orderId
                       success:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([[NSString stringWithFormat:@"%@", orderId] ex_isEmpty]
        || !orderId) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf                 = self;
    _orderDetailTask                               = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ORDER_ORDERDETAIL_URL
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
 *  我买到的订单列表网络请求
 */
- (void)cancelOrderDetailNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_orderDetailTask];
}


/**
 *  退款申请请求
 *
 *
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)applyRefundRequestWithorderId:(NSString *)orderId
                              success:(ZJNetRequestSuccessBlock)successBlock
                                 fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([orderId ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId
                                                                        }];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    //    NSDictionary *parames = @{@"orderId":orderId};
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (orderId) params[@"orderId"] = orderId;
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf             = self;
    _orderListTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:COMMITAPPLYREFUNDDATA_URL
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
 *  取消退款申请请求
 */
- (void)cancelapplyRefundNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_orderDetailTask];
}

/**
 *  查看退款详情的请求
 *
 *  orderId	string	是	订单编号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)getRefundDeatilInforWithorderId:(NSString *)orderId
                                success:(ZJNetRequestSuccessBlock)successBlock
                                   fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([orderId ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId
                                                                        }];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    //    NSDictionary *parames = @{@"orderId":orderId};
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (orderId) params[@"orderId"] = orderId;
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf             = self;
    _orderListTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETREFUNDDEATILINFORTIONDATA_URL
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
 *  取消退款详情请求网络请求
 */
- (void)cancelgetRefundDeatilInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_orderDetailTask];
}

/**
 *  物流信息详情请求网络请求
 *
 *
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)getLogisticsDeatilInforWithorderId:(NSString *)orderId
                               deliveryNum:(NSString *)deliveryNum
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([orderId ex_isEmpty]
        || [deliveryNum ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId,
                                                                        @"deliveryNum":!deliveryNum ? @"" : deliveryNum}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSMutableDictionary *parames = [[NSMutableDictionary alloc]init];
    if (orderId) parames[@"orderId"] = orderId;
    if (deliveryNum) parames[@"deliveryNum"] = deliveryNum;
    
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf             = self;
    _orderListTask                             = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETLOGICSTICSINFORMATION_URL
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
 *  取消物流信息详情请求网络请求
 */
- (void)cancelLogisticsDeatilInforNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_orderDetailTask];
}

/**
 *  取消订单
 *
 *  @param orderId                  订单id
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)cancelOrderWithOrderId:(NSString *)orderId
                        reason:(NSString *)reason
                       success:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([[NSString stringWithFormat:@"%@", orderId] ex_isEmpty]
        || [reason ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId,
                                                                        @"reason":!reason ? @"" : reason}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId,
                              @"reason":reason};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf                     = self;
    _cancelOrderTask                                    = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ORDER_CANCEL_URL
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
 *  订单详情数据网络请求取消
 */
- (void)cancelCancelOrderNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_cancelOrderTask];
}

/**
 *  地址设置身份证号
 *
 *  @param addressId                待设置地址编号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)setIdCardAddressId:(NSString *)addressId
                    idCard:(NSString *)idCard
                   success:(ZJNetRequestSuccessBlock)successBlock
                      fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([addressId ex_isEmpty]
        || [idCard ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"addressId":!addressId ? @"" : addressId,
                                                                        @"idCard":!idCard ? @"" : idCard}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"id":addressId,
                              @"idCard":idCard};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf                     = self;
    _setIdCardTask                                    = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ORDER_SETIDCARD_URL
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
 *  订单详情地址设置身份证号请求取消
 */
- (void)cancelSetIdCardAddressIdNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_setIdCardTask];
}

/**
 确认收货
 orderId	string	是	订单编号
 */
- (void)confirmReceiptGoodsWithorderId:(NSString *)orderId
                               success:(ZJNetRequestSuccessBlock)successBlock
                                  fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([orderId ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf                     = self;
    _setIdCardTask                                    = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:CONFIRMRECEIPTGOODS_URL
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
 *  确认收货请求取消
 */
- (void)cancelconfirmReceiptGoodsNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_setIdCardTask];
}

/**
 *  修改订单支付方式
 *  orderId	string	是	订单编号
 */
- (void)modifyPayTypeWithorderId:(NSString *)orderId
                    orderPayType:(NSString *)orderPayType
                         success:(ZJNetRequestSuccessBlock)successBlock
                            fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([[NSString stringWithFormat:@"%@", orderId] ex_isEmpty]
        || [orderPayType ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId,
                                                                        @"orderPayType":!orderPayType ? @"" : orderPayType}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":[NSString stringWithFormat:@"%@", orderId],
                              @"orderPayType":orderPayType};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf                     = self;
    _modifyPayTypeTask                                    = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:ORDER_CHANGEPAYMENTTYPE_URL
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
 *  修改订单支付方式请求取消
 */
- (void)cancelModifyPayTypeNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_modifyPayTypeTask];
}


/**
 支付记录
 orderId	string	是	订单编号
 */
- (void)paymentRecordListWithorderId:(NSString *)orderId
                             success:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([[NSString stringWithFormat:@"%@", orderId] ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"orderId":!orderId ? @"" : orderId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"orderId":orderId};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf                     = self;
    _setIdCardTask                                    = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:PAYMENTROCERDLISTDATA_URL
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
 *  支付记录请求取消
 */
- (void)cancelpaymentRecordListNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_setIdCardTask];
}


/**
 我的物品的 物流
 */
- (void)GetMyGoodsLogitcsDataWithdepotId:(NSString *)depotId
                                 success:(ZJNetRequestSuccessBlock)successBlock
                                    fail:(ZJNetRequestFailureBlock)failBlock
{
    [SVProgressHUD show];
    /**
     *  TODO:根据服务器携带参数要求判断
     *  不满足服务器参数要求时，抛出异常
     */
    if ([[NSString stringWithFormat:@"%@", depotId] ex_isEmpty]) {
        
        ZJNetRequestError *error = [ZJNetRequestError errorWithDomain:@"必传参数为空"
                                                                 code:-1001
                                                             userInfo:@{@"depotId":!depotId ? @"" : depotId}];
        
        [self handleRequestFailed:error
                     requestModel:nil
                        failBlock:failBlock];
        
        return;
    }
    
    /**
     *  配置参数
     */
    NSDictionary *parames = @{@"depotId":depotId};
    
    /**
     *  请求并获取task
     */
    __weak YBOrderService *weakSelf                     = self;
    _mygoodslogitcsTask                                    = [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:GETMYGOODSLOGICSTICSINFORMATION_URL
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
 *  我的物品的 物流请求取消
 */
- (void)cancelGetMyGoodsLogitcsDataNetRequest
{
    [[ZJProjectNetRequestManager sharedNetRequestManager] cancelNetworkRequestWithTask:_mygoodslogitcsTask];
}
@end
