//
//  YBPaymentDeliveryTypeViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentDeliveryTypeViewModel.h"

@interface YBPaymentDeliveryTypeViewModel()

/**
 当前选中的配送方式
 */
@property (nonatomic, strong) YBPaymentDliveryTypeModel *currentDeliveryModel;

/**
 当前选中的付款方式
 */
@property (nonatomic, strong) YBPaymentDliveryTypeModel *currentPaymentTypeModel;

@end

@implementation YBPaymentDeliveryTypeViewModel

- (NSArray<NSDictionary *> *)dataArray
{
    if (!_dataArray) {
        
        YBPaymentDliveryTypeModel *section1Item1 = [[YBPaymentDliveryTypeModel alloc] init];
        section1Item1.title = ZJSTRING(@"快递送货");
        section1Item1.cellReID = @"YBPaymentDeliveryTypeDefaultCellReuseIdentifier";
        section1Item1.itemSize = CGSizeMake((SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12.f) * 2 - (ADJUST_PERCENT_FLOAT(40.f) * 2)) / 3,
                                            ADJUST_PERCENT_FLOAT(28.f));
        /**
         *  配置默认选中的物流方式
         */
        section1Item1.isSelected = YES;
        self.userDeliveryType = @"1";
        
        YBPaymentDliveryTypeModel *section2Item1 = [[YBPaymentDliveryTypeModel alloc] init];
        section2Item1.itemSize = CGSizeMake(0, 0);
        section2Item1.cellReID = @"cell";
        
        YBPaymentDliveryTypeModel *section2Item2 = [[YBPaymentDliveryTypeModel alloc] init];
        section2Item2.itemSize = CGSizeMake(0, 0);
        section2Item2.cellReID = @"cell";
        
        YBPaymentDliveryTypeModel *section3Item1 = [[YBPaymentDliveryTypeModel alloc] init];
        section3Item1.title = ZJSTRING(@"全部支付");
        section3Item1.cellReID = @"YBPaymentDeliveryTypeDefaultCellReuseIdentifier";
        section3Item1.itemSize = CGSizeMake((SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12.f) * 2 - (ADJUST_PERCENT_FLOAT(40.f) * 2)) / 3,
                                            ADJUST_PERCENT_FLOAT(28.f));
        /**
         *  配置默认的支付方式
         */
        section3Item1.isSelected = YES;
        self.userPaymentMethod = ZJProjectPaymentMethodAll;
        
        YBPaymentDliveryTypeModel *section3Item3 = [[YBPaymentDliveryTypeModel alloc] init];
        section3Item3.title = ZJSTRING(@"分笔支付");
        section3Item3.cellReID = @"YBPaymentDeliveryTypeDefaultCellReuseIdentifier";
        section3Item3.itemSize = CGSizeMake((SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12.f) * 2 - (ADJUST_PERCENT_FLOAT(40.f) * 2)) / 3,
                                            ADJUST_PERCENT_FLOAT(28.f));;
        
