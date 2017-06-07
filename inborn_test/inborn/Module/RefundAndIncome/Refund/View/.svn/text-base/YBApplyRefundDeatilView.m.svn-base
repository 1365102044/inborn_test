//
//  YBApplyRefundDeatilView.m
//  inborn
//
//  Created by 刘文强 on 2017/4/7.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBApplyRefundDeatilView.h"
#import "YBStringTool.h"
#import "NSDate+Extension.h"
#import "NSString+Extension.h"

@interface YBApplyRefundDeatilView ()
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *statusLable;

/**
 状态
 */
@property (weak, nonatomic) IBOutlet UIImageView *refundsatauImageView;
@property (weak, nonatomic) IBOutlet UILabel *refundTopstatusLable;
@property (weak, nonatomic) IBOutlet UILabel *refundTopTimeLable;

@property (weak, nonatomic) IBOutlet UILabel *refundMidstatusLable;
@property (weak, nonatomic) IBOutlet UILabel *refundMidTimeLable;

@property (weak, nonatomic) IBOutlet UILabel *refundBoomstatusLable;
@property (weak, nonatomic) IBOutlet UILabel *refundBoomTimeLable;

/**
 备注
 */
@property (weak, nonatomic) IBOutlet UILabel *beizhucontentLable;
@property (weak, nonatomic) IBOutlet UILabel *orderNumberLable;

/**
 创建时间
 */
@property (weak, nonatomic) IBOutlet UILabel *creatTimeLable;

@end

@implementation YBApplyRefundDeatilView


+(instancetype)loadheaderview
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YBApplyRefundDeatilView" owner:nil options:nil] lastObject];
}

- (void)setDataModel:(YBRefundModel *)dataModel
{

    UIColor *color2 = ZJCOLOR.color_c4;
    
    self.priceLable.text = [NSString stringWithFormat:@"¥ %@",[[YBStringTool share] strmethodCommaWith:dataModel.refundAmt]];

    self.statusLable.text = dataModel.refundStatusStr;
    self.orderNumberLable.text = [NSString stringWithFormat:@"(%@)",dataModel.refundInfo];
    
    self.refundTopTimeLable.text = [[YBStringTool share] returnTimeStrformeTimestr:dataModel.createTime timestyle:@"MM-dd HH:mm"];
    self.creatTimeLable.text = [[YBStringTool share] returnTimeStrformeTimestr:dataModel.createTime timestyle:@"MM-dd HH:mm"];

    if (dataModel.refundStatus == 1 ||dataModel.refundStatus == 4) {
        self.refundsatauImageView.image = [UIImage imageNamed:@"refund_radio1_icon"];
        self.refundMidstatusLable.textColor = color2;
        self.refundBoomstatusLable.textColor = color2;
        
    }else if (dataModel.refundStatus == 2 ) {
        self.refundsatauImageView.image = [UIImage imageNamed:@"refund_radio2_icon"];
        
        self.refundBoomstatusLable.textColor = color2;
        self.refundMidTimeLable.text = [[YBStringTool share] returnTimeStrformeTimestr:dataModel.updateTime timestyle:@"MM-dd HH:mm"];
        
    }else if (dataModel.refundStatus == 3){
        self.refundsatauImageView.image = [UIImage imageNamed:@"refund_radio3_icon"];
        self.refundBoomTimeLable.text = [[YBStringTool share] returnTimeStrformeTimestr:dataModel.updateTime timestyle:@"MM-dd HH:mm"];
    }
}


@end
