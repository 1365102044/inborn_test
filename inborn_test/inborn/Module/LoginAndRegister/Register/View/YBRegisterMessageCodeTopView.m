//
//  YBRegisterMessageCodeTopView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRegisterMessageCodeTopView.h"
#import "YBAttributedStringLabel.h"
#import "YBLoginResultViewController.h"
#import "ZJTimerManager.h"
@interface YBRegisterMessageCodeTopView ()

@property(nonatomic,strong) YBAttributedStringLabel * titleLable;
@property(nonatomic,strong) YBAttributedStringLabel * descLable;
@property(nonatomic,assign) NSInteger  cutTimeNumber;

@end

@implementation YBRegisterMessageCodeTopView

- (void)StarTimer
{
    _cutTimeNumber = 60;
    [[ZJTimerManager shareTimer] startTimerWithTimeInterVal:1.0f];
}

/**
 重新获取验证码
 */
- (void)clickRegetMessgeCode:(UITapGestureRecognizer *)tap
{
    /**
     倒计时过程中不响应
     */
    if (_cutTimeNumber >0) {
        return;
    }
    if (self.clickRegerMessageBlock) {
        self.clickRegerMessageBlock();
    }
}

/**
 倒计时通知
 */
- (void)cutDownTime:(NSNotification *)noti
{
    _cutTimeNumber --;
    
    [_descLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c5,
                                                        @"content":ZJSTRING(REIGSTER_TIPS_NOMESSAGE_STRINGKEY),
                                                        @"size":SYSTEM_REGULARFONT(12),
                                                        @"lineSpacing":@10},
                                                      @{@"color":ZJCOLOR.color_c4,
                                                        @"content":[NSString stringWithFormat:@"%lds后重新发送",(long)_cutTimeNumber],
                                                        @"size":SYSTEM_REGULARFONT(12),
                                                        @"lineSpacing":@10}]];
    if (_cutTimeNumber<=0) {
        [[ZJTimerManager shareTimer] stopTimer];
        
        [_descLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c5,
                                                            @"content":ZJSTRING(REIGSTER_TIPS_NOMESSAGE_STRINGKEY),
                                                            @"size":SYSTEM_REGULARFONT(12),
                                                            @"lineSpacing":@10},
                                                          @{@"color":ZJCOLOR.color_c4,
                                                            @"content":ZJSTRING(REIGSTER_BUTTON_RELOADMESSAGE_STRINGKEY),
                                                            @"size":SYSTEM_REGULARFONT(12),
                                                            @"lineSpacing":@10}]];
    }
}

/**
 初始化
 */
+ (instancetype)creatReginsterMessageCodeTopView
{
    YBRegisterMessageCodeTopView *view      = [[YBRegisterMessageCodeTopView alloc]init];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self setSubviewUI];
        [self setSubviewContrans];
        [self.CodeTextField becomeFirstResponder];
        
        /**
         注册倒计时通知
         */
        [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                      selector:@selector(cutDownTime:)
                                          name:TIMER_NOTIFICATION
                                        object:nil];
        [self StarTimer];
        
    }
    return self;
}

- (void)setSubviewUI
{
    _titleLable = [[YBAttributedStringLabel alloc]init];
    [_titleLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c4,
                                                         @"content":ZJSTRING(REIGSTER_TITLE_INPUTVERCODE_STRINGKEY),
                                                         @"size":SYSTEM_REGULARFONT(24),
                                                         @"lineSpacing":@10}]];
    _titleLable.textAlignment                           = NSTextAlignmentCenter;
    [self addSubview:_titleLable];
    
    _CodeTextField                                      = [[YBVerCodeTextField alloc]init];
    [self addSubview:_CodeTextField];
    
    _descLable = [[YBAttributedStringLabel alloc]init];
    [_descLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c5,
                                                        @"content":ZJSTRING(REIGSTER_TIPS_NOMESSAGE_STRINGKEY),
                                                        @"size":SYSTEM_REGULARFONT(12),
                                                        @"lineSpacing":@10},
                                                      @{@"color":ZJCOLOR.color_c4,
                                                        @"content":ZJSTRING(REIGSTER_BUTTON_RELOADMESSAGE_STRINGKEY),
                                                        @"size":SYSTEM_REGULARFONT(12),
                                                        @"lineSpacing":@10}]];
    _descLable.textAlignment                            = NSTextAlignmentCenter;
    [self addSubview:_descLable];
    _descLable.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickRegetMessgeCode:)];
    [_descLable addGestureRecognizer:tap];
}

- (void)setSubviewContrans
{
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(105));
        make.left.and.right.mas_equalTo(self).mas_offset(0);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(100));
    }];
    
    [_CodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(35));
        make.left.and.right.mas_equalTo(self).mas_offset(0);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(40));
    }];
    
    [_descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_CodeTextField.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(45));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(200), ADJUST_PERCENT_FLOAT(20)));
    }];
    
}
- (void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:TIMER_NOTIFICATION object:nil];
}
@end
