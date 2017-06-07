//
//  YBOrderListViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderListViewController.h"
#import "JXSegment.h"
#import "YBOrderListTableViewCell.h"
#import "YBOrderService.h"
#import "YBPageListBaseModel.h"
#import "YBOrderModel.h"
#import "YBOrderDetailTableViewController.h"
#import "YBGoodsDeatilNaviMoreView.h"
#import "YBLogisticsViewController.h"
#import "YBApplyRefundViewController.h"
#import "YBPaymentController.h"
#import "YBGoodsDeatilImageViewController.h"
#import "MQCustomerServiceManager.h"
#import "JXTAlertManagerHeader.h"
#import "YBTopAlert.h"
#import "YBTimerManager.h"
#import "YBBlankpageView.h"
#import "ZJBaseNavigationController.h"
#import "YBAppraisalService.h"
#import "YBCommitLogitcsViewController.h"
#import "YBAppraisalLogitcsDeatilViewController.h"
#import "YBMySellOrderDeatilViewController.h"
#import "YBAppraisalReportViewController.h"
#import "YBRefundDeatilViewController.h"
#import "YBPaymentResultController.h"
#import "ZJBaseBarButtonItem.h"

static NSString *MYORDERLISTCELLINDIFITER = @"MYORDERLISTCELLINDIFITER";
static NSInteger MAXPAGE = 8;
@interface YBOrderListViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,JXSegmentDelegate>
@property(nonatomic,strong) UIScrollView * MyScrollView;
@property(nonatomic,strong) UITableView * tableview;
@property (nonatomic, strong) JXSegment *segment;
@property(nonatomic,strong) NSArray * topBarDataArr;
@property(nonatomic,strong) NSArray * dataListArr;
/**
 当前控制器的类型
 */
@property(nonatomic,assign) OrderListVcType  OrderListVcType;

/**
 列表的tag
 */
@property(nonatomic,assign) CGFloat   StartScrollOfferX;
@property(nonatomic,assign) CGFloat   EndScrollOfferX;
/**
 当前列表的tag
 */
@property(nonatomic,assign) NSInteger  cuttentListIndex;
@property(nonatomic,assign) NSInteger  currenPage;
@property(nonatomic,assign) NSInteger  tolalPage;
@property(nonatomic,strong) YBPageListBaseModel * listBaseModel;
@property(nonatomic,strong) NSMutableArray * dataModelArr;

@property(nonatomic,strong) YBBlankpageView * blankPageView;
@end

@implementation YBOrderListViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

/**
 tag:11 更多
 10  按钮
 */
