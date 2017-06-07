//
//  YBAboutUSViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/31.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAboutUSViewController.h"

@interface YBAboutUSViewController ()
/**
 保存naviBar的图片
 */
@property (nonatomic, strong) UIImage *defaultNaviBarImage;

/**
 保存naviBar背景图片
 */
@property (nonatomic, strong) UIImage *defaultNaviBarBackgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *versonnumberLable;

@end

@implementation YBAboutUSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    
    self.view.backgroundColor = ZJCOLOR.color_c0;
    self.versonnumberLable.text = [NSString stringWithFormat:@" v.%@",
                                   [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.defaultNaviBarImage                            = self.navigationController.navigationBar.shadowImage;
    self.defaultNaviBarBackgroundImage                  = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:ZJCOLOR.color_c0] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:ZJCOLOR.color_c0]];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:self.defaultNaviBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:self.defaultNaviBarImage];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
