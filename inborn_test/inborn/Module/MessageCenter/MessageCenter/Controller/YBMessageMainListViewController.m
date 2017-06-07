//
//  YBMessageMainListViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageMainListViewController.h"

@interface YBMessageMainListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic) UITableView *tableview;
@property(nonatomic,strong) NSArray * dataArr;
@end

@implementation YBMessageMainListViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    }
    
    return cell;
}
#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr = @[@"",@""];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

-(UITableView *)tableview{
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = ADJUST_PERCENT_FLOAT(46);
        _tableview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.tableFooterView = [[UIView alloc]init];
    }
    return _tableview;
}
@end
