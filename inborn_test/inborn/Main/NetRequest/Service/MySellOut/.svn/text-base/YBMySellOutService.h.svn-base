//
//  YBMySellOutService.h
//  inborn
//
//  Created by 刘文强 on 2017/4/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface YBMySellOutService : ZJBaseService

/**
 *  我卖出的详情
 *
 *  orderId	
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)GetMySellOutDeatilInforWithorderId:(NSString *)orderId
                                  success:(ZJNetRequestSuccessBlock)successBlock
                                     fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消我卖出的详情网络请求
 */
- (void)cancelGetMySellOutDeatilInforNetRequest;


/**
 *  发货页面数据
 *
 *  orderId
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)GetMySellOutSendGoodsInforWithorderId:(NSString *)orderId
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消发货页面数据网络请求
 */
- (void)cancelGetMySellOutSendGoodsInforNetRequest;

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
                                            fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消发提交货数据网络请求
 */
- (void)cancelGetMySellOutCommitSendGoodsInforNetRequest;


@end
