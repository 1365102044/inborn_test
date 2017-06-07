//
//  YBOrderModel.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"
#import "YBAddressAndPickPersonModel.h"
#import "YBRouteModel.h"

@interface YBOrderModel : ZJBaseModel

/**
 商品价格
 */
@property (nonatomic, copy) NSString *goodsPrice;

/**
 * 商品编号
 */
@property (nonatomic, copy) NSString *goodsId;

/**
 * 是否需要配送：1需要（快递），0不需要（自提）
 */
@property (nonatomic, assign) NSString *deliveryType;

/**
 * 是否有地址，0表示无地址，1表示有地址
 */
@property (nonatomic, assign) NSInteger hasAddress;

/**
 * 收货地址编号
 */
@property (nonatomic, copy) NSString *addrId;

/**
 * 收货人姓名
 */
@property (nonatomic, copy) NSString *addrName;

/**
 * 收货人手机
 */
@property (nonatomic, copy) NSString *addrMobile;

/**
 * 收货人省份
 */
@property (nonatomic, copy) NSString *addrProv;

/**
 * 收货人城市
 */
@property (nonatomic, copy) NSString *addrCity;

/**
 * 收货人城市-区(县)
 */
@property (nonatomic, copy) NSString *addrCounty;

/**
 * 收货人收货地址
 */
@property (nonatomic, copy) NSString *addrDetail;

/**
 * 收货人身份证号
 */
@property (nonatomic, copy) NSString *addrIdcard;

/**
 * 商品数量
 */
@property (nonatomic, copy) NSString *goodsNum;

/**
 * 商品名称
 */
@property (nonatomic, copy) NSString *goodsName;

/**
 * 商品图片地址
 */
@property (nonatomic, copy) NSString *squareImage;

/**
 * 商品单价
 */
@property (nonatomic, copy) NSString *mallPrice;

/**
 * 订单总金额
 */
@property (nonatomic, copy) NSString *orderTotalAmount;

/**
 * 订单优惠金额
 */
@property (nonatomic, copy) NSString *discountMoney;

/**
 * 运费
 */
@property (nonatomic, copy) NSString *logisticsMoney;

/**
 * 保费
 */
@property (nonatomic, copy) NSString *insuredMoney;

/**
 * 定金金额
 */
@property (nonatomic, copy) NSString *depositPrice;

/**
 * 已付金额
 */
@property (nonatomic, copy) NSString *alreadyPayAmount;

/**
 *  待付金额
 */
@property (nonatomic, copy) NSString *unpaidAmount;

/**
 物流地址
 */
@property (nonatomic, strong) YBAddressAndPickPersonModel *orderConsignee;

/**
 自提地址
 */
@property (nonatomic, strong) YBAddressAndPickPersonModel *orderPickup;

/**
 物流公司名称
 */
@property (nonatomic, copy) NSString *deliveryMerchant;

/**
 物流
 */
@property (nonatomic, strong) NSArray *routes;

/**
 是否允许自提 0不允许，1允许
 */
@property (nonatomic, assign) NSInteger isPickup;

/**
 是否允许定金支付：0不允许，1允许
 */
@property (nonatomic, assign) NSInteger isAllowBargainPay;

//** =========================================================================================== */
//** ============================================我买到的订单列表========================================== */
//** =========================================================================================== */

/**
 * 订单编号
 */
@property(nonatomic,copy) NSString * orderId;

/**
 * 订单支付方式：1全额支付，2定金支付，3分笔支付，4转账汇款，5订金+刷卡 6.直接支付
 */
@property(nonatomic,assign) NSInteger  orderPayType;

/**
 * 订单支付方式：1全额支付，2定金支付，3分笔支付，4转账汇款，5订金+刷卡 6.直接支付
 */
@property(nonatomic,copy) NSString *orderPayTypeString;



/**
 * 订单类型：1普通订单，2定金订单
 */
@property(nonatomic,assign) NSInteger  orderType;


/**
 * 商品图
 */
@property(nonatomic,copy) NSString *  goodsImage;


/**
 * 订单描述
 */
@property(nonatomic,copy) NSString *  orderDesc;


/**
 * 支付金额
 */
@property(nonatomic,copy) NSString *  orderPayAmount;


/**
 * 是否支付过定金：0否，1是
 */
