//
//  YBOrderDetailModel.h
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderModel.h"

@interface YBOrderDetailModel : YBOrderModel

/**
 *  订单状态
 *  10.未支付
 *  20.部分付款-分笔支付
 *  21.部分付款-定金支付
 *  22.部分付款-定金余款部分付款
 *  30.待发货
 *  31.待配货
 *  40.已发货
 *  41.已配货
 *  50.已收货
 *  51.已自提
 *  60.交易完成，待平台打款
 *  61.交易完成（物流）
 *  62.交易完成（自提）
 *  70.用户手动取消
 *  71.未支付超时取消
 *  72.支付定金超时取消
 *  73.定金+部分货款取消
 *  74.部分货款取消
 *  75.鉴定失败，已取消
 */
@property (nonatomic, assign) NSInteger detailsShowStatus;

//** =========================================================================================== */
//** =======================================是否支持定金支付====================================== */
//** =========================================================================================== */

/**
 <#descrption#>
 */
@property (nonatomic, assign) NSInteger isAllowDepositPay;

//** =========================================================================================== */
//** ============================================界面=========================================== */
//** =========================================================================================== */

/**
 行高
 */
@property (nonatomic, assign) CGFloat rowHeight;

/**
 cell标志
 */
@property (nonatomic, copy) NSString *cellReID;

/**
 title--用于状态展示及defaultCell
 */
@property (nonatomic, copy) NSString *title;

/**
 detailLabel--用于状态展示及defaultCell
 */
@property (nonatomic, copy) NSString *detailTitle;

/**
 是否展示辅助视图--用于defaultCell
 */
@property (nonatomic, assign) BOOL showAccessImageView;

/**
 是否展示detailLabel--用于defaultCell
 */
@property (nonatomic, assign) BOOL showDetailLabel;

/**
 是否隐藏底边线--用于defaultCell
 */
@property (nonatomic, assign) BOOL hiddenBottomMarginLine;

/**
 是否使用富文本形式展示金额--用于defaultCell
 */
@property (nonatomic, assign) BOOL showAmont;

/**
 是否是时间展示cell
 */
@property (nonatomic, assign) BOOL showTime;

@end
