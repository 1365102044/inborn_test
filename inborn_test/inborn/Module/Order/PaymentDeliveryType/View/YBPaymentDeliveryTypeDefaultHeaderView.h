//
//  YBPaymentDeliveryTypeDefaultHeaderView.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionReusableView.h"
@class YBPaymentDliveryTypeModel;

@interface YBPaymentDeliveryTypeDefaultHeaderView : ZJBaseCollectionReusableView

/**
 数据
 */
@property (nonatomic, strong) YBPaymentDliveryTypeModel *paymentDeliveryTypeModel;

- (void)setPaymentDeliveryTypeModel:(YBPaymentDliveryTypeModel *)paymentDeliveryTypeModel;

@end
