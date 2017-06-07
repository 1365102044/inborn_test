//
//  YBConfirmOrderUserInformationTempCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmOrderUserInformationTempCell.h"
#import "YBVerticalButton.h"
#import "YBConfirmOrderModel.h"

/**
 *  YBConfirmOrderUserInformationTempCell
 */
NSString * const YBConfirmOrderUserInformationTempCellReuseIdentifier            = @"YBConfirmOrderUserInformationTempCellReuseIdentifier";

@interface YBConfirmOrderUserInformationTempCell()

@property (weak, nonatomic) IBOutlet YBVerticalButton *addButton;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *accessImageView;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *bottomLineImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSpacingCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *accessImageViewHeightWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addButtonBottomMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *addButtonTopMarginCons;

@end

@implementation YBConfirmOrderUserInformationTempCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel
{
    [super setConfirmOrderModel:confirmOrderModel];
    
    if ([confirmOrderModel.deliveryType isEqualToString:@"1"]) {
        [self.addButton setTitle:ZJSTRING(@"你还没有收货人信息，点击这里添加")
                        forState:UIControlStateNormal];
        
    }else{
        [self.addButton setTitle:ZJSTRING(@"你还没有提货人信息，点击这里添加")
                        forState:UIControlStateNormal];
    }
}

#pragma mark - Third.点击事件

- (IBAction)addAddressButtonClick:(YBVerticalButton *)sender
{
    /**
     *  添加地址按钮点击事件
     */
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
    self.bottomSpacingLineView.hidden               = YES;
    self.bottomLineImageView.image                  = ZJCURRENTIMAGE(IMAGEFILEPATH_ORDER,
                                                                     @"order_address_bg",
                                                                     ZJProjectLoadImageDefault);
    self.accessImageView.image                      = ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                                              @"public_moreitem",
                                                              ZJProjectLoadImageDefault).firstObject;
    
    self.addButton.titleLabel.font                  = SYSTEM_REGULARFONT(13.f);
    [self.addButton setTitleColor:ZJCOLOR.color_c5
                         forState:UIControlStateNormal];
    [self.addButton setImage:ZJIMAGE(IMAGEFILEPATH_ORDER,
                                     @"order_consignee",
                                     ZJProjectLoadImageDefault).firstObject
                    forState:UIControlStateNormal];
    [self.addButton setImage:ZJIMAGE(IMAGEFILEPATH_ORDER,
                                     @"order_consignee",
                                     ZJProjectLoadImageDefault).lastObject
                    forState:UIControlStateHighlighted];
    [self.addButton setTitle:ZJSTRING(@"你还没有提货人信息，点击这里添加")
                    forState:UIControlStateNormal];
    
    self.rightSpacingCons.constant                  = ADJUST_PERCENT_FLOAT(10.f);
    [self.accessImageViewHeightWidthCons enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                      NSUInteger idx,
                                                                      BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(22.f);
    }];
    self.addButtonBottomMarginCons.constant         = ADJUST_PERCENT_FLOAT(12.f);
    self.bottomLineViewHeightCons.constant          = ADJUST_PERCENT_FLOAT(3.f);
    self.addButtonTopMarginCons.constant            = ADJUST_PERCENT_FLOAT(18.f);
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
