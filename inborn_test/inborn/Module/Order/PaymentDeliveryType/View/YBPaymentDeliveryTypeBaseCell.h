//
//  YBPaymentDeliveryTypeBaseCell.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewCell.h"
@class YBPaymentDliveryTypeModel;
@class YBPaymentDeliveryTypeBaseCell;

@protocol YBPaymentDeliveryTypeBaseCellDelegate <NSObject>

/**
 点击按钮回调

 @param paymentDeliveryTypeBaseCell     paymentDeliveryTypeBaseCell
 @param sender                          sender
 */
- (void)paymentDeliveryTypeBaseCell:(YBPaymentDeliveryTypeBaseCell *)paymentDeliveryTypeBaseCell
                             button:(UIButton *)sender;

@end

@interface YBPaymentDeliveryTypeBaseCell : ZJBaseCollectionViewCell

/**
 数据
 */
@property (nonatomic, strong) YBPaymentDliveryTypeModel *paymentDeliveryTypeModel;

/**
 代理
 */
@property (nonatomic, weak) id<YBPaymentDeliveryTypeBaseCellDelegate> delegate;

- (void)setPaymentDeliveryTypeModel:(YBPaymentDliveryTypeModel *)paymentDeliveryTypeModel;

@end
