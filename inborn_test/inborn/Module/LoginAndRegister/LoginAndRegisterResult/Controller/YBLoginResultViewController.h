//
//  YBLoginResultViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"
#import "ZJBaseLoginAndRegisterViewController.h"
/**
 passwordResetResultType,               重置密码成功
 phoneAlreadyBindOtherWXResultType                 该手机号已绑定其他微信
 */
typedef NS_ENUM(NSInteger, LoginResultPageType) {
    passwordResetResultType,
    phoneAlreadyBindOtherWXResultType
};

@interface YBLoginResultViewController : ZJBaseLoginAndRegisterViewController

/**
 初始化
 */
+ (instancetype)creatLoginResultViewControllerWithType:(LoginResultPageType)Type
                                                extend:(id)extend;
@end
