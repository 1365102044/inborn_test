//
//  YBConfirmOrderViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmOrderViewModel.h"
#import "YBConfirmOrderModel.h"
#import "YBOrderService.h"
#import "YBAddressAndPickpersonService.h"
#import "YBTopAlert.h"

@interface YBConfirmOrderViewModel()

/**
 *  用户选中的自提地址
 */
@property (nonatomic, strong) YBAddressAndPickPersonModel *pickUpAddressModel;

/**
 *  用户选中的物流地址
 */
@property (nonatomic, strong) YBAddressAndPickPersonModel *logisticsAddressModel;

@end

@implementation YBConfirmOrderViewModel

- (void)setUserInputIdCardNumber:(NSString *)userInputIdCardNumber
{
    _userInputIdCardNumber = userInputIdCardNumber;
    
    self.orderModel.addrIdcard = userInputIdCardNumber;
    [self setupDataArray];
}

- (void)setLogisticsAddressModel:(YBAddressAndPickPersonModel *)logisticsAddressModel
{
    _logisticsAddressModel = logisticsAddressModel;
    
    [self setupOrderModelWithAddressModel:logisticsAddressModel];
}

- (void)setPickUpAddressModel:(YBAddressAndPickPersonModel *)pickUpAddressModel
{
    _pickUpAddressModel = pickUpAddressModel;
    
    [self setupOrderModelWithAddressModel:pickUpAddressModel];
}

- (void)setupOrderModelWithAddressModel:(YBAddressAndPickPersonModel *)addressModel
{
    self.orderModel.addrId = addressModel.customId;
    self.orderModel.addrCity = addressModel.addrCity;
    self.orderModel.addrName = addressModel.addrName;
    self.orderModel.addrProv = addressModel.addrProv;
    self.orderModel.addrCounty = addressModel.addrCounty;
    self.orderModel.addrDetail = addressModel.addrDetail;
    self.orderModel.addrIdcard = addressModel.addrIdcard;
    self.orderModel.addrMobile = addressModel.addrMobile;
}

/**
 *  配置用户选中的地址
 *
 *  @param addressModel 地址模型
 */
- (void)setupUserSelectedAddressModel:(YBAddressAndPickPersonModel *)addressModel
{
    self.orderModel.hasAddress = 1;
    if (addressModel.addrType == 1) {
        self.logisticsAddressModel = addressModel;
    }
    
    if (addressModel.addrType == 2) {
        self.pickUpAddressModel = addressModel;
    }
    
    [self setupDataArray];
}

/**
 *  配置用户从列表选中地址
 *
 *  @param addressModel 地址模型
 */
- (void)setupFromListUserSelectedAddressModel:(YBAddressAndPickPersonModel *)addressModel
                              successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
{
    /**
     *  查询是否有此地址
     */
    if ([self.orderModel.deliveryType isEqualToString:@"1"]
        && !addressModel) {
        
        /**
         *  物流
         */
        [[YBAddressAndPickpersonService share] getAddressOrPickpersonListInfoWithcurPage:1
                                                                                pageSize:100
                                                                             addressType:@"1"
                                                                                 Success:^(id objc, id requestInfo) {
                                                                                     
                                                                                     /**
                                                                                      *  判断是否有地址，如果有配置数据，如果没有，模型配置为无地址
                                                                                      */
                                                                                     [self checkIsContainCurrentAddressModel:self.logisticsAddressModel obj:objc];
                                                                                     [self setupDataArray];
                                                                                     successCallBack(nil);
                                                                                 } fail:^(id error, id requestInfo) {
                                                                                     
                                                                                 }];
    }
    
    if ([self.orderModel.deliveryType isEqualToString:@"1"]
        && addressModel) {
        self.logisticsAddressModel = addressModel;
        [self setupDataArray];
        successCallBack(nil);
        
    }
    
    if ([self.orderModel.deliveryType isEqualToString:@"0"]
        && !addressModel) {
        
        /**
         *  自提
         */
        [[YBAddressAndPickpersonService share] getAddressOrPickpersonListInfoWithcurPage:1
                                                                                pageSize:100
                                                                             addressType:@"2"
                                                                                 Success:^(id objc, id requestInfo) {
                                                                                     
                                                                                     /**
                                                                                      *  判断是否有地址，如果有配置数据，如果没有，模型配置为无地址
                                                                                      */
                                                                                     [self checkIsContainCurrentAddressModel:self.pickUpAddressModel obj:objc];
                                                                                     [self setupDataArray];
                                                                                     successCallBack(nil);
                                                                                 } fail:^(id error, id requestInfo) {
                                                                                     
                                                                                 }];
    }
    
    if ([self.orderModel.deliveryType isEqualToString:@"0"]
        && addressModel) {
        self.pickUpAddressModel = addressModel;
        [self setupDataArray];
        successCallBack(nil);
    }
}

