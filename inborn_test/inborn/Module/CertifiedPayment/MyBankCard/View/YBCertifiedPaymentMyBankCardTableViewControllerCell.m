//
//  YBCertifiedPaymentMyBankCardTableViewControllerCell.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentMyBankCardTableViewControllerCell.h"

NSString * const YBCertifiedPaymentMyBankCardTableViewControllerCellReusableCellIdentifier = @"YBCertifiedPaymentMyBankCardTableViewControllerCellReusableCellIdentifier";

@interface YBCertifiedPaymentMyBankCardTableViewControllerCell()

/**
 detailLabel
 */
@property (nonatomic, strong) YBDefaultLabel *detailLabel;

@end

@implementation YBCertifiedPaymentMyBankCardTableViewControllerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    self.funcButton.hidden = YES;
    
    self.detailLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13.f)
                                                text:@"卡号"
                                           textColor:ZJCOLOR.color_c5];
    [self.contentView addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.accessImageView.mas_left);
    }];
}

@end
