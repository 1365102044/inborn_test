//
//  YBPlaceHolderTextView.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPlaceHolderTextView.h"
#import "YBAttributedStringLabel.h"

@interface YBPlaceHolderTextView()

/**
 *  占位文字label
 */
@property (nonatomic, weak) YBAttributedStringLabel *placeholderLabel;

@end

@implementation YBPlaceHolderTextView

#pragma mark - First.通知

/**
 *  监听文字改变
 */
- (void)textDidChange
{
    self.placeholderLabel.hidden = self.hasText;
}

/**
 *  更新占位文字尺寸
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.placeholderLabel.width = self.width - 2 * self.placeholderLabel.ex_x;
    [self.placeholderLabel sizeToFit];
}

#pragma mark - Second.赋值


- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    [self.placeholderLabel setAttributedStringWithContentArray:@[@{@"color" : self.placeholderColor,
                                                                   @"content" : placeholder,
                                                                   @"size" : self.placeholderFont,
                                                                   @"lineSpacing": @(self.lineMargin)}]];
    
    self.placeholderLabel.text = placeholder;
    self.font = self.placeholderFont;
    
    [self setNeedsLayout];
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

/**
 * setNeedsDisplay方法 : 会在恰当的时刻自动调用drawRect:方法
 * setNeedsLayout方法 : 会在恰当的时刻调用layoutSubviews方法
 */

- (UIFont *)placeholderFont
{
    if (!_placeholderFont) {
        _placeholderFont = SYSTEM_REGULARFONT(13.f);
    }
    return _placeholderFont;
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.alwaysBounceVertical = YES;
        self.placeholderColor = [UIColor colorWithWhite:175.0/255.0 alpha:1.0];
        [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                      selector:@selector(textDidChange)
                                          name:UITextViewTextDidChangeNotification
                                        object:nil];
    }
    return self;
}

- (void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (YBAttributedStringLabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        YBAttributedStringLabel *placeholderLabel = [[YBAttributedStringLabel alloc] init];
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.ex_x = 4;
        placeholderLabel.ex_y = 7;
        [self addSubview:placeholderLabel];
        _placeholderLabel = placeholderLabel;
        _placeholderLabel.backgroundColor = [UIColor clearColor];
    }
    return _placeholderLabel;
}


@end
