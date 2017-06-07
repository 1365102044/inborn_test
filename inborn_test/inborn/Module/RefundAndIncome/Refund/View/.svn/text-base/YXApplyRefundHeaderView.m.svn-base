//
//  YXApplyRefundHeaderView.m
//  inbid-ios
//
//  Created by 胤讯测试 on 16/12/19.
//  Copyright © 2016年 胤讯. All rights reserved.
//

#import "YXApplyRefundHeaderView.h"
#import "UILabel+Extension.h"
#import "YBStringTool.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "YBPublicConfigure_LocalData.h"
@interface YXApplyRefundHeaderView ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *topviewbigView;
@property (weak, nonatomic) IBOutlet UILabel *canrefundTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *CanrefundContentLable;
@property (weak, nonatomic) IBOutlet UILabel *shouxuTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *shouxuContentLable;
@property (weak, nonatomic) IBOutlet UILabel *shituiMoneyLable;
@property (weak, nonatomic) IBOutlet UILabel *shituiMoneyContentLable;
@property (weak, nonatomic) IBOutlet UIView *seactionView;
@property (weak, nonatomic) IBOutlet UIButton *CommitBtn;
@property (weak, nonatomic) IBOutlet UILabel *boomDescLable;
@end

@implementation YXApplyRefundHeaderView

- (void)setRefundAmount:(NSString *)refundAmount
{
    
    NSString *testratio = [YBPublicConfigure_LocalData share].commonRefundRatio;
    double ratio = [testratio doubleValue];
    
    /**
     总金额
     */
    double allamount = [refundAmount doubleValue];
    self.CanrefundContentLable.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:[NSString stringWithFormat:@"%.0f",allamount]]];
    
    self.shouxuTitleLable.text = [NSString stringWithFormat:@"需扣手续费(%.0f‰)",ratio*1000];
    double shouxufei = ratio * [refundAmount doubleValue];
    self.shouxuContentLable.text =  [NSString stringWithFormat:@"-¥%@",[[YBStringTool share] strmethodCommaWith:[NSString stringWithFormat:@"%.0f",shouxufei]]];
    
    /**
     应退金额
     */
//    double shouldrefund = allamount * ratio;
     double shloulfrefunepri = [refundAmount doubleValue] * (1 - ratio);
    self.shituiMoneyContentLable.text = [NSString stringWithFormat:@"¥%@",[[YBStringTool share] strmethodCommaWith:[NSString stringWithFormat:@"%.0f",shloulfrefunepri]]];
    
    NSString * kefuphone = [YBPublicConfigure_LocalData share].customerPhone;
    NSString *descStr = [NSString stringWithFormat:@" 1、退款将原路退回。\n 2、退款时系统会扣除%.0f‰的手续费。\n 3、定金、保证金不可申请退款。\n 4、如需帮助，可联系客服 %@",ratio*1000,kefuphone];
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:descStr];
//    [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c4 range:NSMakeRange(descStr.length-kefuphone.length-1, kefuphone.length)];
     [atter addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(descStr.length-kefuphone.length-1, kefuphone.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    [atter addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,  atter.length)];
    self.boomDescLable.attributedText = atter;
    
    [self.boomDescLable yb_addAttributeTapActionWithStrings:@[kefuphone] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        [YBStringTool  CallPhoneWith:self phone:kefuphone];
    }];
}

+(instancetype)loadheaderview
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YXApplyRefundHeaderView" owner:nil options:nil] lastObject];
}

- (IBAction)ClickCommitBtn:(id)sender {
    if (self.clickBlock) {
        self.clickBlock();
    }
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    self.CommitBtn.layer.cornerRadius = 4;
    self.CommitBtn.layer.masksToBounds = YES;
    
    NSString *kefuphone = [YBPublicConfigure_LocalData share].customerPhone;
    NSString *descStr = [NSString stringWithFormat:@"1.为了保证您的资金，物品安全，请进行安全验证。\n2.如需帮助，可联系客服%@。",kefuphone];
    NSMutableAttributedString *atter = [[NSMutableAttributedString alloc]initWithString:descStr];
    [atter addAttribute:NSForegroundColorAttributeName value:ZJCOLOR.color_c4 range:NSMakeRange(descStr.length-kefuphone.length-1, kefuphone.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;
    [atter addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,  atter.length)];
    self.boomDescLable.attributedText = atter;
   
    NSString *testratio = [YBPublicConfigure_LocalData share].commonRefundRatio;
    YBLog(@"-testratio---%@",testratio);
}


#pragma mark - 懒加载

#pragma mark - 代理方法

@end
