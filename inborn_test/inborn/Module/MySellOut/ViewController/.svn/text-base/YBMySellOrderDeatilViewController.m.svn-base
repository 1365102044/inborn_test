//
//  YBMySellOrderDeatilViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMySellOrderDeatilViewController.h"
#import "YBMySellOutStatusViewTableViewCell.h"
#import "YBMySellOutService.h"
#import "YBOrderDetailStepHeaderView.h"
//#import "YBOrderDetailCell.h"
#import "YBMySelloutGoodsInforCell.h"

#import "YBSellOutDeatilPriceViewTableViewCell.h"
#import "YBSelloutDeatilTimeTableViewCell.h"
#import "YBMySellOutModel.h"
#import "MQCustomerServiceManager.h"
#import "YBLogisticsViewController.h"
#import "YBCommitLogitcsViewController.h"
#import "YBTimerManager.h"
/**
  上面状态的cell
 */
static NSString *MYSELLOUTORDERTOPSTATUSCELLINDIFTER = @"MYSELLOUTORDERTOPSTATUSCELLINDIFTER";
/**
 价格试图的cell
 */
static NSString *MYSELLOUTORDERDATAILPRICECELLINDIFITER = @"MYSELLOUTORDERDATAILPRICECELLINDIFITER";
/**
 订单号下面的时间cell
 */
static NSString *MYSELLOURDATAILTIMEINDIFITER = @"MYSELLOURDATAILTIMEINDIFITER";
/**
 商品信息
 */
static NSString *MYSELLOUTGOODSINFORCELLINDIFITER = @"MYSELLOUTGOODSINFORCELLINDIFITER";

@interface YBMySellOrderDeatilViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong) YBMySellOutModel * dataModel;
@property(nonatomic,strong) NSString * orderId;

@property(nonatomic,strong) YBDefaultButton * BoomViewleftBtn;
@property(nonatomic,strong) YBDefaultButton * BoomViewrightBtn;
@end

@implementation YBMySellOrderDeatilViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
/**
 点击底部视图上的btn
 */
- (void)clickBtn:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"联系客服"]) {
        [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
    }else if ([sender.titleLabel.text isEqualToString:@"提供单号"]){
        [self.navigationController pushViewController:[YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:SendAppraisalType
                                                                                                          appraisalId:self.dataModel.appraisalId
                                                                                                               extend:nil]
                                             animated:YES];
    }else if ([sender.titleLabel.text isEqualToString:@"发货"]){
        YBCommitLogitcsViewController *delivervc = [YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:DeliverGoodsType appraisalId:self.dataModel.orderId extend:nil];
        delivervc.refreshOrderDeatilBlck = ^{
            [self requestInfor];
        };
        [self.navigationController pushViewController:delivervc animated:YES];
    }else if ([sender.titleLabel.text isEqualToString:@"查看物流"]){
        if (self.dataModel.deliveryNum) {
            [self.navigationController pushViewController:[YBLogisticsViewController creatLogisticsVCwithorderId:self.dataModel.orderId
                                                                                                     deliveryNum:self.dataModel.deliveryNum
                                                                                                          extend:nil]
                                                 animated:YES];
        }
    }else if ([sender.titleLabel.text isEqualToString:@"申请退回"]){
        YBCommitLogitcsViewController *commotlogitcsVC = [YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:ApplyReturnType
                                                                                                             appraisalId:self.dataModel.goodsId
                                                                                                                  extend:nil];
        [self.navigationController pushViewController:commotlogitcsVC animated:YES];
    }
}

#pragma mark  *** 网络请求
-  (void)requestInfor
{
    [[YBMySellOutService share] GetMySellOutDeatilInforWithorderId:_orderId
                                                           success:^(id objc, id requestInfo) {
                                                             
                                                               self.dataModel = [YBMySellOutModel modelWithDictionary:objc[@"data"]];
                                                               [self addBoomView];
                                                               [self.tableView reloadData];
                                                           } fail:^(id error, id requestInfo) {
                                                               
                                                           }];
}

