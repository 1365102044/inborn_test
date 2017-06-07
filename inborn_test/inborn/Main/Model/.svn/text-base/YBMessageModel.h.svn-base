//
//  YBMessageModel.h
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

/**
 系统
 */
@interface YBMessageSystemModel : ZJBaseModel

@property(nonatomic,copy) NSString * createTime;
@property(nonatomic,copy) NSString * customId;
@property(nonatomic,copy) NSString * msgTitle;
@property(nonatomic,assign) NSInteger  msgType;

/**
 本地字段
 */
@property(nonatomic,assign) CGFloat  contentheight;
@property(nonatomic,strong) NSArray * heightArr;
@end

/**
 订单
 */
@interface YBMessageOrderModel : ZJBaseModel

@property(nonatomic,copy) NSString * customId;
@property(nonatomic,copy) NSString * msgTitle;
@property(nonatomic,copy) NSString * deliveryStatus;
@property(nonatomic,copy) NSString * deliveryMerchant;
@property(nonatomic,copy) NSString * msgType;
@property(nonatomic,copy) NSString * createTime;
@property(nonatomic,copy) NSString * goodsName;
@property(nonatomic,copy) NSString * deliveryNum;
@property(nonatomic,copy) NSString * orderId;
@property (nonatomic, copy) NSString *goodsImage;
@property (nonatomic, copy) NSString *refId;
@property (nonatomic, assign)  NSInteger orderStatus;
@property(nonatomic,copy) NSString * squareImage;


/**
 本地字段
 */
@property (nonatomic, copy) NSString *orderstatusStr;
/**
 数据模型的类型 1 订单； 2 鉴定订单
 */
@property(nonatomic,assign) NSInteger  modelType;


@end

@interface YBMessageModel : ZJBaseModel

@property(nonatomic,strong) NSArray * data;
@property(nonatomic,assign) NSInteger  totalRows;
@property(nonatomic,assign) NSInteger  curPage;
@property(nonatomic,strong) NSArray * orderModelArr;

@property(nonatomic,strong) NSArray * systemModelArr;


#pragma mark ++++消息总列表++++++
/**
 鉴定
 */
@property(nonatomic,assign) NSInteger  identifyMsg;

@property(nonatomic,assign) NSInteger  marginMsg;
/**
 订单
 */
@property(nonatomic,assign) NSInteger  orderMsg;
/**
 系统
 */
@property(nonatomic,assign) NSInteger  sysMsg;
/**
 担保金订单
 */
@property(nonatomic,assign) NSInteger  depositMsg;

/**
 数据模型的类型 1 订单； 2 鉴定订单 3 担保金订单
 */
@property(nonatomic,assign) NSInteger  modelType;

@end
/**
 {
 id = 3548,
 msgTitle = "尊敬的会员，您的订单（862354385963387）包含商品（静静数据1）支付成功，平台会在48小时内发货，请关注物流信息。",
 deliveryStatus = 3,
 deliveryMerchant = "顺丰快递",
 msgType = 105,
 createTime = 1491638784000,
 goodsName = "静静数据1",
 deliveryNum = "444004730073",
 orderId = 862354385963387,
 orderStatus = 31,
 refId = "862354385963387",
 hasAddress = 1,
 goodsImage = "http://inbornpai-test.img-cn-beijing.aliyuncs.com/4/ccc3b9f9c21d4f39852d319464bfc279.jpg",
 },

 */
