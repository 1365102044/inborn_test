//
//  YBOrderModel.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderModel.h"

@implementation YBOrderModel

- (NSString *)unpaidAmount
{
    if (!_unpaidAmount) {
        _unpaidAmount = [NSString stringWithFormat:@"%.0f",
                         self.orderPayAmount.floatValue - self.alreadyPayAmount.floatValue];
    }
    return _unpaidAmount;
}

- (NSString *)orderPayTypeString
{
    //1.全额支付，2定金支付，3分笔支付
    if (self.orderPayType == 1) {
        _orderPayTypeString = ZJSTRING(@"全额支付");
    }
    
    if (self.orderPayType == 2) {
        _orderPayTypeString = ZJSTRING(@"定金支付");
    }
    
    if (self.orderPayType == 3) {
        _orderPayTypeString = ZJSTRING(@"分笔支付");
    }
    
    return _orderPayTypeString;
}

/**
 * 订单列表显示状态:1未付款,2部分支付,3已付款,待平台发货,4已付款，待平台配货(自提),5已发货，待收货,
 * 6已配货，待自提,7已签收，待确认收货,8已提货，待确认收货,9交易完成，待平台打款,10平台已打款,交易完成,11已取消
 * 12超时已取消,13鉴定失败，已取消
 */
- (NSString *)orderShowStatusStr
{
    if (_OrderListVCType == MyBuyOrderType) {
        
        if (_orderShowStatus == 1) {
            _listMoreArr = @[@"取消",@"联系客服"];
            _buttonTitleStr = @"去付款";
            return @"待付款";
        }else if (_orderShowStatus == 2) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"继续付款";
            return @"待支付余款";
        }else if (_orderShowStatus == 3) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"提醒发货";
            return @"已付款,待发货";
        }else if (_orderShowStatus == 4) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"提醒发货";
            return @"已付款,待配货";
        }else if (_orderShowStatus == 5) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"查看物流";
            return @"已发货，待买家收货";
        }else if (_orderShowStatus == 6) {
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"已配货，待买家自提";
        }else if (_orderShowStatus == 7) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"确认收货";
            return @"已签收，待确认收货";
        }else if (_orderShowStatus == 8) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"确认收货";
            return @"已提货，待确认收货";
        }else if (_orderShowStatus == 9) {
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"交易完成";
        }else if (_orderShowStatus == 10) {
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"交易完成";
        }else if (_orderShowStatus == 11) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"再次购买";
            return @"已取消";
        }else if (_orderShowStatus == 12) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"再次购买";
            return @"超时已取消";
        }else if (_orderShowStatus == 13) {
            _buttonTitleStr = @"申请退款";
            if (_refundStatus != 1) {
                _buttonTitleStr = @"退款详情";
            }
            _listMoreArr = @[@"联系客服"];
            return @"鉴定失败，已取消";
        }else{
            _listMoreArr =  nil;
            _buttonTitleStr = @"联系客服";
            return @"";
        }
    }else if (_OrderListVCType == AppraisalOrderType){
    
        /**
         appraisalStatus 鉴定状态：1待付费，2付款中，(3待邮寄，4待入库，5鉴定中，6已通过，7未通过), 8已取消    <状态只有3.4.5.6.7>
         */
        if (_appraisalStatus == 1) {
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"待付费";
        }else if (_appraisalStatus == 2){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"付款中";
        }else if (_appraisalStatus == 3){
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"提交物流";
            return @"待送鉴";
        }else if (_appraisalStatus == 4){
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"查看物流";
            return @"待送鉴";
        }else if (_appraisalStatus == 5){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"鉴定中";
        }else if (_appraisalStatus == 6){
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"查看鉴定";
            return @"已通过";
        }else if (_appraisalStatus == 7){
            if (_returnStatus > 0) {
                _listMoreArr = @[@"联系客服"];
                _buttonTitleStr = @"查看鉴定";
                return @"已退回";
            }else{
                _listMoreArr = @[@"联系客服",@"申请退回"];
                _buttonTitleStr = @"查看鉴定";
                return @"未通过";
            }
        }else if (_appraisalStatus == 8){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"已取消";
        }else{
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"";
        }
    }else if (_OrderListVCType == MySellOutOrderType) {
        /**
         * 卖出列表显示状态：10待买家付款；20买家已付款，待鉴定；21买家已付款，鉴定中；22鉴定通过，待平台发货；23待平台发货；24待商家发货
         * 30等待买家收货；31等待买家自提；40等待买家确认；41等待买家确认（自提）
         * 50交易完成；51交易完成（自提）；60买家已取消；61鉴定失败已取消；62订单超时已取消 63 鉴定失败已退回（物流） 64 鉴定失败已退回（自提）
         */
        if (_saleShowStatus == 10) {
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"待付款";
        }else if (_saleShowStatus == 20) {
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"送鉴";
            return @"需鉴定,待送鉴";
        }else if(_saleShowStatus == 21){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"鉴定中";
        }else if(_saleShowStatus == 22){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"鉴定通过，待发货";
        }else if(_saleShowStatus == 23){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"鉴定通过，待发货";
        }else if(_saleShowStatus == 24){
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"发货";
            return @"鉴定通过，待发货";
        }else if(_saleShowStatus == 30){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"待收货";
        }else if(_saleShowStatus == 31){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"待收货";
        }else if(_saleShowStatus == 40){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"待确认";
        }else if(_saleShowStatus == 41){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"待确认";
        }else if(_saleShowStatus == 50){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"已成交";
        }else if(_saleShowStatus == 51){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"已成交";
        }else if (_saleShowStatus == 60){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"已取消";
        }else if (_saleShowStatus == 61){
            _listMoreArr = nil;
            _buttonTitleStr = @"申请退回";
            return @"鉴定失败，已取消";
        }else if (_saleShowStatus == 62){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"超时已取消";
        }else if (_saleShowStatus == 63){
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"查看物流";
            return @"鉴定失败，已退回";
        }else if (_saleShowStatus == 64){
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"鉴定失败，已退回";
        }
        else{
            _listMoreArr = nil;
            _buttonTitleStr = @"联系客服";
            return @"";
        }
    }else if (_OrderListVCType == MyGoodsOrderType){
        /**展示状态和按钮,1=已入库--灰色申请退回,2=退回,待出库--灰色查看物流,
         *              3=退回,已出库--可点查看物流,4=售出,已出库--可点查看物流,5=已入库--可点申请退回
         *              6=退回,已出库--可点查看物流(弹窗口提示，自提商品暂无物流信息，如有疑问请联系客),
         *              7 =售出,已出库--可点查看物流(弹窗口提示，自提商品暂无物流信息，如有疑问请联系客),
         */
        if(_showStatus == 1){
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"申请退回";
            return @"已入库";
        }else if (_showStatus == 2){
            _listMoreArr = @[@"联系客服"];
            _buttonTitleStr = @"查看物流";
            return @"退回，待出库";
        }else if (_showStatus == 3) {
            _listMoreArr =  @[@"联系客服"];
            _buttonTitleStr = @"查看物流";
            return @"退回，已出库";
        }else if (_showStatus == 4) {
            _listMoreArr =  @[@"联系客服"];
            _buttonTitleStr = @"查看物流";
            return @"售出,已出库";
        }else if (_showStatus == 5) {
            _listMoreArr =  @[@"联系客服"];
            _buttonTitleStr = @"申请退回";
            return @"已入库";
        }else if (_showStatus == 6) {
            _listMoreArr =  @[@"联系客服"];
            _buttonTitleStr = @"查看物流";
            return @"退回，已出库";
        }else if (_showStatus == 7) {
            _listMoreArr =  @[@"联系客服"];
            _buttonTitleStr = @"查看物流";
            return @"售出,已出库";
        }else{
            _listMoreArr =  nil;
            _buttonTitleStr = @"联系客服";
            return @"";
        }
    }
    return nil;
}

