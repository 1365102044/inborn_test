//
//  YBBankCardModel.h
//  inborn
//
//  Created by 郑键 on 17/4/7.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"

@interface YBBankCardModel : ZJBaseModel

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *bank_cardNo;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *cardNo;


/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *bank_code;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *bankCode;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *bank_name;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *bankName;


/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *card_type;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *cardType;
/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *ret_code;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *ret_msg;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sign;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *sign_type;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *customId;

/**
 <#descrption#>
 */
@property (nonatomic, assign) BOOL success;

@end
