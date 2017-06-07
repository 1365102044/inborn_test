//
//  YBMySellOutModel.m
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMySellOutModel.h"
#import "YBStringTool.h"
@implementation YBMySellOutModel

/**
 * 卖出列表显示状态：10待买家付款；20买家已付款，待鉴定；21买家已付款，鉴定中；22鉴定通过，待平台发货；23待平台发货；24待商家发货
 * 30等待买家收货；31等待买家自提；40等待买家确认；41等待买家确认（自提）
 * 50交易完成；51交易完成（自提）；60买家已取消；61鉴定失败已取消；62订单超时已取消 63 鉴定失败已退回（物流） 64 鉴定失败已退回（自提）
 */
- (NSArray *)BoomviewBtnArr
{
    _topStatusViewHeight = 185;
    
    if (_saleShowStatus == 10) {
        
        _isHiddenTopImagBool = NO;
        _statusTitleArr = @[@"等待买家付款",@"下单成功，等待买家付款"];
        return @[@"联系客服"];
    }else if (_saleShowStatus == 20){
        
        _isHiddenTopImagBool = NO;
        _statusTitleArr = @[@"等待鉴定",@"请及时将商品送至平台鉴定，以免减少你的信用度"];
        return @[@"联系客服",@"提供单号"];
    }else if (_saleShowStatus == 21){
        
        _isHiddenTopImagBool = NO;
        _statusTitleArr = @[@"商品鉴定中",@"商品正在平台鉴定中，请你耐心等待"];
        return @[@"联系客服"];
    }else if (_saleShowStatus == 22){
        
        _isHiddenTopImagBool = NO;
        _statusTitleArr = @[@"鉴定通过",@"商品已鉴定通过，等待发货"];
        return @[@"联系客服"];
    }else if (_saleShowStatus == 23){
        
        _isHiddenTopImagBool = NO;
        _statusTitleArr = @[@"等待发货",@"买家已付款，等待发货"];
        return @[@"联系客服"];
    }else if (_saleShowStatus == 24){
        
        _isHiddenTopImagBool = NO;
        _statusTitleArr = @[@"等待发货",@"买家已付款，等待你发货"];
        return @[@"联系客服",@"发货"];
    }else if (_saleShowStatus == 30){
        
        _isHiddenTopImagBool = NO;
        _statusTitleArr = @[@"已发货",@"已通过顺丰速递将商品邮寄给买家"];
        return @[@"联系客服",@"查看物流"];
    }else if (_saleShowStatus == 31){
        
        _isHiddenTopImagBool = NO;
        _statusTitleArr = @[@"等待买家自提",@"等待买家自提"];
        return @[@"联系客服"];
    }else if (_saleShowStatus == 40){
        
        _isHiddenTopImagBool = NO;
        _topStatusViewHeight = 235;
        _statusTitleArr = @[@"物流已签收，等待买家确认收货",@"买家还有6天23小时59分来完成本次交易的“确认收货”,如果期间买家没有“确认收货”，本次交易将自动完成，平台将把货款支付给你"];
        return @[@"联系客服",@"查看物流"];
    }else if (_saleShowStatus == 41){
        
        _isHiddenTopImagBool = NO;
        _topStatusViewHeight = 235;
        _statusTitleArr = @[@"买家已取货，等待买家确认收货",@"买家还有6天23小时59分来完成本次交易的“确认收货”,如果期间买家没有“确认收货”，本次交易将自动完成，平台将把货款支付给你"];
        return @[@"联系客服"];
    }
    else if (_saleShowStatus == 50){
        
        _isHiddenTopImagBool = NO;
        _topStatusViewHeight = 210;
        _statusTitleArr = @[@"交易已完成",@"请到“我的钱包”中确认货款到账情况，并可申请提现到你绑定的银行账号内，若未到账，请联系客服"];
        return @[@"联系客服",@"查看物流"];
    }else if (_saleShowStatus == 51){
        
        _isHiddenTopImagBool = NO;
        _topStatusViewHeight = 210;
        _statusTitleArr = @[@"交易已完成",@"请到“我的钱包”中确认货款到账情况，并可申请提现到你绑定的银行账号内，若未到账，请联系客服"];
        return @[@"联系客服"];
    }else if (_saleShowStatus == 60){
        
        _isHiddenTopImagBool = YES;
        _topStatusViewHeight = 107;
        _statusTitleArr = @[@"订单已取消",@"买家已取消订单"];
        return @[@"联系客服"];
    }else if (_saleShowStatus == 61){
        
        _isHiddenTopImagBool = YES;
        _topStatusViewHeight = 107;
        _statusTitleArr = @[@"订单已取消",@"商品鉴定失败，订单已被取消"];
        return @[@"联系客服",@"申请退回"];
    }else if (_saleShowStatus == 62){
        
        _isHiddenTopImagBool = YES;
        _topStatusViewHeight = 107;
        _statusTitleArr = @[@"订单已取消",@"买家未在规定时间内付款，订单已取消"];
        return @[@"联系客服"];
    }else if (_saleShowStatus == 63){
        
        _isHiddenTopImagBool = YES;
        _topStatusViewHeight = 107;
        _statusTitleArr = @[@"商品已退回",@"鉴定失败，已退回"];
        return @[@"联系客服",@"查看物流"];
    }else if (_saleShowStatus == 64){
        
        _isHiddenTopImagBool = YES;
        _topStatusViewHeight = 107;
        _statusTitleArr = @[@"商品已退回",@"鉴定失败，已退回"];
        return @[@"联系客服"];
    }else{
        
        _isHiddenTopImagBool = YES;
        _statusTitleArr = @[@"",@""];
        _topStatusViewHeight = 107;
        return @[@"联系客服"];
    }
    return nil;
}

- (NSArray *)timeArr
{
    NSMutableArray *temparr = [NSMutableArray array];
    NSString *str;
    if (_createTime) {
        str = [NSString stringWithFormat:@"创建时间：%@",_createTime];
        [temparr addObject:str];
    }
    if (_payedTime) {
        str = [NSString stringWithFormat:@"付款时间：%@",_payedTime];
        [temparr addObject:str];
    }
    if (_deliveryTime) {
        str = [NSString stringWithFormat:@"发货时间：%@",_deliveryTime];
        [temparr addObject:str];
    }
    if (_consigneeTime) {
        str = [NSString stringWithFormat:@"签收时间：%@",_consigneeTime];
        [temparr addObject:str];
    }
    if (_finishTime) {
        str = [NSString stringWithFormat:@"确认时间：%@",_finishTime];
        [temparr addObject:str];
    }
    return temparr;
    
}

- (NSString *)getTimestr:(NSString *)timestr
{
    return [[YBStringTool share] returnTimeStrformeTimestr:_createTime timestyle:@"yyyy.MM.dd hh:mm:ss"];
}
@end
