//
//  YBCertificationBaseTableViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertificationBaseTableViewController.h"

@interface YBCertificationBaseTableViewController ()

/**
 保存naviBar的图片
 */
@property (nonatomic, strong) UIImage *defaultNaviBarImage;

/**
 保存naviBar背景图片
 */
@property (nonatomic, strong) UIImage *defaultNaviBarBackgroundImage;

@end

@implementation YBCertificationBaseTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.defaultNaviBarImage                            = self.navigationController.navigationBar.shadowImage;
    self.defaultNaviBarBackgroundImage                  = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:ZJCOLOR.color_c0] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:ZJCOLOR.color_c0]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:self.defaultNaviBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:self.defaultNaviBarImage];
}


@end
