//
//  YBRefundApplyViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/6.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBApplyRefundViewController.h"
#import "YXApplyRefundHeaderView.h"
#import "YBAlearlyCommitApplyRefundViewController.h"
#import "YBAlearlyCommitApplyRefundViewController.h"
#import "YBOrderService.h"
#import "YBRefundDeatilViewController.h"
#import "YBRefundModel.h"
#import "YBComposeService.h"

@interface YBApplyRefundViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) YXApplyRefundHeaderView * applyrefundView;
@property(nonatomic,strong) UITableView * tableview;

@property(nonatomic,strong) NSString * orderId;
@property(nonatomic,strong) NSString * refundAmount;
@property(nonatomic,strong) YBRefundModel * refundmodle;

/**
 申请担保金退费
 */
@property (nonatomic, copy) NSString *goodsId;

@end

@implementation YBApplyRefundViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

+ (instancetype)creatApplyRefundViewControllerWithrefundAmount:(NSString *)refundAmount
                                                       orderId:(NSString *)orderId
                                                        extend:(id)extend
{
    YBApplyRefundViewController *viewcontroller = [[YBApplyRefundViewController alloc]init];
    viewcontroller.refundAmount                 = refundAmount;
    viewcontroller.orderId                      = orderId;
    if (extend
        && [extend isKindOfClass:[NSString class]]) {
        viewcontroller.goodsId = (NSString *)extend;
    }
    return viewcontroller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"退款申请";
    self.view.backgroundColor= ZJCOLOR.color_c12;
    
    [self.view addSubview:self.tableview];
    self.tableview.tableHeaderView = self.applyrefundView;
    self.applyrefundView.refundAmount = self.refundAmount;
    
    WEAKSELF(self);
    self.applyrefundView.clickBlock = ^(){
        [weakself commitData];
    };
}

/**
 提交数据
 */
- (void)commitData
{
//    YBAlearlyCommitApplyRefundViewController *alearlycommitvc= [YBAlearlyCommitApplyRefundViewController creatAlearlyCommitApplyRefundVCwith:self.refundmodle];
//    [self.navigationController pushViewController:alearlycommitvc animated:YES];
//
    if (self.goodsId) {
        
        [[YBComposeService share] refundDepositWithGoodsId:self.goodsId success:^(id objc, id requestInfo) {
            
            if (self.callBackBlock) {
                self.callBackBlock(nil);
            }
            
            self.refundmodle = [YBRefundModel modelWithDictionary:objc[@"data"]];
            YBAlearlyCommitApplyRefundViewController *alearlycommitvc= [YBAlearlyCommitApplyRefundViewController creatAlearlyCommitApplyRefundVCwith:self.refundmodle];
            [self.navigationController pushViewController:alearlycommitvc animated:YES];
            
        } fail:^(id error, id requestInfo) {
            YBLog(@"%@\n%@", error, requestInfo);
        }];
        
    }else{
        [[YBOrderService share] applyRefundRequestWithorderId:_orderId
                                                      success:^(id objc, id requestInfo) {
                                                          self.refundmodle = [YBRefundModel modelWithDictionary:objc[@"data"]];
                                                          
                                                          YBAlearlyCommitApplyRefundViewController *alearlycommitvc= [YBAlearlyCommitApplyRefundViewController creatAlearlyCommitApplyRefundVCwith:self.refundmodle];
                                                          [self.navigationController pushViewController:alearlycommitvc animated:YES];
                                                          
                                                      } fail:^(id error, id requestInfo) {
                                                          
                                                      }];
    }
}


#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载
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
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor  = ZJCOLOR.color_c16;
        _tableview.tableFooterView= [[UIView  alloc]init];
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.scrollEnabled = NO;
    }
    return  _tableview;
}
/**
 懒加载
 */
-(YXApplyRefundHeaderView *)applyrefundView
{
    if (!_applyrefundView) {
        _applyrefundView = [YXApplyRefundHeaderView loadheaderview];
        _applyrefundView.frame = self.view.bounds;
        _applyrefundView.backgroundColor = ZJCOLOR.color_c12;
    }
    return  _applyrefundView;
}

@end
