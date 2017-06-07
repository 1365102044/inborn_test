//
//  YXPaymentDetailCell.m
//  Payment
//
//  Created by 郑键 on 16/11/29.
//  Copyright © 2016年 胤宝. All rights reserved.
//

#import "YXPaymentDetailCell.h"
#import "YBStringTool.h"
@interface YXPaymentDetailCell()

/**
 商品名称label
 */
@property (weak, nonatomic) IBOutlet UILabel *goodNameLabel;

/**
 商品名称内容label
 */
@property (weak, nonatomic) IBOutlet UILabel *goodNameContentLabel;

/**
 订单总金额label
 */
@property (weak, nonatomic) IBOutlet UILabel *totleLabel;

/**
 应付金额label
 */
@property (weak, nonatomic) IBOutlet UILabel *handleLabel;

/**
 订单总金额价格label
 */
@property (weak, nonatomic) IBOutlet UILabel *totleContentLabel;

/**
 应付金额价格label
 */
@property (weak, nonatomic) IBOutlet UILabel *handleContentLabel;

/**
 底部分割线视图
 */
@property (weak, nonatomic) IBOutlet UIView *bottomMarginLineView;
@end

@implementation YXPaymentDetailCell

- (void)setalllprice:(NSString *)allprice
      shouldpayprice:(NSString *)shouldpayprice
           goodsname:(NSString *)goodsname
{
    self.goodNameContentLabel.text = goodsname;
    self.totleContentLabel.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:allprice]];
    self.handleContentLabel.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:shouldpayprice]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //** 配置界面 */
    self.backgroundColor                                = [UIColor redColor];
    self.selectionStyle                                 = UITableViewCellSelectionStyleNone;
    
    
    
    self.goodNameLabel.font                             = SYSTEM_REGULARFONT(14);
    self.goodNameContentLabel.font                      = SYSTEM_REGULARFONT(14);
    
    self.goodNameLabel.textColor                             = ZJCOLOR.color_c4;
    self.goodNameContentLabel.textColor                      = ZJCOLOR.color_c4;
    
    self.totleLabel.font                                = SYSTEM_REGULARFONT(13);
    self.totleLabel.textColor                           = ZJCOLOR.color_c4;
    
    self.handleLabel.font                               = SYSTEM_REGULARFONT(13);
    self.handleLabel.textColor                          = ZJCOLOR.color_c4;
    
    self.totleContentLabel.font                         = SYSTEM_REGULARFONT(13);
    self.totleContentLabel.textColor                    = ZJCOLOR.color_c4;
    
    self.handleContentLabel.font                        = SYSTEM_REGULARFONT(13);
    self.handleContentLabel.textColor                   = ZJCOLOR.color_c4;
    
    self.bottomMarginLineView.backgroundColor           = ZJCOLOR.color_c12;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//-(void)setDeatilmodle:(YXPaymentHomepageViewDataModel *)deatilmodle
//{
//    _deatilmodle                = deatilmodle;
//    
//    _goodNameLabel.text         = @"商品名称：";
//    _goodNameContentLabel.text  = deatilmodle.prodName;
//    _totleLabel.text = @"订单总金额：";
//    _totleContentLabel.text     = [NSString stringWithFormat:@"￥%@",
//                                   [YXStringFilterTool strmethodComma:[NSString stringWithFormat:@"%lld",
//                                                                       [deatilmodle.totalAmount longLongValue] / 100]]];
//    _handleLabel.text = @"待付金额：";
//    _handleContentLabel.text    = [NSString stringWithFormat:@"￥%@",
//                                   [YXStringFilterTool strmethodComma:[NSString stringWithFormat:@"%lld",
//                                                                       [deatilmodle.payAmount longLongValue] / 100]]];
//}
//
@end
