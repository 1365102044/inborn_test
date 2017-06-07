//
//  YBTopAlert.m
//  inborn
//
//  Created by 郑键 on 17/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBTopAlert.h"
#import "YBAttributedStringLabel.h"

@interface YBTopAlert()

/**
 alertView
 */
@property (nonatomic, strong) ZJBaseView *alertView;

/**
 tipsLabel
 */
@property (nonatomic, strong) YBAttributedStringLabel *tipsLabel;

/**
 countDownLabel
 */
@property (nonatomic, strong) ZJBaseLabel *titleLabel;

/**
 关闭按钮
 */
@property (nonatomic, strong) YBDefaultButton *closeButton;

/**
 block
 */
@property (nonatomic, copy) ZJEventCallBackBlock eventCallBackBlock;

@end

@implementation YBTopAlert

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)closeButtonClick:(UIButton *)sender
{
    [self hiddenAlert];
    self.eventCallBackBlock(self);
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

+ (instancetype)sharedAlert
{
    static id alertInstance                 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertInstance                       = [[self alloc] initWithFrame:CGRectMake(0,
                                                                                     0,
                                                                                     SCREEN_WIDTH,
                                                                                     ADJUST_PERCENT_FLOAT(PROJECT_ALERT_TOP_HEIGHT))];
    });
    return alertInstance;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [super setupCustomUI];
    
    [self addSubview:self.alertView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.alertView).mas_offset(ADJUST_PERCENT_FLOAT(20.f));
        make.top.mas_equalTo(self.alertView).mas_offset(ADJUST_PERCENT_FLOAT(18.f));
        make.right.mas_equalTo(self.closeButton.mas_left);
    }];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel);
        make.right.mas_equalTo(self.alertView).mas_offset(ADJUST_PERCENT_FLOAT(-20.f));
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(20.f));
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.alertView).mas_offset(ADJUST_PERCENT_FLOAT(0));
        //make.top.mas_equalTo(self.alertView).mas_offset(ADJUST_PERCENT_FLOAT(19.75));
        make.right.mas_equalTo(self.alertView).mas_offset(ADJUST_PERCENT_FLOAT(0));
        //make.right.mas_equalTo(self.alertView).mas_offset(ADJUST_PERCENT_FLOAT(-23.75));
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(68.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(60.f));
    }];
}

#pragma mark - Seventh.懒加载

- (YBDefaultButton *)closeButton
{
    if (!_closeButton) {
        _closeButton                                        = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_LOGINANDREGISTER_LOGIN
                                                                                                 imageNamed:@"login_off"
                                                                                                       type:ZJProjectButtonSetImage
                                                                                                     target:self
                                                                                                   selector:@selector(closeButtonClick:)];
    }
    return _closeButton;
}

- (ZJBaseLabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel                                         = [[ZJBaseLabel alloc] init];
        _titleLabel.font                                    = SYSTEM_REGULARFONT(18.f);
        _titleLabel.textColor                               = ZJCOLOR.color_c0;
        _tipsLabel.backgroundColor                          = self.alertView.backgroundColor;
        _titleLabel.text = @"测试文字";
    }
    return _titleLabel;
}

- (YBAttributedStringLabel *)tipsLabel
{
    if (!_tipsLabel) {
        _tipsLabel                                          = [YBAttributedStringLabel labelWithFont:SYSTEM_REGULARFONT(13.f)
                                                                                                text:@"测试"
                                                                                           textColor:ZJCOLOR.color_c0];
        _tipsLabel.backgroundColor                          = self.alertView.backgroundColor;
    }
    return _tipsLabel;
}

- (ZJBaseView *)alertView
{
    if (!_alertView) {
        _alertView                                          = [[ZJBaseView alloc] initWithFrame:CGRectMake(0,
                                                                                                           -self.height,
                                                                                                           self.width,
                                                                                                           self.height)];
        _alertView.layer.shadowOffset                       = CGSizeMake(0, 3);
        _alertView.layer.shadowOpacity                      = 0.5;
        _alertView.layer.shadowRadius                       = 2.0;
        _alertView.tag                                      = -9999;
        [_alertView addSubview:self.tipsLabel];
        [_alertView addSubview:self.titleLabel];
        [_alertView addSubview:self.closeButton];
        
    }
    return _alertView;
}

