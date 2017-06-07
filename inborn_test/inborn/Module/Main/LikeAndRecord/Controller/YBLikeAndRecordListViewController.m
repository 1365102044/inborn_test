    //
//  YBLikeAndRecordListViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLikeAndRecordListViewController.h"
#import "YBLikeAndRecordListTableViewCell.h"
#import "ZJMineService.h"
#import "YBLikeAndRecordBaseModel.h"
#import "YBGoodsDeatilNaviMoreView.h"
#import "User_LocalData.h"
#import "YBGoodsDeatilImageViewController.h"
#import "YXShareSDKManager.h"
#import "YBBlankpageView.h"
#import "ZJBaseNavigationController.h"
#import "ZJBaseBarButtonItem.h"
#import "MQCustomerServiceManager.h"

static NSString *LIKEORRECORDCELLINDIFITER = @"LIKEORRECORDCELLINDIFITER";
@interface YBLikeAndRecordListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableview;
@property (assign,nonatomic) LikeOrRecordType vctype;
@property(nonatomic,assign) NSInteger  cureenrPage;
@property(nonatomic,assign) NSInteger  tolalPage;
@property(nonatomic,strong) YBLikeAndRecordBaseModel * DataBaseModel;
@property(nonatomic,strong) YBBlankpageView * blankPageView;

@end

@implementation YBLikeAndRecordListViewController
NSInteger MAXPAGE = 8;
#pragma mark - First.通知
#pragma mark - Second.赋值

#pragma mark  *** 网络请求
-(void)LoadListData
{
    self.cureenrPage = 1;
    if (_vctype == RecordVcType) {
        
        [[ZJMineService share] getSeeRecordGoodsListDataInfocurPage:_cureenrPage
                                                           pageSize:MAXPAGE
                                                            Success:^(id objc, id requestInfo) {
                                                                self.tableview.mj_footer.hidden = NO;
                                                                
                                                                self.DataBaseModel = [YBLikeAndRecordBaseModel modelWithDictionary:objc[@"data"]];
                                                                
                                                                if (self.DataBaseModel.totalRows ==0 || !self.DataBaseModel.totalRows) {
                                                                    
                                                                    self.tableview.tableHeaderView = self.blankPageView;
                                                                    self.tableview.tableHeaderView.height = self.tableview.height;
                                                                    self.tableview.mj_footer.hidden = YES;
                                                                }else{
                                                                    self.tableview.mj_footer.hidden = NO;
                                                                    [self.blankPageView removeFromSuperview];
                                                                    self.tableview.tableHeaderView.height = 0;
                                                                }
                                                                if (self.DataBaseModel.totalRows <= MAXPAGE) {
                                                                    self.tableview.mj_footer.hidden = YES;
                                                                }else{
                                                                    self.tableview.mj_footer.hidden = NO;
                                                                }
                                                                
                                                                [self.tableview.mj_header endRefreshing];
                                                                [self.tableview.mj_footer resetNoMoreData];
                                                                [self.tableview reloadData];
                                                                
                                                            } fail:^(id error, id requestInfo) {
                                                                [self.tableview.mj_header endRefreshing];
                                                            }];
    }else if (_vctype == liekVcType){
        
        [[ZJMineService share] getMyLikeGoodsListDataInfocurPage:_cureenrPage
                                                        pageSize:MAXPAGE
                                                         Success:^(id objc, id requestInfo) {
                                                             self.tableview.mj_footer.hidden = NO;
                                                             self.DataBaseModel = [YBLikeAndRecordBaseModel modelWithDictionary:objc[@"data"]];
                                                             
                                                             if (self.DataBaseModel.totalRows ==0 || !self.DataBaseModel.totalRows) {
                                                                 self.tableview.tableHeaderView = self.blankPageView;
                                                                 self.tableview.tableHeaderView.height = self.tableview.height;
                                                                 self.tableview.mj_footer.hidden = YES;
                                                             }else{
                                                                 self.tableview.mj_footer.hidden = NO;
                                                                 [self.blankPageView removeFromSuperview];
                                                                 self.tableview.tableHeaderView.height = 0;
                                                             }
                                                             if (self.DataBaseModel.totalRows <= MAXPAGE) {
                                                                 self.tableview.mj_footer.hidden = YES;
                                                             }else{
                                                                 self.tableview.mj_footer.hidden = NO;
                                                             }
                                                             
                                                             [self.tableview.mj_header endRefreshing];
                                                             [self.tableview.mj_footer resetNoMoreData];
                                                             [self.tableview reloadData];
                                                         } fail:^(id error, id requestInfo) {
                                                             
                                                             [self.tableview.mj_header endRefreshing];
                                                         }];
    }
}