- (void)clickCellSubviewBtnWithTag:(NSInteger )tag btnTitle:(NSString *)btnStr dataModel:(YBOrderModel *)dataModel btn:(UIButton *)btn
{
    if(tag == 11){
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        CGPoint buttonCenter = CGPointMake(btn.bounds.origin.x + btn.frame.size.width/2,
                                           btn.bounds.origin.y + btn.bounds.size.height/2 +ADJUST_PERCENT_FLOAT(8));
        CGPoint btnorigin = [btn convertPoint:buttonCenter toView:window];
        
        [[YBGoodsDeatilNaviMoreView share] addMoreViewWithOrigin:btnorigin
                                                           Width:ADJUST_PERCENT_FLOAT(81)
                                                          Height:(dataModel.listMoreArr.count*ADJUST_PERCENT_FLOAT(32))
                                                       Direction:WBArrowDirectionUp2
                                                          sourVC:self
                                                         dataArr:dataModel.listMoreArr
                                                        ImageArr:nil
                                                      cellHeight:ADJUST_PERCENT_FLOAT(32)
                                                  clickCellBlcok:^(NSInteger row) {
                                                      
                                                      [[YBGoodsDeatilNaviMoreView share] dismiss];
                                                      
                                                      NSString *cellstr = dataModel.listMoreArr[row];
                                                      if ([cellstr isEqualToString:@"取消"]) {
                                                          [self alearcancleorderviewdataModel:dataModel];
                                                      }else if ([cellstr isEqualToString:@"联系客服"]){
                                                          [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
                                                      }else if ([cellstr isEqualToString:@"申请退回"]){
                                                          YBCommitLogitcsViewController *commotlogitcsVC = [YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:ApplyReturnType
                                                                                                                                                               appraisalId:dataModel.goodsId
                                                                                                                                                                    extend:nil];
                                                          [self.navigationController pushViewController:commotlogitcsVC animated:YES];
                                                          
                                                      }
                                                      
                                                  }];
        [[YBGoodsDeatilNaviMoreView share] popView];
        
    }else if (tag == 10){
        
        if (_OrderListVcType == MyBuyOrderType) [self clickMyBuyOrderMoreBtnwithStr:btnStr dataModel:dataModel];
        else if (_OrderListVcType == AppraisalOrderType) [self clickAppraisalOrderMoreBtnwithStr:btnStr dataModel:dataModel];
        else if (_OrderListVcType == MySellOutOrderType) [self clickMySellOutMoreBtnwitStr:btnStr dataModel:dataModel];
        else if (_OrderListVcType == MyGoodsOrderType) [self clickMyGoodsMoreBtnwitStr:btnStr dataModel:dataModel];
    }
}

/**
 点击我买到的订单列表上btn
 */
- (void)clickMyBuyOrderMoreBtnwithStr:(NSString *)btnStr dataModel:(YBOrderModel *)dataModel
{
    if ([btnStr isEqualToString:@"去付款"]) {
        YBPaymentController *gotopay = [YBPaymentController paymentControllerWithOrderId:dataModel.orderId paymentMethod:dataModel.paymentType paymentEventType:ZJProjectPaymentEventOrder extend:nil];
        [self.navigationController pushViewController:gotopay animated:YES];
    }else if ([btnStr isEqualToString:@"继续付款"]){
        
        if ([self currentPaymentMethodOrderModel:dataModel] == ZJProjectPaymentMethodDeposit) {
            
            [self jxt_showActionSheetWithTitle:ZJSTRING(@"分笔余款支付方式选择")
                                       message:nil
                             appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                                 
                                 alertMaker.
                                 addActionDefaultTitle(ZJSTRING(@"全额支付")).
                                 addActionDefaultTitle(ZJSTRING(@"分笔支付")).
                                 addActionCancelTitle(ZJSTRING(@"取消"));
                                 alertMaker.view.tintColor = ZJCOLOR.color_c4;
                                 
                             } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                                 
                                 YBPaymentController *paymentController;
                                 
                                 if (buttonIndex == 0) {
                                     
                                     paymentController = [YBPaymentController paymentControllerWithOrderId:dataModel.orderId
                                                                                             paymentMethod:ZJProjectPaymentMethodDepositBalance_All
                                                                                          paymentEventType:ZJProjectPaymentEventOrder
                                                                                                    extend:nil];
                                     
                                 }else if (buttonIndex == 1) {
                                     
                                     paymentController = [YBPaymentController paymentControllerWithOrderId:dataModel.orderId
                                                                                             paymentMethod:ZJProjectPaymentMethodDepositBalance_part
                                                                                          paymentEventType:ZJProjectPaymentEventOrder
                                                                                                    extend:nil];
                                     
                                 }else if (buttonIndex == 2) {
                                     return;
                                 }
                                 [self.navigationController pushViewController:paymentController animated:YES];
                                 
                             }];
            
        }else{
            
            YBPaymentController *paymentController = [YBPaymentController paymentControllerWithOrderId:dataModel.orderId
                                                                                         paymentMethod:[self currentPaymentMethodOrderModel:dataModel]
                                                                                      paymentEventType:ZJProjectPaymentEventOrder
                                                                                                extend:nil];
            [self.navigationController pushViewController:paymentController animated:YES];
            
        }
        
    }else if ([btnStr isEqualToString:@"提醒发货"]){
        [self AlearFahuoview:@"提醒发货成功"];
    }else if ([btnStr isEqualToString:@"查看物流"]){
        if (dataModel.deliveryNum) {
            YBLogisticsViewController *wuliuVC = [YBLogisticsViewController creatLogisticsVCwithorderId:dataModel.orderId deliveryNum:dataModel.deliveryNum extend:nil];
            [self.navigationController pushViewController:wuliuVC animated:YES];
        }
    }else if ([btnStr isEqualToString:@"确认收货"]){
        [self requestConfirmReceiptGoodsWithorderId:dataModel.orderId];
    }else if ([btnStr isEqualToString:@"晒单"]){
        
    }else if ([btnStr isEqualToString:@"再次购买"]){
        
        YBGoodsDeatilImageViewController *goodsdeatil = [YBGoodsDeatilImageViewController creatGoodsDeatilImageViewControllerWithGoodsId:dataModel.goodsId Extend:nil];
        ZJBaseNavigationController *nav = [[ZJBaseNavigationController alloc]initWithRootViewController:goodsdeatil];
        [self presentViewController:nav animated:YES completion:nil];
        
    }else if ([btnStr isEqualToString:@"申请退款"]){
        YBApplyRefundViewController *refundVC = [YBApplyRefundViewController creatApplyRefundViewControllerWithrefundAmount:dataModel.refundAmount
                                                                                                                    orderId:dataModel.orderId
                                                                                                                     extend:nil];
        [self.navigationController pushViewController:refundVC animated:YES];
    }else if ([btnStr isEqualToString:@"联系客服"]){
        
        [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
        
    }else if ([btnStr isEqualToString:@"退款详情"]){
        [self.navigationController pushViewController:[YBRefundDeatilViewController creatRefundDeatilVCwithorderId:dataModel.orderId
                                                                                                            extend:nil]
                                             animated:YES];
    }
}

