//
//  YBMySellOutModel.h
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

@interface YBMySellOutModel : ZJBaseModel
/**
 * 订单编号
 */
@property(nonatomic,copy) NSString * orderId;


/**
 * 订单支付方式：1全额支付，2定金支付，3分笔支付，4转账汇款，5订金+刷卡 6.直接支付
 */
@property(nonatomic,assign) NSInteger  orderPayType;


/**
 * 订单类型：1普通订单，2定金订单
 */
@property(nonatomic,assign) NSInteger  orderType;


/**
 * 商品编号
 */
@property(nonatomic,copy) NSString * goodsId;


/**
 * 商品名称
 */
@property(nonatomic,copy) NSString * goodsName;


/**
 * 商品图
 */
@property(nonatomic,copy) NSString * goodsImage;


/**
 * 订单描述
 */
@property(nonatomic,copy) NSString * orderDesc;


/**
 * 订单金额
 */
@property(nonatomic,copy) NSString * orderTotalAmount;


/**
 * 支付金额
 */
@property(nonatomic,copy) NSString * orderPayAmount;


/**
 * 定金金额
 */
@property(nonatomic,copy) NSString * depositPrice;


/**
 * 是否支付定金：0否，1是
 */
@property(nonatomic,assign) NSInteger  isPayedDeposit;


/**
 * 已支付的金额（累加）
 */
@property(nonatomic,copy) NSString * alreadyPayAmount;


/**
 * 已支付成功的次数
 */
@property(nonatomic,assign) NSInteger  alreadyPayCount;


/**
 * 已支付的手续费（累加）
 */
@property(nonatomic,copy) NSString * alreadyPayFee;


/**
 * 订单状态：订单状态：10待付款，11部分付款，20待鉴定，21鉴定失败，30待发货，31待收货，32待确认收货，40交易完成，41交易取消
 */
@property(nonatomic,assign) NSInteger  orderStatus;


/**
 * 平台向商户打款状态：10未打款，11部分打款，12打款完成
 */
@property(nonatomic,assign) NSInteger platformPayStatus;


/**
 * 是否分笔支付：1是，0否
 */
@property(nonatomic,assign) NSInteger  isPartPay;


/**
 * 退款状态,1,未申请 2,已申请,3,退款中,4,部分退款中,5.部分退款成功，6.退款成功，7.拒绝退款
 */
@property(nonatomic,assign) NSInteger  refundStatus;


/**
 * 退款金额
 */
@property(nonatomic,copy) NSString * refundAmount;


/**
 * 是否需要配送：1需要（快递），0不需要（自提）
 */
@property(nonatomic,assign) NSInteger  deliveryType;


/**
 * 配送状态 1:未发货,2:配货中,3:已发货,4:确认收货
 */
@property(nonatomic,assign) NSInteger  deliveryStatus;


/**
 * 配送单号
 */
@property(nonatomic,copy) NSString * deliveryNum;


/**
 * 配送商
 */
@property(nonatomic,copy) NSString * deliveryMerchant;


/**
 * 订单提货码
 */
@property(nonatomic,copy) NSString * orderPickupCode;


/**
 * 订单取消原因
 */
@property(nonatomic,copy) NSString * cancelReason;


/**
 * 是否是用户取消，0表示否，1表示是
 */
@property(nonatomic,assign) NSInteger  isUserCancel;


/**
 * 订单取消时间
 */
@property(nonatomic,copy) NSString * cancelTime;


/**
 * 订单失效时间
 */
@property(nonatomic,copy) NSString * invalidTime;


/**
 * 生成支付信息的时间
 */
@property(nonatomic,copy) NSString * topayTime;


/**
 * 订单支付完成时间
 */
@property(nonatomic,copy) NSString * payedTime;


/**
 * 是否订单已删除： 1已删除， 0未删除
 */
@property(nonatomic,assign) NSInteger  isDelete;


/**
 * 订单完成时间
 */
@property(nonatomic,copy) NSString * finishTime;


/**
 * 订单关闭时间
 */
@property(nonatomic,copy) NSString * colsedTime;


/**
 * 创建时间
 */
@property(nonatomic,copy) NSString * createTime;


/**
 * 发货时间
 */

@property(nonatomic,copy) NSString * deliveryTime;


/**
 * 签收时间
 */
@property(nonatomic,copy) NSString * consigneeTime;


/**
 * 订单列表显示状态:1未付款,2部分支付,3已付款,待平台发货,4已付款，待平台配货(自提),5已发货，待收货,
 * 6已配货，待自提,7已签收，待确认收货,8已提货，待确认收货,9交易完成，待平台打款,10平台已打款,交易完成,11已取消
 * 12超时已取消,13鉴定失败，已取消
 */
@property(nonatomic,assign) NSInteger  orderShowStatus;


/**
 * 订单列表显示状态:10未付款,20部分支付(分笔),21部分支付(定金),22部分支付(定金+部分货款),30已付款,待平台发货,31已付款，待平台配货(自提),
 * 40已发货，待收货,41已配货，待自提,50已签收，待确认收货,51已提货，待确认收货,60交易完成，待平台打款,61交易完成，待平台打款(自提),62平台已打款,交易完成,
 * 70用户已取消,71超时已取消(未支付),72超时已取消(支付定金),73超时已取消(定金+部分货款),74超时已取消(部分货款),75鉴定失败，已取消
 */
@property(nonatomic,assign) NSInteger  detailsShowStatus;


/**
 * 卖出列表显示状态：10待买家付款；20买家已付款，待鉴定；21买家已付款，鉴定中；22鉴定通过，待平台发货；23待平台发货；24待商家发货
 * 30等待买家收货；31等待买家自提；40等待买家确认；41等待买家确认（自提）
 * 50交易完成；51交易完成（自提）；60买家已取消；61鉴定失败已取消；62订单超时已取消
 */
@property(nonatomic,assign) NSInteger  saleShowStatus;


/**
 * 倒计时时间差
 */
@property(nonatomic,copy) NSString * diffTime;


/**
 * 鉴定状态
 */
@property(nonatomic,assign) NSInteger  appraisalStatus;


/**
 * 鉴定时间
 */
@property(nonatomic,copy) NSString * appraisalTime;


/**
 * 佣金比率
 */
@property(nonatomic,copy) NSString * commissionRatio;

/**
 * 商品价格
 */
@property(nonatomic,copy) NSString * goodsPrice;

/**
 * 商品数量
 */
@property(nonatomic,assign) NSInteger  goodsNum;


/**
 * 优惠金额
 */
@property(nonatomic,copy) NSString * discountMoney;


/**
 * 实收金额
 */
@property(nonatomic,copy) NSString * receiveAmount;

/**
 * 平台服务费
 */
@property(nonatomic,copy) NSString * platformServiceAmount;

/**
 * 鉴定编号
 */
@property(nonatomic,copy) NSString * appraisalId;


#pragma ============本地字段===========

/**
 底部btn.title
 */
@property(nonatomic,strong) NSArray * BoomviewBtnArr;
/**
 顶部的状态问题
 */
@property(nonatomic,strong) NSArray * statusTitleArr;
/**
 订单详情中的顶部 状态视图高度
 */
@property(nonatomic,assign) CGFloat  topStatusViewHeight;
/**
 底部时间数组
 */
@property(nonatomic,strong) NSArray * timeArr;

/**
 是否显示 上方的流程图 YES 不显示。 NO显示
 */
@property(nonatomic,assign) BOOL  isHiddenTopImagBool;


@end
