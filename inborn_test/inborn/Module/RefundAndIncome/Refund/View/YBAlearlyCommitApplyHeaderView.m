//
//  YBAlearlyCommitApplyHeaderView.m
//  inborn
//
//  Created by 刘文强 on 2017/4/10.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAlearlyCommitApplyHeaderView.h"
#import "YBPublicConfigure_LocalData.h"
#import "YBStringTool.h"
#import "UILabel+YBAttributeTextTapAction.h"

@interface YBAlearlyCommitApplyHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *descLable;

@end

@implementation YBAlearlyCommitApplyHeaderView

+(instancetype)creatAlearlyCommitApplyHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YBAlearlyCommitApplyHeaderView" owner:nil options:nil] lastObject];
}

-(void)setRefundmodle:(YBRefundModel *)refundmodle
{
    _refundmodle = refundmodle;
    
//    self.priceLable.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:refundmodle.refundAmt]];
    

//    NSString *testratio = [YBPublicConfigure_LocalData share].commonRefundRatio;
//    double ratio = [testratio doubleValue];
//    double pri = [refundmodle.refundAmt doubleValue] * (1 - ratio);
    self.priceLable.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:[NSString stringWithFormat:@"%@",refundmodle.refundAmt]]];
    
    self.descLable.numberOfLines = 0;
    NSString *kefuphone = [YBPublicConfigure_LocalData share].customerPhone;
    NSString *desc = [NSString stringWithFormat:@"1.平台将在%@个工作日内处理您的退款申请。\n2.银行到账时间预计需要%@个工作日。\n3.如需帮助可联系客服%@。",refundmodle.refundDealDays,refundmodle.refundWorkDays,kefuphone];
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:desc];
    [atter addAttribute:NSFontAttributeName value:SYSTEM_REGULARFONT(12) range:NSMakeRange(0, desc.length)];
    [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c5 range:NSMakeRange(0, atter.length)];
    [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c4 range:NSMakeRange(desc.length-kefuphone.length-1, kefuphone.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    [atter addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,  atter.length)];
    self.descLable.attributedText  = atter;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    NSString *kefuphone = [YBPublicConfigure_LocalData share].customerPhone;
    [self.descLable yb_addAttributeTapActionWithStrings:@[kefuphone] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        [YBStringTool  CallPhoneWith:self phone:kefuphone];
    }];
}

@end
