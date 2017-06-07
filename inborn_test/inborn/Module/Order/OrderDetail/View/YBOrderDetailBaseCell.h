//
//  YBOrderDetailBaseCell.h
//  inborn
//
//  Created by 郑键 on 17/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBDefaultTableViewCell.h"
@class YBOrderDetailModel;

@interface YBOrderDetailBaseCell : YBDefaultTableViewCell

/**
 数据模型
 */
@property (nonatomic, strong) YBOrderDetailModel *orderDetailModel;

@end
