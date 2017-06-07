//
//  YBPaymentRecordTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/4/11.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentRecordTableViewCell.h"

#import "YBStringTool.h"
@interface YBPaymentRecordTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *payLable;

@property (weak, nonatomic) IBOutlet UILabel *paymentyypeLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;

@end

@implementation YBPaymentRecordTableViewCell

- (void)setDataModle:(YBRefundModel *)dataModle
{
    _dataModle = dataModle;
    /**
     * 支付方式： 1 PC网银支付，2 手机微信支付，3手机支付宝支付，4apple pay，5连连认证支付
     */
    NSString *str ;
    if (dataModle.payType ==1) {
        str = @"PC网银支付";
    }else if(dataModle.payType == 2){
        str = @"手机微信支付";
    }else if(dataModle.payType == 3){
        str = @"手机支付宝支付";
    }else if(dataModle.payType == 4){
        str = @"Apple Pay";
    }else if(dataModle.payType == 5){
        str = @"连连认证支付";
    }
    self.payLable.text = str;
    
    
    NSString *paystr;
    
    if (dataModle.isDepositPay == 1) {
        paystr = @"定金";
    }else {
        if(dataModle.isPartPay == 1 ){
        paystr = @"分笔";
        }else{
        paystr = @"全款";
        }
    }
    self.paymentyypeLable.text = paystr;
    
    
    self.timeLable.text = [[YBStringTool share] returnTimeStrformeTimestr:dataModle.payedTime timestyle:@"yyyy-MM-dd"];
    
    self.priceLable.text = [NSString stringWithFormat:@"¥ %@",[[YBStringTool share] strmethodCommaWith:dataModle.payAmt]];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"YBPaymentRecordTableViewCell" owner:nil options:nil] lastObject];
    }
    
    return  self;
}
@end
