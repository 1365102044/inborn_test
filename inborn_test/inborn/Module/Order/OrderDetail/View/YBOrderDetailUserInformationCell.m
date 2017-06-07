//
//  YBOrderDetailUserInformationCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBOrderDetailUserInformationCell.h"
#import "YBOrderDetailViewModel.h"
#import "YBAttributedStringLabel.h"
#import "YBPublicConfigure_LocalData.h"

/**
 *  YBOrderDetailUserInformationCell
 */
NSString * const YBOrderDetailUserInformationCellReuseIdentifier = @"YBOrderDetailUserInformationCellReuseIdentifier";

@interface YBOrderDetailUserInformationCell()

@property (weak, nonatomic) IBOutlet YBDefaultLabel *userInformationTitleLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray<UILabel *> *detailLabelsArray;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSapcingCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSpacingCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailLabelMarginCons;

@end

@implementation YBOrderDetailUserInformationCell

- (void)setOrderDetailModel:(YBOrderDetailModel *)orderDetailModel
{
    [super setOrderDetailModel:orderDetailModel];
    
    if ([orderDetailModel.deliveryType isEqualToString:@"0"]) {
        
        /**
         *  自提
         */
        self.userInformationTitleLabel.text = [NSString stringWithFormat:@"%@：%@",
                                               ZJSTRING(@"配送方式"),
                                               ZJSTRING(@"来店自提")];
        YBAttributedStringLabel *attrLabel = (YBAttributedStringLabel *)self.detailLabelsArray[0];
        NSString *tempString = [NSString stringWithFormat:@"自提地址：%@\n贵宾专线：%@\n营业时间：%@",
                                [NSString stringWithFormat:@"%@%@%@%@",
                                 orderDetailModel.addrProv ? orderDetailModel.addrProv : @"",
                                 orderDetailModel.addrCity ? orderDetailModel.addrCity : @"",
                                 orderDetailModel.addrCounty ? orderDetailModel.addrCounty : @"",
                                 orderDetailModel.addrDetail ? orderDetailModel.addrDetail : @""],
                                orderDetailModel.addrMobile ? orderDetailModel.addrMobile : @"",
                                [[YBPublicConfigure_LocalData new] businessTime]];
        
        YBLog(@"%@", tempString);
        
        [attrLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                           @"content" : tempString,
                                                           @"size" : SYSTEM_REGULARFONT(12.f),
                                                           @"lineSpacing": @(ADJUST_PERCENT_FLOAT(10.f))}]];
        self.detailLabelsArray[1].hidden = YES;

    }
    
    if ([orderDetailModel.deliveryType isEqualToString:@"1"]) {
        
        /**
         *  物流
         */
        self.userInformationTitleLabel.text = [NSString stringWithFormat:@"%@：%@",
                                               ZJSTRING(@"配送方式"),
                                               ZJSTRING(@"快递邮寄")];
        self.detailLabelsArray[0].text = [NSString stringWithFormat:@"%@  %@",
                                          orderDetailModel.addrName,
                                          orderDetailModel.addrMobile];
        self.detailLabelsArray[1].text = [NSString stringWithFormat:@"%@%@%@%@",
                                          orderDetailModel.addrProv ? orderDetailModel.addrProv : @"",
                                          orderDetailModel.addrCity ? orderDetailModel.addrCity : @"",
                                          orderDetailModel.addrCounty ? orderDetailModel.addrCounty : @"",
                                          orderDetailModel.addrDetail ? orderDetailModel.addrDetail : @""];
        self.detailLabelsArray[1].hidden = NO;
    }
}

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

- (void)setupCustomUI
{
    /**
     *  配置界面
     */
    self.userInformationTitleLabel.textColor = ZJCOLOR.color_c4;
    self.userInformationTitleLabel.font = SYSTEM_REGULARFONT(13.f);
    
    [self.detailLabelsArray enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj,
                                                         NSUInteger idx,
                                                         BOOL * _Nonnull stop) {
        obj.textColor = ZJCOLOR.color_c4;
        obj.font = SYSTEM_LIGHTFONT(13.f);
        obj.lineBreakMode = NSLineBreakByTruncatingTail;
    }];
    
    self.titleLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(20.f);
    self.leftSapcingCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.rightSpacingCons.constant = ADJUST_PERCENT_FLOAT(10.f);
    self.detailLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(14.f);
    self.detailLabelMarginCons.constant = ADJUST_PERCENT_FLOAT(10.f);
}


@end