/**
 点击 鉴定订单上的btn
 */
- (void)clickAppraisalOrderMoreBtnwithStr:(NSString *)btnstr dataModel:(YBOrderModel *)dataModel{
    if ([btnstr isEqualToString:@"提交物流"]) {
        YBCommitLogitcsViewController *commotlogitcsVC = [YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:CommitLogitcsType
                                                                                                             appraisalId:dataModel.customId
                                                                                                                  extend:nil];
        [self.navigationController pushViewController:commotlogitcsVC animated:YES];
        
    }
    else if ([btnstr isEqualToString:@"查看物流"]){
        [self.navigationController pushViewController:[YBAppraisalLogitcsDeatilViewController creatAppraisalLogitcsDeatilWithpostid:dataModel.reqExpressNum
                                                                                                                               type:dataModel.expComId
                                                                                                                             extend:nil]
                                             animated:YES];
    }else if ([btnstr isEqualToString:@"查看鉴定"]){
        [self.navigationController pushViewController:[YBAppraisalReportViewController creatAppraisalReportWithappraisalId:dataModel.customId
                                                                                                                    extend:nil]
                                             animated:YES];
    }else if ([btnstr isEqualToString:@"联系客服"]){
        
        [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
    }
}

/**
 点击我卖出的订单列表上的btn
 */
- (void)clickMySellOutMoreBtnwitStr:(NSString *)btnStr dataModel:(YBOrderModel *)dataModel
{
    if ([btnStr isEqualToString:@"联系客服"]) {
        [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
    }else if([btnStr isEqualToString:@"送鉴"]){
        [self.navigationController pushViewController:[YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:SendAppraisalType
                                                                                                          appraisalId:dataModel.appraisalId
                                                                                                               extend:nil]
                                             animated:YES];
        
    }else if ([btnStr isEqualToString:@"申请退回"]){
        YBCommitLogitcsViewController *commotlogitcsVC = [YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:ApplyReturnType
                                                                                                             appraisalId:dataModel.goodsId
                                                                                                                  extend:nil];
        [self.navigationController pushViewController:commotlogitcsVC animated:YES];
    }else if ([btnStr isEqualToString:@"发货"]){
        YBCommitLogitcsViewController *commotlogitcsVC = [YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:DeliverGoodsType
                                                                                                             appraisalId:dataModel.orderId
                                                                                                                  extend:nil];
        [self.navigationController pushViewController:commotlogitcsVC animated:YES];
    }else if ([btnStr isEqualToString:@"查看物流"]){
        if (dataModel.deliveryNum) {
            YBLogisticsViewController *wuliuVC = [YBLogisticsViewController creatLogisticsVCwithorderId:dataModel.orderId
                                                                                            deliveryNum:dataModel.deliveryNum
                                                                                                 extend:nil];
            [self.navigationController pushViewController:wuliuVC animated:YES];
        }
    }
}

/**
 点击我的物品的订单列表上的btn
 */
- (void)clickMyGoodsMoreBtnwitStr:(NSString *)btnStr dataModel:(YBOrderModel *)dataModel
{
    if ([btnStr isEqualToString:@"联系客服"]) {
        
        [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
        
    }else if([btnStr isEqualToString:@"查看物流"]){
        if (dataModel.showStatus == 6 ||
            dataModel.showStatus == 7) {
            [self AlearFahuoview:@"自提商品暂无物流信息，如有疑问请联系客服"];
            return;
        }
        YBLogisticsViewController *wuliuVC = [YBLogisticsViewController creatLogisticsVCwithorderId:dataModel.customId deliveryNum:nil extend:@"MyGoodsOrder"];
        [self.navigationController pushViewController:wuliuVC animated:YES];
    }else if ([btnStr isEqualToString:@"申请退回"]){
        YBCommitLogitcsViewController *commotlogitcsVC = [YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:ApplyReturnType
                                                                                                             appraisalId:dataModel.goodsId
                                                                                                                  extend:nil];
        [self.navigationController pushViewController:commotlogitcsVC animated:YES];
    }
}

- (ZJProjectPaymentMethod)currentPaymentMethodOrderModel:(YBOrderModel *)orderModel
{
    if (orderModel.orderPayType == 1) {
        return ZJProjectPaymentMethodAll;
    }else if (orderModel.orderPayType == 2) {
        return ZJProjectPaymentMethodDeposit;
    }else if (orderModel.orderPayType == 3) {
        return ZJProjectPaymentMethodPen;
    }
    return 0;
}

- (void)alearcancleorderviewdataModel:(YBOrderModel *)dataModel
{
    /**
     *  弹窗
     */
    [self jxt_showActionSheetWithTitle:nil
                               message:nil
                     appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                         
                         alertMaker.addActionCancelTitle(ZJSTRING(@"取消"));
                         alertMaker.addActionDefaultTitle(ZJSTRING(@"我不想要了"));
                         alertMaker.addActionDefaultTitle(ZJSTRING(@"支付遇到问题，无法支付"));
                         alertMaker.addActionDefaultTitle(ZJSTRING(@"其他原因"));
                         [alertMaker setAlertDidShown:^{
                             
                         }];
                         alertMaker.alertDidDismiss = ^{
                             
                         };
                         alertMaker.view.tintColor = ZJCOLOR.color_c4;
                     } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                         
                         if (buttonIndex == 0) {
                             
                             /**
                              *  取消
                              */
                             
                         } else if (buttonIndex == 1) {
                             
                             [self cancleOrder:dataModel.orderId reason:@"我不想要了"];
                         }else if (buttonIndex == 2){
                             [self cancleOrder:dataModel.orderId reason:@"支付遇到问题，无法支付"];
                         }else if (buttonIndex == 3){
                             [self cancleOrder:dataModel.orderId reason:@"其他原因"];
                         }
                         
                     }];
    
    
}

/**
 取消订单
 */
- (void)cancleOrder:(NSString *)orderId reason:(NSString *)reason
{
    [[YBOrderService share] cancelOrderWithOrderId:orderId
                                            reason:reason
                                           success:^(id objc, id requestInfo) {
                                               /**
                                                *  退回订单成功
                                                */
                                               [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"恭喜你") tipsStringKey:ZJSTRING(@"订单取消成功") type:YBTopAlertSuccess eventCallBackBlock:^(id sender) {
                                                   
                                               }];
                                               [self RequestNewListData];
                                           } fail:^(id error, id requestInfo) {
                                               
                                           }];
}

