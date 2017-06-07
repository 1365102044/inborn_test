//
//  YBRefundDeatilViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRefundDeatilViewController.h"
#import "YBRefundModel.h"
#import "YBApplyRefundDeatilView.h"
#import "YBOrderService.h"

@interface YBRefundDeatilViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) YBApplyRefundDeatilView *headerview;
@property(nonatomic,strong) UITableView * tableview;
@property(nonatomic,strong) NSString * orderId;
@property(nonatomic,strong) YBRefundModel * dataModel;

@end

@implementation YBRefundDeatilViewController

/**
 请求数据
 */
- (void)requestRefundDeatilInfor
{
    [[YBOrderService share] getRefundDeatilInforWithorderId:_orderId
                                                    success:^(id objc, id requestInfo) {
                                                        self.dataModel = [YBRefundModel modelWithDictionary:objc[@"data"]];
                                                        
                                                        self.headerview.dataModel = self.dataModel;
                                                        [self.tableview reloadData];
                                                        
                                                    } fail:^(id error, id requestInfo) {
                                                        
                                                    }];
}


+ (instancetype)creatRefundDeatilVCwithorderId:(id)orderId
                                        extend:(id)extend
{
    YBRefundDeatilViewController *deatilvc = [[YBRefundDeatilViewController alloc]init];
    deatilvc.orderId                            = orderId;
    return deatilvc;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"退款详情";
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    [self.view addSubview:self.tableview];
    self.tableview.tableHeaderView = self.headerview;

    [self requestRefundDeatilInfor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (YBApplyRefundDeatilView *)headerview {
    if (!_headerview) {
        _headerview = [YBApplyRefundDeatilView loadheaderview];
        _headerview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(440));
    }
    return _headerview;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor  = ZJCOLOR.color_c12;
        _tableview.tableFooterView= [[UIView  alloc]init];
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.showsVerticalScrollIndicator = NO;
    }
    return  _tableview;
}

@end
