//
//  YBMyComposedListViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMyComposedListViewController.h"
#import "ZJBaseScrollView.h"
#import "ZJTimerManager.h"
#import "YBMyComposedListTableViewController.h"

@interface YBMyComposedListViewController ()

@end

@implementation YBMyComposedListViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)timerEvent:(NSTimer *)timer
{
    /**
     *  获取当前屏幕中的控制器
     */
    NSInteger index = self.scrollview.contentOffset.x / self.scrollview.width;
    YBMyComposedListTableViewController *viewVc = (YBMyComposedListTableViewController *)self.childViewControllers[index];
    [viewVc countDown];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    
    /**
     *  配置标题数组，可扩展构造方法，传入数组
     */
    self.titlesArray = @[@{@"title":@"全部",
                           @"controllerName":@"YBMyComposedListTableViewController"},
                         @{@"title":@"待审核",
                           @"controllerName":@"YBMyComposedListTableViewController"},
                         @{@"title":@"待确认寄卖",
                           @"controllerName":@"YBMyComposedListTableViewController"},
                         @{@"title":@"待付费",
                           @"controllerName":@"YBMyComposedListTableViewController"},
                         @{@"title":@"待上架",
                           @"controllerName":@"YBMyComposedListTableViewController"},
                         @{@"title":@"出售中",
                           @"controllerName":@"YBMyComposedListTableViewController"},
                         @{@"title":@"已下架",
                           @"controllerName":@"YBMyComposedListTableViewController"},
                         @{@"title":@"不符合",
                           @"controllerName":@"YBMyComposedListTableViewController"}];
    
    [super viewDidLoad];

    self.navigationItem.title = ZJSTRING(@"我发布的");
    self.titleView.backgroundColor =ZJCOLOR.color_c0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1
                                                     target:self
                                                   selector:@selector(timerEvent:)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
    [[ZJTimerManager shareTimer] stopTimer];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