/**
 确认收货请求
 */
- (void)requestConfirmReceiptGoodsWithorderId:(NSString *)orderId
{
    [[YBOrderService share] confirmReceiptGoodsWithorderId:orderId
                                                   success:^(id objc, id requestInfo) {
                                                       [self RequestNewListData];
                                                   } fail:^(id error, id requestInfo) {
                                                   }];
}

/**
 提醒发货
 */
-(void)AlearFahuoview:(NSString *)tips
{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"" message:tips preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertC addAction:action2];
    //显示
    [self presentViewController:alertC animated:YES completion:nil];
}

#pragma mark  *** 网络请求
-(void)RequestNewListData
{
    [self.tableview.mj_header endRefreshing];
    //**把当前的tag值对应的tableview 设置成全局对象**/
    for (UITableView *mytableviews in self.MyScrollView.subviews) {
        if ([mytableviews isKindOfClass:[UITableView class]]) {
            if (mytableviews.tag == _cuttentListIndex) {
                self.tableview = mytableviews;
            }
        }
    }
    _currenPage = 1;
    //    [self.dataModelArr removeAllObjects];
    [[YBOrderService share] getOrderListInforWithcurPage:_currenPage
                                                pageSize:MAXPAGE
                                                listType:_cuttentListIndex
                                         orderListVcType:_OrderListVcType
                                                 success:^(id objc, id requestInfo) {
                                                     self.tableview.mj_footer.hidden = NO;
                                                     
                                                     self.listBaseModel = [YBPageListBaseModel modelWithDictionary:objc[@"data"]];
                                                     [self handleJsonToModelWith:objc];
                                                     if (self.listBaseModel.totalRows ==0 || !self.listBaseModel.totalRows) {
                                                         
                                                         [self.tableview addSubview:[self addblankpage]];
                                                         
                                                         self.tableview.mj_footer.hidden = YES;
                                                     }else{
                                                         self.tableview.mj_footer.hidden = NO;
                                                         
                                                         for (YBBlankpageView *view in self.tableview.subviews) {
                                                             
                                                             if (view.tag == self.tableview.tag+100) {
                                                                 [view removeFromSuperview];
                                                             }
                                                         }
                                                     }
                                                     
                                                     if (self.listBaseModel.totalRows <= MAXPAGE) {
                                                         self.tableview.mj_footer.hidden = YES;
                                                     }else{
                                                         self.tableview.mj_footer.hidden = NO;
                                                         [self.tableview.mj_footer resetNoMoreData];
                                                     }
                                                     
                                                 } fail:^(id error, id requestInfo) {
                                                     [self.tableview.mj_header endRefreshing];
                                                     self.tableview.mj_footer.hidden = YES;
                                                 }];
}

