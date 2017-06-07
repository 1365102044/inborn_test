//
//  YBBranceModel.h
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

@interface YBBranceModel : ZJBaseModel

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *brandId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *brandName;

//** =========================================================================================== */
//** ======================================适配发布修改返回数据===================================== */
//** =========================================================================================== */

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *customId;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *brandCnName;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *brandEnName;

@end
