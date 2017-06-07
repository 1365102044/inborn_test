//
//  YBBankCardTableViewCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBBankCardTableViewCell.h"
#import "YBBankCardModel.h"

NSString * const YBBankCardTableViewCellReusableIdentifier = @"YBBankCardTableViewCellReusableIdentifier";

@interface YBBankCardTableViewCell()

@property (weak, nonatomic) IBOutlet ZJBaseImageView *logoIconImageView;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *bankNameLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *bankCardInformationLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *bgViewMarginConsArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewLeftMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *logoImageViewHeightWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelLeftMarginCons;

@end

@implementation YBBankCardTableViewCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setBankCardModel:(YBBankCardModel *)bankCardModel
{
    _bankCardModel = bankCardModel;
    
    self.bankNameLabel.text = bankCardModel.bankName;
    self.bankCardInformationLabel.text = [NSString stringWithFormat:@"%@ 丨 **** **** **** %@",
                                          bankCardModel.cardType,
                                          bankCardModel.cardNo];
    [self.logoIconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://inbid-pro.img-cn-beijing.aliyuncs.com/bank/%@.png", bankCardModel.bankCode]]
                              placeholderImage:nil
                                       options:SDWebImageRetryFailed];
    
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupCustomUI];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    ZJBaseView *bgView = [[ZJBaseView alloc] init];
    bgView.backgroundColor = ZJCOLOR.color_c12;
    self.backgroundView = bgView;
    
    self.bottomSpacingLineView.hidden = YES;
    
    self.bankNameLabel.font = SYSTEM_REGULARFONT(14.f);
    self.bankNameLabel.textColor = ZJCOLOR.color_c4;
    
    self.bankCardInformationLabel.font = SYSTEM_REGULARFONT(12.f);
    self.bankCardInformationLabel.textColor = ZJCOLOR.color_c4;
    
    self.bgView.backgroundColor = ZJCOLOR.color_c0;
    self.bgView.layer.cornerRadius = ADJUST_PERCENT_FLOAT(4.f);
    self.bgView.layer.masksToBounds = YES;
    
    [self.bgViewMarginConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                             NSUInteger idx,
                                                             BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(12.f);
    }];
    self.logoImageViewLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    [self.logoImageViewHeightWidthCons enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                    NSUInteger idx,
                                                                    BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(33.f);
    }];
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.titleLabelLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(18.5);
}

#pragma mark - Seventh.懒加载

@end