/**
 加载更多
 */
- (void)requestMoreListData
{
    [self.tableview.mj_header endRefreshing];
    //**把当前的tag值对应的tableview 设置成全局对象**/
    for (UITableView *mytableviews in self.MyScrollView.subviews) {
        if ([mytableviews isKindOfClass:[UITableView class]]) {
            if (mytableviews.tag == _cuttentListIndex) {
                self.tableview = mytableviews;
            }
        }
    }
    
    if(_listBaseModel.totalRows%MAXPAGE==0)
    {
        _tolalPage = _listBaseModel.totalRows/MAXPAGE;
    }else{
        _tolalPage = _listBaseModel.totalRows/MAXPAGE+1;
    }
    if (_currenPage + 1 >_tolalPage) {
        
        [self.tableview.mj_footer endRefreshing];
        [self.tableview.mj_footer endRefreshingWithNoMoreData];
        return;
    }else{
        [self.tableview.mj_footer resetNoMoreData];
    }
    _currenPage ++;
    [[YBOrderService share] getOrderListInforWithcurPage:_currenPage
                                                pageSize:MAXPAGE
                                                listType:_cuttentListIndex
                                         orderListVcType:_OrderListVcType
                                                 success:^(id objc, id requestInfo) {
                                                     self.listBaseModel = [YBPageListBaseModel modelWithDictionary:objc[@"data"]];
                                                     [self handleJsonToModelWith:objc];
                                                     
                                                 } fail:^(id error, id requestInfo) {
                                                     [self.tableview.mj_footer endRefreshing];
                                                 }];
}

/**
 数据转模型处理
 */
- (void)handleJsonToModelWith:(id)objc
{
    NSMutableArray *tempArr = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in _listBaseModel.data) {
        YBOrderModel *ordermodel = [YBOrderModel modelWithDictionary:dic];
        ordermodel.OrderListVCType = _OrderListVcType;
        [tempArr addObject:ordermodel];
    }
    if (_currenPage > 1) {
        NSMutableArray *arr = [NSMutableArray array];
        arr = self.dataModelArr;
        [arr addObjectsFromArray:tempArr];
        self.dataModelArr = arr;
    }else{
        self.dataModelArr = [NSMutableArray array];
        self.dataModelArr = tempArr;
    }
    [self.tableview reloadData];
    [self.tableview.mj_footer endRefreshing];
    [self.tableview.mj_header endRefreshing];
}

