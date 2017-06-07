//
//  YBConfirmOrderDefaultCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmOrderDefaultCell.h"
#import "YBAttributedStringLabel.h"
#import "YBConfirmOrderModel.h"
#import "YBStringTool.h"

/**
 *  defaultCell
 */
NSString * const YBConfirmOrderViewControllerDefaultCellReuseIdentifier          = @"YBConfirmOrderViewControllerDefaultCellReuseIdentifier";

@interface YBConfirmOrderDefaultCell()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (weak, nonatomic) IBOutlet YBDefaultButton *tipsButton;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *detailLabel;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *accessImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomLineImageView;
@property (weak, nonatomic) IBOutlet UITextField *idCardTextField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *tipsButtonHeightWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailButtonRightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *accessImageViewHeightWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *idCardRightMarginCons;

@end

@implementation YBConfirmOrderDefaultCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel
{
    [super setConfirmOrderModel:confirmOrderModel];
    
    self.titleLabel.text = confirmOrderModel.title;
    
    /**
     *  根据数据布置界面
     */
    self.accessImageView.hidden = !confirmOrderModel.isShowAccessImageView;
    self.detailLabel.hidden = confirmOrderModel.isHiddenDetailLabel;
    
    /**
     *  判断是否隐藏辅助视图
     */
    if (self.accessImageView.hidden) {
        self.detailButtonRightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    }else{
        self.detailButtonRightMarginCons.constant = ADJUST_PERCENT_FLOAT(38.f);
    }
    
    /**
     *  判断是否是身份证cell
     */
    if (confirmOrderModel.isIdCardCell) {
        self.tipsButton.hidden                              = NO;
        self.bottomLineImageView.hidden                     = NO;
        self.tipsButton.tag                                 = 1003;
        
        /**
         *  判断是否有身份证信息
         */
        if ([confirmOrderModel.addrIdcard ex_isEmpty]
            || !confirmOrderModel.addrIdcard) {
            self.detailLabel.textColor          = ZJCOLOR.color_c5;
        }else{
            self.detailLabel.textColor          = ZJCOLOR.color_c4;
        }
        
    }else{
        self.tipsButton.hidden                              = YES;
        self.bottomLineImageView.hidden                     = YES;
        self.tipsButton.tag                                 = 0;
    }
    
    /**
     *  判断是否是待付金额cell，如果是，赋值采用富文本方式
     */
    if (confirmOrderModel.isDetailAmont) {
        [self.detailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                  @"content" : @"¥",
                                                                  @"size" : SYSTEM_REGULARFONT(12.f),
                                                                  @"lineSpacing": @0},
                                                                @{@"color" : ZJCOLOR.color_c4,
                                                                  @"content" : [[YBStringTool share] strmethodCommaWith:confirmOrderModel.unpaidAmount],
                                                                  @"size" : SYSTEM_REGULARFONT(13.f),
                                                                  @"lineSpacing": @0}]];
        
        
    }else{
        self.detailLabel.text = confirmOrderModel.detailTitle;
    }
}

#pragma mark - Third.点击事件

/**
 点击事件

 @param sender sender
 */
- (IBAction)tipsButtonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(confirmBaseCell:button:)]) {
        [self.delegate confirmBaseCell:self button:sender];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    /**
     *  配置界面
     */
    self.titleLabel.textColor = ZJCOLOR.color_c4;
    self.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.detailLabel.textColor = ZJCOLOR.color_c4;
    self.detailLabel.font = SYSTEM_REGULARFONT(13.f);
    self.idCardTextField.font = SYSTEM_REGULARFONT(13.f);
    self.idCardTextField.placeholder = ZJSTRING(@"请输入收件人证件号码");
    
    self.tipsButton.hidden = YES;
    [self.tipsButton setImage:ZJIMAGE(IMAGEFILEPATH_ORDER,
                                      @"order_tips",
                                      ZJProjectLoadImageDefault).firstObject
                     forState:UIControlStateNormal];
    
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    [self.tipsButtonHeightWidth enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                             NSUInteger idx,
                                                             BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(16.f);
    }];
    self.detailButtonRightMarginCons.constant = ADJUST_PERCENT_FLOAT(38.f);
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    [self.accessImageViewHeightWidth enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                  NSUInteger idx,
                                                                  BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(22.f);
    }];
    self.accessImageView.image = ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                         @"public_moreitem",
                                         ZJProjectLoadImageDefault).firstObject;
    self.bottomLineImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_ORDER,
                                                    @"order_address_bg",
                                                    ZJProjectLoadImageDefault);
    self.idCardRightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.bottomLineImageView.hidden = YES;
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
