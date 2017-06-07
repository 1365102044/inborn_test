//
//  YBRefundModel.h
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

@interface YBRefundModel : ZJBaseModel

/**
 * 退款编号
 */
@property(nonatomic,copy) NSString * customId;

/**
 * 订单编号
 */
@property(nonatomic,copy) NSString * orderId;

/**
 * 订单商品编号
 */
@property(nonatomic,copy) NSString * orderGoodsId;

/**
 * 退款申请人编号
 */
@property(nonatomic,copy) NSString * memberId;


/**
 * 退款类型1=全额,2=部分
 */
@property(nonatomic,assign) NSInteger  refundType;


/**
 * 订单可退款金额
 */
@property(nonatomic,copy) NSString * orderPayAmt;

/**
 * 实退金额
 */
@property(nonatomic,copy) NSString * refundAmt;


/**
 * 退款手续费
 */
@property(nonatomic,copy) NSString * refundFee;


/**
 * 退款费率
 */
@property(nonatomic,copy) NSString * refundRadio;


/**
 * 退款状态：1申请退款 2平台处理中, 3退款完成，4退款驳回
 */
@property(nonatomic,assign) NSInteger  refundStatus;


/**
 * 姓名
 */
@property(nonatomic,copy) NSString * name;


/**
 * 银行卡号
 */
@property(nonatomic,copy) NSString * bankCardNo;


/**
 * 卡类型
 */
@property(nonatomic,copy) NSString * bankCardType;


/**
 * 银行类型编号
 */
@property(nonatomic,copy) NSString * bankCard;


/**
 * 身份证号
 */
@property(nonatomic,copy) NSString * idCard;


/**
 * 备注
 */
@property(nonatomic,copy) NSString * refundInfo;


/**
 * 退款申请时间
 */
@property(nonatomic,strong) NSString * createTime;

/**
 * 退款完成时间
 */
@property(nonatomic,strong) NSString * completeTime;

/**
 * 修改时间
 */
@property(nonatomic,strong) NSString * updateTime;


#pragma mark  *** 提交退款申请返回的数据

@property(nonatomic,copy) NSString * refundDealDays;

@property(nonatomic,copy) NSString * refundWorkDays;


#pragma mark  +********  收支记录的 *******
/**
 * 交易类型：1订单交易，2鉴定费，3担保费，4我要打款，5保证金
 */
@property(nonatomic,assign) NSInteger  transType;


/**
 * 支付方式： 1 PC网银支付，2 手机微信支付，3手机支付宝支付，4apple pay，5连连认证支付
 */
@property(nonatomic,assign) NSInteger  payType;

/**
 * 支付分期方式：0-不分期、1-商户普通分期、2-客户自由分期
 */
@property(nonatomic,assign) NSInteger  payInstalments;

/**
 * 支付金额
 */
@property(nonatomic,copy) NSString * payAmt;


/**
 * 支付成功时间（对账与清算使用）
 */
@property(nonatomic,copy) NSString * payedTime;
/**
 * 是否定金支付：0否，1是
 */
@property(nonatomic,assign) NSInteger  isDepositPay;

/**
 * 是否分笔支付：1是，0否
 */
@property(nonatomic,assign) NSInteger  isPartPay;




#pragma mark  *** 本地字段
/**
 可以直接展示的字符串
 */
@property(nonatomic,strong) NSString * refundStatusStr;




@end
/**
 {
	status = "1",
	data = 	{
 refundDealDays = "2",
 refundAmt = 100000,
 refundWorkDays = "3~5",
	},
	errorMsg = "",
	v = "2.0",
 }

 */

