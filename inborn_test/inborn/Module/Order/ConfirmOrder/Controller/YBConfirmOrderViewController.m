//
//  YBConfirmOrderViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmOrderViewController.h"
#import "ZJBaseTableView.h"
#import "YBConfirmOrderViewModel.h"
#import "YBConfirmOrderDefaultCell.h"
#import "YBConfirmOrderUserInformationCell.h"
#import "YBConfirmOrderUserInformationTempCell.h"
#import "YBConfirmOrderDetailCell.h"
#import "YBConfirmOrderAmontDetailCell.h"
#import "YBConfirmAgreementCell.h"
#import "YBConfirmDepositCell.h"
#import "YBAttributedStringLabel.h"
#import "YBAddNewAddressOrPickpersonViewController.h"
#import "YBPaymentDeliveryTypeController.h"
#import "YBAddressAndPickListViewController.h"
#import "YBPaymentController.h"
#import "ZJBaseBarButtonItem.h"
#import "JXTAlertManagerHeader.h"
#import "YBStringTool.h"
#import "YBGoodsDeatilNaviMoreView.h"
#import "MQCustomerServiceManager.h"
#import "YBAgreementViewController.h"

@interface YBConfirmOrderViewController () <UITableViewDataSource, UITableViewDelegate, YBConfirmBaseCellDelegate, YBAddNewAddressOrPickpersonViewControllerDelegate, YBAddressAndPickListViewControllerDelegate>

/**
 内容视图
 */
@property (nonatomic, strong) ZJBaseTableView *contentTableView;

/**
 viewModel
 */
@property (nonatomic, strong) YBConfirmOrderViewModel *confirmOrderViewModel;

/**
 底部提交订单视图
 */
@property (nonatomic, strong) ZJBaseView *bottomFuncView;

/**
 底部视图中的应付金额展示
 */
@property (nonatomic, weak) YBAttributedStringLabel *amontLabel;

@end

@implementation YBConfirmOrderViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setConfirmOrderViewModel:(YBConfirmOrderViewModel *)confirmOrderViewModel
{
    _confirmOrderViewModel = confirmOrderViewModel;
    
    [self.amontLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                             @"content" :ZJSTRING(@"应付金额："),
                                                             @"size" : SYSTEM_MEDIUMFONT(14.f),
                                                             @"lineSpacing": @0},
                                                           @{@"color" : ZJCOLOR.color_c6,
                                                             @"content" : @"¥",
                                                             @"size" : SYSTEM_REGULARFONT(12.f),
                                                             @"lineSpacing": @0},
                                                           @{@"color" : ZJCOLOR.color_c6,
                                                             @"content" : [[YBStringTool share] strmethodCommaWith:self.confirmOrderViewModel.currentPrice],
                                                             @"size" : SYSTEM_REGULARFONT(14.f),
                                                             @"lineSpacing": @0}]];
    
    [self.contentTableView reloadData];
    [self hiddenMaskView];
}

#pragma mark - Third.点击事件

- (void)submitButtonClick:(YBDefaultButton *)sender
{
    /**
     *  提交点击事件，发送网络请求生成订单
     */
    [self.confirmOrderViewModel creatOrderSuccessCallBack:^(id obj) {
        
        /**
         *  成功后，将id传递给支付界面
         */
        NSString *orderId = (NSString *)obj;
        
        YBPaymentController *paymentController = [YBPaymentController paymentControllerWithOrderId:orderId
                                                                                     paymentMethod:self.confirmOrderViewModel.userCurrentPaymentMethod == 0 ? ZJProjectPaymentMethodAll : self.confirmOrderViewModel.userCurrentPaymentMethod
                                                                                  paymentEventType:ZJProjectPaymentEventOrder
                                                                                            extend:nil];
        [self.navigationController pushViewController:paymentController animated:YES];
        
    } failureCallBack:^(id error) {
        
    }];
}

#pragma mark - Fourth.代理方法

#pragma mark <YBAddressAndPickListViewControllerDelegate>

/**
 选中地址回调
 
 @param addressAndPickListViewController        addressAndPickListViewController
 @param addressModel                            addressModel
 */
- (void)addressAndPickListViewController:(YBAddressAndPickListViewController *)addressAndPickListViewController
                            addressModel:(YBAddressAndPickPersonModel *)addressModel
{
    /**
     *  判断是否有此地址
     *  给order地址赋值
     */
    [self.confirmOrderViewModel setupFromListUserSelectedAddressModel:addressModel successCallBack:^(id model) {
        [self.contentTableView reloadData];
    }];
}

#pragma mark <YBAddNewAddressOrPickpersonViewControllerDelegate>