#pragma mark - Fourth.代理方法
#pragma mark  *** tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(70);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataModelArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBOrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MYORDERLISTCELLINDIFITER];
    if (!cell) {
        cell = [[YBOrderListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MYORDERLISTCELLINDIFITER];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    WEAKSELF(self);
    if (self.dataModelArr.count) {
        [cell setDataModel:self.dataModelArr[indexPath.row]
             OrderListType:_OrderListVcType
         clickCellBtnBlock:^(NSInteger tag, NSString *btnStr,YBOrderModel *datamodel,UIButton *btn) {
             [weakself clickCellSubviewBtnWithTag:tag btnTitle:btnStr dataModel:datamodel btn:btn];
         }];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBOrderModel *orderModel;
    @try {
        orderModel = self.dataModelArr[indexPath.row];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    if (_OrderListVcType == MyBuyOrderType) {
        
        YBOrderDetailTableViewController *orderDetailController = [YBOrderDetailTableViewController orderDetailTableViewControllerWithOrderId:orderModel.orderId extend:nil];
        [self.navigationController pushViewController:orderDetailController animated:YES];
    }else if (_OrderListVcType == MySellOutOrderType){
        
        [self.navigationController pushViewController:[YBMySellOrderDeatilViewController creatMysellOutOrderDeatilWithOrderId:orderModel.orderId
                                                                                                                       extend:nil]
                                             animated:YES];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 173;
}

#pragma mark - JXSegmentDelegate
- (void)JXSegment:(JXSegment*)segment didSelectIndex:(NSInteger)index{
    
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"ORDERVCSCROLLINDEX" object:nil userInfo:@{@"scrollIndex":@(index)}];
    [self.MyScrollView setContentOffset:CGPointMake(SCREEN_WIDTH*index, 1) animated:NO];
    _cuttentListIndex = index;
    [self creatTableview];
    [self RequestNewListData];
}

#pragma mark  *** scrollView--delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //**防止上拉加载的时候触发**/
    self.EndScrollOfferX = scrollView.contentOffset.x;
    if (self.StartScrollOfferX == self.EndScrollOfferX) {
    }else{
        NSInteger ScrollIndex = scrollView.contentOffset.x/SCREEN_WIDTH;
        //** 滚动topbar */
        [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"formeVCscrollIndex" object:nil userInfo:@{@"scrollIndex":@(ScrollIndex)}];
        [self.MyScrollView setContentOffset:CGPointMake(SCREEN_WIDTH*ScrollIndex, 1) animated:NO];
        _cuttentListIndex = ScrollIndex;
    }
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    self.StartScrollOfferX = scrollView.contentOffset.x;
}

#pragma mark - Fifth.控制器生命周期

+ (instancetype)creatOrderListViewControllerWithCutrtentIndex:(NSInteger)CutrrentIndex
                                              OrderListVcType:(OrderListVcType)OrderListVcType
                                                       Extend:(id)extend
{
    YBOrderListViewController *viewcontroller           = [[YBOrderListViewController alloc]init];
    viewcontroller.OrderListVcType                        = OrderListVcType;
    if (CutrrentIndex) viewcontroller.cuttentListIndex  = CutrrentIndex;
    return viewcontroller;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    //    [self RequestNewListData];
    
    [self setUI];
    [self.MyScrollView setContentOffset:CGPointMake(SCREEN_WIDTH*_cuttentListIndex, 1) animated:YES];
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"formeVCscrollIndex" object:nil userInfo:@{@"scrollIndex":@(_cuttentListIndex)}];
    //    [[YBTimerManager shareTimer] startTimerWithTimeInterVal:1.0f];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[YBTimerManager shareTimer] stopTimer];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (_OrderListVcType == MyBuyOrderType) {
        self.title  = @"我购买的";
        self.topBarDataArr = @[@"全部",@"待付款",@"待发货",@"待收货",@"待确认",@"已成交",@"已取消"];
    }else if (_OrderListVcType == AppraisalOrderType){
        self.title  = @"我的鉴定";
        self.topBarDataArr = @[@"全部",@"待送鉴",@"鉴定中",@"已通过",@"未通过"];
    }else if (_OrderListVcType == MySellOutOrderType){
        self.title  = @"我卖出的";
        self.topBarDataArr = @[@"全部",@"待付款",@"待发货",@"待收货",@"待确认",@"已成交",@"已取消"];
    }else if (_OrderListVcType == MyGoodsOrderType){
        self.title  = @"我的物品";
        self.topBarDataArr = @[@"全部",@"已入库",@"已出库"];
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    WEAKSELF(self);
    ZJBaseBarButtonItem *backButtonItem                 = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_back"
                                                                                                     callBack:^(id sender) {
                                                                                                         
                                                                                                         if ([weakself.sourceController isKindOfClass:[YBPaymentResultController class]]) {
                                                                                                             
                                                                                                             [self.navigationController popToRootViewControllerAnimated:YES];
                                                                                                             
                                                                                                         }else{
                                                                                                             [self.navigationController popViewControllerAnimated:YES];
                                                                                                         }
                                                                                                         
                                                                                                     }];
    backButtonItem.offSet = YES;
    self.navigationItem.leftBarButtonItem     = backButtonItem;
}