/**
 检查是否包含当前地址
 
 @param addressModel    addressModel
 @param obj             obj
 */
- (void)checkIsContainCurrentAddressModel:(YBAddressAndPickPersonModel *)addressModel
                                      obj:(NSDictionary *)obj
{
    YBPageDataModel *pageModel = [YBPageDataModel modelWithDictionary:obj[@"data"]];
    if ([pageModel.totalRows isEqualToString:@"0"]) {
        self.orderModel.hasAddress = 0;
        return;
    }else{
        self.orderModel.hasAddress = 1;
    }
    NSArray *tempArray = obj[@"data"][@"data"];
    __block BOOL currentAddressIsHave = NO;
    [tempArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                            NSUInteger idx,
                                            BOOL * _Nonnull stop) {
        if ([obj[@"addrId"] isEqualToString:addressModel.customId]) {
            *stop = YES;
            currentAddressIsHave = YES;
        }
    }];
    
    if (!currentAddressIsHave) {
        if (addressModel.addrType == 1) {
            self.logisticsAddressModel = [YBAddressAndPickPersonModel modelWithDictionary:tempArray.firstObject];
        }
        
        if (addressModel.addrType == 2) {
            self.pickUpAddressModel = [YBAddressAndPickPersonModel modelWithDictionary:tempArray.firstObject];
        }
    }
}

/**
 *  配置用户选中地配送及支付方式
 *
 *  @param deliveryType             用户选中的配送方式
 *  @param paymentMethod            用户选中的支付方式
 *  @param successCallBack          成功
 */
- (void)setupUserSelectedDeliveryType:(NSString *)deliveryType
                        paymentMethod:(ZJProjectPaymentMethod)paymentMethod
                      successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
{
    self.orderModel.deliveryType = deliveryType;
    self.userCurrentPaymentMethod = paymentMethod;
    
    /**
     *  如果配送方式为自提，网络请求查询自提地址列表
     */
    if ([deliveryType isEqualToString:@"0"]) {
        
        [[YBAddressAndPickpersonService share] getAddressOrPickpersonListInfoWithcurPage:1
                                                                                pageSize:SEVRIES_PAGESIZE
                                                                             addressType:@"2"
                                                                                 Success:^(id objc, id requestInfo) {
                                                                                     
                                                                                     /**
                                                                                      *  判断是否有地址，如果有配置数据，如果没有，模型配置为无地址
                                                                                      */
                                                                                     [self checkPickUpAddressWithData:objc[@"data"]];
                                                                                     successCallBack(nil);
                                                                                 } fail:^(id error, id requestInfo) {
                                                                                     
                                                                                 }];
        return;
    }
    
    /**
     *  物流方式
     */
    if ([deliveryType isEqualToString:@"1"]) {
        
        /**
         *  判断是否有地址
         */
        if (self.logisticsAddressModel) {
            self.orderModel.hasAddress = 1;
        }else{
            self.orderModel.hasAddress = 0;
        }
        
        /**
         *  配置第一组第一行数据，地址行联动
         */
        [self setupOrderModelWithAddressModel:self.logisticsAddressModel];
        [self setupDataArray];
        //        NSArray *tempArray = self.dataModelArray.firstObject[@"data"];
        //        YBConfirmOrderModel *section1Row1 = tempArray.firstObject;
        //        section1Row1.detailTitle = [NSString stringWithFormat:@"%@ %zd", deliveryType,
        //                                    paymentMethod];
        successCallBack(nil);
        
    }
}

