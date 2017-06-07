//
//  YBAppraisalModel.h
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"
#import "YBCommitLogitcsViewController.h"


/**
 收货人信息
 */
@interface consigneeModel : ZJBaseModel

@property(nonatomic,copy) NSString * consigneeName;
@property(nonatomic,copy) NSString * consigneeAddressDetail;
@property(nonatomic,copy) NSString * consigneeTelephone;

@property(nonatomic,copy) NSString * orderId;
@property(nonatomic,copy) NSString * consigneeIdcard;
@property(nonatomic,copy) NSString * consigneeCounty;
@property(nonatomic,copy) NSString * consigneeProvince;
@property(nonatomic,copy) NSString * consigneeCity;
@property(nonatomic,copy) NSString * consigneeMobile;

@end
/**
 "consigneeName": "铁雪莲",收货人
 "consigneeAddressDetail": "北京市朝阳区望京东路8号锐创国际中心A座20层", 地址
 "consigneeTelephone": "010-84177113"  电话
 */



@interface YBAppraisalModel : ZJBaseModel

//** =========================================================================================== */
//** ============================================提交物流页面的数据========================================= */
//** =========================================================================================== */


@property(nonatomic,copy) NSString * goodsId;

@property(nonatomic,copy) NSString * imgUrl;

@property(nonatomic,copy) NSString * sellerDesc;

@property(nonatomic,copy) NSString * sellerId;

@property(nonatomic,copy) NSString * customId;

@property(nonatomic,strong) NSArray * expressList;

@property(nonatomic,strong) NSDictionary * consignee;
/**
 收货人信息的模型数据
 */
@property(nonatomic,strong) consigneeModel * consigneemodel;


//** =========================================================================================== */
//** ============================================申请退回========================================== */
//** =========================================================================================== */

@property(nonatomic,copy) NSString * addrCity;

@property(nonatomic,copy) NSString * addrCounty;

@property(nonatomic,copy) NSString * addrDetail;

@property(nonatomic,copy) NSString * addrId;

@property(nonatomic,copy) NSString * addrIdcard;

@property(nonatomic,copy) NSString * addrMobile;

@property(nonatomic,copy) NSString * addrName;

@property(nonatomic,copy) NSString * addrProv;

@property(nonatomic,assign) NSInteger  deliveryType;

@property(nonatomic,assign) NSInteger  hasAddress;
/**
 入库时间
 */
@property(nonatomic,copy) NSString * inDepotTime;

/**
 仓库编号
 */
@property(nonatomic,copy) NSString * depotId;

@property(nonatomic,copy) NSString * squareImage;

//** =========================================================================================== */
//** ============================================发货／提供单号(送鉴)(我卖出的)========================================== */
//** =========================================================================================== */

/**
 商品名称
 */
@property(nonatomic,copy) NSString * goodsName;

/**
 商品图片
 */
@property(nonatomic,copy) NSString * goodsImage;

#pragma  +++++本地字段

/**
 seaction ==0 && row == 1
 */
@property(nonatomic,assign) CGFloat  addressHeight;


/**
 控制器类型
 */
@property(nonatomic,assign) viewcontrollerType  VCType;


@end
/**
 "addrCity": "北京市",
 "addrCounty": "朝阳区",
 "addrDetail": "望京东路8号\n锐创国际大厦a坐",
 "addrId": 176,
 "addrIdcard": "1****************2",
 "addrMobile": "152****1425",
 "addrName": "炸毛三",
 "addrProv": "北京市",
 "deliveryType": 1,
 "goodsId": 687054300021032,
 "hasAddress": 1, 0表示无地址，1表示有地址
 "id": 3,
 "imgUrl": "http://inbornpai-test.img-cn-beijing.aliyuncs.com/4/5c8985a5c357401faa04f34a1376e77c.png",  图片
 "sellerDesc": "卖家商品", 商品信息
 "sellerId": 257054300006614
 
 {
 -"data": {
 -"expressCompanyList": [  物流选择列表
 -{
 "expComCode": "dhl",
 "expComName": "dhl",
 "expSort": 2,
 "id": 11,
 "isUsable": 1
 },
 -{
 "expComCode": "ems",
 "expComName": "ems快递",
 "expSort": 3,
 "id": 15,
 "isUsable": 1
 },
 -{
 "expComCode": "shunfeng",
 "expComName": "顺丰",
 "expSort": 1,
 "id": 57,
 "isUsable": 1
 }
 ],
 "goodsId": 152554300046843,
 "id": 11,
 "imgUrl": "http://inbornpai-test.img-cn-beijing.aliyuncs.com/4/5c8985a5c357401faa04f34a1376e77c.png",  图片
 "sellerDesc": "卖家商品", 商品信息
 "sellerId": 232554300032417
 },
 "errorMsg": "",
 "status": "1",
 "v": "2.1"
 }
 */
