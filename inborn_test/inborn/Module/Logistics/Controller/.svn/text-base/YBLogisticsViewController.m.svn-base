//
//  YBLogisticsViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLogisticsViewController.h"
#import "YBLogisticsTableViewCell.h"
#import "YBOrderService.h"
#import "YBLogitcsInforModel.h"
#import "YBStringTool.h"

@interface YBLogisticsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableview;
@property(nonatomic,strong) YBLogitcsInforModel * LogitcsDataModel;
@property(nonatomic,strong) NSString * orderId;
@property(nonatomic,strong) NSString * deliveryNum;
@property(nonatomic,strong) NSString * sourceType;
@end

@implementation YBLogisticsViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

/**
 网络请求
 */
- (void)requestLogictcsInfor
{
    /**
     我的物品 单独的接口
     */
    if([self.sourceType isEqualToString:@"MyGoodsOrder"]){
        
        [[YBOrderService share] GetMyGoodsLogitcsDataWithdepotId:_orderId
                                                         success:^(id objc, id requestInfo) {
            self.LogitcsDataModel = [YBLogitcsInforModel modelWithDictionary:objc[@"data"]];
            [self.tableview reloadData];
        } fail:^(id error, id requestInfo) {
            
        }];
        return;
    }
    
    [[YBOrderService share] getLogisticsDeatilInforWithorderId:_orderId
                                                   deliveryNum:_deliveryNum
                                                       success:^(id objc, id requestInfo) {
                                                           self.LogitcsDataModel = [YBLogitcsInforModel modelWithDictionary:objc[@"data"]];
                                                           [self.tableview reloadData];
                                                       } fail:^(id error, id requestInfo) {
                                                           
                                                       }];
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 1;
    else if (section == 1) return self.LogitcsDataModel.routesModelArr.count+1;
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return ADJUST_PERCENT_FLOAT(68);
    }else{
        if (indexPath.row==0) {
            return ADJUST_PERCENT_FLOAT(46);
        }else{
            YBLogitcsRoutesModle *model = self.LogitcsDataModel.routesModelArr[indexPath.row-1];
            YBLog(@"height:%.2f",model.contentHeight);
            return model.contentHeight;
        }
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        UIView *cellview = [self creatSeactionFirstViewWithModel:self.LogitcsDataModel];
        cellview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(68));
        [cell.contentView addSubview:cellview];
        return cell;
    }else{
        
        YBLogisticsTableViewCell *cell = [YBLogisticsTableViewCell cellwithTableview:tableView indexPath:indexPath dataCount:self.LogitcsDataModel.routesModelArr.count];
        cell.backgroundColor = ZJCOLOR.color_c0;
        if (indexPath.row == self.LogitcsDataModel.routesModelArr.count) {
            cell.line.hidden = YES;
        }
        if (indexPath.row>0) {
            cell.dataRoutsModel = self.LogitcsDataModel.routesModelArr[indexPath.row-1];
        }
        cell.clickPhoneBlock = ^(NSString *phonestr) {
            [YBStringTool CallPhoneWith:self.view phone:phonestr];
        };
        return cell;
    }
}

#pragma mark - Fifth.控制器生命周期
+ (instancetype)creatLogisticsVCwithorderId:(NSString *)orderId
                                deliveryNum:(NSString *)deliveryNum
                                     extend:(id)extend{
    
    YBLogisticsViewController *vc   = [[YBLogisticsViewController alloc]init];
    vc.orderId                      = orderId;
    vc.deliveryNum                  = deliveryNum;
    if (extend)     {
        vc.sourceType = extend;
    }
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"物流信息";
    self.view.backgroundColor = ZJCOLOR.color_c12;
    [self.view addSubview:self.tableview];
    
    [self requestLogictcsInfor];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载
- (UIView *)creatSeactionFirstViewWithModel:(YBLogitcsInforModel *)model
{
    UIView *view = [[UIView alloc]init];
    
    YBDefaultLabel *deliveryTypeLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                                 text:@"test"
                                                            textColor:ZJCOLOR.color_c4];
    [view addSubview:deliveryTypeLable];
    
    YBDefaultLabel *deliveryNumberLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                                   text:@"testnumber"
                                                              textColor:ZJCOLOR.color_c4];
    [view addSubview:deliveryNumberLable];
    
    deliveryTypeLable.text = [NSString stringWithFormat:@"%@快递",model.expComName];
    deliveryNumberLable.text = [NSString stringWithFormat:@"运单号码：%@",model.expressNum];
    [deliveryTypeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.top.mas_equalTo(view.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
    }];
    
    [deliveryNumberLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.top.mas_equalTo(deliveryTypeLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(8));
        make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(20));
    }];
    return view;
}

- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-10) style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

@end