/**
 配置自提地址
 
 @param data data
 */
- (void)checkPickUpAddressWithData:(id)data
{
    YBPageDataModel *pageModel = [YBPageDataModel modelWithDictionary:data];
    if ([pageModel.totalRows isEqualToString:@"0"]) {
        self.orderModel.hasAddress = 0;
    }else{
        
        self.orderModel.hasAddress = 1;
        NSArray *tempArray = data[@"data"];
        NSDictionary *addressDict = tempArray.firstObject;
        
        /**
         *  界面赋值
         */
        YBAddressAndPickPersonModel *addressModel = [[YBAddressAndPickPersonModel alloc] init];
        addressModel.customId = addressDict[@"id"];
        addressModel.addrCity = addressDict[@"addrCity"];
        addressModel.addrName = addressDict[@"addrName"];
        addressModel.addrProv = addressDict[@"addrProv"];
        addressModel.addrCounty = addressDict[@"addrCounty"];
        addressModel.addrDetail = addressDict[@"addrDetail"];
        addressModel.addrIdcard = addressDict[@"addrIdcard"];
        addressModel.addrMobile = addressDict[@"addrMobile"];
        self.pickUpAddressModel = addressModel;
        
    }
    [self setupDataArray];
}

/**
 *  确认订单网络请求
 *
 *  @param goodId              商品id
 *  @param successCallBack     成功
 *  @param failureCallBack     失败
 */
- (void)confirmOrderWithGoodId:(NSString *)goodId
               successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
               failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    WEAKSELF(self);
    [[YBOrderService share] confirmOrderWithGoodId:goodId success:^(id objc, id requestInfo) {
        
        /**
         *  处理返回数据
         */
        [self configDataModelArrayWithData:objc[@"data"]];
        successCallBack(weakself);
        
    } fail:^(id error, id requestInfo) {
        [self handleRequestFailed:error];
        failureCallBack(error);
    }];
}

/**
 *  确认订单网络请求
 *
 *  @param successCallBack     成功
 *  @param failureCallBack     失败
 */
- (void)creatOrderSuccessCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
                  failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    /**
     *  用户选中的地址有值时，使用该地址
     *  为空时，判断是否有服务器返回的收货地址
     */
    
    if (self.orderModel.hasAddress == 0) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:@"请选择地址"
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        return;
    }
    
    if (self.userCurrentPaymentMethod == 2) {
        
        YBConfirmOrderModel *agreementModel = self.dataModelArray[2][@"data"][0];
        
        if (!agreementModel.isDepositAgreementSwitch) {
            
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                    tipsStringKey:@"请同意定金支付协议"
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
            return;
        }
    }
    
    [[YBOrderService share] creatOrderWithGoodId:self.orderModel.goodsId
                                    deliveryType:self.orderModel.deliveryType
                                    orderPayType:[NSString stringWithFormat:@"%zd", self.userCurrentPaymentMethod == 0 ? 1 : self.userCurrentPaymentMethod]
                                       addressId:[NSString stringWithFormat:@"%@", self.orderModel.addrId]
                                       channelId:@"1"
                                         success:^(id objc, id requestInfo) {
                                             successCallBack(objc[@"data"]);
                                         } fail:^(id error, id requestInfo) {
                                             YBLog(@"%@\n%@", error, requestInfo);
                                         }];
}

/**
 服务器返回数据处理
 
 @param data 服务器返回数据
 */
