//
//  YBThridBindingViewController.h
//  inborn
//
//  Created by 刘文强 on 2017/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"

typedef NS_ENUM(NSInteger, viewControllerType) {
    accountSurityType,
    thridBindingType
};
@interface YBThridBindingViewController : ZJBaseViewController

+ (instancetype)creatThridBindingViewControllerWitVCtype:(viewControllerType)vctype Extend:(id)Extend;
@end
