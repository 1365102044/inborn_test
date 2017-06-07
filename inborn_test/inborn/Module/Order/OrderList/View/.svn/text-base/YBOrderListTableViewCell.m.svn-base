//
//  YBOrderListTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/1.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderListTableViewCell.h"
#import "YBStringTool.h"
#import "NSDate+Extension.h"
#import "NSString+Extension.h"
#import "YBTimerManager.h"
#import "YBStringTool.h"
@interface YBOrderListTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *orderNumberLable;
@property (weak, nonatomic) IBOutlet UILabel *orderStatusLable;

@property (weak, nonatomic) IBOutlet UIImageView *goodsImageView;
@property (weak, nonatomic) IBOutlet UILabel *goodsNameLable;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *goodsPriceLable;
@property (weak, nonatomic) IBOutlet UIButton *orderStatusBtn;
@property (weak, nonatomic) IBOutlet UIButton *orderMoreBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *goodsNameLableContansHeight;
@property (weak, nonatomic) IBOutlet UILabel *payDaojishiLable;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *timelableWidth;
@property(nonatomic,copy) clickCellSubViewBlock  clickBtnBlock;
@property(nonatomic,strong) YBOrderModel * dataModel;

@property(nonatomic,assign) double  diffTime;

@end

@implementation YBOrderListTableViewCell

- (void)setDataModel:(YBOrderModel *)dataModel
       OrderListType:(OrderListVcType)OrderListVcType
   clickCellBtnBlock:(clickCellSubViewBlock)clickCellBtnBlock
{
    _clickBtnBlock = clickCellBtnBlock;
    _dataModel = dataModel;
    
    
    
    
    if (OrderListVcType == MyBuyOrderType)  [self setMyBuyModel];
    if (OrderListVcType == AppraisalOrderType) [self setMyAppraisalModel];
    if (OrderListVcType == MySellOutOrderType) [self setMySellOutModel];
    if (OrderListVcType == MyGoodsOrderType) [self setMyGoodsModel];
    
    /**
     状态
     */
    _orderStatusLable.text = dataModel.orderShowStatusStr ? dataModel.orderShowStatusStr : @"";
    
    /**
     btn上的文字
     */
    [_orderStatusBtn setTitle:dataModel.buttonTitleStr forState:UIControlStateNormal];
    
    /**
     时间
     */
    NSArray *timearr = [[NSString stringWithFormat:@"%@",_dataModel.createTime] componentsSeparatedByString:@":"];
    NSString *timestr;
    if (timearr.count>1) {
        timestr = [NSString stringWithFormat:@"%@:%@",timearr[0],timearr[1]];
    }
    if (OrderListVcType == MyBuyOrderType ||
        OrderListVcType == AppraisalOrderType ||
        OrderListVcType == MySellOutOrderType) {
        
        _orderTimeLable.text = timestr;
    }else if (OrderListVcType == MyGoodsOrderType){
        self.timelableWidth.constant = ADJUST_PERCENT_FLOAT(180);
        _orderTimeLable.text = [NSString stringWithFormat:@"入库时间：%@",[[YBStringTool share] returnTimeStrformeTimestr:dataModel.inDepotTime timestyle:@"yyyy-MM-dd hh:mm"]];
        
        /**展示状态和按钮,1=已入库--灰色申请退回,2=退回,待出库--灰色查看物流,
         *              3=退回,已出库--可点查看物流,4=售出,已出库--可点查看物流,5=已入库--可点申请退回
         *              6=退回,已出库--可点查看物流(弹窗口提示，自提商品暂无物流信息，如有疑问请联系客),
         *              7 =售出,已出库--可点查看物流(弹窗口提示，自提商品暂无物流信息，如有疑问请联系客),
         */
        if (dataModel.showStatus == 1 ||
            dataModel.showStatus == 2 ) {
            [_orderStatusBtn setTitleColor:ZJCOLOR.color_c5 forState:UIControlStateNormal];
        }else{
            [_orderStatusBtn setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
        }
    }
    
    if (dataModel.listMoreArr == nil || dataModel.listMoreArr.count == 0)
    {
        self.orderMoreBtn.hidden = YES;
    }else{
        self.orderMoreBtn.hidden = NO;
    }
    
}


#pragma mark  *** 赋值
/**
 我买到的
 */
- (void)setMyBuyModel
{
    _orderNumberLable.text = [NSString stringWithFormat:@"订单编号：%@",_dataModel.orderId];
    /**
     价格
     */
    _goodsPriceLable.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:_dataModel.orderTotalAmount]];
    
    if (_dataModel.orderShowStatus == 1 || _dataModel.orderShowStatus == 2) {
        
        self.payDaojishiLable.hidden = NO;
        _diffTime = [_dataModel.diffTime doubleValue];
        [[YBTimerManager shareTimer] startTimerWithTimeInterVal:1.0f];
        self.payDaojishiLable.text = [NSString stringWithFormat:@"付款剩余:%@",[self gettimestrWithdifftime:_diffTime]];
        if ([_dataModel.diffTime doubleValue]<=0) {
            self.payDaojishiLable.hidden = YES;
        }
    }else{
        self.payDaojishiLable.hidden = YES;
    }
    
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, _dataModel.goodsImage)] placeholderImage:[UIImage imageNamed:@""]];
    _goodsNameLable.text = _dataModel.goodsName;
    CGFloat nameLableHei = [_dataModel.goodsName ex_getSpaceLabelHeightwithSpeace:5 withFont:SYSTEM_REGULARFONT(14) withWidth:SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(66+12*3)];
    if (nameLableHei >25) {
        nameLableHei = ADJUST_PERCENT_FLOAT(45);
    }
    self.goodsNameLableContansHeight.constant = nameLableHei;
}

