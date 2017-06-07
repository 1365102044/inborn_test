//
//  YBOrderDetailLogisticsCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailLogisticsCell.h"
#import "YBAttributedStringLabel.h"
#import "YBOrderDetailViewModel.h"

/**
 *  YBOrderDetailLogisticsCell
 */
NSString * const YBOrderDetailLogisticsCellReuseIdentifier = @"YBOrderDetailLogisticsCellReuseIdentifier";

@interface YBOrderDetailLogisticsCell()

@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *logisticsTitleLabel;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *logisticsLogoImageView;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *contentLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *timeLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *timeLabelTopMarginCons;

@end

@implementation YBOrderDetailLogisticsCell

- (void)setOrderDetailModel:(YBOrderDetailModel *)orderDetailModel
{
    [super setOrderDetailModel:orderDetailModel];
    
    [self.logisticsTitleLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                      @"content" : [NSString stringWithFormat:@"%@  ", orderDetailModel.deliveryMerchant ? orderDetailModel.deliveryMerchant : @" "],
                                                                      @"size" : SYSTEM_REGULARFONT(13.f),
                                                                      @"lineSpacing": @0.f},
                                                                    @{@"color" : ZJCOLOR.color_c5,
                                                                      @"content" : orderDetailModel.deliveryNum ? orderDetailModel.deliveryNum : @" ",
                                                                      @"size" : SYSTEM_REGULARFONT(12.f),
                                                                      @"lineSpacing": @0.f}]];
    
    self.contentLabel.attributedText = [self attributedStringWithHTMLString:[[orderDetailModel.routes.firstObject remark] ex_htmlEntityDecode]];
    self.timeLabel.text = [orderDetailModel.routes.firstObject time];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.contentLabel.numberOfLines = 1;
    self.contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    [self.contentView addSubview:self.accessImageView];
    [self.accessImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(22.f));
    }];
    self.titleLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(19.f);
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.logoImageViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(11.f);
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(38.f);
    
    self.bottomSpacingLineView.hidden = YES;
    
    self.logisticsLogoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_ORDERDETAIL,
                                                       @"orderdetails_take_icon",
                                                       ZJProjectLoadImageDefault);
    
    self.timeLabel.font = SYSTEM_REGULARFONT(12.f);
    self.timeLabel.textColor = ZJCOLOR.color_c5;
    self.timeLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(10.f);
}

/**
 *  将HTML字符串转化为NSAttributedString富文本字符串
 */
- (NSAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString
{
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [[NSAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
}

@end
