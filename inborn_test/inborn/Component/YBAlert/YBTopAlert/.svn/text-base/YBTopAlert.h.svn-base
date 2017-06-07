//
//  YBTopAlert.h
//  inborn
//
//  Created by 郑键 on 17/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseAlert.h"

/**
 顶部Alert类型

 - YBTopAlertDefault:                               默认
 - YBTopAlertSuccess:                               成功
 - YBTopAlertError:                                 错误
 */
typedef NS_ENUM(NSUInteger, YBTopAlertType) {
    YBTopAlertDefault,
    YBTopAlertSuccess,
    YBTopAlertError,
};

@interface YBTopAlert : ZJBaseAlert

/**
 显示顶部弹窗

 @param titleStringKey                              titleStringKey
 @param tipsStringKey                               tipsStringKey
 @param type                                        弹窗类型
 @param eventCallBackBlock                          点击事件回调
 */
- (void)showAlertWithTitleStringKey:(NSString *)titleStringKey
                      tipsStringKey:(NSString *)tipsStringKey
                               type:(YBTopAlertType)type
                 eventCallBackBlock:(ZJEventCallBackBlock)eventCallBackBlock;

/**
 隐藏弹窗
 */
- (void)hiddenAlert;

@end