/**
 添加新地址回调
 
 @param addNewAddressOrPickpersonViewController     addNewAddressOrPickpersonViewController
 @param newAddressModel                             newAddressModel 新地址模型
 */
- (void)addNewAddressOrPickpersonViewController:(YBAddNewAddressOrPickpersonViewController *)addNewAddressOrPickpersonViewController
                                newAddressModel:(YBAddressAndPickPersonModel *)newAddressModel
{
    [self.confirmOrderViewModel setupUserSelectedAddressModel:newAddressModel];
    
    /**
     *  刷新第一组第二行
     */
    [self.contentTableView reloadData];
}

#pragma mark <YBConfirmBaseCellDelegate>

/**
 cell上的按钮点击事件
 
 @param confirmBaseCell     confirmBaseCell
 @param button              button
 */
- (void)confirmBaseCell:(YBConfirmBaseCell *)confirmBaseCell button:(UIButton *)button
{
    if (button.tag == 1001) {
        
        /**
         *  地址为空
         *  判断当前的配送状态，跳转不同的控制器
         *
         *  addressType,
         *  pickPersonType
         */
        YBAddNewAddressOrPickpersonViewController *addvc = [YBAddNewAddressOrPickpersonViewController creatAddNewViewControllerWith:[self.confirmOrderViewModel.orderModel.deliveryType isEqualToString:@"1"] ? addressType : pickPersonType
                                                                                                                             Extend:nil];
        addvc.delegate = self;
        [self.navigationController pushViewController:addvc animated:YES];
    }
    
    if (button.tag == 1002) {
        
        /**
         *  定金写协议
         */
        YBAgreementViewController *agreementViewController = [[YBAgreementViewController alloc] init];
        [self.navigationController pushViewController:agreementViewController animated:YES];
    }
    
    if (button.tag == 1003) {
        
        /**
         *  身份证提示
         */
        [self jxt_showAlertWithTitle:ZJSTRING(@"提示")
                             message:ZJSTRING(@"为保证您的交易安全，请填写收件人的证件号码，用于物流派送时快递员验证收件人身份。如不填写有效证件号码，导致您的物品丢失，责任须买家自行承担")
                   appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
            
                       alertMaker.
                       addActionCancelTitle(ZJSTRING(@"知道了"));
                       
                       alertMaker.view.tintColor = ZJCOLOR.color_c6;
                       
        } actionsBlock:^(NSInteger buttonIndex,
                         UIAlertAction * _Nonnull action,
                         JXTAlertController * _Nonnull alertSelf) {
            
        }];
    }
}

#pragma mark <UITableViewDataSource>

