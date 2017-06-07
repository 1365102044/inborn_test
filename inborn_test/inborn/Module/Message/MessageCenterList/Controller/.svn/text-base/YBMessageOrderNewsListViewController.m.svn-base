//
//  YBMessageOrderNewsListViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageOrderNewsListViewController.h"
#import "YBMessageOrderNewsListTableViewCell.h"
#import "YBMessageService.h"
#import "YBMessageModel.h"
#import "YBOrderDetailTableViewController.h"
static NSInteger MAXPAGE = 8;
static NSString *MESSAGEORDERNEWSLISTCELLINDIFITER = @"MESSAGEORDERNEWSLISTCELLINDIFITER";
static NSString *ARREAISALORDERTYPE = @"jianding";
static NSString *DESPOSITORDERTYPE = @"deposit";
@interface YBMessageOrderNewsListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) YBMessageModel * dataBaseModel;
@property(nonatomic,strong) NSArray * orderModelArr;
@property(nonatomic,assign) NSInteger  cureenPage;
@property (nonatomic, assign) NSInteger totalPage;

@end

@implementation YBMessageOrderNewsListViewController

#pragma mark - First.通知

#pragma mark - Second.赋值
- (void)loadNewOrderListData
{
    _cureenPage = 1;
    self.dataBaseModel = [[YBMessageModel alloc]init];
    if ([self.sourtype isEqualToString:ARREAISALORDERTYPE]) {
        [[YBMessageService share] getMessageAppraisalNewsListInforWith:MAXPAGE
                                                               curPage:_cureenPage
                                                               Success:^(id objc, id requestInfo) {
                                                                   self.tableview.mj_footer.hidden = NO;
                                                                   [self getobjcToModel:objc];
                                                                   [self.tableview.mj_header endRefreshing];
                                                                   [self.tableview reloadData];
                                                               } fail:^(id error, id requestInfo) {
                                                                   [self.tableview.mj_header endRefreshing];
                                                               }];
        
    }else if ([self.sourtype isEqualToString:DESPOSITORDERTYPE]){
        
        [[YBMessageService share] getMessageDepositNewsListInforWith:MAXPAGE
                                                       curPage:_cureenPage
                                                       Success:^(id objc, id requestInfo) {
                                                           self.tableview.mj_footer.hidden = NO;
                                                           [self getobjcToModel:objc];
                                                           [self.tableview.mj_header endRefreshing];
                                                           [self.tableview reloadData];
                                                       } fail:^(id error, id requestInfo) {
                                                           [self.tableview.mj_header endRefreshing];
                                                       }];
        
    }else{
        
        [[YBMessageService share] getMessageOrderListInforWith:MAXPAGE
                                                       curPage:_cureenPage
                                                       Success:^(id objc, id requestInfo) {
                                                           self.tableview.mj_footer.hidden = NO;
                                                           [self getobjcToModel:objc];
                                                           [self.tableview.mj_header endRefreshing];
                                                           [self.tableview reloadData];
                                                       } fail:^(id error, id requestInfo) {
                                                           [self.tableview.mj_header endRefreshing];
                                                       }];
    }
    
}

- (void)loadMoreOrderListData
{
    if(self.dataBaseModel.totalRows%MAXPAGE==0)
    {
        self.totalPage = self.dataBaseModel.totalRows/MAXPAGE;
    }else{
        self.totalPage = self.dataBaseModel.totalRows/MAXPAGE+1;
    }
    if (self.cureenPage+1 >self.totalPage) {
        
        [self.tableview.mj_footer endRefreshingWithNoMoreData];
        //        [self.tableview.mj_footer endRefreshing];
        return;
    }else{
        [self.tableview.mj_footer resetNoMoreData];
    }
    self.cureenPage ++;
    if ([self.sourtype isEqualToString:ARREAISALORDERTYPE]) {
        
        [[YBMessageService share] getMessageAppraisalNewsListInforWith:MAXPAGE
                                                               curPage:_cureenPage
                                                               Success:^(id objc, id requestInfo) {
                                                                   [self getobjcToModel:objc];
                                                                   [self.tableview.mj_footer endRefreshing];
                                                                   [self.tableview reloadData];
                                                               } fail:^(id error, id requestInfo) {
                                                                   [self.tableview.mj_footer endRefreshing];
                                                               }];
    }else if ([self.sourtype isEqualToString:DESPOSITORDERTYPE]){
        
        [[YBMessageService share] getMessageDepositNewsListInforWith:MAXPAGE
                                                       curPage:_cureenPage
                                                       Success:^(id objc, id requestInfo) {
                                                           [self getobjcToModel:objc];
                                                           [self.tableview.mj_footer endRefreshing];
                                                           [self.tableview reloadData];
                                                       } fail:^(id error, id requestInfo) {
                                                           [self.tableview.mj_footer endRefreshing];
                                                       }];
        
    }else{
        
        [[YBMessageService share] getMessageOrderListInforWith:MAXPAGE
                                                       curPage:_cureenPage
                                                       Success:^(id objc, id requestInfo) {
                                                           [self getobjcToModel:objc];
                                                           [self.tableview.mj_footer endRefreshing];
                                                           [self.tableview reloadData];
                                                       } fail:^(id error, id requestInfo) {
                                                           [self.tableview.mj_footer endRefreshing];
                                                       }];
    }
    
}

