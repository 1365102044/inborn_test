//
//  YBComposeHomePageFooterView.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageFooterView.h"

/**
 *  footer
 */
NSString * const YBComposeHomePageFooterViewReuseIdentifier              = @"YBComposeHomePageFooterViewReuseIdentifier";

@interface YBComposeHomePageFooterView()

/**
 alreadyAgreement
 */
@property (nonatomic, strong) YBDefaultButton *alreadyAgreement;

/**
 agreement
 */
@property (nonatomic, strong) YBDefaultButton *agreement;

@end

@implementation YBComposeHomePageFooterView

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setIsShowFuncButton:(BOOL)isShowFuncButton
{
    _isShowFuncButton = isShowFuncButton;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
        obj.hidden = !isShowFuncButton;
    }];
}

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    if (sender.tag == 1001) {
        
        /**
         *  阅读协议
         */
        sender.selected = !sender.selected;
        if ([self.delegate respondsToSelector:@selector(composeHomePageFooterView:button:)]) {
            [self.delegate composeHomePageFooterView:self button:sender];
        }
    }
    
    if (sender.tag == 1002) {
        
        /**
         *  协议
         */
        if ([self.delegate respondsToSelector:@selector(composeHomePageFooterView:button:)]) {
            [self.delegate composeHomePageFooterView:self button:sender];
        }
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.alreadyAgreement mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(26.75));
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(104.f));
    }];
    
    [self.agreement mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.alreadyAgreement.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(3.f));
        make.centerY.mas_equalTo(self.alreadyAgreement);
    }];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    self.backgroundColor = ZJCOLOR.color_c12;
    
    [self addSubview:self.alreadyAgreement];
    [self addSubview:self.agreement];
    
    /**
     *  初始化同意
     */
    [self buttonClick:self.alreadyAgreement];
}

#pragma mark - Seventh.懒加载

- (YBDefaultButton *)alreadyAgreement
{
    if (!_alreadyAgreement) {
        _alreadyAgreement = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@"我已阅读"
                                                                        titleColor:ZJCOLOR.color_c5
                                                                         titleFont:SYSTEM_REGULARFONT(12.f)
                                                                     imageFilePath:IMAGEFILEPATH_PUBLISH
                                                                        imageNamed:@"publish_agree"
                                                                              type:ZJProjectButtonSetImage
                                                                            target:self
                                                                          selector:@selector(buttonClick:)];
        _alreadyAgreement.imageEdgeInsets = UIEdgeInsetsMake(0, ADJUST_PERCENT_FLOAT(-6.f), 0, 0);
        [_alreadyAgreement setTitleColor:ZJCOLOR.color_c4
                                forState:UIControlStateSelected];
        _alreadyAgreement.tag = 1001;
    }
    return _alreadyAgreement;
}

- (YBDefaultButton *)agreement
{
    if (!_agreement) {
        _agreement = [YBDefaultButton buttonWithTitleStringKey:@"胤宝售卖服务协议"
                                                    titleColor:ZJCOLOR.color_c4
                                                     titleFont:SYSTEM_REGULARFONT(12.f)
                                                        target:self
                                                      selector:@selector(buttonClick:)];
        _agreement.tag = 1002;
    }
    return _agreement;
}

@end
