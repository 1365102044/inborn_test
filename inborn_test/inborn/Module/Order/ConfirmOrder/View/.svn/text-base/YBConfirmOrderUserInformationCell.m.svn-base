//
//  YBConfirmOrderUserInformationCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmOrderUserInformationCell.h"
#import "YBConfirmOrderModel.h"

/**
 *  YBConfirmOrderUserInformationCell
 */
NSString * const YBConfirmOrderUserInformationCellReuseIdentifier                = @"YBConfirmOrderUserInformationCellReuseIdentifier";

@interface YBConfirmOrderUserInformationCell()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (strong, nonatomic) IBOutletCollection(YBDefaultLabel) NSArray<YBDefaultLabel *> *detailLabelsArray;
@property (weak, nonatomic) IBOutlet UIImageView *bottomLineImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSapcingCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSpacingCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailLabelMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *accessImageViewHeightWidthCons;

@end

@implementation YBConfirmOrderUserInformationCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel
{
    [super setConfirmOrderModel:confirmOrderModel];
    
    /**
     *  根据数据配置界面
     */
    if ([confirmOrderModel.deliveryType isEqualToString:@"0"]) {
        
        /**
         *  自提
         */
        self.titleLabel.text = ZJSTRING(@"提货人信息");
        self.detailLabelsArray[0].text = [NSString stringWithFormat:@"%@  %@",
                                          confirmOrderModel.addrName,
                                          confirmOrderModel.addrMobile];
        
        if ([confirmOrderModel.addrIdcard ex_isEmpty]
            || !confirmOrderModel.addrIdcard) {
            self.detailLabelsArray[1].text = @" ";
        }else{
            self.detailLabelsArray[1].text = confirmOrderModel.addrIdcard;;
        }
        
        self.bottomLineImageView.hidden = NO;
        self.bottomSpacingLineView.hidden = YES;
    }
    
    if ([confirmOrderModel.deliveryType isEqualToString:@"1"]) {
        
        /**
         *  快递配送
         */
        self.titleLabel.text = ZJSTRING(@"收货人信息");
        self.detailLabelsArray[0].text = [NSString stringWithFormat:@"%@  %@",
                                          confirmOrderModel.addrName,
                                          confirmOrderModel.addrMobile];
        self.detailLabelsArray[1].text = [NSString stringWithFormat:@"%@%@%@%@",
                                          confirmOrderModel.addrProv,
                                          confirmOrderModel.addrCity,
                                          confirmOrderModel.addrCounty,
                                          confirmOrderModel.addrDetail];
        self.bottomLineImageView.hidden = YES;
        self.bottomSpacingLineView.hidden = NO;
    }
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
    /**
     *  配置界面
     */
    self.titleLabel.textColor = ZJCOLOR.color_c4;
    self.titleLabel.font = SYSTEM_REGULARFONT(13.f);
    
    [self.detailLabelsArray enumerateObjectsUsingBlock:^(YBDefaultLabel *  _Nonnull obj,
                                                         NSUInteger idx,
                                                         BOOL * _Nonnull stop) {
        obj.textColor = ZJCOLOR.color_c4;
        obj.font = SYSTEM_LIGHTFONT(13.f);
    }];
    
    self.accessImageView.image = ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                         @"public_moreitem",
                                         ZJProjectLoadImageDefault).firstObject;
    
    self.titleLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(20.f);
    self.leftSapcingCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.rightSpacingCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    self.detailLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(14.f);
    self.detailLabelMarginCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    [self.accessImageViewHeightWidthCons enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
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
    self.bottomLineImageView.hidden = YES;
}

#pragma mark - Seventh.懒加载

@end
