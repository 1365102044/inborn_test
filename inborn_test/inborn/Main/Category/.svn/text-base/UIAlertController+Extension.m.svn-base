//
//  UIAlertController+Extension.m
//  Project
//
//  Created by 郑键 on 17/3/13.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "UIAlertController+Extension.h"

@implementation UIAlertController (Extension)

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
                       confrimBlock:(void (^)())confirm
{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        
        UIAlertController *alertController          = [UIAlertController alertControllerWithTitle:title
                                                                                          message:message
                                                                                   preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction                 = [UIAlertAction actionWithTitle:cancelButtonTitle
                                                                               style:UIAlertActionStyleCancel
                                                                             handler:^(UIAlertAction *action) {
                                                                                 cancle();
                                                                             }];
        UIAlertAction *otherAction                  = [UIAlertAction actionWithTitle:otherButtonTitle
                                                                               style:UIAlertActionStyleDefault
                                                                             handler:^(UIAlertAction *action) {
                                                                                 confirm();
                                                                             }];
        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
        [viewController presentViewController:alertController
                                     animated:YES
                                   completion:nil];
    }else{
        UIAlertView *TitleAlert                     = [[UIAlertView alloc] initWithTitle:title
                                                                                 message:message
                                                                                delegate:self
                                                                       cancelButtonTitle:cancelButtonTitle
                                                                       otherButtonTitles:otherButtonTitle,nil];
        [TitleAlert show];
    }
}

@end