/**
 我卖出的
 */
- (void)setMySellOutModel
{
    self.payDaojishiLable.hidden = YES;
    /**
     价格
     */
    _goodsPriceLable.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:_dataModel.orderTotalAmount]];
    
    _orderNumberLable.text = [NSString stringWithFormat:@"订单编号：%@",_dataModel.orderId];
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, _dataModel.goodsImage)] placeholderImage:[UIImage imageNamed:@""]];
    
    _goodsNameLable.text = _dataModel.goodsName;
    CGFloat nameLableHei = [_dataModel.goodsName ex_getSpaceLabelHeightwithSpeace:5 withFont:SYSTEM_REGULARFONT(14) withWidth:SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(66+12*3)];
    if (nameLableHei >25) {
        nameLableHei = ADJUST_PERCENT_FLOAT(45);
    }
    self.goodsNameLableContansHeight.constant = nameLableHei;
}
/**
 我鉴定的
 */
- (void)setMyAppraisalModel
{
    self.payDaojishiLable.hidden = YES;
    self.goodsPriceLable.hidden = YES;
    
    _orderNumberLable.text = [NSString stringWithFormat:@"鉴定编号：%@",_dataModel.customId];
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, _dataModel.imgUrl)] placeholderImage:[UIImage imageNamed:@""]];
    
    _goodsNameLable.text = _dataModel.sellerDesc;
    CGFloat nameLableHei = [_dataModel.sellerDesc ex_getSpaceLabelHeightwithSpeace:5 withFont:SYSTEM_REGULARFONT(14) withWidth:SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(66+12*3)];
    if (nameLableHei >25) {
        nameLableHei = ADJUST_PERCENT_FLOAT(45);
    }
    self.goodsNameLableContansHeight.constant = nameLableHei;
}
/**
 我的物品
 */
- (void)setMyGoodsModel
{
    self.payDaojishiLable.hidden = YES;
    self.goodsPriceLable.hidden = YES;
    
    _orderNumberLable.text = [NSString stringWithFormat:@"物品编号：%@",_dataModel.customId];
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, _dataModel.squareImage)] placeholderImage:[UIImage imageNamed:@""]];
    
    _goodsNameLable.text = _dataModel.sellerDesc;
    CGFloat nameLableHei = [_dataModel.sellerDesc ex_getSpaceLabelHeightwithSpeace:5 withFont:SYSTEM_REGULARFONT(14) withWidth:SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(66+12*3)];
    if (nameLableHei >25) {
        nameLableHei = ADJUST_PERCENT_FLOAT(45);
    }
    self.goodsNameLableContansHeight.constant = nameLableHei;
}


/**
 tag:11
 */
- (IBAction)clickOrderMoreBtn:(UIButton *)sender {
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender.tag,sender.titleLabel.text,_dataModel,sender);
    }
}

/**
 tag:10
 */
- (IBAction)clickOrderStatusBtn:(UIButton *)sender {
    if (_dataModel.showStatus == 1 ||
        _dataModel.showStatus == 2) {
        return;
    }
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender.tag,sender.titleLabel.text,_dataModel,sender);
    }
}

/**
 倒计时通知事件
 */
- (void)cutdownTimeNumber:(NSNotification *)noti
{
    if (_dataModel.OrderListVCType == MyBuyOrderType) {
        _diffTime = _diffTime -1000;
        self.payDaojishiLable.text = [NSString stringWithFormat:@"付款剩余:%@",[self gettimestrWithdifftime:_diffTime]];
        if (_diffTime <= 0) {
            self.payDaojishiLable.text = @"付款剩余:00:00:00";
        }
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.orderStatusBtn.layer.masksToBounds = YES;
    self.orderStatusBtn.layer.cornerRadius = ADJUST_PERCENT_FLOAT(11);
    self.orderStatusBtn.layer.borderColor = ZJCOLOR.color_c5.CGColor;
    self.orderStatusBtn.layer.borderWidth = 0.5;
    
    [self.orderMoreBtn setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
    
    [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(cutdownTimeNumber:)
                                      name:TIMER_NOTIFICATION
                                    object:nil];
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 0;
    frame.size.height -= 10;
    frame.origin.y += 10;
    
    [super setFrame:frame];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"YBOrderListTableViewCell" owner:nil options:nil].lastObject;
    }
    return self;
}

- (NSString *)gettimestrWithdifftime:(double)difftime
{
    //小时数
    NSString *hours = [NSString stringWithFormat:@"%02ld", (NSInteger)((difftime)/1000/60/60)];
    //分钟数
    NSString *minute = [NSString stringWithFormat:@"%02ld", (NSInteger)((difftime)/1000/60)%60];
    //秒数
    NSString *second = [NSString stringWithFormat:@"%02ld", ((NSInteger)(difftime))/1000%60];
    
    return [NSString stringWithFormat:@"%@:%@:%@",hours,minute,second];
}

-(void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:TIMER_NOTIFICATION object:nil];
}

@end
