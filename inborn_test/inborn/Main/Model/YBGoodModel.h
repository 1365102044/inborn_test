//
//  YBGoodModel.h
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"
#import "YBBranceModel.h"

@interface YBGoodModel : ZJBaseModel

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *brandId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *createTime;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *goodsStatus;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *customId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sellerBuyPrice;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sellerDesc;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sellerGoodsParts;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sellerPsychicPrice;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *videoUrl;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *imgUrl;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *consignWay;

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBBranceModel *brand;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *refundMoney;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *payCountdown;

@end
