//
//  YBPenToPayController.h
//  inborn
//
//  Created by 郑键 on 17/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTableViewController.h"
#import "YBPaymentViewModel.h"

@interface YBPenToPayController : ZJBaseTableViewController

/**
 viewModel
 */
@property (nonatomic, weak) YBPaymentViewModel *paymentViewModel;

@end
