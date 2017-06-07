//
//  YBCertifiedPaymentMyBankCardTableViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentMyBankCardTableViewController.h"
#import "YBCertifiedPaymentMyBankCardTableViewControllerCell.h"

@interface YBCertifiedPaymentMyBankCardTableViewController ()

@end

@implementation YBCertifiedPaymentMyBankCardTableViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark <UITableViewDataSource>

/**
 返回组
 
 @param tableView tableView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

/**
 返回行
 
 @param tableView tableView
 @param section   section
 
 @return 每组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBCertifiedPaymentMyBankCardTableViewControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:YBCertifiedPaymentMyBankCardTableViewControllerCellReusableCellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registerSubViews];
}

#pragma mark - Sixth.界面配置

- (void)registerSubViews
{
    [self.tableView registerClass:[YBCertifiedPaymentMyBankCardTableViewControllerCell class]
           forCellReuseIdentifier:YBCertifiedPaymentMyBankCardTableViewControllerCellReusableCellIdentifier];
}
#pragma mark - Seventh.懒加载

@end
