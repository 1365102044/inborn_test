//
//  ZJBaseAlert.h
//  inborn
//
//  Created by 郑键 on 17/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseWindow.h"

@interface ZJBaseAlert : ZJBaseWindow

/**
 获取单利对象

 @return alert对象
 */
+ (instancetype)sharedAlert;

/**
 配置界面
 */
- (void)setupCustomUI;

/**
 显示Alert
 */
- (void)showAlert;

/**
 隐藏Alert
 */
- (void)hiddenAlert;

@end