/**
 返回组
 
 @param tableView tableView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.confirmOrderViewModel.dataModelArray.count;
}

/**
 返回行
 
 @param tableView tableView
 @param section   section
 
 @return 每组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *tempArray = self.confirmOrderViewModel.dataModelArray[section][@"data"];
    return tempArray.count;
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tempArray                          = self.confirmOrderViewModel.dataModelArray[indexPath.section][@"data"];
    YBConfirmOrderModel *confirmOrderModel      = tempArray[indexPath.row];
    
    YBConfirmBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:confirmOrderModel.cellReID
                                                              forIndexPath:indexPath];
    cell.confirmOrderModel = confirmOrderModel;
    cell.delegate = self;
    return cell;
}

/**
 行高
 
 @param tableView tableView
 @param indexPath indexPath
 @return 行高
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tempArray                          = self.confirmOrderViewModel.dataModelArray[indexPath.section][@"data"];
    YBConfirmOrderModel *confirmOrderModel      = tempArray[indexPath.row];
    return confirmOrderModel.rowHeight;
}

/**
 点击事件
 
 @param tableView tableView
 @param indexPath indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tempArray                          = self.confirmOrderViewModel.dataModelArray[indexPath.section][@"data"];
    YBConfirmOrderModel *confirmOrderModel      = tempArray[indexPath.row];
    
    /**
     *  选择付款和配送
     */
    if (indexPath.section == 0
        && indexPath.row == 0) {
        
        YBPaymentDeliveryTypeController *paymentDeliveryTypeController = [YBPaymentDeliveryTypeController paymentDeliveryTypeControllerWithDeliveryType:self.confirmOrderViewModel.orderModel.deliveryType
                                                                                                                                          paymentMethod:ZJProjectPaymentMethodAll confirmOrderViewModel:self.confirmOrderViewModel
                                                                                                                                          callBackBLock:^(NSString *userDeliveryType, ZJProjectPaymentMethod paymentMethod) {
                                                                                                                                              
                                                                                                                                              /**
                                                                                                                                               *  选中支付方式和配送方式回调
                                                                                                                                               */
                                                                                                                                              [self.confirmOrderViewModel setupUserSelectedDeliveryType:userDeliveryType
                                                                                                                                                                                          paymentMethod:paymentMethod successCallBack:^(id model) {
                                                                                                                                                                                              
                                                                                                                                                                                              [self.amontLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                                                                                                                                                                                                       @"content" :ZJSTRING(@"应付金额："),
                                                                                                                                                                                                                                                       @"size" : SYSTEM_MEDIUMFONT(14.f),
                                                                                                                                                                                                                                                       @"lineSpacing": @0},
                                                                                                                                                                                                                                                     @{@"color" : ZJCOLOR.color_c6,
                                                                                                                                                                                                                                                       @"content" : @"¥",
                                                                                                                                                                                                                                                       @"size" : SYSTEM_REGULARFONT(12.f),
                                                                                                                                                                                                                                                       @"lineSpacing": @0},
                                                                                                                                                                                                                                                     @{@"color" : ZJCOLOR.color_c6,
                                                                                                                                                                                                                                                       @"content" : [[YBStringTool share] strmethodCommaWith:self.confirmOrderViewModel.currentPrice],
                                                                                                                                                                                                                                                       @"size" : SYSTEM_REGULARFONT(14.f),
                                                                                                                                                                                                                                                       @"lineSpacing": @0}]];
                                                                                                                                                                                              
                                                                                                                                                                                              /**
                                                                                                                                                                                               *  刷新第一组第一行
                                                                                                                                                                                               */
                                                                                                                                                                                              [self.contentTableView reloadData];
                                                                                                                                                                                              
                                                                                                                                                                                          }];
                                                                                                                                              
                                                                                                                                          }];
        [self.navigationController pushViewController:paymentDeliveryTypeController animated:YES];
    }
    
    /**
     *  地址选择列表
     */
    if (indexPath.section == 0
        && indexPath.row == 1) {
        
        YBAddressAndPickListViewController *addressAdndPickListViewController = [YBAddressAndPickListViewController creatAddressAndPickPersonViewControllerWithType:[self.confirmOrderViewModel.orderModel.deliveryType isEqualToString:@"1"] ? addressType : pickPersonType Extend:nil];
        addressAdndPickListViewController.delegate = self;
        [self.navigationController pushViewController:addressAdndPickListViewController animated:YES];
    }
    
    /**
     *  弹出输入身份证号界面
     *  没有身份证号
     *  物流快递方式
     */
    if (indexPath.section == 0
        && indexPath.row == 2
        && [confirmOrderModel.deliveryType isEqualToString: @"1"]) {
        if (!confirmOrderModel.addrIdcard
            || [confirmOrderModel.addrIdcard ex_isEmpty]) {
            
            [self idNumberAlertWithModel:confirmOrderModel];
        }
    }
    
}

/**
 输入用户身份证号
 */
- (void)idNumberAlertWithModel:(YBConfirmOrderModel *)confirmOrderModel
{
    WEAKSELF(self);
    [self jxt_showAlertWithTitle:ZJSTRING(@"输入身份证")
                         message:nil
               appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                   
                   alertMaker.view.tintColor = ZJCOLOR.color_c6;
                   
                   alertMaker.addActionCancelTitle(ZJSTRING(@"取消")).
                   addActionDefaultTitle(ZJSTRING(@"确定"));
                   
                   [alertMaker addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                       textField.placeholder = ZJSTRING(@"请输入身份证号码");
                       textField.keyboardType = UIKeyboardTypeASCIICapable;
                       textField.autocorrectionType = UITextAutocorrectionTypeNo;
                   }];
                   
               } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                  
                   if (buttonIndex == 1) {
                       
                       UITextField *textField = alertSelf.textFields.firstObject;
                       
                       /**
                        *  发送网络请求
                        *  并展示到界面
                        */
                       [self.confirmOrderViewModel setupUserIdNumber:textField.text
                                                     successCallBack:^(id model) {
                                                         
                                                         /**
                                                          *  刷新界面
                                                          */
                                                         self.confirmOrderViewModel.userInputIdCardNumber = [textField.text ex_replaceStringWithReplaceString:@"*"
                                                                                                                                                startLocation:1
                                                                                                                                                       lenght:textField.text.length - 2];
                                                         [weakself.contentTableView reloadData];
                                                         
                                                     } failureCallBack:^(id error) {
                                                         
                                                     }];
                   }
               }];
    
}

#pragma mark - Fifth.控制器生命周期

/**
 初始化确认订单控制器
 
 @param goodId id
 @param extend 扩展参数（nil）
 @return 确认订单控制器
 */