- (void)setOrderConsignee:(YBAddressAndPickPersonModel *)orderConsignee
{
    _orderConsignee = orderConsignee;
}

- (void)setRoutes:(NSArray *)routes
{
    NSMutableArray *tempArrayM = [NSMutableArray array];
    [routes enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                         NSUInteger idx,
                                         BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[YBRouteModel class]]) {
            [tempArrayM addObject:obj];
        }else{
            [tempArrayM addObject:[YBRouteModel modelWithDictionary:obj]];
        }
    }];
    _routes = tempArrayM.copy;
}

/**
 项目支持支付方式
 
 - ZJProjectPaymentMethodDefault:                               默认
 - ZJProjectPaymentMethodAll:                                   全款支付
 - ZJProjectPaymentMethodDeposit:                               定金支付
 - ZJProjectPaymentMethodPen:                                   分笔支付
 - ZJProjectPaymentMethodTransfer:                              转账支付
 - ZJProjectPaymentMethodDefaultCard:                           订金+刷卡
 */
- (ZJProjectPaymentMethod)paymentType
{
    if (_orderPayType == 1) {
        return ZJProjectPaymentMethodAll;
    }else if (_orderPayType == 2) {
        return ZJProjectPaymentMethodDeposit;
    }else if (_orderPayType == 3) {
        return ZJProjectPaymentMethodPen;
    }else if (_orderPayType == 4) {
        return ZJProjectPaymentMethodTransfer;
    }else if (_orderPayType == 5) {
        return ZJProjectPaymentMethodCard;
    }else if (_orderPayType == 6) {
        return ZJProjectPaymentMethodDefault;
    }
    
    return ZJProjectPaymentMethodDefault;
}

@end