#pragma mark - Fourth.代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) return 1;
    else if(section == 1) return 3;
    else if (section == 2) return self.dataModel.timeArr.count ? self.dataModel.timeArr.count + 1 : 1;
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0 ) return self.dataModel.topStatusViewHeight ? self.dataModel.topStatusViewHeight : ADJUST_PERCENT_FLOAT(186);
    if (indexPath.section == 1) {
        if (indexPath.row == 0) return ADJUST_PERCENT_FLOAT(46);
        if (indexPath.row == 1) return  ADJUST_PERCENT_FLOAT(101);
        if (indexPath.row == 2) return ADJUST_PERCENT_FLOAT(152);
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) return ADJUST_PERCENT_FLOAT(46);
        else return ADJUST_PERCENT_FLOAT(30);
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        YBMySellOutStatusViewTableViewCell *cell = [[YBMySellOutStatusViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MYSELLOUTORDERTOPSTATUSCELLINDIFTER];
        cell.dataModel  = self.dataModel;
        cell.refreshDataBlck = ^{
            [self requestInfor];
        };
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            UIView *rowone = [self creatROWoneview];
            rowone.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(46));
            [cell.contentView addSubview:rowone];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if (indexPath.row == 1){
            YBMySelloutGoodsInforCell *goodsinforcell = [[YBMySelloutGoodsInforCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MYSELLOUTGOODSINFORCELLINDIFITER];
            goodsinforcell.sellOutdataModle = self.dataModel;
            return goodsinforcell;
        }else if (indexPath.row == 2){
            YBSellOutDeatilPriceViewTableViewCell *priceCell = [[YBSellOutDeatilPriceViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MYSELLOUTORDERDATAILPRICECELLINDIFITER"];
            priceCell.dataModel = self.dataModel;
            priceCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return priceCell;
        } else{
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            return cell;
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellseationtwo"];
            UIView *delivernumview = [self ceartorderDeliverNumview];
            delivernumview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(46));
            [cell.contentView addSubview:delivernumview];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            YBSelloutDeatilTimeTableViewCell *cell = [[YBSelloutDeatilTimeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MYSELLOURDATAILTIMEINDIFITER];
            cell.desc = self.dataModel.timeArr[indexPath.row - 1];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
/**
  商品cellone
 */
- (UIView *)creatROWoneview
{
    UIView *rowoneview = [[UIView alloc]init];
    YBDefaultLabel *lable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                     text:ZJSTRING(@"1件商品")
                                                textColor:ZJCOLOR.color_c4];
    lable.text = [NSString stringWithFormat:@"%ld件商品",self.dataModel.goodsNum];
    [rowoneview addSubview:lable];
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = ZJCOLOR.color_c16;
    [rowoneview addSubview:line];
    lable.frame = CGRectMake(ADJUST_PERCENT_FLOAT(12), 0, ADJUST_PERCENT_FLOAT(100), ADJUST_PERCENT_FLOAT(45));
      line.frame = CGRectMake(ADJUST_PERCENT_FLOAT(12), lable.bottom, SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12), 0.5);
    return rowoneview;
}
/**
 订单编号
 */
- (UIView *)ceartorderDeliverNumview
{
    UIView *rowoneview = [[UIView alloc]init];
    YBDefaultLabel *leftlable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                     text:ZJSTRING(@"订单编号")
                                                textColor:ZJCOLOR.color_c4];
    leftlable.textAlignment = NSTextAlignmentLeft;
    [rowoneview addSubview:leftlable];
    YBDefaultLabel *rightlable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                     text:ZJSTRING(@"")
                                                textColor:ZJCOLOR.color_c4];
    rightlable.textAlignment = NSTextAlignmentRight;
    [rowoneview addSubview:rightlable];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = ZJCOLOR.color_c16;
    [rowoneview addSubview:line];
    
    leftlable.frame = CGRectMake(ADJUST_PERCENT_FLOAT(12), 0, ADJUST_PERCENT_FLOAT(100), ADJUST_PERCENT_FLOAT(45));
    rightlable.frame = CGRectMake(leftlable.right , 0, SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(120), ADJUST_PERCENT_FLOAT(45));
    rightlable.text = self.dataModel.orderId;
    line.frame = CGRectMake(ADJUST_PERCENT_FLOAT(12), leftlable.bottom, SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12), 0.5);
    return rowoneview;
}
#pragma mark - Fifth.控制器生命周期

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[YBTimerManager shareTimer] stopTimer];
}