+ (instancetype)confirmOrderViewControllerWithGoodId:(NSString *)goodId
                                              extend:(id)extend
{
    YBConfirmOrderViewController *confirmOrderViewController = [[YBConfirmOrderViewController alloc] init];
    YBConfirmOrderViewModel *confirmOrderViewModel = [[YBConfirmOrderViewModel alloc] init];
    if (extend
        && [extend isEqualToString: @"1"]) {
        confirmOrderViewModel.userCurrentPaymentMethod = ZJProjectPaymentMethodDeposit;
    }
    
    [confirmOrderViewModel confirmOrderWithGoodId:goodId
                                  successCallBack:^(id model) {
                                      confirmOrderViewController.confirmOrderViewModel = model;
                                  } failureCallBack:^(id error) {
                                      
                                  }];
    
    return confirmOrderViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showMaskView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contentTableView.contentInset = UIEdgeInsetsMake(ADJUST_PERCENT_FLOAT(-20), 0, ADJUST_PERCENT_FLOAT(100), 0);
    
    [self.view addSubview:self.contentTableView];
    [self.view addSubview:self.bottomFuncView];
    self.navigationItem.title = ZJSTRING(@"确认订单");
    [self.bottomFuncView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
    }];
    
    ZJBaseBarButtonItem *rightButtonItem                = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_more"
                                                                                                     callBack:^(id sender) {
                                                                                                         [self clickRightItem];
                                                                                                         
                                                                                                     }];
    self.navigationItem.rightBarButtonItem              = rightButtonItem;
    
    
    
    [self registerSubViews];
}

/**
 点击 更多rightitem
 */
- (void)clickRightItem
{
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
                                                  
                                                  [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
                                                  [[MQCustomerServiceManager share] sendUrlMessage:[NSString stringWithFormat:@"商品名称：%@\n商品编号：%@\n商品地址：%@",
                                                                                                    self.confirmOrderViewModel.orderModel.goodsName,
                                                                                                    self.confirmOrderViewModel.orderModel.goodsId,
                                                                                                    [NSString stringWithFormat:@"%@/detail/detail.html?params=%@",
                                                                                                     BASE_M_URL,
                                                                                                     self.confirmOrderViewModel.orderModel.goodsId]]];

                                              }];
    [[YBGoodsDeatilNaviMoreView share] popView];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.myMaskView.frame = CGRectMake(0, 0, self.contentTableView.width, self.contentTableView.height + ADJUST_PERCENT_FLOAT(20.f));
}

#pragma mark - Sixth.界面配置

- (void)registerSubViews
{
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBConfirmOrderDefaultCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBConfirmOrderViewControllerDefaultCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBConfirmOrderUserInformationCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBConfirmOrderUserInformationCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBConfirmOrderUserInformationTempCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBConfirmOrderUserInformationTempCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBConfirmOrderDetailCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBConfirmOrderDetailCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBConfirmOrderAmontDetailCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBConfirmOrderAmontDetailCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBConfirmAgreementCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBConfirmAgreementCellReuseIdentifier];
    [self.contentTableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBConfirmDepositCell class])
                                                      bundle:nil]
                forCellReuseIdentifier:YBConfirmDepositCellReuseIdentifier];
}

#pragma mark - Seventh.懒加载

- (ZJBaseTableView *)contentTableView
{
    if (!_contentTableView) {
        _contentTableView = [[ZJBaseTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _contentTableView.sectionHeaderHeight = ADJUST_PERCENT_FLOAT(10.f);
        _contentTableView.sectionFooterHeight = 0.1f;
        _contentTableView.dataSource = self;
        _contentTableView.delegate = self;
        _contentTableView.backgroundColor = ZJCOLOR.color_c12;
    }
    return _contentTableView;
}

- (ZJBaseView *)bottomFuncView
{
    if (!_bottomFuncView) {
        
        _bottomFuncView                         = [[ZJBaseView alloc] init];
        YBAttributedStringLabel *amontLabel     = [[YBAttributedStringLabel alloc] init];
        _amontLabel                             = amontLabel;
        YBDefaultButton *submitButton           = [YBDefaultButton buttonFourthWithTitleStringKey:@"提交订单"
                                                                                       titleColor:ZJCOLOR.color_c0
                                                                                        titleFont:SYSTEM_REGULARFONT(18.f)
                                                                                           target:self
                                                                                         selector:@selector(submitButtonClick:)];
        [_bottomFuncView addSubview:amontLabel];
        [_bottomFuncView addSubview:submitButton];
        
        [amontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(_bottomFuncView);
            make.left.mas_equalTo(_bottomFuncView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
        }];
        
        [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(amontLabel.mas_right);
            make.right.top.bottom.mas_equalTo(_bottomFuncView);
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(130.f));
        }];
        
    }
    return _bottomFuncView;
}

@end
