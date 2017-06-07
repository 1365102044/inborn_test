//
//  YBLoginViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"
#import "ZJBaseLoginAndRegisterViewController.h"
/**
 quickLoginType,                           快捷登录
 generalLoginType                          普通登录
 haveAcountLoginType                       保存有账号的登录
 */
typedef NS_ENUM(NSInteger, loginTypeEnum) {
    generalLoginType,
    quickLoginType,
    haveAcountLoginType
};

/**
 掉线之后 再次登录成功后
 */
typedef void(^againloginsecusshiddentabbarblock)();

/**
 登录后 跳转我的主页
 */
typedef BOOL(^loginSuccessPushMeMainVCBlock)();

@interface YBLoginViewController : ZJBaseLoginAndRegisterViewController

@property(nonatomic,copy) loginSuccessPushMeMainVCBlock  PushMeMainBlock;

/**
 初始化控制器
 */
+ (instancetype)creatLoginViewControllerWithType:(loginTypeEnum)Type
                                          extend:(id)extend;

/**
 只在 tabbar代理方法里使用这个方法
 */
- (void)formTabbarWith:(NSString *)formVC lastSelectTabbarItemIndex:(NSInteger)itemIndex;

@property(nonatomic,copy) againloginsecusshiddentabbarblock  againloginsecusshiddentabbarblock;

@end