+ (instancetype)creatMysellOutOrderDeatilWithOrderId:(NSString *)orderId
                                              extend:(id)extend
{
    YBMySellOrderDeatilViewController *viewcontroller = [[YBMySellOrderDeatilViewController alloc]init];
    viewcontroller.orderId                              = orderId;
    return viewcontroller;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self requestInfor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    self.view.backgroundColor = ZJCOLOR.color_c12;
    [self.view addSubview:self.tableView];
}

- (void)addBoomView
{
    UIView *boomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.height - 44, SCREEN_WIDTH, 44)];
    boomView.backgroundColor = ZJCOLOR.color_c0;
    [self.view addSubview:boomView];
    self.BoomViewleftBtn.hidden = YES;
    [boomView addSubview:self.BoomViewrightBtn];
    [self.BoomViewrightBtn setTitle:ZJSTRING(self.dataModel.BoomviewBtnArr[0]) forState:UIControlStateNormal];
    [self.BoomViewrightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(boomView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(84), ADJUST_PERCENT_FLOAT(28)));
        make.centerY.mas_equalTo(boomView.mas_centerY);
    }];

    if (self.dataModel.BoomviewBtnArr.count>1) {
        self.BoomViewleftBtn.hidden = NO;
        [boomView addSubview:self.BoomViewleftBtn];
        [self.BoomViewrightBtn setTitle:ZJSTRING(self.dataModel.BoomviewBtnArr[1]) forState:UIControlStateNormal];
        [self.BoomViewleftBtn setTitle:ZJSTRING(self.dataModel.BoomviewBtnArr[0]) forState:UIControlStateNormal];
        [self.BoomViewleftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_BoomViewrightBtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(84), ADJUST_PERCENT_FLOAT(28)));
            make.centerY.mas_equalTo(boomView.mas_centerY);
        }];
    }
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 44 - 20) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = ZJCOLOR.color_c12;
    }
    return _tableView;
}

- (YBDefaultButton *)BoomViewleftBtn {
    if (!_BoomViewleftBtn) {
        _BoomViewleftBtn = [YBDefaultButton buttonWithTitleStringKey:ZJSTRING(@"")
                                                          titleColor:ZJCOLOR.color_c4
                                                           titleFont:SYSTEM_REGULARFONT(14)
                                                              target:self
                                                            selector:@selector(clickBtn:)];
        _BoomViewleftBtn.layer.masksToBounds = YES;
        _BoomViewleftBtn.layer.cornerRadius = 14;
        _BoomViewleftBtn.layer.borderWidth = 1;
        _BoomViewleftBtn.layer.borderColor = ZJCOLOR.color_c5.CGColor;
    }
    return _BoomViewleftBtn;
}
- (YBDefaultButton *)BoomViewrightBtn {
    if (!_BoomViewrightBtn) {
        _BoomViewrightBtn = [YBDefaultButton buttonWithTitleStringKey:ZJSTRING(@"联系客服")
                                                          titleColor:ZJCOLOR.color_c6
                                                           titleFont:SYSTEM_REGULARFONT(14)
                                                              target:self
                                                            selector:@selector(clickBtn:)];
        _BoomViewrightBtn.layer.masksToBounds = YES;
        _BoomViewrightBtn.layer.cornerRadius = 14;
        _BoomViewrightBtn.layer.borderWidth = 1;
        _BoomViewrightBtn.layer.borderColor = ZJCOLOR.color_c6.CGColor;
    }
    return _BoomViewrightBtn;
}
@end
