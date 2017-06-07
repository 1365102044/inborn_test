//
//  YBFuncButtonView.m
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBFuncButtonView.h"
#import "YBButton.h"

@interface YBFuncButtonView()

@end

@implementation YBFuncButtonView

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(funcButtonView:button:)]) {
        [self.delegate funcButtonView:self button:sender];
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

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    for (NSInteger i = 0; i < 4; ++i) {
        
        YBDefaultButton *button = [YBDefaultButton new];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.subviews.count == 1) {
                make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
                make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(68.f));
                make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(22.f));
                make.centerY.mas_equalTo(self);
            } else {
                make.right.mas_equalTo(self.subviews[self.subviews.count - 2].mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
                make.width.height.mas_equalTo(self.subviews[self.subviews.count - 2]);
                make.centerY.mas_equalTo(self.subviews[self.subviews.count - 2]);
            }
        }];
    }
}

#pragma mark - Seventh.懒加载

#pragma mark - Eighth.Other

- (void)setButtonWithButtonArray:(NSArray *)buttonModelArray
{
    if (buttonModelArray.count <= self.subviews.count) {

        /*
         *  需要的按钮数量和当前的按钮数量相等
         */
    } else {

        for (NSInteger i = 0; i < buttonModelArray.count - self.subviews.count; ++i) {

            YBDefaultButton *button = [[YBDefaultButton alloc] init];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                if (self.subviews.count == 1) {
                    make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
                    make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(68.f));
                    make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(22.f));
                    make.centerY.mas_equalTo(self);
                } else {
                    make.right.mas_equalTo(self.subviews[self.subviews.count - 2].mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
                    make.width.height.mas_equalTo(self.subviews[self.subviews.count - 2]);
                    make.centerY.mas_equalTo(self.subviews[self.subviews.count - 2]);
                }
            }];
        }
    }

    /*
     *  配置当前按钮
     */
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView *obj,
                                                NSUInteger idx,
                                                BOOL *stop) {

        if (![obj isKindOfClass:[UIButton class]]) return;
        if (idx >= buttonModelArray.count) {
            obj.hidden = YES;
            return;
        }
        
        YBButton *buttonModel = buttonModelArray[idx];
        UIButton *button = (UIButton *)obj;
        [button setTitle:buttonModel.norTitle
                forState:UIControlStateNormal];
        [button setTitle:buttonModel.selTitle
                forState:UIControlStateHighlighted];
        if (buttonModel.imageFilePath) {
            [button setBackgroundImage:ZJIMAGE(buttonModel.imageFilePath,
                                               buttonModel.imageNamed,
                                               ZJProjectLoadImageDefault).firstObject
                              forState:UIControlStateNormal];
            [button setBackgroundImage:ZJIMAGE(buttonModel.imageFilePath,
                                               buttonModel.imageNamed,
                                               ZJProjectLoadImageDefault).lastObject
                              forState:UIControlStateHighlighted];
        }else{
            
            if (buttonModel.imageNamed) {
                YBLog(@"%@", buttonModel.imageNamed);
                [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%@", buttonModel.imageNamed, PROJECT_THEME_IMAGE_NOR]]
                                  forState:UIControlStateNormal];
                [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%@", buttonModel.imageNamed, PROJECT_THEME_IMAGE_HIG]]
                                  forState:UIControlStateHighlighted];
            }else{
                [button setBackgroundImage:[UIImage imageWithColor:ZJCOLOR.color_c0]
                                  forState:UIControlStateNormal];
                [button setBackgroundImage:[UIImage imageWithColor:ZJCOLOR.color_c0]
                                  forState:UIControlStateHighlighted];
            }
        }
        [button setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
        button.titleLabel.font = SYSTEM_REGULARFONT(12.f);
    }];
}

@end
