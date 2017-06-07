//
//  YBOrderService.h
//  inborn
//
//  Created by 郑键 on 17/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface YBOrderService : ZJBaseService

/**
 *  确认订单网络请求
 *
 *  @param goodId               商品id
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)confirmOrderWithGoodId:(NSString *)goodId
                       success:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消确认订单网络请求
 */
- (void)cancelConfirmOrderNetRequest;

/**
 *  生成订单
 *
 *  @param goodId                  商品id
 *  @param deliveryType            配送方式 1（快递），0（自提）
 *  @param orderPayType            支付方式1全额支付，2定金支付，3分笔支付，4转账汇款，5订金+刷卡 6.直接支付
 *  @param addressId               地址编号
 *  @param channelId               下单渠道：1=IOS,2=android,3=pc,4=M站,5pc直接支付
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)creatOrderWithGoodId:(NSString *)goodId
                deliveryType:(NSString *)deliveryType
                orderPayType:(NSString *)orderPayType
                   addressId:(NSString *)addressId
                   channelId:(NSString *)channelId
                     success:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  我买到的订单列表网络请求
 */
- (void)cancelCreatOrderNetRequest;

/**
 *  订单列表网络请求
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
                                fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消订单列表网络请求
 */
- (void)cancelgetOrderListInforNetRequest;

/**
 *  订单详情数据
 *
 *  @param orderId                  订单id
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)orderDetailWithOrderId:(NSString *)orderId
                       success:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  订单详情数据网络请求取消
 */
- (void)cancelOrderDetailNetRequest;


/**
 *  退款申请请求
 *
 *  orderId	string	是	订单编号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)applyRefundRequestWithorderId:(NSString *)orderId
                              success:(ZJNetRequestSuccessBlock)successBlock
                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消退款申请请求网络请求
 */
- (void)cancelapplyRefundNetRequest;


/**
 *  查看退款详情的请求
 *
 *  orderId	string	是	订单编号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)getRefundDeatilInforWithorderId:(NSString *)orderId
                                success:(ZJNetRequestSuccessBlock)successBlock
                                   fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消退款详情请求网络请求
 */
- (void)cancelgetRefundDeatilInforNetRequest;



/**
 *  物流信息详情请求网络请求
 *
 *  orderId	string	是	订单编号	10000
 *  deliveryNum	string	是	物流编号
 *  @param successBlock             成功
 *  @param failBlock                失败
 */
- (void)getLogisticsDeatilInforWithorderId:(NSString *)orderId
                               deliveryNum:(NSString *)deliveryNum
                                   success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消物流信息详情请求网络请求
 */
- (void)cancelLogisticsDeatilInforNetRequest;

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
                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  订单详情数据网络请求取消
 */
- (void)cancelCancelOrderNetRequest;

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
                      fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  订单详情地址设置身份证号请求取消
 */
- (void)cancelSetIdCardAddressIdNetRequest;

/**
 确认收货
 orderId	string	是	订单编号
 */
- (void)confirmReceiptGoodsWithorderId:(NSString *)orderId
                               success:(ZJNetRequestSuccessBlock)successBlock
                                  fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  确认收货请求取消
 */
- (void)cancelconfirmReceiptGoodsNetRequest;

/**
 *  修改订单支付方式
 *  orderId	string	是	订单编号
 */
- (void)modifyPayTypeWithorderId:(NSString *)orderId
                    orderPayType:(NSString *)orderPayType
                         success:(ZJNetRequestSuccessBlock)successBlock
                            fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  修改订单支付方式请求取消
 */
- (void)cancelModifyPayTypeNetRequest;


/**
 支付记录
 orderId	string	是	订单编号
 */
- (void)paymentRecordListWithorderId:(NSString *)orderId
                             success:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  支付记录请求取消
 */
- (void)cancelpaymentRecordListNetRequest;


/**
 我的物品的 物流
 */
- (void)GetMyGoodsLogitcsDataWithdepotId:(NSString *)depotId
                                 success:(ZJNetRequestSuccessBlock)successBlock
                                    fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  我的物品的 物流请求取消
 */
- (void)cancelGetMyGoodsLogitcsDataNetRequest;

@end