- (void)LoadListMoreData
{
    _cureenrPage ++;
    if(self.DataBaseModel.totalRows%MAXPAGE==0)
    {
        self.tolalPage = self.DataBaseModel.totalRows/MAXPAGE;
    }else{
        self.tolalPage = self.DataBaseModel.totalRows/MAXPAGE+1;
    }
    if (self.cureenrPage >self.tolalPage) {
        
        [self.tableview.mj_footer endRefreshingWithNoMoreData];
        [self.tableview.mj_footer endEditing:YES];
        return;
    }else{
        [self.tableview.mj_footer resetNoMoreData];
    }

    if (_vctype == RecordVcType) {
        
        [[ZJMineService share] getSeeRecordGoodsListDataInfocurPage:_cureenrPage
                                                           pageSize:MAXPAGE
                                                            Success:^(id objc, id requestInfo) {
                                                                YBLikeAndRecordBaseModel *modelarr = [YBLikeAndRecordBaseModel modelWithDictionary:objc[@"data"]];
                                                                NSMutableArray *temparr = self.DataBaseModel.dataModelArr;
                                                                [temparr addObjectsFromArray:modelarr.dataModelArr];
                                                                self.DataBaseModel.dataModelArr = temparr;
                                                                
                                                                
                                                                
                                                                [self.tableview.mj_footer endRefreshing];
                                                                [self.tableview reloadData];
                                                                
                                                            } fail:^(id error, id requestInfo) {
                                                                [self.tableview.mj_footer endRefreshing];
                                                            }];
    }else if (_vctype == liekVcType){
        
        [[ZJMineService share] getMyLikeGoodsListDataInfocurPage:_cureenrPage
                                                        pageSize:MAXPAGE
                                                         Success:^(id objc, id requestInfo) {
                                                             
                                                             YBLikeAndRecordBaseModel *modelarr = [YBLikeAndRecordBaseModel modelWithDictionary:objc[@"data"]];
                                                             NSMutableArray *temparr = self.DataBaseModel.dataModelArr;
                                                             [temparr addObjectsFromArray:modelarr.dataModelArr];
                                                             self.DataBaseModel.dataModelArr = temparr;
                                                             [self.tableview.mj_footer endRefreshing];
                                                             [self.tableview reloadData];

                                                         } fail:^(id error, id requestInfo) {
                                                             
                                                             [self.tableview.mj_footer endRefreshing];
                                                         }];
    }
}

#pragma mark - Third.点击事件
/**
 tag ：
    1 找相似
    2 更多
 */
- (void)clickCellSubViewBtnWith:(NSInteger )tag btn:(UIButton *)btn model:(YBLikeAndRecordModel *)model
{
    if (tag == 1) {
        
    }else if (tag == 2){
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        CGPoint buttonCenter = CGPointMake(btn.bounds.origin.x + btn.frame.size.width/2,
                                           btn.bounds.origin.y + btn.bounds.size.height/2 +ADJUST_PERCENT_FLOAT(8));
        CGPoint btnorigin = [btn convertPoint:buttonCenter toView:window];
        [[YBGoodsDeatilNaviMoreView share] addMoreViewWithOrigin:btnorigin
                                                           Width:ADJUST_PERCENT_FLOAT(81)
                                                          Height:ADJUST_PERCENT_FLOAT(32)
                                                       Direction:WBArrowDirectionUp2
                                                          sourVC:self
                                                         dataArr:@[@"分享"]
                                                        ImageArr:nil
                                                      cellHeight:32
                                                  clickCellBlcok:^(NSInteger row) {
                                                      
                                                      /**
                                                       *  分享
                                                       */
                                                      [[YXShareSDKManager sharedManager] shareGoodWithImageURLString:model.goodsImage
                                                                                                        andGoodNamed:model.goodsName
                                                                                                       andGoodDetail:model.sellerDesc
                                                                                                           andProdId:model.goodsId
                                                                                                        andProdBidId:@""
                                                                                                   andViewController:self];

                                                      
                                                  }];
          [[YBGoodsDeatilNaviMoreView share] popView];
    }
}

