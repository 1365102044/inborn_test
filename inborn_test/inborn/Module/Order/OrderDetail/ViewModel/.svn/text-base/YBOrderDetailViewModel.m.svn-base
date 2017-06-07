//
//  YBOrderDetailViewModel.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailViewModel.h"
#import "YBOrderService.h"
#import "YBStringTool.h"
#import "ZJTimerManager.h"

@interface YBOrderDetailViewModel()

/**
 倒计时计算时间
 */
@property (nonatomic, assign) NSTimeInterval surplusBidTime;

@end

@implementation YBOrderDetailViewModel

- (void)setOrderPayType:(NSInteger)orderPayType
{
    _orderPayType = orderPayType;
    self.orderDetailModel.orderPayType = orderPayType;
    
    [self setupDataArray];
}

- (NSArray<NSDictionary *> *)dataArray
{
    if (!_dataArray) {
        [self setupDataArray];
    }
    return _dataArray;
}

- (void)setupDataArray
{
    @autoreleasepool {
        
        YBOrderDetailModel *section1Row1 = [YBOrderDetailModel new];
        section1Row1.cellReID = @"YBOrderDetailStatusCellReuseIdentifier";
        
        YBOrderDetailModel *section1Row2 = [YBOrderDetailModel new];
        section1Row2.cellReID = @"YBOrderDetailUserInformationCellReuseIdentifier";
        section1Row2.rowHeight = ADJUST_PERCENT_FLOAT(101.5f);
        section1Row2.deliveryType = self.orderDetailModel.deliveryType;
        
        
        YBOrderDetailModel *section2Row1 = [YBOrderDetailModel new];
        section2Row1.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
        section2Row1.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
        section2Row1.title = [NSString stringWithFormat:@"%@%@",
                              self.orderDetailModel.goodsNum,
                              ZJSTRING(@"件商品")];
        
        YBOrderDetailModel *section2Row2 = [YBOrderDetailModel new];
        section2Row2.cellReID = @"YBOrderDetailCellReuseIdentifier";
        section2Row2.rowHeight = ADJUST_PERCENT_FLOAT(101.f);
        section2Row2.goodsName = self.orderDetailModel.goodsName;
        section2Row2.goodsImage = self.orderDetailModel.goodsImage;
        section2Row2.orderTotalAmount = self.orderDetailModel.orderTotalAmount;
        section2Row2.logisticsMoney = self.orderDetailModel.logisticsMoney;
        section2Row2.discountMoney = self.orderDetailModel.discountMoney;
        section2Row2.alreadyPayAmount = self.orderDetailModel.alreadyPayAmount;
        section2Row2.insuredMoney = self.orderDetailModel.insuredMoney;
        section2Row2.goodsPrice = self.orderDetailModel.goodsPrice;
        
        YBOrderDetailModel *section2Row3 = [YBOrderDetailModel new];
        section2Row3.cellReID = @"YBOrderDetailAmontDetailCellReuseIdentifier";
        section2Row3.rowHeight = ADJUST_PERCENT_FLOAT(130.f);
        section2Row3.orderTotalAmount = self.orderDetailModel.orderTotalAmount;
        section2Row3.logisticsMoney = self.orderDetailModel.logisticsMoney;
        section2Row3.discountMoney = self.orderDetailModel.discountMoney;
        section2Row3.alreadyPayAmount = self.orderDetailModel.alreadyPayAmount;
        section2Row3.insuredMoney = self.orderDetailModel.insuredMoney;
        section2Row3.goodsPrice = self.orderDetailModel.goodsPrice;
        
        YBOrderDetailModel *section2Row4 = [YBOrderDetailModel new];
        section2Row4.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
        section2Row4.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
        section2Row4.showAccessImageView = NO;
        section2Row4.showDetailLabel = YES;
        section2Row4.title = ZJSTRING(@"待付金额");
        section2Row4.showAmont = YES;
        section2Row4.detailTitle = [[YBStringTool share] strmethodCommaWith:self.orderDetailModel.unpaidAmount];
        
        
        YBOrderDetailModel *section3Row1 = [YBOrderDetailModel new];
        section3Row1.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
        section3Row1.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
        section3Row1.showDetailLabel = YES;
        section3Row1.title = ZJSTRING(@"付款方式");
        section3Row1.detailsShowStatus = self.orderDetailModel.detailsShowStatus;
        section3Row1.detailTitle = self.orderDetailModel.orderPayTypeString;
        section3Row1.isAllowDepositPay = self.orderDetailModel.isAllowDepositPay;
        section3Row1.orderPayType = self.orderDetailModel.orderPayType;
        
        YBOrderDetailModel *section3Row2 = [YBOrderDetailModel new];
        section3Row2.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
        section3Row2.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
        section3Row2.showAccessImageView = YES;
        section3Row2.showDetailLabel = YES;
        section3Row2.title = ZJSTRING(@"支付记录");
        section3Row2.detailTitle = ZJSTRING(@"查看明细");
        
        /**
         *  第四组数据需根据当前各状态时间判断
         */
        YBOrderDetailModel *section4Row1 = [YBOrderDetailModel new];
        section4Row1.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
        section4Row1.rowHeight = ADJUST_PERCENT_FLOAT(46.f);
        section4Row1.showAccessImageView = NO;
        section4Row1.showDetailLabel = YES;
        section4Row1.title = ZJSTRING(@"订单编号");
        section4Row1.detailTitle = self.orderDetailModel.orderId;;
        
        //** =========================================================================================== */
        //** ==========================================业务判断========================================= */
        //** =========================================================================================== */
        [self setupStatusModel:section1Row1];
        
        NSMutableArray *section1TempArray = [NSMutableArray array];
        [section1TempArray addObject:section1Row1];
        [section1TempArray addObject:section1Row2];
        
        if ([self.orderDetailModel.deliveryType isEqualToString:@"1"]) {
            
            section1Row2.addrName = self.orderDetailModel.orderConsignee.consigneeName;
            section1Row2.addrMobile = self.orderDetailModel.orderConsignee.consigneeMobile;
            section1Row2.addrProv = self.orderDetailModel.orderConsignee.consigneeProvince;
            section1Row2.addrCity = self.orderDetailModel.orderConsignee.consigneeCity;
            section1Row2.addrCounty = self.orderDetailModel.orderConsignee.consigneeCounty;
            section1Row2.addrDetail = self.orderDetailModel.orderConsignee.consigneeAddressDetail;
            section1Row2.rowHeight = ADJUST_PERCENT_FLOAT(102.f);
            
        }else{
            
            section1Row2.addrName = self.orderDetailModel.orderConsignee.consigneeName;
            section1Row2.addrMobile = self.orderDetailModel.orderConsignee.consigneeMobile;
            section1Row2.addrProv = self.orderDetailModel.orderConsignee.consigneeProvince;
            section1Row2.addrCity = self.orderDetailModel.orderConsignee.consigneeCity;
            section1Row2.addrCounty = self.orderDetailModel.orderConsignee.consigneeCounty;
            section1Row2.addrDetail = self.orderDetailModel.orderConsignee.consigneeAddressDetail;
            section1Row2.rowHeight = ADJUST_PERCENT_FLOAT(124.f);
            
            YBOrderDetailModel *section1Row3 = [YBOrderDetailModel new];
            section1Row3.cellReID = @"YBOrderDetailPickAddressCellReuseIdentifier";
            section1Row3.addrName = self.orderDetailModel.orderPickup.pickupName;
            section1Row3.addrIdcard = self.orderDetailModel.orderPickup.pickupIdcard;
            section1Row3.addrMobile = self.orderDetailModel.orderPickup.pickupMobile;
            section1Row3.rowHeight = ADJUST_PERCENT_FLOAT(102.f);
            [section1TempArray addObject:section1Row3];
        }
        
        /**
         *  快递
         *  判断是否状态是否需要展示物流信息
         */
        if (self.orderDetailModel.detailsShowStatus == 40
            || self.orderDetailModel.detailsShowStatus == 50
            || self.orderDetailModel.detailsShowStatus == 60) {
            
            YBOrderDetailModel *section1Row4 = [YBOrderDetailModel new];
            section1Row4.cellReID = @"YBOrderDetailLogisticsCellReuseIdentifier";
            section1Row4.rowHeight = ADJUST_PERCENT_FLOAT(100.f);
            section1Row4.deliveryMerchant = self.orderDetailModel.deliveryMerchant;
            section1Row4.deliveryNum = self.orderDetailModel.deliveryNum;
            section1Row4.routes = self.orderDetailModel.routes;
            section1Row4.deliveryType = self.orderDetailModel.deliveryType;
            [section1TempArray addObject:section1Row4];
            
        }else if (self.orderDetailModel.detailsShowStatus == 31
                  || self.orderDetailModel.detailsShowStatus == 41
                  || self.orderDetailModel.detailsShowStatus == 51
                  || self.orderDetailModel.detailsShowStatus == 61) {
        }
        
        /**
         *  判断是否有有时间展示
         */
        NSMutableArray *section4TempArrayM = [NSMutableArray array];
        [section4TempArrayM addObject:section4Row1];
        
        if (self.orderDetailModel.createTime) {
            
            YBOrderDetailModel *section4Row2 = [YBOrderDetailModel new];
            section4Row2.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
            section4Row2.rowHeight = ADJUST_PERCENT_FLOAT(26.f);
            section4Row2.showAccessImageView = NO;
            section4Row2.showTime = YES;
            section4Row2.hiddenBottomMarginLine = YES;
            section4Row2.title = [NSString stringWithFormat:@"%@：%@",
                                  ZJSTRING(@"创建时间"),
                                  [NSDate ex_stringWithDate:self.orderDetailModel.createTime formatterString:@"yyyy.MM.dd HH:mm:ss" timeZoneStr:@"Asia/Shanghai"]];
            [section4TempArrayM addObject:section4Row2];
            
        }
        
        if (self.orderDetailModel.payedTime) {
            
            YBOrderDetailModel *section4Row3 = [YBOrderDetailModel new];
            section4Row3.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
            section4Row3.rowHeight = ADJUST_PERCENT_FLOAT(26.f);
            section4Row3.showAccessImageView = NO;
            section4Row3.showTime = YES;
            section4Row3.hiddenBottomMarginLine = YES;
            section4Row3.title = [NSString stringWithFormat:@"%@：%@",
                                  ZJSTRING(@"付款时间"),
                                  [NSDate ex_stringWithDate:self.orderDetailModel.payedTime formatterString:@"yyyy.MM.dd HH:mm:ss" timeZoneStr:@"Asia/Shanghai"]];
            [section4TempArrayM addObject:section4Row3];
            
        }
        
        if (self.orderDetailModel.deliveryTime) {
            
            YBOrderDetailModel *section4Row4 = [YBOrderDetailModel new];
            section4Row4.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
            section4Row4.rowHeight = ADJUST_PERCENT_FLOAT(26.f);
            section4Row4.showAccessImageView = NO;
            section4Row4.showTime = YES;
            section4Row4.hiddenBottomMarginLine = YES;
            section4Row4.title = [NSString stringWithFormat:@"%@：%@",
                                  ZJSTRING(@"发货时间"),
                                  [NSDate ex_stringWithDate:self.orderDetailModel.deliveryTime formatterString:@"yyyy.MM.dd HH:mm:ss" timeZoneStr:@"CCDAsia/Shanghai"]];
            [section4TempArrayM addObject:section4Row4];
            
        }
        
        if (self.orderDetailModel.consigneeTime) {
            
            YBOrderDetailModel *section4Row5 = [YBOrderDetailModel new];
            section4Row5.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
            section4Row5.rowHeight = ADJUST_PERCENT_FLOAT(26.f);
            section4Row5.showAccessImageView = NO;
            section4Row5.showTime = YES;
            section4Row5.hiddenBottomMarginLine = YES;
            NSString *timeTitleString;
            if ([self.orderDetailModel.deliveryType isEqualToString:@"1"]) {
                timeTitleString = ZJSTRING(@"签收时间");
            }else{
                timeTitleString = ZJSTRING(@"自提时间");
            }
            section4Row5.title = [NSString stringWithFormat:@"%@：%@",
                                  timeTitleString,
                                  [NSDate ex_stringWithDate:self.orderDetailModel.consigneeTime formatterString:@"yyyy.MM.dd HH:mm:ss" timeZoneStr:@"CCD"]];
            [section4TempArrayM addObject:section4Row5];
            
        }
        
        if (self.orderDetailModel.cancelTime) {
            
            YBOrderDetailModel *section4Row6 = [YBOrderDetailModel new];
            section4Row6.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
            section4Row6.rowHeight = ADJUST_PERCENT_FLOAT(26.f);
            section4Row6.showAccessImageView = NO;
            section4Row6.showTime = YES;
            section4Row6.hiddenBottomMarginLine = YES;
            section4Row6.title = [NSString stringWithFormat:@"%@：%@",
                                  ZJSTRING(@"取消时间"),
                                  [NSDate ex_stringWithDate:self.orderDetailModel.cancelTime formatterString:@"yyyy.MM.dd HH:mm:ss" timeZoneStr:@"CCD"]];
            [section4TempArrayM addObject:section4Row6];
            
        }
        
        if (self.orderDetailModel.finishTime) {
            
            YBOrderDetailModel *section4Row7 = [YBOrderDetailModel new];
            section4Row7.cellReID = @"YBOrderDetailDefaultCellReuseIdentifier";
            section4Row7.rowHeight = ADJUST_PERCENT_FLOAT(26.f);
            section4Row7.showAccessImageView = NO;
            section4Row7.showTime = YES;
            section4Row7.hiddenBottomMarginLine = YES;
            section4Row7.title = [NSString stringWithFormat:@"%@：%@",
                                  ZJSTRING(@"完成时间"),
                                  [NSDate ex_stringWithDate:self.orderDetailModel.finishTime formatterString:@"yyyy.MM.dd HH:mm:ss" timeZoneStr:@"CCD"]];
            [section4TempArrayM addObject:section4Row7];
            
        }
        
        /**
         *  判断支付方式
         */
        if (self.orderDetailModel.orderPayType == 1) {
            section3Row1.detailTitle = ZJSTRING(@"全额支付");
        }else if (self.orderDetailModel.orderPayType == 2) {
            section3Row1.detailTitle = ZJSTRING(@"定金支付");
        }else if (self.orderDetailModel.orderPayType == 3) {
            section3Row1.detailTitle = ZJSTRING(@"分笔支付");
        }
        
        /**
         *  是否可以切换支付方式
         */
        if (self.orderDetailModel.detailsShowStatus == 10) {
            
            section3Row1.showAccessImageView = YES;
        }else{
            section3Row1.showAccessImageView = NO;
        }
        
        /**
         *  清除最底部边线
         */
        YBOrderDetailModel *orderDetailModelSection1 = section1TempArray.lastObject;
        orderDetailModelSection1.hiddenBottomMarginLine = YES;
        
        YBOrderDetailModel *orderDetailModelSection4 = section4TempArrayM.lastObject;
        orderDetailModelSection4.hiddenBottomMarginLine = YES;
        
        section2Row4.hiddenBottomMarginLine = YES;
        section3Row2.hiddenBottomMarginLine = YES;
        
        //** =========================================================================================== */
        //** ==========================================业务判断========================================= */
        //** =========================================================================================== */
        
        _dataArray = @[@{@"data":section1TempArray.copy},
                       @{@"data":@[section2Row1,
                                   section2Row2,
                                   section2Row3,
                                   section2Row4]},
                       @{@"data":@[section3Row1,
                                   section3Row2]},
                       @{@"data":section4TempArrayM.copy}];
    }
}

