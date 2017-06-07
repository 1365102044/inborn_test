//
//  YXPCUniconPayZabrViewController.m
//  Payment
//
//  Created by 胤讯测试 on 16/11/30.
//  Copyright © 2016年 胤宝. All rights reserved.
//

#import "YXPCUniconPayZabrViewController.h"
#import "UILabel+Extension.h"
#import "YBPublicConfigure_LocalData.h"
#import "YBStringTool.h"
#import "ZJBaseBarButtonItem.h"
#import "YBOrderDetailTableViewController.h"
#import "YBPaymentService.h"
#import "YBAttributedStringLabel.h"

@interface YXPCUniconPayZabrViewController ()
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *dingdannumberLable;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dingdanNumberLableWidth;

@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *priceLable;

@property (weak, nonatomic) IBOutlet UILabel *descLable;
@property (weak, nonatomic) IBOutlet UIButton *PayMentSuccessBtn;
@property (weak, nonatomic) IBOutlet UIButton *PayMentRequestBtn;

@property(nonatomic,strong) NSString * orderNumber;
@property(nonatomic,strong) NSString * goodsName;
@property(nonatomic,strong) NSString * orderAllprice;
@property(nonatomic,strong) NSString * shouldPayprice;
@property(nonatomic,strong) NSString * orderId;
@property(nonatomic,assign) NSInteger  orderType;

@property(nonatomic,strong) ZJBaseView * mynavview;
@end

@implementation YXPCUniconPayZabrViewController

+ (instancetype)CreatwebPagePayVCwithordernumber:(NSString *)ordernumber
                                       goodsName:(NSString *)goodsName
                                   orderAllprice:(NSString *)orderAllprice
                                  shouldPayprice:(NSString *)shouldPayprice
                                         orderId:(NSString *)orderId
                                       orderType:(NSInteger )orderType
                                          extend:(id)extend
{
    YXPCUniconPayZabrViewController *payresult = [[YXPCUniconPayZabrViewController alloc]init];
    payresult.goodsName = goodsName;
    payresult.orderAllprice = orderAllprice;
    payresult.shouldPayprice = shouldPayprice;
    payresult.orderId = orderId;
    payresult.orderNumber = ordernumber;
    payresult.orderType = orderType;
    return payresult;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden =  YES;
    
    [self setNavRightItems];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden =  NO;
    
    [self.mynavview removeFromSuperview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"PC网银扫码支付";
    
    NSString *moneyAmount = [NSString stringWithFormat:@"%@",[[YBStringTool share] strmethodCommaWith:_shouldPayprice]];
    
    /**
     {
     "color" : color,
     "content" : "文字内容",
     "size" : 文字大小,
     "lineSpacing": 行间距
     },
     */
    
    [self.dingdannumberLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c4,
                                                                     @"content":@"订单号: ",
                                                                     @"size":SYSTEM_REGULARFONT(14),
                                                                     @"lineSpacing":@0},
                                                                   @{@"color":ZJCOLOR.color_c5,
                                                                     @"content":_orderNumber,
                                                                     @"size":SYSTEM_REGULARFONT(14),
                                                                     @"lineSpacing":@0}]];
    
    CGFloat MAXW = [NSString ex_sizeWithText:[NSString stringWithFormat:@"订单号: %@",_orderNumber] andFont:SYSTEM_REGULARFONT(14)].width;
    self.dingdanNumberLableWidth.constant = MAXW;
    
    [self.priceLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c4,
                                                             @"content":@"支付金额: ",
                                                             @"size":SYSTEM_REGULARFONT(14),
                                                             @"lineSpacing":@0},
                                                           @{@"color":ZJCOLOR.color_c5,
                                                             @"content":moneyAmount,
                                                             @"size":SYSTEM_REGULARFONT(14),
                                                             @"lineSpacing":@0}]];
    
    
    NSString *kefuphonestr = [YBPublicConfigure_LocalData share].customerPhone;
    self.descLable.text = [NSString stringWithFormat:@"提示：如果支付遇到问题，请联系客服或致电\n我们的24小时客服热线：%@",kefuphonestr];
    self.descLable.textColor =  ZJCOLOR.color_c5;
    [self.descLable setRowSpace:10];
    self.descLable.textAlignment = NSTextAlignmentCenter;
    
    
    self.PayMentSuccessBtn.layer.masksToBounds = YES;
    self.PayMentSuccessBtn.layer.cornerRadius = 22;
    self.PayMentSuccessBtn.layer.borderColor = ZJCOLOR.color_c6.CGColor;
    self.PayMentSuccessBtn.layer.borderWidth = 1;
    self.PayMentRequestBtn.layer.masksToBounds = YES;
    self.PayMentRequestBtn.layer.cornerRadius = 22;
    self.PayMentRequestBtn.layer.borderColor = ZJCOLOR.color_c6.CGColor;
    self.PayMentRequestBtn.layer.borderWidth = 1;
    [self.PayMentSuccessBtn setBackgroundImage:[UIImage imageNamed:@"public_blank2_btn_n"] forState:UIControlStateHighlighted];
    [self.PayMentRequestBtn setBackgroundImage:[UIImage imageNamed:@"public_blank2_btn_n"] forState:UIControlStateHighlighted];
    
}

