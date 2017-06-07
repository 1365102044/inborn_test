//
//  YBMessageModel.m
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMessageModel.h"
#import "NSString+Extension.h"
/**
 系统
 */
@implementation YBMessageSystemModel


- (NSArray *)heightArr
{
    CGFloat temhieght = self.contentheight;
    NSMutableArray *temp = [NSMutableArray array];
    [temp addObject:[NSString stringWithFormat:@"%f",temhieght]];
    _heightArr = temp;
    return _heightArr;
    
}

- (CGFloat)contentheight
{
    CGFloat heigth = [self.msgTitle ex_getSpaceLabelHeightwithSpeace:5
                                                        withFont:SYSTEM_REGULARFONT(12)
                                                       withWidth:(SCREEN_WIDTH -ADJUST_PERCENT_FLOAT(17*2))];
//    if (heigth <50) {
//        heigth = 40;
//    }else if (heigth >50) {
//        heigth = 75;
//    }else if (heigth > 60){
//        heigth = 80;
//    }
    return heigth +30;
}

@end

/**
 订单
 */
@implementation YBMessageOrderModel

/**
 10 订单待付款
 11 订单付款中
 20 订单待鉴定
 21 鉴定失败
 30 订单待发货
 31 订单已发货(快递)
 32 订单已签收(快递)
 40订单已完成(快递)
 41 订单已取消
 */
- (NSString *)orderstatusStr
{
    if (_orderStatus == 10) {
        return @"订单待付款";
    }else if (_orderStatus == 11){
        return @"订单付款中";
    }else if (_orderStatus == 20){
        return @"订单待鉴定";
    }else if (_orderStatus == 21){
        return @"鉴定失败";
    }else if (_orderStatus == 30){
        return @"订单待发货";
    }else if (_orderStatus == 31){
        return @"订单已发货";
    }else if (_orderStatus == 32){
        return @"订单已签收";
    }else if (_orderStatus == 40){
        return @"订单已完成";
    }else if (_orderStatus == 41){
        return @"订单已取消";
    }else if (_modelType == 2 && [_msgType isEqualToString:@"301"]){
        return @"未付款";
    }else if (_modelType == 2 && [_msgType isEqualToString:@"302"]){
        return @"已取消";
    }else if (_modelType == 3 && [_msgType isEqualToString:@"501"]) {
        return @"未付款";
    }else if (_modelType == 3 && [_msgType isEqualToString:@"502"]) {
        return @"已取消";
    }
    return nil;
}

@end

@implementation YBMessageModel

- (NSArray *)orderModelArr
{
    if (_data== nil ||_data.count ==0) return nil;
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = [NSDictionary dictionary];
    YBMessageOrderModel * orderModel;
    for (dict in _data) {
        orderModel = [YBMessageOrderModel modelWithDictionary:dict];
        orderModel.modelType = _modelType;
        [tempArr addObject:orderModel];
    }
    return tempArr;
}


- (NSArray *)systemModelArr
{
    if (_data== nil ||_data.count ==0) return nil;
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = [NSDictionary dictionary];
    YBMessageSystemModel * systemModel;
    for (dict in _data) {
        systemModel = [YBMessageSystemModel modelWithDictionary:dict];
        [tempArr addObject:systemModel];
    }
    return  tempArr;
}

@end
