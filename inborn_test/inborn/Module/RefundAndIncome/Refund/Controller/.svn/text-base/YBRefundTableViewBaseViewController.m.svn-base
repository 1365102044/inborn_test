//
//  YBRefundTableViewBaseViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRefundTableViewBaseViewController.h"

@interface YBRefundTableViewBaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YBRefundTableViewBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
}


#pragma mark  *** tableview delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

/**
 懒加载
 */
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor  = ZJCOLOR.color_c16;
        _tableview.tableFooterView= [[UIView  alloc]init];
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.showsVerticalScrollIndicator = NO;
        
    }
    return  _tableview;
}

@end
