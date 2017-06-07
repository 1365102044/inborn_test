//
//  YBPaymentDeliveryTypeFooterView.h
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionReusableView.h"
@class YBPaymentDeliveryTypeFooterView;

@protocol YBPaymentDeliveryTypeFooterViewDelegate <NSObject>

/**
 按钮点击事件

 @param paymentDeliveryTypeFooterView   paymentDeliveryTypeFooterView
 @param button                          button
 */
- (void)paymentDeliveryTypeFooterView:(YBPaymentDeliveryTypeFooterView *)paymentDeliveryTypeFooterView
                               button:(UIButton *)button;

@end

@interface YBPaymentDeliveryTypeFooterView : ZJBaseCollectionReusableView

/**
 代理
 */
@property (nonatomic, weak) id<YBPaymentDeliveryTypeFooterViewDelegate> delegate;

@end
