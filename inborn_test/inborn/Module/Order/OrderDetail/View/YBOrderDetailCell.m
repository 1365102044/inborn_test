//
//  YBOrderDetailCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailCell.h"
#import "YBAttributedStringLabel.h"
#import "YBOrderDetailViewModel.h"
#import "YBStringTool.h"

/**
 *  YBOrderDetailCell
 */
NSString * const YBOrderDetailCellReuseIdentifier = @"YBOrderDetailCellReuseIdentifier";

@interface YBOrderDetailCell()

@property (weak, nonatomic) IBOutlet ZJBaseImageView *goodImageView;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *goodNameTitleLabel;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *detailLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSpacingCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *goodImageViewHeightWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;

@end

@implementation YBOrderDetailCell

- (void)setOrderDetailModel:(YBOrderDetailModel *)orderDetailModel
{
    [super setOrderDetailModel:orderDetailModel];
    
    /**
     *  根据数据配置界面
     */
    [self.goodNameTitleLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                     @"content" : orderDetailModel.goodsName ? orderDetailModel.goodsName : @"",
                                                                     @"size" : SYSTEM_REGULARFONT(13.f),
                                                                     @"lineSpacing": @10}]];
    self.goodNameTitleLabel.numberOfLines = 2;
    [self.detailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : @"¥",
                                                              @"size" : SYSTEM_REGULARFONT(12.f),
                                                              @"lineSpacing": @0},
                                                            @{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : [[YBStringTool share] strmethodCommaWith:orderDetailModel.goodsPrice ? orderDetailModel.goodsPrice : @" "],
                                                              @"size" : SYSTEM_REGULARFONT(13.f),
                                                              @"lineSpacing": @0}]];
    [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList,
                                                                                 orderDetailModel.goodsImage)]
                          placeholderImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC,
                                                          @"public_placeHolder",
                                                          ZJProjectLoadImageDefault) options:SDWebImageRetryFailed];
    
}

- (void)setSellOutdataModle:(YBMySellOutModel *)sellOutdataModle
{
    _sellOutdataModle = sellOutdataModle;
    
    /**
     *  根据数据配置界面
     */
    [self.goodNameTitleLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                     @"content" : sellOutdataModle.goodsName ? sellOutdataModle.goodsName : @"",
                                                                     @"size" : SYSTEM_REGULARFONT(13.f),
                                                                     @"lineSpacing": @10}]];
    self.goodNameTitleLabel.numberOfLines = 2;
    [self.detailLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : @"¥",
                                                              @"size" : SYSTEM_REGULARFONT(12.f),
                                                              @"lineSpacing": @0},
                                                            @{@"color" : ZJCOLOR.color_c4,
                                                              @"content" : [[YBStringTool share] strmethodCommaWith:sellOutdataModle.goodsPrice ? sellOutdataModle.goodsPrice : @" "],
                                                              @"size" : SYSTEM_REGULARFONT(13.f),
                                                              @"lineSpacing": @0}]];
    [self.goodImageView sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageURLStringList,
                                                                                 sellOutdataModle.goodsImage)]
                          placeholderImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLIC,
                                                          @"public_placeHolder",
                                                          ZJProjectLoadImageDefault) options:SDWebImageRetryFailed];
}

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

@end