/**
 添加消息item
 */
-(void)setNavRightItems
{
    [self.view addSubview:self.mynavview];
    
    [self.mynavview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_offset(64);
    }];
}

/**
 点击支付成功
 */
- (IBAction)ClickPayMentSuccessBtn:(UIButton *)sender {
    [self requestCheckScanPayStatus];
}

/**
 点击支付遇到问题
 */
- (IBAction)ClickPayMentRequestBtn:(id)sender {
    [self requestCheckScanPayStatus];
}

/**
 支付失败 和 返回
 */
- (void)clickcolsebtn
{
    [self requestCheckScanPayStatus];
    
}

/*
 @brief 返回的时候，需要查询一下，支付是否 成功。。。。
 */
-(void)requestCheckScanPayStatus
{
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [[YBPaymentService share] checkscanPaymentResultInforWithorderId:_orderId
                                                               orderType:[NSString stringWithFormat:@"%ld",(long)_orderType]
                                                             paymentType:@"1"
                                                                 success:^(id objc, id requestInfo) {
                                                                     
                                                                     NSString *result = objc[@"data"][@"paymentResult"];
                                                                     if ([result isEqualToString:@"FAIL"]) {
                                                                         [self payfial];
                                                                     }else if ([result isEqualToString:@"SUCCESS"]){
                                                                         [self paysuccess];
                                                                     }
                                                                     
                                                                     [SVProgressHUD dismiss];
                                                                 } fail:^(id error, id requestInfo) {
                                                                     
                                                                     [SVProgressHUD dismiss];
                                                                 }];
    });
    
}

/**
 支付失败
 */
- (void)payfial
{
    self.navigationController.navigationBar.hidden =  NO;
    if (self.navigationController.viewControllers.count>3) {
        
        [self.navigationController popToViewController:self.navigationController.viewControllers[self.navigationController.viewControllers.count - 4] animated:YES];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/**
 支付成功
 */
- (void)paysuccess{
    [self pushorderdeatilvc];
}

/**
 去订单详情
 */
- (void)pushorderdeatilvc
{
    YBOrderDetailTableViewController *orderdeatilVC = [YBOrderDetailTableViewController orderDetailTableViewControllerWithOrderId:_orderId extend:self];
    [self.navigationController pushViewController:orderdeatilVC animated:YES];
}

- (ZJBaseView *)mynavview
{
    if (!_mynavview) {
        _mynavview = [[ZJBaseView alloc]init];
        
        YBDefaultLabel *titlelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(17)
                                                              text:ZJSTRING(@"PC扫码支付")
                                                         textColor:[UIColor blackColor]];
        titlelable.textAlignment = NSTextAlignmentCenter;
        [_mynavview addSubview:titlelable];
        
        [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(150), 40));
            make.centerX.mas_equalTo(_mynavview.mas_centerX);
            make.top.mas_offset(26);
        }];
        
        UIButton *colsebtn = [[UIButton alloc]init];
        [colsebtn setImage:[UIImage imageNamed:@"public_back_n"] forState:UIControlStateNormal];
        [colsebtn addTarget:self action:@selector(clickcolsebtn) forControlEvents:UIControlEventTouchUpInside];
        [_mynavview addSubview:colsebtn];
        
        [colsebtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(30), ADJUST_PERCENT_FLOAT(30)));
            make.centerY.mas_equalTo(titlelable.mas_centerY);
            make.left.mas_offset(ADJUST_PERCENT_FLOAT(15));
        }];
    }
    return _mynavview;
}

@end