//        YBPaymentDliveryTypeModel *section3Item4 = [[YBPaymentDliveryTypeModel alloc] init];
//        section3Item4.title = ZJSTRING(@"转账汇款");
//        section3Item4.cellReID = @"YBPaymentDeliveryTypeDefaultCellReuseIdentifier";
//        section3Item4.itemSize = CGSizeMake((SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12.f) * 2 - (ADJUST_PERCENT_FLOAT(40.f) * 2)) / 3,
//                                            ADJUST_PERCENT_FLOAT(28.f));;
//        
//        YBPaymentDliveryTypeModel *section3Item5 = [[YBPaymentDliveryTypeModel alloc] init];
//        section3Item5.title = ZJSTRING(@"定金+刷卡");
//        section3Item5.cellReID = @"YBPaymentDeliveryTypeDefaultCellReuseIdentifier";
//        section3Item5.itemSize = CGSizeMake((SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12.f) * 2 - (ADJUST_PERCENT_FLOAT(40.f) * 2)) / 3,
//                                            ADJUST_PERCENT_FLOAT(28.f));;
        
        YBPaymentDliveryTypeModel *section4Item1 = [[YBPaymentDliveryTypeModel alloc] init];
        section4Item1.title = ZJSTRING(@"支付支付。。。。。");
        section4Item1.cellReID = @"cell";
        section4Item1.itemSize = CGSizeMake(0, 0);
        
        //** =========================================================================================== */
        //** ==========================================业务逻辑========================================= */
        //** =========================================================================================== */
        
        NSMutableArray *section1TempArrayM = [NSMutableArray array];
        [section1TempArrayM addObject:section1Item1];
        
        if (self.confirmOrderViewModel.orderModel.isPickup == 1) {
            
            YBPaymentDliveryTypeModel *section1Item2 = [[YBPaymentDliveryTypeModel alloc] init];
            section1Item2.title = ZJSTRING(@"来店自提");
            section1Item2.cellReID = @"YBPaymentDeliveryTypeDefaultCellReuseIdentifier";
            section1Item2.itemSize = CGSizeMake((SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12.f) * 2 - (ADJUST_PERCENT_FLOAT(40.f) * 2)) / 3,
                                                ADJUST_PERCENT_FLOAT(28.f));
            [section1TempArrayM addObject:section1Item2];
        }
        
        NSMutableArray *section3TempArrayM = [NSMutableArray array];
        [section3TempArrayM addObject:section3Item1];
        [section3TempArrayM addObject:section3Item3];
        
        if (self.confirmOrderViewModel.orderModel.isAllowBargainPay == 1) {
            
            YBPaymentDliveryTypeModel *section3Item2 = [[YBPaymentDliveryTypeModel alloc] init];
            section3Item2.title = ZJSTRING(@"定金支付");
            section3Item2.cellReID = @"YBPaymentDeliveryTypeDefaultCellReuseIdentifier";
            section3Item2.itemSize = CGSizeMake((SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(12.f) * 2 - (ADJUST_PERCENT_FLOAT(40.f) * 2)) / 3,
                                                ADJUST_PERCENT_FLOAT(28.f));
            [section3TempArrayM addObject:section3Item2];
        }
        
        //** =========================================================================================== */
        //** ==========================================业务逻辑========================================= */
        //** =========================================================================================== */
        
        _dataArray = @[@{@"data":section1TempArrayM.copy},
                       @{@"data":@[section2Item1,
                                   section2Item2]},
                       @{@"data":section3TempArrayM.copy},
                       @{@"data":@[section4Item1]}];
    }
    return _dataArray;
}

/**
 点击配送方式选择
 
 @param button              button
 @param indexPath           indexPath
 @param callBackBlock       callBackBlock
 */
- (void)selectedDeliveryTypeButton:(ZJBaseButton *)button
                         indexPath:(NSIndexPath *)indexPath
                     callBackBlock:(ZJEventCallBackBlock)callBackBlock
{
    /**
     *  获取当前点击的cell对应的模型
     */
    NSArray *tempArray                                  =  self.dataArray[indexPath.section][@"data"];
    YBPaymentDliveryTypeModel *section1Item             = tempArray[indexPath.item];
    
    /**
     *  判断是否是第一次点击
     */
    if (self.currentDeliveryModel) {
        
        /**
         *  重置上一次选中按钮的状态
         */
        self.currentDeliveryModel.isSelected            = !self.currentDeliveryModel.isSelected;
    }else{
        
        /**
         *  将初始化选中的按钮设置为未选中状态
         */
        NSArray *tempArrayInit                          =  self.dataArray.firstObject[@"data"];
        YBPaymentDliveryTypeModel *section2Item1        = tempArrayInit.firstObject;
        section2Item1.isSelected                        = NO;
    }
    
    /**
     *  获取提示section的数据
     */
    NSMutableArray *tempArrayTips                       = self.dataArray[1][@"data"];
    YBPaymentDliveryTypeModel *section2Item1            = tempArrayTips.firstObject;
    YBPaymentDliveryTypeModel *section2Item2            = tempArrayTips.lastObject;
    
    if ([section1Item.title isEqualToString:ZJSTRING(@"快递送货")]) {
        
        /**
         *  配置界面
         */
        section2Item1.itemSize                          = CGSizeMake(0, 0);
        section2Item1.cellReID                          = @"cell";
        section2Item2.itemSize                          = CGSizeMake(0, 0);
        section2Item2.cellReID                          = @"cell";
        
        /**
         *  记录用户选择
         */
        self.userDeliveryType                           = @"1";
    }
    
    if ([section1Item.title isEqualToString:ZJSTRING(@"来店自提")]) {
        
        /**
         *  配置界面
         */
        section2Item1.itemSize                          = CGSizeMake(ADJUST_PERCENT_FLOAT(351),
                                                                     ADJUST_PERCENT_FLOAT(126.f));
        section2Item1.cellReID                          = @"YBPaymentDeliveryTypeAddressCellReuseIdentifier";
        section2Item2.itemSize                          = CGSizeMake(ADJUST_PERCENT_FLOAT(351),
                                                                     ADJUST_PERCENT_FLOAT(64.f));
        section2Item2.cellReID                          = @"YBPaymentDeliveryTypeTipsCellReuseIdentifier";
        section2Item2.title                             = ZJSTRING(@"贵重商品提货时需要验证提货人身份信息，请提货人携带本人身份证到自提地址提取您购买的商品如需他人代提货，请携带代办人及提货人本人身份证。");
        
        /**
         *  记录用户选择
         */
        self.userDeliveryType                           = @"0";
    }
    
    self.currentDeliveryModel                           = section1Item;
    callBackBlock(nil);
}

