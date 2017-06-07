//
//  YBOrderDetailStepHeaderView.h
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseTableViewHeaderFooterView.h"
@class YBOrderDetailViewModel;
#import "YBMySellOutModel.h"
/**
 *  YBOrderDetailStepHeaderView
 */
UIKIT_EXTERN NSString * const YBOrderDetailStepHeaderViewReuseIdentifier;

@interface YBOrderDetailStepHeaderView : ZJBaseTableViewHeaderFooterView

/**
 数据模型
 */
@property (nonatomic, strong) YBOrderDetailViewModel *orderDetailViewModel;

/**
 我卖出的 订单详情
 */
@property(nonatomic,strong) YBMySellOutModel * selloutdeatilModel;

/**
 配置状态配置
 
 @param index               下标
 @param dataArray           数据
 */
- (void)setStatusWithIndex:(NSInteger)index
                 dataArray:(NSArray *)dataArray
                      alph:(CGFloat)alph;
- (void)test;

@end
