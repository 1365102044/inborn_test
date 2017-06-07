//
//  YBConfirmOrderDetailCell.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBConfirmOrderDetailCell.h"
#import "YBAttributedStringLabel.h"
#import "YBConfirmOrderModel.h"
#import "YBStringTool.h"

/**
 *  YBConfirmOrderDetailCell
 */
NSString * const YBConfirmOrderDetailCellReuseIdentifier                         = @"YBConfirmOrderDetailCellReuseIdentifier";

@interface YBConfirmOrderDetailCell()

@property (weak, nonatomic) IBOutlet ZJBaseImageView *goodImageView;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *titleLabel;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *detailLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSpacingCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *goodImageViewHeightWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;


@end

@implementation YBConfirmOrderDetailCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setConfirmOrderModel:(YBConfirmOrderModel *)confirmOrderModel
{
    [super setConfirmOrderModel:confirmOrderModel];
    
    /**
     *  根据数据配置界面
     */
    [self.titleLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                             @"content" : confirmOrderModel.goodsName,
                                                             @"size" : SYSTEM_REGULARFONT(13.f),
                                                             @"lineSpacing": @10}]];
    self.titleLabel.numberOfLines = 2;
    [self.detailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : @"¥",
                                                              @"size" : SYSTEM_REGULARFONT(12.f),
                                                              @"lineSpacing": @0},
                                                            @{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : [[YBStringTool share] strmethodCommaWith:confirmOrderModel.mallPrice],
                                                              @"size" : SYSTEM_REGULARFONT(13.f),
                                                              @"lineSpacing": @0}]];
    [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList, confirmOrderModel.squareImage)]
                          placeholderImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC,
                                                          @"public_placeHolder",
                                                          ZJProjectLoadImageDefault)
                                   options:SDWebImageRetryFailed];
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    /**
     *  配置界面
     */
    self.goodImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.goodImageView.clipsToBounds = YES;
    
    self.leftSpacingCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    [self.goodImageViewHeightWidthCons enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                                    NSUInteger idx,
                                                                    BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(60.f);
    }];
    self.titleLabelLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载
@end