@property(nonatomic,copy) NSString *  isPayedDeposit;


/**
 * 已支付成功的次数
 */
@property(nonatomic,assign) NSInteger  alreadyPayCount;


/**
 * 已支付的手续费（累加）
 */
@property(nonatomic,copy) NSString *  alreadyPayFee;


/**
 * 订单状态：1待付款，2付款中，3部分付款，4付款成功（后置待鉴定），5待发货，6待确认收货，7交易完成，8交易取消
 *  10待付款，11部分付款，20待鉴定，21鉴定失败，30待发货，31待收货，32待确认收货，40交易完成，41交易取消
 */
@property(nonatomic,assign) NSInteger  orderStatus;


/**
 * 平台向商户打款状态：10未打款，11部分打款，12打款完成
 */
@property(nonatomic,assign) NSInteger  platformPayStatus;


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
@property(nonatomic,copy) NSString *  refundAmount;


/**
 * 配送状态 1:未发货,2:配货中,3:已发货,4:确认收货
 */
@property(nonatomic,assign) NSInteger  deliveryStatus;


/**
 * 配送商
 */
@property(nonatomic,copy) NSString*  deliveryNum;


/**
 * 订单提货码
 */
@property(nonatomic,copy) NSString  *orderPickupCode;


/**
 * 订单取消原因
 */
@property(nonatomic,copy) NSString *  cancelReason;


/**
 * 是否是用户取消，0表示否，1表示是
 */
@property(nonatomic,assign) NSInteger  isUserCancel;


/**
 * 订单取消时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate  *cancelTime;


/**
 * 订单失效时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate *  invalidTime;


/**
 * 生成支付信息的时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate  *topayTime;


/**
 * 订单支付完成时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate * payedTime;


/**
 * 是否订单已删除： 1已删除， 0未删除
 */
@property(nonatomic,assign) NSInteger  isDelete;


/**
 * 订单完成时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate * finishTime;


/**
 * 订单关闭时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate *  colsedTime;


/**
 * 创建时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate *  createTime;


/**
 * 发货时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate  *deliveryTime;


/**
 * 签收时间
 */
//@JSONField(format = "yyyy-MM-dd HH:mm:ss")
@property(nonatomic,copy) NSDate *  consigneeTime;


/**
 * 订单列表显示状态:1未付款,2部分支付,3已付款,待平台发货,4已付款，待平台配货(自提),5已发货，待收货,
 * 6已配货，待自提,7已签收，待确认收货,8已提货，待确认收货,9交易完成，待平台打款,10平台已打款,交易完成,11已取消
 * 12超时已取消,13鉴定失败，已取消
 */
@property(nonatomic,assign) NSInteger  orderShowStatus;


/**
 * 倒计时时间差
 */
@property(nonatomic,copy) NSString *  diffTime;


//** =====================================我买到的订单列表 本地字段，经过内部处理的字段======================================= */

/**
 订单需要显示的订单状态
 */
@property(nonatomic,copy) NSString * orderShowStatusStr;

/**
 返回：状态btn的title
 */
@property(nonatomic,strong) NSString * buttonTitleStr;

/**
 返回：更多的展示的数组
 */
@property(nonatomic,strong) NSArray * listMoreArr;

/**
 支付类型
 */
@property(nonatomic,assign) ZJProjectPaymentMethod  paymentType;


//** =========================================================================================== */
//** ============================================鉴定的订单列表========================================== */
//** =========================================================================================== */

@property(nonatomic,copy) NSString * appraisalAmt;

@property(nonatomic,copy) NSString * appraisalConclusion;

@property(nonatomic,copy) NSString * appraisalLocation;
/**
 * 鉴定状态
 */
@property(nonatomic,assign) NSInteger  appraisalStatus;

@property(nonatomic,copy) NSString * appraisalWho;

@property(nonatomic,copy) NSString * appraisalWhy;

@property(nonatomic,copy) NSString * imgUrl;

@property(nonatomic,copy) NSString * recallPrice;
/**
 * 商品细节
 */
@property(nonatomic,copy) NSString * sellerDesc;

@property(nonatomic,copy) NSString * sellerId;

@property(nonatomic,copy) NSString * startPrice;

@property(nonatomic,copy) NSString * updateTime;