/**
 配置当前订单状态
 
 @param orderDetailModel 订单详情状态
 */
- (void)setupStatusModel:(YBOrderDetailModel *)orderDetailModel
{
    if (self.orderDetailModel.detailsShowStatus == 10) {
        
        orderDetailModel.title = ZJSTRING(@"等待你付款");
        orderDetailModel.detailTitle = ZJSTRING(@"   后，如果你未付款，订单将自动关闭");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(107.f);
        [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1
                                                         target:self
                                                       selector:@selector(timerEvent:)];
        
    }else if (self.orderDetailModel.detailsShowStatus == 20) {
        
        orderDetailModel.title = ZJSTRING(@"已支付部分货款，等待你支付余款");
        orderDetailModel.detailTitle = ZJSTRING(@"   后，如果你未支付余款，订单将自动关闭");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(116.f);
        [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1
                                                         target:self
                                                       selector:@selector(timerEvent:)];
        
    }else if (self.orderDetailModel.detailsShowStatus == 21) {
        
        orderDetailModel.title = ZJSTRING(@"已支付定金，等待你支付尾款");
        orderDetailModel.detailTitle = [NSString stringWithFormat:@"   后，如果你未支付尾款，订单将自动关闭\n已支付定金¥%@不予退还",
                                        [[YBStringTool share] strmethodCommaWith:self.orderDetailModel.depositPrice]];
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(141.f);
        [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1
                                                         target:self
                                                       selector:@selector(timerEvent:)];
        
    }else if (self.orderDetailModel.detailsShowStatus == 22) {
        
        orderDetailModel.title = ZJSTRING(@"已支付部分货款，等待你支付余款");
        orderDetailModel.detailTitle = [NSString stringWithFormat:@"   后，如果你未付款，订单将自动关闭\n已付定金¥%@不予退还",
                                        [[YBStringTool share] strmethodCommaWith:self.orderDetailModel.depositPrice]];
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(141.f);
        [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1
                                                         target:self
                                                       selector:@selector(timerEvent:)];
        
    }else if (self.orderDetailModel.detailsShowStatus == 30) {
        
        orderDetailModel.title = ZJSTRING(@"已付款，等待发货");
        orderDetailModel.detailTitle = ZJSTRING(@"平台将在付款后48小时内为你安排发货");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(116.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
    }else if (self.orderDetailModel.detailsShowStatus == 31) {
        
        orderDetailModel.title = ZJSTRING(@"已付款，等待配货");
        orderDetailModel.detailTitle = ZJSTRING(@"平台将在付款后48小时内为你安排配货");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(141.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
    }else if (self.orderDetailModel.detailsShowStatus == 40) {
        
        orderDetailModel.title = ZJSTRING(@"平台已发货");
        orderDetailModel.detailTitle = [NSString stringWithFormat:@"已通过%@为你派送商品，请保持手机通畅",
                                        self.orderDetailModel.deliveryMerchant];
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(116.f);
        [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1
                                                         target:self
                                                       selector:@selector(timerEvent:)];
        
    }else if (self.orderDetailModel.detailsShowStatus == 41) {
        
        orderDetailModel.title = ZJSTRING(@"商品已到达自提点");
        orderDetailModel.detailTitle = ZJSTRING(@"请携带本人身份证到自提地址提取你购买的商品，如需其他人代提货，请携带代办人及你本人的身份证");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(141.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
    }else if (self.orderDetailModel.detailsShowStatus == 50) {
        
        orderDetailModel.title = ZJSTRING(@"物流已签收，请确认收货");
        orderDetailModel.detailTitle = ZJSTRING(@"系统将在   后自动确认收货");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(116.f);
        [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1
                                                         target:self
                                                       selector:@selector(timerEvent:)];
        
    }else if (self.orderDetailModel.detailsShowStatus == 51) {
        
        orderDetailModel.title = ZJSTRING(@"买家已取货，请确认收货");
        orderDetailModel.detailTitle = ZJSTRING(@"系统将在   后自动确认收货");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(116.f);
        [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1
                                                         target:self
                                                       selector:@selector(timerEvent:)];
        
    }else if (self.orderDetailModel.detailsShowStatus == 60) {
        
        orderDetailModel.title = ZJSTRING(@"已确认，交易成功");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(85.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
        
    }else if (self.orderDetailModel.detailsShowStatus == 61) {
        
        orderDetailModel.title = ZJSTRING(@"已确认，交易成功");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(85.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
        
    }else if (self.orderDetailModel.detailsShowStatus == 70) {
        
        orderDetailModel.title = ZJSTRING(@"订单已取消");
        orderDetailModel.detailTitle = ZJSTRING(@"你取消了这笔订单");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(107.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
    }else if (self.orderDetailModel.detailsShowStatus == 71) {
        
        orderDetailModel.title = ZJSTRING(@"订单已取消");
        orderDetailModel.detailTitle = ZJSTRING(@"由于您未在约定时间内支付尾款，订单已取消");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(107.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
    }else if (self.orderDetailModel.detailsShowStatus == 72) {
        
        orderDetailModel.title = ZJSTRING(@"订单已取消");
        orderDetailModel.detailTitle = [NSString stringWithFormat:@"由于您未在约定时间内支付尾款，订单已取消\n已支付定金¥%@已按约定扣除",
                                        [[YBStringTool share] strmethodCommaWith:self.orderDetailModel.depositPrice]];
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(132.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
    }else if (self.orderDetailModel.detailsShowStatus == 73) {
        
        orderDetailModel.title = ZJSTRING(@"订单已取消");
        orderDetailModel.detailTitle = [NSString stringWithFormat:@"由于您未在约定时间内支付尾款，订单已取消\n已支付定金¥%@已按约定扣除，已付¥%@可申请退款",
                                        [[YBStringTool share] strmethodCommaWith:self.orderDetailModel.depositPrice],
                                        [[YBStringTool share] strmethodCommaWith:self.orderDetailModel.refundAmount]];
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(150.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
    }else if (self.orderDetailModel.detailsShowStatus == 74) {
        
        orderDetailModel.title = ZJSTRING(@"订单已取消");
        orderDetailModel.detailTitle = [NSString stringWithFormat:@"由于您未在约定时间内支付余款，订单已取消\n已付¥%@可申请退款",
                                        [[YBStringTool share] strmethodCommaWith:self.orderDetailModel.refundAmount]];
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(132.f);
        [[ZJTimerManager shareTimer] stopTimer];
        
    }else if (self.orderDetailModel.detailsShowStatus == 75) {
        
        orderDetailModel.title = ZJSTRING(@"订单已取消");
        orderDetailModel.detailTitle = ZJSTRING(@"鉴定失败");
        orderDetailModel.rowHeight = ADJUST_PERCENT_FLOAT(107.f);
        [[ZJTimerManager shareTimer] stopTimer];
    }
}

/**
 定时事件
 
 @param timer 定时器
 */
- (void)timerEvent:(NSTimer *)timer
{
    self.surplusBidTime -= 1;
    
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:ORDER_ORDERDETAIL_NOTIFICATION
                                             object:nil
                                           userInfo:@{@"countDownString":[self countDownString]}];
    
    if (self.surplusBidTime <= 0) {
        [[ZJTimerManager shareTimer] stopTimer];
    }
}

/**
 倒计时时间
 
 @return 返回倒计时字符串
 */
- (NSString *)countDownString
{
    NSDate *now                 = [NSDate date];
    NSCalendar *calendar        = [NSCalendar currentCalendar];
    
    /**
     *  比较时间
     */
    NSCalendarUnit unit         = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour |
    NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *cmps      = [calendar components:unit
                                              fromDate:[NSDate dateWithTimeIntervalSinceNow:self.surplusBidTime]
                                                toDate:now
                                               options:0];
    
    /**
     *  判断是否有天
     */
    if (cmps.day != 0) {
        return [NSString stringWithFormat:@"%ld天%ld时%ld分",
                (long)self.surplusBidTime/86400,
                (long)self.surplusBidTime%86400/3600,
                (long)self.surplusBidTime%3600/60];
    }else{
        
        /**
         *  判断是否有小时
         */
        if (cmps.hour != 0) {
            return [NSString stringWithFormat:@"%ld时%ld分%ld秒",
                    (long)self.surplusBidTime%86400/3600,
                    (long)self.surplusBidTime%3600/60,
                    (long)self.surplusBidTime%60];
        }else{
            
            /**
             *  判断是否有分钟
             */
            if (cmps.minute != 0) {
                return [NSString stringWithFormat:@"%ld分%ld秒",
                        (long)self.surplusBidTime%3600/60,
                        (long)self.surplusBidTime%60];
            }else{
                return [NSString stringWithFormat:@"%ld秒",
                        (long)self.surplusBidTime%60];
            }
        }
    }
}

/**
 取消订单
 
 @param reason                      原因
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)cancelOrderWithReason:(NSString *)reason
         successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
              failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBOrderService share] cancelOrderWithOrderId:self.orderId
                                            reason:reason success:^(id objc, id requestInfo) {
                                                successCallBackBlock(objc);
                                            } fail:^(id error, id requestInfo) {
                                                failureCallBack(error);
                                            }];
}

/**
 加载订单详情数据
 
 @param successCallBackBlock        成功
 @param failureCallBack             失败
 */
- (void)loadOrderDetailWithSuccessCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                                failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBOrderService share] orderDetailWithOrderId:self.orderId success:^(id objc, id requestInfo) {
        
        [self handleRequestObj:objc];
        successCallBackBlock(self);
        
    } fail:^(id error, id requestInfo) {
        
        YBLog(@"%@\n%@", error, requestInfo);
        failureCallBack(error);
    }];
}

- (void)handleRequestObj:(id)obj
{
    self.orderDetailModel           = [YBOrderDetailModel modelWithDictionary:obj[@"data"]];
    [self setupDataArray];
    self.surplusBidTime             = self.orderDetailModel.diffTime.doubleValue / 1000;
}

/**
 配置底部
 
 @param bottomFuncView 配置底部视图
 */
- (void)setupBottomFuncView:(UIView *)bottomFuncView
{
    NSArray *tempArray;
    
    if (self.orderDetailModel.detailsShowStatus == 10) {
        
        tempArray = @[@{@"title":ZJSTRING(@"去支付"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 20
              || self.orderDetailModel.detailsShowStatus == 21
              || self.orderDetailModel.detailsShowStatus == 22) {
        
        tempArray = @[@{@"title":ZJSTRING(@"继续支付"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 30) {
        
        tempArray = @[@{@"title":ZJSTRING(@"提醒发货"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 31) {
        
        tempArray = @[@{@"title":ZJSTRING(@"提醒配货"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"查看提货码"),
                        @"imageNamed":@"orderdetails_btn1_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 40) {
        
        tempArray = @[@{@"title":ZJSTRING(@"查看物流"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 41) {
        
        tempArray = @[@{@"title":ZJSTRING(@"查看提货码"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 50) {
        
        tempArray = @[@{@"title":ZJSTRING(@"确认收货"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"查看物流"),
                        @"imageNamed":@"orderdetails_btn1_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 51) {
        
        tempArray = @[@{@"title":ZJSTRING(@"确认收货"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 60) {
        
        tempArray = @[@{@"title":ZJSTRING(@"查看物流"),
                        @"imageNamed":@"orderdetails_btn2_bg"},
                      @{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn1_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 61) {
        
        tempArray = @[@{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn2_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 70) {
        
        tempArray = @[@{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn2_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 71) {
        
        tempArray = @[@{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn2_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 72) {
        
        tempArray = @[@{@"title":ZJSTRING(@"联系客服"),
                        @"imageNamed":@"orderdetails_btn2_bg"}];
        
    }else if (self.orderDetailModel.detailsShowStatus == 73) {
        
        /**
         *  判断退款状态
         *  self.orderDetailModel.refundStatus
         */
        if (self.orderDetailModel.refundStatus == 1) {
            
            tempArray = @[@{@"title":ZJSTRING(@"申请退款"),
                            @"imageNamed":@"orderdetails_btn2_bg"},
                          @{@"title":ZJSTRING(@"联系客服"),
                            @"imageNamed":@"orderdetails_btn1_bg"}];
            
        }else{
            
            tempArray = @[@{@"title":ZJSTRING(@"退款详情"),
                            @"imageNamed":@"orderdetails_btn2_bg"},
                          @{@"title":ZJSTRING(@"联系客服"),
                            @"imageNamed":@"orderdetails_btn1_bg"}];
            
        }
        
    }else if (self.orderDetailModel.detailsShowStatus == 74) {
        
        /**
         *  判断退款状态
         *  self.orderDetailModel.refundStatus
         */
        if (self.orderDetailModel.refundStatus == 1) {
            
            tempArray = @[@{@"title":ZJSTRING(@"申请退款"),
                            @"imageNamed":@"orderdetails_btn2_bg"},
                          @{@"title":ZJSTRING(@"联系客服"),
                            @"imageNamed":@"orderdetails_btn1_bg"}];
            
        }else{
            
            tempArray = @[@{@"title":ZJSTRING(@"退款详情"),
                            @"imageNamed":@"orderdetails_btn2_bg"},
                          @{@"title":ZJSTRING(@"联系客服"),
                            @"imageNamed":@"orderdetails_btn1_bg"}];
        }
        
    }else if (self.orderDetailModel.detailsShowStatus == 75) {
        
        if (self.orderDetailModel.refundStatus == 1) {
            
            tempArray = @[@{@"title":ZJSTRING(@"申请退款"),
                            @"imageNamed":@"orderdetails_btn2_bg"},
                          @{@"title":ZJSTRING(@"联系客服"),
                            @"imageNamed":@"orderdetails_btn1_bg"}];
            
        }else{
            
            tempArray = @[@{@"title":ZJSTRING(@"退款详情"),
                            @"imageNamed":@"orderdetails_btn2_bg"},
                          @{@"title":ZJSTRING(@"联系客服"),
                            @"imageNamed":@"orderdetails_btn1_bg"}];
        
        }
    }
    
    [bottomFuncView.subviews enumerateObjectsUsingBlock:^(__kindof YBDefaultButton * _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
        if (idx > tempArray.count - 1) {
            obj.hidden = YES;
        }else{
            obj.hidden = NO;
            NSDictionary *dict = tempArray[idx];
            
            [obj setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                            dict[@"imageNamed"],
                                            ZJProjectLoadImageDefault).firstObject
                           forState:UIControlStateNormal];
            [obj setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                            dict[@"imageNamed"],
                                            ZJProjectLoadImageDefault).lastObject
                           forState:UIControlStateHighlighted];
            [obj setTitle:dict[@"title"]
                 forState:UIControlStateNormal];
        }
        
        if (idx == 0) {
            [obj setTitleColor:ZJCOLOR.color_c6
                      forState:UIControlStateNormal];
        }else{
            [obj setTitleColor:ZJCOLOR.color_c4
                      forState:UIControlStateNormal];
        }
        
        obj.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    }];
}

/**
 确认收货
 
 @param successCallBackBlock        successCallBackBlock
 @param failureCallBack             failureCallBack
 */
- (void)confirmOrderSuccessCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                         failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBOrderService share] confirmReceiptGoodsWithorderId:self.orderId success:^(id objc, id requestInfo) {
        successCallBackBlock(objc);
    } fail:^(id error, id requestInfo) {
        failureCallBack(error);
    }];
}

/**
 切换支付方式
 
 @param successCallBackBlock        successCallBackBlock
 @param failureCallBack             failureCallBack
 */
- (void)changePaymentTypeWithPaymentType:(NSString *)paymentType
                    successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
                         failureCallBack:(ZJViewModelCallBackFailureBlock)failureCallBack
{
    [[YBOrderService share] modifyPayTypeWithorderId:self.orderId
                                        orderPayType:paymentType
                                             success:^(id objc, id requestInfo) {
                                                 
                                                 successCallBackBlock(objc);
                                                 
                                             } fail:^(id error, id requestInfo) {
                                                 
                                                 failureCallBack(error);
                                                 
                                             }];
}

@end
