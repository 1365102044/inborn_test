//
//  YBPaymentRecordViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/11.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentRecordViewController.h"
#import "YBPaymentRecordTableViewCell.h"
#import "YBOrderService.h"
#import "YBRefundModel.h"

static NSString *PAYMENTRECORDLISTCELLINDIFITER = @"PAYMENTRECORDLISTCELLINDIFITER";

@interface YBPaymentRecordViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * tableview;

@property(nonatomic,strong) NSArray * dataArr;

@end

@implementation YBPaymentRecordViewController

#pragma mark - First.通知

#pragma mark - Second.赋值
- (void)requestListData
{
    [[YBOrderService share] paymentRecordListWithorderId:self.orderId
                                                 success:^(id objc, id requestInfo) {
                                                     
                                                     NSMutableArray *temp = [NSMutableArray array];
                                                     for (NSDictionary *dict in objc[@"data"]) {
                                                         [temp addObject:[YBRefundModel modelWithDictionary:dict]];
                                                     }
                                                     self.dataArr = temp;
                                                     if (self.dataArr.count == 0 || self.dataArr == nil) {
                                                         [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                          
                                                                                   tipsString:ZJSTRING(@"暂无数据")
                                                                                  buttonTitle:nil];
                                                         self.myMaskView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                                                     }else {
                                                         [self hiddenMaskView];
                                                     }
                                                     [self.tableview.mj_header endRefreshing];
                                                     [self.tableview reloadData];
                                                 } fail:^(id error, id requestInfo) {
                                                     [self.tableview.mj_header endRefreshing];
                                                 }];
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(50);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBPaymentRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PAYMENTRECORDLISTCELLINDIFITER];
    if (!cell) {
        cell = [[YBPaymentRecordTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PAYMENTRECORDLISTCELLINDIFITER];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.dataModle = self.dataArr[indexPath.row];
    return cell;
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"收支记录";
    self.view.backgroundColor  = ZJCOLOR.color_c12;
    [self.view addSubview:self.tableview];
    self.tableview.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestListData)];
    [self requestListData];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

/**
 懒加载
 */
-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor  = ZJCOLOR.color_c12;
        _tableview.tableFooterView= [[UIView  alloc]init];
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.rowHeight = ADJUST_PERCENT_FLOAT(60);
        UIView *headerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(10))];
        headerview.backgroundColor = [UIColor clearColor];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.tableHeaderView = headerview;
    }
    return  _tableview;
}
@end
