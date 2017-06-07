//
//  YXWebPagePayViewController.m
//  Payment
//
//  Created by 郑键 on 16/12/1.
//  Copyright © 2016年 胤宝. All rights reserved.
//

#import "YXWebPagePayViewController.h"
//#import "YXPaymentDetailCell.h"
#import "YXPaymentTypeHeaderView.h"
#import "YXWebPagePCPayLogoCell.h"
#import "YXWebPagePCPayFooterView.h"
#import "YXPayZBarViewController.h"
#import "YXPCUniconPayZabrViewController.h"
#import "User_LocalData.h"
#import <AVFoundation/AVFoundation.h>
#import "YBPaymentService.h"
#import "YBScanPCPayTableViewCell.h"
#import "YBTopAlert.h"
#import "ZJProjectNetRequestManager.h"

@interface YXWebPagePayViewController () <UITableViewDataSource, UITableViewDelegate>

/**
 内容视图
 */
@property (nonatomic, strong) UITableView *contentTableView;

@property(nonatomic,strong) NSString * orderNumber;
@property(nonatomic,strong) NSString * goodsName;
@property(nonatomic,strong) NSString * orderAllprice;
@property(nonatomic,strong) NSString * shouldPayprice;
@property(nonatomic,strong) NSString * orderId;
@property(nonatomic,assign) NSInteger  orderType;
@property(nonatomic,strong) NSArray * dataArr;
@end

@implementation YXWebPagePayViewController

//** 重用标志 */
static NSString * const kYXPaymentHomePageControllerDetailCellReusableIdentifier = @"kYXPaymentHomePageControllerDetailCellReusableIdentifier";
static NSString * const kYXPaymentHomePageControllerPaymentTypeHeaderViewReusableIdentifier = @"kYXPaymentHomePageControllerPaymentTypeHeaderViewReusableIdentifier";
static NSString * const kYXPaymentWebPagePayControllerPCPayLogoCellReusableIdentifier = @"kYXPaymentWebPagePayControllerPCPayLogoCellReusableIdentifier";
static NSString * const kYXPaymentWebPagePayControllerPCPayFooterViewReusableIdentifier = @"kYXPaymentWebPagePayControllerPCPayFooterViewReusableIdentifier";

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark <UITableViewDataSource>

+ (instancetype)CreatwebPagePayVCwithordernumber:(NSString *)ordernumber
                                       goodsName:(NSString *)goodsName
                                   orderAllprice:(NSString *)orderAllprice
                                  shouldPayprice:(NSString *)shouldPayprice
                                         orderId:(NSString *)orderId
                                       orderType:(NSInteger )orderType
                                          extend:(id)extend
{
    YXWebPagePayViewController *vc =[[YXWebPagePayViewController alloc]init];
    vc.orderNumber = ordernumber;
    vc.goodsName = goodsName;
    vc.orderAllprice = orderAllprice;
    vc.shouldPayprice = shouldPayprice;
    vc.orderId = orderId;
    vc.orderType = orderType;
    return vc;
}

/**
 返回组
 
 @param tableView tableView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

/**
 返回行
 
 @param tableView tableView
 @param section   section
 
 @return 每组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 4;
    }else
    {
        return 1;
        
    }
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0 ) {
        
        YBScanPCPayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYXPaymentHomePageControllerDetailCellReusableIdentifier forIndexPath:indexPath];
        [cell setTitleStr:self.dataArr[indexPath.row][0] desctr:self.dataArr[indexPath.row][1]];
        if (indexPath.row == 0) {
            cell.titleLable.textColor = ZJCOLOR.color_c4;
        }
        if (indexPath.row == 3) {
            cell.lineview.hidden = YES;
        }else{
            cell.lineview.hidden = NO;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 1) {
        YXWebPagePCPayLogoCell *cell = [tableView dequeueReusableCellWithIdentifier:kYXPaymentWebPagePayControllerPCPayLogoCellReusableIdentifier forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, -10000);
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0 ) {
        return nil;
    }
    YXWebPagePCPayFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kYXPaymentWebPagePayControllerPCPayFooterViewReusableIdentifier];
    footerView.clicksurebtnblock= ^(){
    
        // 1、 获取摄像设备
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if (device) {
            AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (status == AVAuthorizationStatusNotDetermined) {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            YXPayZBarViewController *zbarvc =[[YXPayZBarViewController alloc]init];
                            zbarvc.formePCPayurlBlock = ^(NSString *url){
                                [self GetPayUrlWithZbar:url];
                            };
                            [self.navigationController pushViewController:zbarvc animated:YES];
                        });
                        // 用户第一次同意了访问相机权限
                        
                    } else {
                        
                        // 用户第一次拒绝了访问相机权限
                    }
                }];
            } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
                YXPayZBarViewController *zbarvc =[[YXPayZBarViewController alloc]init];
                zbarvc.formePCPayurlBlock = ^(NSString *url){
                    [self GetPayUrlWithZbar:url];
                };
                [self.navigationController pushViewController:zbarvc animated:YES];
                
            } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
                
            } else if (status == AVAuthorizationStatusRestricted) {
                YBLog(@"因为系统原因, 无法访问相册");
            }
        } else {
            YBLog(@"%@", @"未检测到您的摄像头, 请在真机上测试");
        }
    };
    if (!footerView) {
        footerView = [[YXWebPagePCPayFooterView alloc] initWithReuseIdentifier:kYXPaymentWebPagePayControllerPCPayFooterViewReusableIdentifier];
    }
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section ==0) {
        return 0.0001;
    }else{
        return ADJUST_PERCENT_FLOAT(74.f);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 46.f;
    }else if (indexPath.section == 1){
    return 135.f;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网银扫码支付";
    self.view.backgroundColor = ZJCOLOR.color_c12;
    [self.view addSubview:self.contentTableView];
    [self registerSubViews];
    
    self.dataArr = @[@[@"订单编号",self.orderNumber],
                     @[@"商品名称",self.goodsName],
                     @[@"订单总金额",self.orderAllprice],
                     @[@"应付金额",self.shouldPayprice]];
}

/**
 扫码完成的 拿到的URL 和 参数
 */
