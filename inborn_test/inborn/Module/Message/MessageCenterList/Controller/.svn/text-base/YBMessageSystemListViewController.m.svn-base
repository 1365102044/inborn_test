//
//  YBMessageSystemListViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageSystemListViewController.h"
#import "YBMessageSystemListTableViewCell.h"
#import "YBMessageService.h"
#import "YBMessageModel.h"
#import "YBMessageSystemListTableViewCell.h"

static NSInteger MAXPAGE = 8;
static NSString *SYSTEMNESLISTCELLINDIFITER = @"SYSTEMNESLISTCELLINDIFITER";
@interface YBMessageSystemListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableview;
@property (nonatomic, strong) YBMessageModel * dataBaseModel;
@property(nonatomic,strong) NSArray * dataModelArr;
@property(nonatomic,assign) NSInteger  cureenPage;
@property (nonatomic, assign) NSInteger totalPage;

@end

@implementation YBMessageSystemListViewController

#pragma mark - First.通知
- (void)loadNewData
{
    _cureenPage = 1;
    [[YBMessageService share] getMessageSystemNewsListInforWith:MAXPAGE
                                                        curPage:_cureenPage
                                                        Success:^(id objc, id requestInfo) {
                                                            [self handledataToModel:objc];
                                                            [self.tableview.mj_header endRefreshing];
                                                        } fail:^(id error, id requestInfo) {
                                                            [self.tableview.mj_header endRefreshing];
                                                        }];
}

- (void)loadMoreData
{
    if(self.dataBaseModel.totalRows%MAXPAGE==0)
    {
        self.totalPage = self.dataBaseModel.totalRows/MAXPAGE;
    }else{
        self.totalPage = self.dataBaseModel.totalRows/MAXPAGE+1;
    }
    if (self.cureenPage+1 >self.totalPage) {
        
        [self.tableview.mj_footer endRefreshingWithNoMoreData];
        [self.tableview.mj_footer endRefreshing];
        return;
    }else{
        [self.tableview.mj_footer resetNoMoreData];
    }

    self.cureenPage ++;
    [[YBMessageService share] getMessageSystemNewsListInforWith:MAXPAGE
                                                        curPage:_cureenPage
                                                        Success:^(id objc, id requestInfo) {
                                                            [self handledataToModel:objc];
                                                            [self.tableview.mj_footer endRefreshing];
                                                        } fail:^(id error, id requestInfo) {
                                                            [self.tableview.mj_footer endRefreshing];
                                                        }];
}

/**
 转模型
 */
- (void)handledataToModel:(id)objc
{
    if (objc == nil) {
        return;
    }
    self.dataBaseModel = [YBMessageModel modelWithDictionary:objc[@"data"]];
    NSMutableArray *temparr = [NSMutableArray array];
    if (_cureenPage > 1) {
        [temparr addObjectsFromArray:self.dataModelArr];
    }else{
        self.dataModelArr = [NSArray array];
        
        if (self.dataBaseModel.totalRows == 0) {
            [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                      tipsString:@"暂无数据"
                                     buttonTitle:nil];
            self.myMaskView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        }else{
            [self hiddenMaskView];
        }

    }

    [temparr addObjectsFromArray:self.dataBaseModel.systemModelArr];
    self.dataModelArr = temparr;
    [self.tableview.mj_header endRefreshing];
    [self.tableview.mj_footer endRefreshing];
    [self.tableview reloadData];
    
}

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBMessageSystemModel *model = self.dataModelArr[indexPath.section];
    if (!model.contentheight) {
        return ADJUST_PERCENT_FLOAT(50);
    }
    
    YBLog(@"----%.0f--", [model.heightArr[indexPath.section] floatValue]);
    return [model.heightArr[indexPath.section] floatValue];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataModelArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBMessageSystemListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SYSTEMNESLISTCELLINDIFITER];
    if (!cell) {
        cell = [[YBMessageSystemListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SYSTEMNESLISTCELLINDIFITER];
    }
    cell.backgroundColor = ZJCOLOR.color_c12;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.dataModel = self.dataModelArr[indexPath.section];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *seactionview = [[UIView alloc]init];
    seactionview.backgroundColor = [UIColor clearColor];
    seactionview.frame = CGRectMake(0, 0, SCREEN_WIDTH, 20);
    
    YBMessageOrderModel*listmodle = self.dataModelArr[section];
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
    return ADJUST_PERCENT_FLOAT(15);
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"系统消息";
    
    [self.view addSubview:self.tableview];
    self.tableview.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 自动改变透明度
    self.tableview.mj_header.automaticallyChangeAlpha = YES;
    self.tableview.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    MJRefreshAutoFooter *autoFooter                                     = (MJRefreshAutoFooter *)self.tableview.mj_footer;
    autoFooter.triggerAutomaticallyRefreshPercent                       = -100;

    
    [self loadNewData];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource  = self;
        _tableview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIView *headerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
        headerview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.tableHeaderView = headerview;
    }
    return _tableview;
}

@end