#pragma mark - Sixth.界面配置
- (void)setUI{
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    self.segment = [[JXSegment alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(33))];
    [self.segment updateChannels:self.topBarDataArr];
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
    if(self.topBarDataArr.count <=1){
        self.segment.hidden = YES;
    }
    
    [self.view addSubview:self.MyScrollView];
    [self creatTableview];
    
    [self RequestNewListData];
}
#pragma mark - Seventh.懒加载
/**
 懒加载
 */
-(UIScrollView*)MyScrollView
{
    if (!_MyScrollView) {
        if (self.segment.hidden == YES) {
            self.segment.height = 0;
        }
        _MyScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.segment.bottom, SCREEN_WIDTH, SCREEN_HEIGHT-self.segment.height - ADJUST_PERCENT_FLOAT(20))];
        _MyScrollView.delegate = self;
        _MyScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*self.topBarDataArr.count, 0);
        _MyScrollView.backgroundColor = ZJCOLOR.color_c12;
        _MyScrollView.pagingEnabled = YES;
        _MyScrollView.bounces = YES;
    }
    return _MyScrollView;
}

-(void)creatTableview{
    
    /*
     @brief 如果scrollview子视图中有当前的tag值，就不再创建tableview了
     */
    BOOL ishave = false;
    for (UIView *tablviews in self.MyScrollView.subviews) {
        if ([tablviews isKindOfClass:[UITableView class]]) {
            if (tablviews.tag == _cuttentListIndex) {
                ishave = YES;
            }
        }
    }
    if (!ishave) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*_cuttentListIndex, 0, SCREEN_WIDTH, self.MyScrollView.height ) style:UITableViewStyleGrouped];
        //        tableView.frame = ;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = ZJCOLOR.color_c12;
        tableView.tag = _cuttentListIndex;
        [self.MyScrollView addSubview:tableView];
        [tableView registerNib:[UINib nibWithNibName:@"YBOrderListTableViewCell" bundle:nil]  forCellReuseIdentifier:MYORDERLISTCELLINDIFITER];
        
        tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(RequestNewListData)];
        tableView.mj_header.automaticallyChangeAlpha = YES;
        //        tableView.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestMoreListData)];
        //        MJRefreshAutoFooter *autoFooter                                     = (MJRefreshAutoFooter *)tableView.mj_footer;
        tableView.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestMoreListData)];
        //        autoFooter.triggerAutomaticallyRefreshPercent                       = -100;
        //                UIView *footerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        //                footerview.backgroundColor = [UIColor clearColor];
        //        self.tableview.tableFooterView.height = 30;
        //        tableView.contentSize  = CGSizeMake(1, self.MyScrollView.height+40);
        tableView.mj_footer.hidden = YES;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
}

- (NSMutableArray *)dataModelArr {
    if (!_dataModelArr) {
        _dataModelArr = [NSMutableArray array];
    }
    return _dataModelArr;
}

- (YBBlankpageView *)addblankpage{
    YBBlankpageView *blankPageView = [[YBBlankpageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    blankPageView.tag = self.tableview.tag + 100;
    return blankPageView;
}

@end
