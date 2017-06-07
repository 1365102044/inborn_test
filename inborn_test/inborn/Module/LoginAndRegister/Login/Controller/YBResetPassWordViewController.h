//
//  YBResetPassWordViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"
#import "ZJBaseLoginAndRegisterViewController.h"
@interface YBResetPassWordViewController : ZJBaseLoginAndRegisterViewController
/**
 初始化控制器
 */
+ (instancetype)creatReSetPassWordViewControllerWithPhone:(NSString *)phone messageCode:(NSString *)messageCode Extend:(id)extend;
@end
