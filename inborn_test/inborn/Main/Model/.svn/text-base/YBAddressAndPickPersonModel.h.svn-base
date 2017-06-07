//
//  YBAddressAndPickPersonModel.h
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"


@interface YBAddressAndPickPersonModel : ZJBaseModel
/**
 * 身份证号
 */
@property(nonatomic,copy) NSString *  addrIdcard;
/**
 * 手机号
 */
@property(nonatomic,copy) NSString *  addrMobile;
/**
 * 姓名
 */
@property(nonatomic,copy) NSString *  addrName;
/**
 * 地址类型：1收货人，2提货人
 */
@property(nonatomic,assign) NSInteger   addrType;
/**
 * 创建时间
 */
@property(nonatomic,copy) NSString *  createTime;
/**
 * 是否设置为默认（0否，1是）
 */
@property(nonatomic,assign) NSInteger   isDefault;

@property(nonatomic,copy) NSString *  memberId;

@property(nonatomic,copy) NSString *  customId;
/**
 * 省
 */
@property(nonatomic,copy) NSString  * addrProv;


/**
 * 市
 */
@property(nonatomic,copy) NSString *  addrCity;


/**
 * 县(区)
 */
@property(nonatomic,copy) NSString * addrCounty;


/**
 * 详细地址
 */
@property(nonatomic,copy) NSString * addrDetail;


/**
* 备注
*/
@property(nonatomic,copy) NSString * addrRemark;

/**
 * 修改时间
 */
@property(nonatomic,copy) NSString * updateTime;


/**
 判断当前的模型数据 是属于 地址／提货人 addre/pick
 */
@property(nonatomic,copy) NSString * modelType;

//** =========================================================================================== */
//** ========================================订单物流信息======================================= */
//** =========================================================================================== */

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *consigneeAddressDetail;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *consigneeCity;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *consigneeCounty;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *consigneeMobile;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *consigneeName;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *consigneeProvince;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *orderId;

//** =========================================================================================== */
//** =========================================订单自提地址======================================== */
//** =========================================================================================== */

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *pickupStatus;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *buyerId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *pickupCode;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *pickupIdcard;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *pickupMobile;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *pickupName;

@end

@interface YBAddressBaseModel : ZJBaseModel

@property(nonatomic,assign) NSInteger  curPage;

@property(nonatomic,strong) NSArray * data;

@property(nonatomic,assign) NSInteger  success;

@property(nonatomic,assign) NSInteger  totalRows;

@property(nonatomic,strong) NSMutableArray * dataModelArr;

@end


/**
 {
 data =     {
 curPage = 1;
 data =         (
 {
 addrIdcard = "4****************X";
 addrMobile = "188****0890";
 addrName = "\U5218\U6587\U5f3a";
 addrType = 2;
 createTime = 1490704006000;
 id = 24;
 isDefault = 0;
 memberId = 927054300008428;
 }
 );
 success = 1;
 totalRows = 1;
 };
 errorMsg = "";
 status = 1;
 v = "2.0";
 }

 */