-(void)GetPayUrlWithZbar:(NSString *)url
{
    YBLog(@"===扫码结果：==%@===",url);
    
    if (![url containsString:@"pcPay/loginAuth"] ||
        ![url containsString:@"?"] ||
        ![url containsString:@"clientId"]) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                                tipsStringKey:ZJSTRING(@"无效二维码") type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        [self.navigationController popViewControllerAnimated:YES];
        return ;
    }
    
    NSString *clientID;
    NSString *URL;
    if (url) {
        NSArray *urlarr = [url componentsSeparatedByString:@"?"];
        if (urlarr.count>1) {
            URL = urlarr[0];
            NSArray *clientIDarr = [urlarr[1] componentsSeparatedByString:@"="];
            if (clientIDarr.count>1) {
                clientID = clientIDarr[1];
            }
        }
    }
    if (URL) {
        [self requestPayWithScanResultURL:URL clientID:clientID];
    }
}


#pragma mark  ******************* 扫码支付 发送请求**********************
/**
 使用获取的url
 */
- (void)requestPayWithScanResultURL:(NSString *)url  clientID:(NSString *)clientID
{
    NSString *userID = [User_LocalData getTokenId];
    if (userID.length==0) {
        return;
    }
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (_orderId)    param[@"orderId"] = _orderId;
    if (_orderType)  param[@"orderType"] = [NSString stringWithFormat:@"%ld",(long)_orderType];
    if (clientID)    param[@"clientId"] = clientID;
    
    [[ZJProjectNetRequestManager sharedNetRequestManager] connectNetWithUrl:url
                                                         requestNetworkType:ZJProjectNetRequestPost
                                                                 parameters:param
                                                            timeoutInterval:6.0
                                                               successBlock:^(id objc, id requestInfo) {
                                                                   YXPCUniconPayZabrViewController *zbarPayResult =[YXPCUniconPayZabrViewController  CreatwebPagePayVCwithordernumber:_orderNumber
                                                                                                                                                                            goodsName:_goodsName
                                                                                                                                                                        orderAllprice:_orderAllprice
                                                                                                                                                                       shouldPayprice:_shouldPayprice
                                                                                                                                                                              orderId:_orderId
                                                                                                                    
                                                                                                                                                                            orderType:_orderType                                                                 extend:nil];
                                                                   
                                                                   [self.navigationController pushViewController:zbarPayResult animated:YES];

                                                               } failureBlock:^(id error, id requestInfo) {
                                                                   [SVProgressHUD dismiss];
                                                                   [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                                                                                           tipsStringKey:ZJSTRING(@"请求失败") type:YBTopAlertError
                                                                                                      eventCallBackBlock:^(id sender) {
                                                                                                          
                                                                                                      }];
                                                                   [self.navigationController popViewControllerAnimated:YES];

                                                               }];
}

/**
 注册子控件
 */
- (void)registerSubViews
{
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBScanPCPayTableViewCell class]) bundle:nil] forCellReuseIdentifier:kYXPaymentHomePageControllerDetailCellReusableIdentifier];
    
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YXWebPagePCPayLogoCell class]) bundle:nil] forCellReuseIdentifier:kYXPaymentWebPagePayControllerPCPayLogoCellReusableIdentifier];
    [self.contentTableView registerClass:[YXWebPagePCPayFooterView class] forHeaderFooterViewReuseIdentifier:kYXPaymentWebPagePayControllerPCPayFooterViewReusableIdentifier];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (UITableView *)contentTableView
{
    if (!_contentTableView) {
        _contentTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _contentTableView.dataSource = self;
        _contentTableView.delegate = self;
        _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _contentTableView.backgroundColor = ZJCOLOR.color_c12;
    }
    return _contentTableView;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
    
}
@end