#pragma mark - Fourth.代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.DataBaseModel.dataModelArr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YBLikeAndRecordListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LIKEORRECORDCELLINDIFITER];
    if (!cell) {
        cell = [[YBLikeAndRecordListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:LIKEORRECORDCELLINDIFITER];
    }
    cell.DataModel = self.DataBaseModel.dataModelArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.clickCellBlock = ^(NSInteger btntag,UIButton *btn,YBLikeAndRecordModel *model){
        [self clickCellSubViewBtnWith:btntag btn:btn model:model];
    };
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(40);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_vctype == liekVcType) {
        /**
         喜欢
         */
    }else if (_vctype == RecordVcType){
        /**
         足迹
         */
    }
    
    YBLikeAndRecordModel *model = self.DataBaseModel.dataModelArr[indexPath.row];
    YBGoodsDeatilImageViewController *goodsdeatil = [YBGoodsDeatilImageViewController creatGoodsDeatilImageViewControllerWithGoodsId:model.goodsId Extend:nil];
    ZJBaseNavigationController *nav = [[ZJBaseNavigationController alloc]initWithRootViewController:goodsdeatil];
    [self presentViewController:nav animated:YES completion:nil];
    
}

#pragma mark - Fifth.控制器生命周期
/**
 初始化
 */
+ (instancetype) creatLikeAndRecordListViewControllerWith:(LikeOrRecordType)vctype
                                                   extend:(id)extend
{
    YBLikeAndRecordListViewController *viewcontroller = [[YBLikeAndRecordListViewController alloc]init];
    viewcontroller.vctype                             = vctype;
    return viewcontroller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_vctype == liekVcType) {
        self.title = @"我喜欢的";
    }else if (_vctype == RecordVcType) {
        self.title = @"我的足迹";
    }
    [self.view addSubview:self.tableview];
    
    self.tableview.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(LoadListData)];
    self.tableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(LoadListMoreData)];    
    self.tableview.mj_footer.hidden = YES;
    [self setnaviview];
}
#pragma mark - Sixth.界面配置
- (void)setnaviview
{
    ZJBaseBarButtonItem *rightitem = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_DETAIL
                                                                              imageNamed:@"details_more"
                                                                                callBack:^(id sender) {
                                                                                    
                                                                                    [[YBGoodsDeatilNaviMoreView share] addMoreViewWithOrigin:CGPointMake(ADJUST_PERCENT_FLOAT(SCREEN_WIDTH-30),
                                                                                                                                                         ADJUST_PERCENT_FLOAT(65))
                                                                                                                                       Width:ADJUST_PERCENT_FLOAT(115)
                                                                                                                                      Height:ADJUST_PERCENT_FLOAT(40)
                                                                                                                                   Direction:WBArrowDirectionUp3
                                                                                                                                      sourVC:self
                                                                                                                                     dataArr:@[@"联系客服",]
                                                                                                                                    ImageArr:@[@"details_message_kefu_icon"]
                                                                                                                                  cellHeight:40
                                                                                                                              clickCellBlcok:^(NSInteger row) {
                                                                                                                                  
                                                                                                                                  [[MQCustomerServiceManager  share] showCustomerServiceWithViewController:self];
                                                                                                                                  
                                                                                                                              }];
                                                                                    [[YBGoodsDeatilNaviMoreView share] popView];
                                                                                    
                                                                                    
                                                                                }];
    self.navigationItem.rightBarButtonItem = rightitem;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    [self LoadListData];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

/**
 懒加载
 */
-(UITableView *)tableview{
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = ADJUST_PERCENT_FLOAT(105);
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

- (YBBlankpageView *)blankPageView{
    if (!_blankPageView) {
        _blankPageView = [[YBBlankpageView alloc]initWithFrame:self.tableview.bounds];
    }
    return _blankPageView;
}

@end
