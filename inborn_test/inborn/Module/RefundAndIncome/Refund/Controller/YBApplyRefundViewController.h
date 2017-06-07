//
//  YBRefundApplyViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRefundTableViewBaseViewController.h"
#import "YBOrderDetailModel.h"

@interface YBApplyRefundViewController : UIViewController


/**
 *  refundAmount 退款金额（总）
 *  我发布的退费申请，通过extend传入goodsId
 */
+ (instancetype)creatApplyRefundViewControllerWithrefundAmount:(NSString *)refundAmount
                                                       orderId:(NSString *)orderId
                                                        extend:(id)extend;

/**
 *  我发布的列表回调，刷新界面
 */
@property (nonatomic, copy) ZJEventCallBackBlock callBackBlock;

@end
