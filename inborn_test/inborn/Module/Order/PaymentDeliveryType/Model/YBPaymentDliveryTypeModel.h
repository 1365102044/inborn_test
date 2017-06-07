//
//  YBPaymentDliveryTypeModel.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderModel.h"

@interface YBPaymentDliveryTypeModel : YBOrderModel

//** =========================================================================================== */
//** ============================================界面=========================================== */
//** =========================================================================================== */

/**
 itemSize
 */
@property (nonatomic, assign) CGSize itemSize;

/**
 cell标志
 */
@property (nonatomic, copy) NSString *cellReID;

/**
 title
 */
@property (nonatomic, copy) NSString *title;

/**
 是否选中
 */
@property (nonatomic, assign) BOOL isSelected;

@end