@property(nonatomic,copy) NSString * customId;

/**
 * 退回状态：1待退回，2.配货中 3.已发货，4.已退回
 */
@property(nonatomic,assign) NSInteger  returnStatus;


//** =====================================鉴定的订单列表 本地字段，经过内部处理的字段======================================= */

@property(nonatomic,assign) OrderListVcType  OrderListVCType;



//** =========================================================================================== */
//** ===========================================我卖出的列表订单列表========================================== */
//** =========================================================================================== */


/**
 * 订单列表显示状态:10未付款,20部分支付(分笔),21部分支付(定金),22部分支付(定金+部分货款),30已付款,待平台发货,31已付款，待平台配货(自提),
 * 40已发货，待收货,41已配货，待自提,50已签收，待确认收货,51已提货，待确认收货,60交易完成，待平台打款,61交易完成，待平台打款(自提),62平台已打款,交易完成,
 * 70用户已取消,71超时已取消(未支付),72超时已取消(支付定金),73超时已取消(定金+部分货款),74超时已取消(部分货款),75鉴定失败，已取消
 */
@property(nonatomic,assign) NSInteger  detailsShowStatus;


/**
 * 卖出列表显示状态：10待买家付款；20买家已付款，待鉴定；21买家已付款，鉴定中；22鉴定通过，待平台发货；30等待买家收货；40等待买家确认
 * 50交易完成；60买家已取消；61鉴定失败已取消；62订单超时已取消
 */
@property(nonatomic,assign) NSInteger  saleShowStatus;

/**
 * 鉴定时间
 */
@property(nonatomic,copy) NSString * appraisalTime;

/**
 * 佣金比率
 */
@property(nonatomic,copy) NSString * commissionRatio;

/**
 * 鉴定编号
 */
@property(nonatomic,copy) NSString * appraisalId;

//** =========================================================================================== */
//** ===========================================我的物品列表订单列表========================================== */
//** =========================================================================================== */

/**
 * 仓库编号（用于生成二维码等）
 */
//private Long id;

/**
 * 会员编号
 */
@property(nonatomic,copy) NSString * memberId;


/**
 * 入库类型：1默认（鉴定）
 */
@property(nonatomic,assign) NSInteger  inType;


/**
 * 入库时间
 */
@property(nonatomic,copy) NSString * inDepotTime;


/**
 * 入库者
 */
@property(nonatomic,copy) NSString * inDepotHandler;


/**
 * 入库描述
 */
@property(nonatomic,copy) NSString * inDepotDesc;


/**
 * 入库图片（带码的）
 */
@property(nonatomic,copy) NSString * inGoodsImg;


/**
 * 出库类型：10售出，20鉴定退回，21未售出退回，30已回收
 */
@property(nonatomic,assign) NSInteger  outType;


/**
 * 出库时间
 */
@property(nonatomic,copy) NSString * outDepotTime;


/**
 * 出库者
 */
@property(nonatomic,copy) NSString * outDepotHandler;


/**
 * 出库描述
 */
@property(nonatomic,copy) NSString * outDepotDesc;


/**
 * 出库方式：1快递，2自提
 */
@property(nonatomic,assign) NSInteger  outWay;


/**
 * 快递申请方式：1普通快递填单方式，2顺丰快递打印方式
 */
@property(nonatomic,assign) NSInteger  expIoWay;


/**
 * 快递公司ID
 */
@property(nonatomic,copy) NSString * expComId;


/**
 * 快递单号
 */
@property(nonatomic,copy) NSString * reqExpressNum;


/**
 * 品牌中文名称
 */
@property(nonatomic,copy) NSString * brandCnName;

/**
 * 品牌英文名称
 */
@property(nonatomic,copy) NSString * brandEnName;

/**展示状态和按钮,1=已入库--灰色申请退回,2=退回,待出库--灰色查看物流,
 *              3=退回,已出库--可点查看物流,4=售出,已出库--可点查看物流,5=已入库--可点申请退回
 *              6=退回,已出库--可点查看物流(弹窗口提示，自提商品暂无物流信息，如有疑问请联系客),
 *              7 =售出,已出库--可点查看物流(弹窗口提示，自提商品暂无物流信息，如有疑问请联系客),
 */
@property(nonatomic,assign) NSInteger  showStatus;

@end
