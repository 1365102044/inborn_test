//
//  YBConfirmAgreementCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmAgreementCell.h"
#import "YBConfirmOrderModel.h"

/**
 *  YBConfirmAgreementCell
 */
NSString * const YBConfirmAgreementCellReuseIdentifier                           = @"YBConfirmAgreementCellReuseIdentifier";

@interface YBConfirmAgreementCell()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (weak, nonatomic) IBOutlet YBDefaultButton *tipsButton;
@property (weak, nonatomic) IBOutlet UISwitch *switchView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *tipsButtonHeightWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;

@end

@implementation YBConfirmAgreementCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel
{
    [super setConfirmOrderModel:confirmOrderModel];
    
    /**
     *  操作switchView
     */
    self.switchView.selected = confirmOrderModel.isDepositAgreementSwitch;
}

#pragma mark - Third.点击事件

- (IBAction)tipsButtonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(confirmBaseCell:button:)]) {
        [self.delegate confirmBaseCell:self button:sender];
    }
}

- (IBAction)agreementSwitch:(UISwitch *)sender
{
    sender.selected = !sender.selected;
    self.confirmOrderModel.isDepositAgreementSwitch = sender.selected;
}


#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    /**
     *  配置界面
     */
    self.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.titleLabel.textColor = ZJCOLOR.color_c4;
    self.titleLabel.text = ZJSTRING(@"我已同意定金不退等平台服务协议");
    
    [self.tipsButton setImage:ZJIMAGE(IMAGEFILEPATH_PUBLISH,
                                     @"publish_pricehelp",
                                     ZJProjectLoadImageDefault).firstObject
                     forState:UIControlStateNormal];
    
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    [self.tipsButtonHeightWidth enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                             NSUInteger idx,
                                                             BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(16.f);
    }];
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
