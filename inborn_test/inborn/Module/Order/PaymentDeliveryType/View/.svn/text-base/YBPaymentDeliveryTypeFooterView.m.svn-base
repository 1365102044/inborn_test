//
//  YBPaymentDeliveryTypeFooterView.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentDeliveryTypeFooterView.h"

@implementation YBPaymentDeliveryTypeFooterView

- (void)buttonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(paymentDeliveryTypeFooterView:button:)]) {
        [self.delegate paymentDeliveryTypeFooterView:self button:sender];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        self.backgroundColor = ZJCOLOR.color_c12;
        
        YBDefaultButton *sureButton = [YBDefaultButton buttonFifthWithTitleStringKey:@"确定"
                                                                          titleColor:ZJCOLOR.color_c0
                                                                           titleFont:SYSTEM_REGULARFONT(14.f)
                                                                              target:self
                                                                            selector:@selector(buttonClick:)];
        [self addSubview:sureButton];
        [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ADJUST_PERCENT_FLOAT(30.f));
            make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
            make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
        }];
    }
    return self;
}

@end
