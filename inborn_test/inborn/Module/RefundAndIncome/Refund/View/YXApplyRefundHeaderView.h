//
//  YXApplyRefundHeaderView.h
//  inbid-ios
//
//  Created by 胤讯测试 on 16/12/19.
//  Copyright © 2016年 胤讯. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 tag :100 提交数据。200 验证码
 */
typedef void (^clickcommitbtnblock)();
@interface YXApplyRefundHeaderView : UIView

+(instancetype)loadheaderview;

@property(nonatomic,copy)  clickcommitbtnblock clickBlock;

/**
 退款金额
 */
@property(nonatomic,strong)  NSString * refundAmount;

@end
