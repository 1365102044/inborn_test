//
//  ZJBaseNavigationController.m
//  Project
//
//  Created by 郑键 on 17/1/11.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJBaseNavigationController.h"
#import "YBDefaultButton.h"
#import "ZJBaseBarButtonItem.h"

@interface ZJBaseNavigationController () <UINavigationControllerDelegate>

@end

@implementation ZJBaseNavigationController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate                                           = self;

    /**
     *  配置全局统一无下边线白底navigationBar
     */
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:ZJCOLOR.color_c0] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageWithColor:ZJCOLOR.color_c0]];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

#pragma mark - Eight.Other

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    UIViewController *root = navigationController.viewControllers[0];
    
    if (root != viewController) {
        ZJBaseBarButtonItem *backButtonItem                 = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                       imageNamed:@"public_back"
                                                                                                         callBack:^(id sender) {
                                                                                                             [self popViewControllerAnimated:YES];
                                                                                                         }];
        viewController.navigationItem.leftBarButtonItem     = backButtonItem;
        viewController.tabBarController.tabBar.hidden       = YES;
    }else{
        viewController.tabBarController.tabBar.hidden       = NO;
    }
}

@end
