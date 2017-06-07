//
//  YBShareView.h
//  inborn
//
//  Created by 刘文强 on 2017/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
typedef void(^clickShareBtnBlock)(NSInteger tag);

@interface YBShareView : ZJBaseView
+ (instancetype)share;

/**
 弹出视图
 */
- (void)showShareViewWithclickBlcok:(clickShareBtnBlock)clickItemBlcok;

/**
 移除视图
 */
- (void)dismissShareView;

@end