- (void)getobjcToModel:(id)objc
{
    if (objc == nil) {
        return;
    }
    self.dataBaseModel = [YBMessageModel modelWithJSON:objc[@"data"]];
    self.dataBaseModel.modelType = 1;
    if([_sourtype  isEqualToString:ARREAISALORDERTYPE]){
        self.dataBaseModel.modelType = 2;
    }else if ([_sourtype isEqualToString:DESPOSITORDERTYPE]){
        self.dataBaseModel.modelType = 3;
    }
    NSMutableArray *temparr = [NSMutableArray array];
    if (_cureenPage > 1) {
        [temparr addObjectsFromArray:self.orderModelArr];
    }else{
        self.orderModelArr = [NSArray array];
        if (self.dataBaseModel.totalRows == 0) {
            [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                      tipsString:@"暂无数据"
                                     buttonTitle:nil];
            self.myMaskView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        }else{
            [self hiddenMaskView];
        }
        if (self.dataBaseModel.totalRows <= MAXPAGE) {
            self.tableview.mj_footer.hidden = YES;
        }else{
            self.tableview.mj_footer.hidden = NO;
        }
    }
    [temparr addObjectsFromArray:self.dataBaseModel.orderModelArr];
    self.orderModelArr = temparr;
    [self.tableview.mj_header endRefreshing];
    [self.tableview.mj_footer endRefreshing];
    
}
#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.orderModelArr.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *seactionview = [[UIView alloc]init];
    seactionview.backgroundColor = [UIColor clearColor];
    seactionview.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20);
    
    YBMessageOrderModel*listmodle = self.orderModelArr[section];
    NSDate *timedate = [NSDate dateWithTimeIntervalSince1970:([listmodle.createTime doubleValue] / 1000.0)];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    [formatter setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"]];
    [formatter setDateFormat:@"yyyy年MM月dd HH:mm"];
    NSString *time = [formatter stringFromDate:timedate];
    
    
    UILabel *timelable = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-110)/2, 0, 110, 20)];
    [seactionview addSubview:timelable];
    timelable.text = time;
    timelable.font = SYSTEM_REGULARFONT(10);
    timelable.textColor = [UIColor whiteColor];
    timelable.layer.masksToBounds = YES;
    timelable.layer.cornerRadius  = 2;
    timelable.textAlignment = NSTextAlignmentCenter;
    timelable.backgroundColor = ZJCOLOR.color_c5;
    return seactionview;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footer = [[UIView alloc]init];
    footer.backgroundColor = ZJCOLOR.color_c12;
    return footer;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(30);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBMessageOrderNewsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[YBMessageOrderNewsListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MESSAGEORDERNEWSLISTCELLINDIFITER];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.dataModel = self.orderModelArr[indexPath.section];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.sourtype isEqualToString:ARREAISALORDERTYPE] || [self.sourtype isEqualToString:DESPOSITORDERTYPE]){
        return;
    }else {
        YBMessageOrderModel *model = self.orderModelArr[indexPath.section];
        YBOrderDetailTableViewController *orderdeativc = [YBOrderDetailTableViewController orderDetailTableViewControllerWithOrderId:model.orderId
                                                                                                                              extend:self];
        [self.navigationController pushViewController:orderdeativc animated:YES];
    }
}
#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZJCOLOR.color_c12;
    self.title = @"订单通知";
    if ([self.sourtype isEqualToString:ARREAISALORDERTYPE]) {
        self.title = @"鉴定通知";
    }else if ([self.sourtype isEqualToString:DESPOSITORDERTYPE]){
        self.title = @"担保金通知";
    }
    
    [self.view addSubview:self.tableview];
    self.tableview.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewOrderListData)];
    // 自动改变透明度
    self.tableview.mj_header.automaticallyChangeAlpha = YES;
    self.tableview.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreOrderListData)];
    MJRefreshAutoFooter *autoFooter                                     = (MJRefreshAutoFooter *)self.tableview.mj_footer;
    autoFooter.triggerAutomaticallyRefreshPercent                       = -100;
    self.tableview.mj_footer.hidden = YES;
    [self loadNewOrderListData];
    
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

-(UITableView *)tableview{
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = ADJUST_PERCENT_FLOAT(137);
        _tableview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.tableFooterView.backgroundColor = ZJCOLOR.color_c12;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIView *headerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
        headerview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.tableHeaderView = headerview;
    }
    return _tableview;
}


@end
