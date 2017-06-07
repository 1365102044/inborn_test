//
//  YBAlearlyCommitApplyView.m
//  inborn
//
//  Created by 刘文强 on 2017/4/7.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAlearlyCommitApplyView.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "YBStringTool.h"
#import "YBPublicConfigure_LocalData.h"
@interface YBAlearlyCommitApplyView ()
{
    
    
    UIImageView *myimageview;
    YBDefaultLabel *toplable;
    YBDefaultLabel *seactionlable;
    YBDefaultLabel *desclable;
}
@end

@implementation YBAlearlyCommitApplyView

-(void)setRefundmodle:(YBRefundModel *)refundmodle
{
    _refundmodle = refundmodle;
    
    NSString *kefuphone = [YBPublicConfigure_LocalData share].customerPhone;
    NSString *desc = [NSString stringWithFormat:@"1.平台将在%@个工作日内处理您的退款申请。\n2.银行到账时间预计需要%@个工作日。\n3.如需帮助可联系客服%@。",refundmodle.refundDealDays,refundmodle.refundWorkDays,kefuphone];
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:desc];
    [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c5 range:NSMakeRange(0, atter.length)];
    [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c4 range:NSMakeRange(desc.length-kefuphone.length-1, kefuphone.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    [atter addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,  atter.length)];
    desclable.attributedText  = atter;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        myimageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"watchrefunddeatil"]];
        [self addSubview:myimageview];
        
        toplable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(17)
                                            text:@"申请已提交"
                                       textColor:ZJCOLOR.color_c4];
        toplable.numberOfLines = 0;
        toplable.textAlignment= NSTextAlignmentCenter;
        [self addSubview:toplable];
        
        seactionlable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(12)
                                            text:@"将退回至您的支付银行卡内"
                                       textColor:ZJCOLOR.color_c4];
        seactionlable.numberOfLines = 0;
        seactionlable.textAlignment= NSTextAlignmentCenter;
        [self addSubview:seactionlable];
        
        
        desclable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13)
                                            text:@""
                                       textColor:ZJCOLOR.color_c4];
        desclable.numberOfLines = 0;
        [self addSubview:desclable];
        
        
        NSString *kefuphone = [YBPublicConfigure_LocalData share].customerPhone;
        NSString *desc = [NSString stringWithFormat:@"1.平台将在%@个工作日内处理您的退款申请。\n2.银行到账时间预计需要%@个工作日。\n3.如需帮助可联系客服%@。",@"2",@"3-5",kefuphone];
        NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:desc];
        [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c5 range:NSMakeRange(0, atter.length)];
        [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c4 range:NSMakeRange(desc.length-kefuphone.length-1, kefuphone.length)];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5;
        [atter addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,  atter.length)];
        desclable.attributedText  = atter;
     
        
        [desclable yb_addAttributeTapActionWithStrings:@[kefuphone] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
            
            [YBStringTool  CallPhoneWith:self phone:kefuphone];
        }];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    myimageview.frame = CGRectMake(10, 100, 43, 43);
    myimageview.centerX = self.centerX;
    
    toplable.frame = CGRectMake(10, myimageview.bottom+40, SCREEN_WIDTH-20, 40);
    seactionlable.frame = CGRectMake(10, toplable.bottom+10, SCREEN_WIDTH-20, 40);
    desclable.frame =CGRectMake(25, seactionlable.bottom+50, SCREEN_WIDTH-30, 120);
    
}
@end