- (void)configDataModelArrayWithData:(NSDictionary *)data
{
    self.orderModel = [YBConfirmOrderModel modelWithDictionary:data];
    
    if (self.orderModel.hasAddress == 1) {
        _logisticsAddressModel = [[YBAddressAndPickPersonModel alloc] init];
        self.logisticsAddressModel.customId = self.orderModel.addrId;
        self.logisticsAddressModel.addrCity = self.orderModel.addrCity;
        self.logisticsAddressModel.addrName = self.orderModel.addrName;
        self.logisticsAddressModel.addrProv = self.orderModel.addrProv;
        self.logisticsAddressModel.addrCounty = self.orderModel.addrCounty;
        self.logisticsAddressModel.addrDetail = self.orderModel.addrDetail ;
        self.logisticsAddressModel.addrIdcard = self.orderModel.addrIdcard;
        self.logisticsAddressModel.addrMobile = self.orderModel.addrMobile;
    }
    
    [self setupDataArray];
}

/**
 配置界面
 */
- (void)setupDataArray
{
    /**
     *  根据数据配置数组
     */
    NSMutableArray *tempArrayM = [NSMutableArray array];
    
    YBConfirmOrderModel *section1Row1 = [[YBConfirmOrderModel alloc] init];
    section1Row1.title = ZJSTRING(@"付款和配送");
    section1Row1.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
    section1Row1.cellReID = @"YBConfirmOrderViewControllerDefaultCellReuseIdentifier";
    if (self.userCurrentPaymentMethod) {
        if (self.userCurrentPaymentMethod == 1) {
            if ([self.orderModel.deliveryType isEqualToString: @"0"]) {
                section1Row1.detailTitle = ZJSTRING(@"来店自提 全额支付");
            }
            
            if ([self.orderModel.deliveryType isEqualToString: @"1"]) {
                section1Row1.detailTitle = ZJSTRING(@"快递送货 全额支付");
            }
        }else if (self.userCurrentPaymentMethod == 2) {
            if ([self.orderModel.deliveryType isEqualToString: @"0"]) {
                section1Row1.detailTitle = ZJSTRING(@"来店自提 定金支付");
            }
            
            if ([self.orderModel.deliveryType isEqualToString: @"1"]) {
                section1Row1.detailTitle = ZJSTRING(@"快递送货 定金支付");
            }
        }else if (self.userCurrentPaymentMethod == 3) {
            if ([self.orderModel.deliveryType isEqualToString: @"0"]) {
                section1Row1.detailTitle = ZJSTRING(@"来店自提 分笔支付");
            }
            
            if ([self.orderModel.deliveryType isEqualToString: @"1"]) {
                section1Row1.detailTitle = ZJSTRING(@"快递送货 分笔支付");
            }
        }else if (self.userCurrentPaymentMethod == 4) {
            if ([self.orderModel.deliveryType isEqualToString: @"0"]) {
                section1Row1.detailTitle = ZJSTRING(@"来店自提 转账支付");
            }
            
            if ([self.orderModel.deliveryType isEqualToString: @"1"]) {
                section1Row1.detailTitle = ZJSTRING(@"快递送货 转账支付");
            }
        }else if (self.userCurrentPaymentMethod == 5) {
            if ([self.orderModel.deliveryType isEqualToString: @"0"]) {
                section1Row1.detailTitle = ZJSTRING(@"来店自提 订金+刷卡");
            }
            
            if ([self.orderModel.deliveryType isEqualToString: @"1"]) {
                section1Row1.detailTitle = ZJSTRING(@"快递送货 订金+刷卡");
            }
        }
        
    }else{
        section1Row1.detailTitle = ZJSTRING(@"快递送货 全额支付");
    }
    section1Row1.isShowAccessImageView = YES;
    [tempArrayM addObject:section1Row1];
    
    YBConfirmOrderModel *section1Row2 = [[YBConfirmOrderModel alloc] init];
    /**
     *  根据自提和收货的不同，展示不同的文字
     */
    section1Row2.title = ZJSTRING(@"收货人信息");
    section1Row2.rowHeight = ADJUST_PERCENT_FLOAT(102.f);
    /**
     *  判断是否有地址，如果有展示地址
     *  0表示无地址 1表示有地址
     */
    if (self.orderModel.hasAddress == 1) {
        section1Row2.cellReID = @"YBConfirmOrderUserInformationCellReuseIdentifier";
    }else{
        section1Row2.cellReID = @"YBConfirmOrderUserInformationTempCellReuseIdentifier";
    }
    section1Row2.detailTitle = ZJSTRING(@"请选择");
    section1Row2.deliveryType = self.orderModel.deliveryType;
    section1Row2.addrId = self.orderModel.addrId;
    section1Row2.addrCity = self.orderModel.addrCity;
    section1Row2.addrName = self.orderModel.addrName;
    section1Row2.addrProv = self.orderModel.addrProv;
    section1Row2.addrCounty = self.orderModel.addrCounty;
    section1Row2.addrDetail = self.orderModel.addrDetail;
    section1Row2.addrIdcard = self.orderModel.addrIdcard;
    section1Row2.addrMobile = self.orderModel.addrMobile;
    
    [tempArrayM addObject:section1Row2];
    
    /**
     *  如果地址展示空视图，同时，不展示身份证号码
     *  如果为自提物流方式，不展示身份证
     */
    if ([section1Row2.cellReID isEqualToString:@"YBConfirmOrderUserInformationCellReuseIdentifier"]
        && ![self.orderModel.deliveryType isEqualToString:@"0"]) {
        
        YBConfirmOrderModel *section1Row3 = [[YBConfirmOrderModel alloc] init];
        /**
         *  身份证号码
         */
        section1Row3.title = ZJSTRING(@"身份证号码");
        section1Row3.rowHeight = ADJUST_PERCENT_FLOAT(50.f);
        section1Row3.cellReID = @"YBConfirmOrderViewControllerDefaultCellReuseIdentifier";
        /**
         *  身份证号码
         */
        if (!self.orderModel.addrIdcard
            || [self.orderModel.addrIdcard ex_isEmpty]) {
            section1Row3.detailTitle = ZJSTRING(@"请输入收件人证件号码");
        }else{
            section1Row3.detailTitle = self.orderModel.addrIdcard;
        }
        
        section1Row3.isShowAccessImageView = NO;
        section1Row3.isIdCardCell = YES;
        section1Row3.addrIdcard = self.orderModel.addrIdcard;
        section1Row3.deliveryType = self.orderModel.deliveryType;
        [tempArrayM addObject:section1Row3];
        
    }
    
    YBConfirmOrderModel *section2Row1 = [[YBConfirmOrderModel alloc] init];
    /**
     *  需根据商品数量展示
     */
    section2Row1.title = [NSString stringWithFormat:@"%@%@",
                          self.orderModel.goodsNum,
                          ZJSTRING(@"件商品")];
    section2Row1.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
    section2Row1.cellReID = @"YBConfirmOrderViewControllerDefaultCellReuseIdentifier";
    section2Row1.isShowAccessImageView = NO;
    section2Row1.isHiddenDetailLabel = YES;
    
    YBConfirmOrderModel *section2Row2 = [[YBConfirmOrderModel alloc] init];
    /**
     *  商品名称
     */
    section2Row2.rowHeight = ADJUST_PERCENT_FLOAT(102.f);
    section2Row2.cellReID = @"YBConfirmOrderDetailCellReuseIdentifier";
    section2Row2.goodsName = self.orderModel.goodsName;
    section2Row2.mallPrice = self.orderModel.mallPrice;
    section2Row2.squareImage = self.orderModel.squareImage;
    
    YBConfirmOrderModel *section2Row3 = [[YBConfirmOrderModel alloc] init];
    section2Row3.rowHeight = ADJUST_PERCENT_FLOAT(130.f);
    section2Row3.cellReID = @"YBConfirmOrderAmontDetailCellReuseIdentifier";
    section2Row3.orderTotalAmount = self.orderModel.orderTotalAmount;
    section2Row3.logisticsMoney = self.orderModel.logisticsMoney;
    section2Row3.discountMoney = self.orderModel.discountMoney;
    section2Row3.alreadyPayAmount = self.orderModel.alreadyPayAmount;
    section2Row3.insuredMoney = self.orderModel.insuredMoney;
    section2Row3.mallPrice = self.orderModel.mallPrice;
    
    YBConfirmOrderModel *section2Row4 = [[YBConfirmOrderModel alloc] init];
    section2Row4.title = ZJSTRING(@"待付金额");
    section2Row4.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
    section2Row4.cellReID = @"YBConfirmOrderViewControllerDefaultCellReuseIdentifier";
    section2Row4.unpaidAmount = self.orderModel.unpaidAmount;
    /**
     *  价格
     */
    section2Row4.isShowAccessImageView = NO;
    section2Row4.isDetailAmont = YES;
    
    /**
     *  当为定金方式时，展示
     */
    YBConfirmOrderModel *section3Row1 = [[YBConfirmOrderModel alloc] init];
    section3Row1.title = ZJSTRING(@"我已同意定金不退等平台服务协议");
    section3Row1.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
    section3Row1.cellReID = @"YBConfirmAgreementCellReuseIdentifier";
    section3Row1.isShowAccessImageView = YES;
    section3Row1.isDepositAgreementSwitch = YES;
    
    YBConfirmOrderModel *section3Row2 = [[YBConfirmOrderModel alloc] init];
    section3Row2.title = ZJSTRING(@"需付定金");
    section3Row2.detailTitle = ZJSTRING(@"下单后需在48小时之内支付尾款");
    section3Row2.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
    section3Row2.cellReID = @"YBConfirmDepositCellReuseIdentifier";
    section3Row2.depositPrice = self.orderModel.depositPrice;
    
    /**
     *  当为定金支付时，展示定金选项
     */
    if (self.userCurrentPaymentMethod == ZJProjectPaymentMethodDeposit) {
        
        _dataModelArray = @[@{@"data":tempArrayM.copy},
                            @{@"data":@[section2Row1,
                                        section2Row2,
                                        section2Row3,
                                        section2Row4]},
                            @{@"data":@[section3Row1,
                                        section3Row2]}];
        section3Row2.hiddenBottomLine = YES;
    }else{
        
        _dataModelArray = @[@{@"data":tempArrayM.copy},
                            @{@"data":@[section2Row1,
                                        section2Row2,
                                        section2Row3,
                                        section2Row4]}];
    }
    
    /**
     *  消除最后一个cell的底边线
     */
    YBConfirmOrderModel *confirmOrderModelSection1 = tempArrayM.lastObject;
    confirmOrderModelSection1.hiddenBottomLine = YES;
    
    section2Row4.hiddenBottomLine = YES;
}

/**
 *  设置用户身份证号
 *
 *  @param idNumber                idNumber
 *  @param successCallBack         成功
 *  @param failureCallBack         失败
 */
- (void)setupUserIdNumber:(NSString *)idNumber
          successCallBack:(ZJViewModelCallBackSuccessBlock)successCallBack
          failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBOrderService share] setIdCardAddressId:self.orderModel.addrId
                                        idCard:idNumber
                                       success:^(id objc, id requestInfo) {
                                           successCallBack(objc);
                                       } fail:^(id error, id requestInfo) {
                                           failureCallBack(nil);
                                       }];
}

/**
 当前应支付的金额
 
 @return 应支付的金额，分为单位
 */
- (NSString *)currentPrice
{
    if (self.userCurrentPaymentMethod == 1) {
        _currentPrice = self.orderModel.unpaidAmount;
    }else if (self.userCurrentPaymentMethod == 2) {
        _currentPrice = self.orderModel.depositPrice;
    }else if (self.userCurrentPaymentMethod == 3) {
        _currentPrice = self.orderModel.unpaidAmount;
    }else{
        _currentPrice = self.orderModel.unpaidAmount;
    }
    
    return _currentPrice;
}

@end
