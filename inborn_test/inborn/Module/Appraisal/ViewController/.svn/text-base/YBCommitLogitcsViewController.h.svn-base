//
//  YBCommitLogitcsViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//


#import "ZJBaseTableViewController.h"

/**
 CommitLogitcsType,         提交物流
 ApplyReturnType            申请退回
 ／／SupplyNumberType           提供单号（我卖出的）
 DeliverGoodsType,              发货
 SendAppraisalType              送鉴 提交单号
 */
typedef NS_ENUM(NSInteger, viewcontrollerType) {
    CommitLogitcsType = 1,
    ApplyReturnType,
//    SupplyNumberType,
    DeliverGoodsType,
    SendAppraisalType
    
};

/**
 刷新订单详情数据
 */
 typedef void(^refreshMySellOutOrderDeatilDataBlock)();

@interface YBCommitLogitcsViewController :ZJBaseTableViewController

+ (instancetype)creatViewCotrollerWithVcWithtype:(viewcontrollerType)VCtype
                                     appraisalId:(NSString *)appraisalId
                                          extend:(id)extend;
@property(nonatomic,copy) refreshMySellOutOrderDeatilDataBlock refreshOrderDeatilBlck;

/**
 我发布的列表回调，刷新界面
 */
@property (nonatomic, copy) ZJEventCallBackBlock callBackBlock;

@end
