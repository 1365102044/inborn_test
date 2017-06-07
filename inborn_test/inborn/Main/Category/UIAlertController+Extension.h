//
//  UIAlertController+Extension.h
//  Project
//
//  Created by 郑键 on 17/3/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Extension)

/**
 alert提示弹窗

 @param viewController                      viewController
 @param title title                         标题
 @param message message                     内容
 @param cancelButtonTitle cancelButtonTitle 取消按钮
 @param otherButtonTitle otherButtonTitle   其他按钮
 @param cancle cancle                       取消回调
 @param confirm confirm                     其他回调
 */
+ (void)showAlertViewWithController:(UIViewController *)viewController
                              title:(NSString *)title
                            message:(NSString *)message
                        cancelTitle:(NSString *)cancelButtonTitle
                         otherTitle:(NSString *)otherButtonTitle
                        cancelBlock:(void (^)())cancle
                       confrimBlock:(void (^)())confirm;

@end
