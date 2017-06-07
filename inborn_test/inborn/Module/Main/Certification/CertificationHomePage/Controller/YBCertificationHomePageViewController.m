//
//  YBCertificationHomePageViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertificationHomePageViewController.h"
#import "YBCerificationDefaultCell.h"
#import "YBCertificationResultViewController.h"
#import "YBCertificationIdCardImageViewController.h"
#import "YBCertificationInputInformationViewController.h"

@interface YBCertificationHomePageViewController ()

/**
 数组
 */
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation YBCertificationHomePageViewController

/**
 *  重用标志
 */
static NSString *YBCertificationHomePageViewControllerReusableIdentifier = @"YBCertificationHomePageViewControllerReusableIdentifier";

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
    return 1;
}

/**
 返回行
 
 @param tableView tableView
 @param section   section
 
 @return 每组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBCerificationDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:YBCertificationHomePageViewControllerReusableIdentifier
                                                                      forIndexPath:indexPath];
    cell.titleLabel.text = self.dataArray[indexPath.row][@"title"];
    return cell;
}

/**
 点击事件

 @param tableView tableView
 @param indexPath indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        /**
         *  实名认证
         */
        YBCertificationInputInformationViewController *inputInformationViewController = [[YBCertificationInputInformationViewController alloc] init];
        [self.navigationController pushViewController:inputInformationViewController animated:YES];
    }
    
    if (indexPath.row == 1) {
        
        /**
         *  身份证认证
         */
        YBCertificationIdCardImageViewController *idCardImageViewController = [[YBCertificationIdCardImageViewController alloc] init];
        [self.navigationController pushViewController:idCardImageViewController animated:YES];
    }
    
    if (indexPath.row == 2) {
        
        /**
         *  芝麻信用认证
         */
    }
    
    if (indexPath.row == 3) {
        
        /**
         *  商家认证
         */
    }
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = ZJCOLOR.color_c12;
    self.tableView.contentInset = UIEdgeInsetsMake(ADJUST_PERCENT_FLOAT(10.f), 0, 0, 0);
    self.navigationItem.title = ZJSTRING(@"认证中心");
    [self registerSubViews];
}

#pragma mark - Sixth.界面配置

- (void)registerSubViews
{
    [self.tableView registerClass:[YBCerificationDefaultCell class]
           forCellReuseIdentifier:YBCertificationHomePageViewControllerReusableIdentifier];
}

#pragma mark - Seventh.懒加载

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@{@"title":@"实名认证"},
                       @{@"title":@"身份证认证"}];
        
        /**
         @{@"title":@"芝麻信用认证"},
         @{@"title":@"商家认证"}
         */
    }
    return _dataArray;
}


@end
