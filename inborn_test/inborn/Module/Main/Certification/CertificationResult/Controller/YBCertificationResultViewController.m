//
//  YBCertificationResultViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertificationResultViewController.h"
#import "YBCertificationResultHeaderView.h"
#import "YBCertificationResultDefaultCell.h"
#import "ZJBaseTableView.h"
#import "User_LocalData.h"
#import "ZJMineService.h"
#import "ZJBaseBarButtonItem.h"

@interface YBCertificationResultViewController () <UITableViewDataSource, UITableViewDelegate>

/**
 内容视图
 */
@property (nonatomic, strong) ZJBaseTableView *contentTableView;

@end

@implementation YBCertificationResultViewController

/**
 *  重用标志
 */
static NSString *YBCertificationResultViewControllerReusableIdentifier = @"YBCertificationResultViewControllerReusableIdentifier";

/**
 *  重用标志header
 */
static NSString *YBCertificationResultViewControllerHeaderReusableIdentifier = @"YBCertificationResultViewControllerHeaderReusableIdentifier";

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
    return 3;
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBCertificationResultDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:YBCertificationResultViewControllerReusableIdentifier
                                                                             forIndexPath:indexPath];
    NSString *titleString;
    NSString *detailString;
    if (indexPath.row == 0) {
        
        titleString = @"真实姓名";
        
        /**
         *  判断是否实名认证
         */
        User_LocalData *localData = [User_LocalData new];
        if ([[localData idcardStatus] isEqualToString:@"0"]
            || ![localData idcardStatus]
            || [localData idcardStatus].length == 0) {
            
            detailString = @"";
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
            
        }else if ([[localData idcardStatus] isEqualToString:@"1"]) {
            
            detailString = @"";
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
            
        }else if ([[localData idcardStatus] isEqualToString:@"2"]) {
            
            detailString = [localData name];
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
            
        }else if ([[localData idcardStatus] isEqualToString:@"3"]) {
            
            detailString = @"";
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
        }
        
    }else if (indexPath.row == 1) {
        
        titleString = @"身份证";
        
        
        /**
         *  判断是否实名认证
         */
        User_LocalData *localData = [User_LocalData new];
        if ([[localData idcardStatus] isEqualToString:@"0"]
            || ![localData idcardStatus]
            || [localData idcardStatus].length == 0) {
            
            detailString = @" ";
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
            
        }else if ([[localData idcardStatus] isEqualToString:@"1"]) {
            
            detailString = @" ";
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
            
        }else if ([[localData idcardStatus] isEqualToString:@"2"]) {
            
            detailString = [localData idCard];
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
            
        }else if ([[localData idcardStatus] isEqualToString:@"3"]) {
            
            detailString = @" ";
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
        }
        
    }else if (indexPath.row == 2) {
        
        titleString = @"证件信息";
        
        /**
         *  判断是否实名认证
         */
        User_LocalData *localData = [User_LocalData new];
        if ([[localData idcardStatus] isEqualToString:@"0"]
            || ![localData idcardStatus]
            || [localData idcardStatus].length == 0) {
            
            detailString = @"未认证";
            cell.detailLabel.textColor = ZJCOLOR.color_c4;
            
        }else if ([[localData idcardStatus] isEqualToString:@"1"]) {
        
            detailString = @"认证中";
            cell.detailLabel.textColor = ZJCOLOR.color_c20;
            
        }else if ([[localData idcardStatus] isEqualToString:@"2"]) {
            
            detailString = @"已认证";
            cell.detailLabel.textColor = ZJCOLOR.color_c6;
            
        }else if ([[localData idcardStatus] isEqualToString:@"3"]) {
            
            detailString = @"认证失败";
            cell.detailLabel.textColor = ZJCOLOR.color_c19;
        }
    }
    
    cell.titleLabel.text = titleString;
    cell.detailLabel.text = detailString;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YBCertificationResultHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:YBCertificationResultViewControllerHeaderReusableIdentifier];
    if (!headerView) {
        headerView = [[YBCertificationResultHeaderView alloc] initWithReuseIdentifier:YBCertificationResultViewControllerHeaderReusableIdentifier];
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(201.f);
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = ZJSTRING(@"实名认证");
    
    [self registerSubViews];
    [self.view addSubview:self.contentTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    ZJBaseBarButtonItem *backButtonItem                 = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_back"
                                                                                                     callBack:^(id sender) {
                                                                                                         
                                                                                                         [self.navigationController popToRootViewControllerAnimated:YES];
                                                                                                         
                                                                                                     }];
    backButtonItem.offSet = YES;
    self.navigationItem.leftBarButtonItem     = backButtonItem;
}

#pragma mark - Sixth.界面配置

- (void)registerSubViews
{
    [self.contentTableView registerClass:[YBCertificationResultDefaultCell class]
                  forCellReuseIdentifier:YBCertificationResultViewControllerReusableIdentifier];
    [self.contentTableView registerClass:[YBCertificationResultHeaderView class]
      forHeaderFooterViewReuseIdentifier:YBCertificationResultViewControllerHeaderReusableIdentifier];
}

#pragma mark - Seventh.懒加载

- (ZJBaseTableView *)contentTableView
{
    if (!_contentTableView) {
        _contentTableView = [[ZJBaseTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _contentTableView.sectionHeaderHeight = ADJUST_PERCENT_FLOAT(201.f);
        _contentTableView.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
        _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _contentTableView.dataSource = self;
        _contentTableView.delegate = self;
        _contentTableView.backgroundColor = ZJCOLOR.color_c12;
        _contentTableView.bounces = NO;
    }
    return _contentTableView;
}

#pragma mark - Eighth.Other

- (void)loadData
{
    
}

@end