/**
 点击付款方式选择
 
 @param button              button
 @param indexPath           indexPath
 @param callBackBlock       callBackBlock
 */
- (void)selectedPaymentTypeButton:(ZJBaseButton *)button
                        indexPath:(NSIndexPath *)indexPath
                    callBackBlock:(ZJEventCallBackBlock)callBackBlock
{
    /**
     *  获取当前点击的cell对应的模型
     */
    NSArray *tempArray                              =  self.dataArray[indexPath.section][@"data"];
    YBPaymentDliveryTypeModel *section3Item         = tempArray[indexPath.item];
    
    /**
     *  判断是否是第一次点击
     */
    if (self.currentPaymentTypeModel) {
        
        /**
         *  重置上一次选中按钮的状态
         */
        self.currentPaymentTypeModel.isSelected     = !self.currentPaymentTypeModel.isSelected;
    }else{
        
        /**
         *  将初始化选中的按钮设置为未选中状态
         */
        NSArray *tempArray                          =  self.dataArray[indexPath.section][@"data"];
        YBPaymentDliveryTypeModel *section3Item1    = tempArray.firstObject;
        section3Item1.isSelected                    = NO;
    }
    
    /**
     *  获取提示section的数据
     */
    NSArray *tempArrayTips                          =  self.dataArray.lastObject[@"data"];
    YBPaymentDliveryTypeModel *section4Item1        = tempArrayTips.firstObject;
    
    if ([section3Item.title isEqualToString:ZJSTRING(@"全部支付")]) {
        section4Item1.title                         = ZJSTRING(@"支付支付。。。。。");
        section4Item1.cellReID                      = @"cell";
        section4Item1.itemSize                      = CGSizeMake(0, 0);
        
        /**
         *  记录用户选择
         */
        self.userPaymentMethod                      = ZJProjectPaymentMethodAll;
    }
    
    if ([section3Item.title isEqualToString:ZJSTRING(@"定金支付")]) {
        section4Item1.title                         = ZJSTRING(@"先付10%的定金，余额可在48小时内支付，若未在规定时间内支付余款，定金将被扣除！");
        section4Item1.cellReID                      = @"YBPaymentDeliveryTypeTipsCellReuseIdentifier";
        section4Item1.itemSize                      = CGSizeMake(ADJUST_PERCENT_FLOAT(351),
                                                                 ADJUST_PERCENT_FLOAT(38.f));
        
        /**
         *  记录用户选择
         */
        self.userPaymentMethod                      = ZJProjectPaymentMethodDeposit;
    }
    
    if ([section3Item.title isEqualToString:ZJSTRING(@"分笔支付")]) {
        section4Item1.title                         = ZJSTRING(@"支付支付。。。。。");
        section4Item1.cellReID                      = @"cell";
        section4Item1.itemSize                      = CGSizeMake(0, 0);
        
        /**
         *  记录用户选择
         */
        self.userPaymentMethod                      = ZJProjectPaymentMethodPen;
    }
    
    if ([section3Item.title isEqualToString:ZJSTRING(@"转账汇款")]) {
        section4Item1.title                         = ZJSTRING(@"支付支付。。。。。");
        section4Item1.cellReID                      = @"cell";
        section4Item1.itemSize                      = CGSizeMake(0, 0);
        
        /**
         *  记录用户选择
         */
        self.userPaymentMethod                      = ZJProjectPaymentMethodTransfer;
    }
    
    if ([section3Item.title isEqualToString:ZJSTRING(@"定金+刷卡")]) {
        section4Item1.title                         = ZJSTRING(@"线上支付20%订金，自提时支付余款！");
        section4Item1.cellReID                      = @"YBPaymentDeliveryTypeTipsCellReuseIdentifier";
        section4Item1.itemSize                      = CGSizeMake(ADJUST_PERCENT_FLOAT(351),
                                                                 ADJUST_PERCENT_FLOAT(64.f));
        
        /**
         *  记录用户选择
         */
        self.userPaymentMethod                      = ZJProjectPaymentMethodCard;
    }
    
    self.currentPaymentTypeModel                    = section3Item;
    callBackBlock(nil);
}

@end
