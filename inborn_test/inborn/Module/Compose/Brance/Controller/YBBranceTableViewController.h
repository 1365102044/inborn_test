//
//  YBBranceTableViewController.h
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTableViewController.h"
@class YBBranceTableViewController;
@class YBBranceModel;

@protocol YBBranceTableViewControllerDelegate <NSObject>

/**
 选中的品牌
 
 @param branceTableViewController       branceTableViewController
 @param slectedBrandModel               selectedBrandText
 */
- (void)branceTableViewController:(YBBranceTableViewController *)branceTableViewController
                slectedBrandModel:(YBBranceModel *)slectedBrandModel;

@end

@interface YBBranceTableViewController : ZJBaseTableViewController

/**
 选中回调的代理
 */
@property (nonatomic, weak) id<YBBranceTableViewControllerDelegate> selectedDelegate;

@end