#pragma mark - Eight.Other

/**
 显示顶部弹窗
 
 @param titleStringKey                              titleStringKey
 @param tipsStringKey                               tipsStringKey
 @param type                                        弹窗类型
 @param eventCallBackBlock                          点击事件回调
 */
- (void)showAlertWithTitleStringKey:(NSString *)titleStringKey
                      tipsStringKey:(NSString *)tipsStringKey
                               type:(YBTopAlertType)type
                 eventCallBackBlock:(ZJEventCallBackBlock)eventCallBackBlock
{
    /**
     *  根据不同的弹窗做不同的处理
     */
    self.eventCallBackBlock                                 = eventCallBackBlock;
    
    if (type == YBTopAlertDefault) {
        self.alertView.backgroundColor                      = ZJCOLOR.color_c0;
    }
    
    if (type == YBTopAlertSuccess) {
        self.alertView.backgroundColor                      = ZJCOLOR.color_c6;
    }
    
    if (type == YBTopAlertError) {
        self.alertView.backgroundColor                      = ZJCOLOR.color_c9;
    }
    
    self.titleLabel.text                                    = ZJSTRING(titleStringKey);
    [self.tipsLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c0,
                                                            @"content" : ZJSTRING(tipsStringKey),
                                                            @"size" : SYSTEM_REGULARFONT(13.f),
                                                            @"lineSpacing": @12.f}]];
    
    self.alertView.layer.shadowColor                        = self.alertView.backgroundColor.CGColor;
    self.titleLabel.backgroundColor                         = self.alertView.backgroundColor;
    self.tipsLabel.backgroundColor                          = self.alertView.backgroundColor;
    self.closeButton.backgroundColor                        = self.alertView.backgroundColor;
    
    /**
     *  计算提示文字高度，改变当前Window高度
     */
    @try {
        CGFloat stringHeight                                    = ([ZJSTRING(tipsStringKey) ex_getSpaceLabelHeightwithSpeace:ADJUST_PERCENT_FLOAT(12.f)
                                                                                                                    withFont:SYSTEM_REGULARFONT(13.f)
                                                                                                                   withWidth:self.width] - [ZJSTRING(@"用于计算一行高度") ex_getSpaceLabelHeightwithSpeace:ADJUST_PERCENT_FLOAT(12.f)
                                                                                                                                                                                          withFont:SYSTEM_REGULARFONT(13.f)
                                                                                                                                                                                         withWidth:self.width]);
        
        /**
         *  加底部间距
         */
        self.height = PROJECT_ALERT_TOP_HEIGHT + (stringHeight == 0 ? stringHeight : (stringHeight + ADJUST_PERCENT_FLOAT(20.f))) + (iPhone6Plus_6sPlus ? 10 : 0);
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    [super showAlert];
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
        if (obj.tag == -9999) {
            
        }else{
            obj.hidden = YES;
        }
    }];
    
    [self startAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hiddenAlert];
    });
}

- (void)hiddenAlert
{
    /**
     隐藏的时候 恢复商品详情a页面的frame
     */
    if ([self.tipsLabel.text isEqualToString:@"不能购买自己的商品"]) {
        [SYSTEM_NOTIFICATIONCENTER postNotificationName:@"RecoveryGoodsImageDeatilViewFrameWhenHiddenTopAlearView" object:nil];
    }
    
    [self endAnimation];
    [[UIApplication sharedApplication] setStatusBarHidden:NO
                                            withAnimation:UIStatusBarAnimationFade];
}

- (void)startAnimation
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alertView.frame = CGRectMake(0,
                                          0,
                                          self.width,
                                          self.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)endAnimation
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alertView.frame = CGRectMake(0,
                                          -self.height,
                                          self.width,
                                          self.height);
    } completion:^(BOOL finished) {
        if (finished) {
            [super hiddenAlert];
        }
    }];
}

@end
