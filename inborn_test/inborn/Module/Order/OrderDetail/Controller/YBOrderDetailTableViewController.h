//
//  YBOrderDetailTableViewController.h
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"

@interface YBOrderDetailTableViewController : ZJBaseViewController

/**
 创建订单详情控制器

 @param orderId         orderId（订单编号）
 @param extend          extend（扩展参数暂传nil）
 @return                订单详情
 */
+ (instancetype)orderDetailTableViewControllerWithOrderId:(NSString *)orderId
                                                   extend:(id)extend;

@end
