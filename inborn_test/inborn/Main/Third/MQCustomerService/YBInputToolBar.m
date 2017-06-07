//
//  YBInputToolBar.m
//  inborn
//
//  Created by 郑键 on 17/4/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBInputToolBar.h"
#import <MQTabInputContentView.h>
#import "YBRecorderView.h"

@interface YBInputToolBar () <YBRecorderViewDelegate>

@property (nonatomic, strong) YBRecorderView *displayRecordView;//只用来显示

/**
 切换文字及语音输入方式按钮
 */
@property (nonatomic, strong) YBDefaultButton *leftButton;

/**
 表情按钮
 */
@property (nonatomic, strong) YBDefaultButton *emojiButton;

/**
 其他功能按钮
 */
@property (nonatomic, strong) YBDefaultButton *otherFuncButton;

@end

@implementation YBInputToolBar
{
    UIView *buttonContainerView;
    NSLayoutConstraint *buttonContainerViewHeightConstraint;
    id resignFirstResponderBlock;
    YBDefaultLabel *_voiceLabel;
}

@dynamic delegate;

- (void)recorderView:(YBRecorderView *)recorderView type:(YBRecorderViewType)type extend:(id)extend
{
    if ([self.delegate respondsToSelector:@selector(inputToolBar:type:extend:)]) {
        [self.delegate inputToolBar:self type:type extend:nil];
    }
}

- (void)recorderView:(YBRecorderView *)recorderView changeVoiceValue:(NSInteger)value
{
    if ([self.delegate respondsToSelector:@selector(inputToolBar:changeVoiceValue:)]) {
        [self.delegate inputToolBar:self changeVoiceValue:value];
    }
}

#pragma mark - 点击事件

- (void)voiceButtonClick:(UIButton *)sender
{
    /**
     *  发送语音
     */
    if ([self.delegate respondsToSelector:@selector(inputToolBar:sender:)]) {
        [self.delegate inputToolBar:self sender:sender];
    }
}

- (void)leftButtonClick:(UIButton *)sender
{
    if (_contentView.alpha == 1.0f) {
        
        /**
         *  语音
         */
        [sender setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                            @"message_voice_n",
                                            ZJProjectLoadImageDefault)
                    forState:UIControlStateNormal];
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
        [UIView animateWithDuration:0.25 animations:^{
           
            self.displayRecordView.alpha = 1.f;
            _contentView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }else{
     
        /**
         *  文字输入
         */
        [sender setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                        @"message_keyboard_n",
                                        ZJProjectLoadImageDefault)
                forState:UIControlStateNormal];
        [UIView animateWithDuration:0.25 animations:^{
            
            self.displayRecordView.alpha = 0.f;
            _contentView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)otherFuncButtonClick:(UIButton *)sender
{
    if (self.displayRecordView.alpha == 1.f) {
        [self.leftButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                        @"message_keyboard_n",
                                        ZJProjectLoadImageDefault)
                forState:UIControlStateNormal];
        [UIView animateWithDuration:0.25 animations:^{
            
            self.displayRecordView.alpha = 0.f;
            _contentView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
    if ([self.delegate respondsToSelector:@selector(inputToolBar:sender:)]) {
        [self.delegate inputToolBar:self sender:sender];
    }
}

- (void)emojiButtonClick:(UIButton *)sender
{
    if (self.displayRecordView.alpha == 1.f) {
        [self.leftButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                        @"message_keyboard_n",
                                        ZJProjectLoadImageDefault)
                forState:UIControlStateNormal];
        [UIView animateWithDuration:0.25 animations:^{
            
            self.displayRecordView.alpha = 0.f;
            _contentView.alpha = 1;
            
        } completion:^(BOOL finished) {
            
        }];
    }
    
    if ([self.delegate respondsToSelector:@selector(inputToolBar:sender:)]) {
        [self.delegate inputToolBar:self sender:sender];
    }
}

#pragma mark - 代理

- (void)recordEnd {
    if ([self.delegate respondsToSelector:@selector(recordEnd)]) {
        [self.delegate recordEnd];
    }
}

- (void)recordStarted {
    if ([self.delegate respondsToSelector:@selector(recordStarted)]) {
        [self.delegate recordStarted];
    }
}

- (void)recordCanceld {
    if ([self.delegate respondsToSelector:@selector(recordCanceld)]) {
        [self.delegate recordCanceld];
    }
}

#pragma mark - SDK方法

- (instancetype)initWithFrame:(CGRect)frame contentView:(MQInputContentView *)contentView; {
    if (self = [super initWithFrame:frame]) {
        self.barTintColor = [UIColor whiteColor];
        _functionViews = [[NSMutableArray alloc] init];
        
        _buttonGroupBar = [[MQButtonGroupBar alloc] init];
        [self addSubview:self.buttonGroupBar];
        
        _contentView = contentView;
        _contentView.layoutDelegate = self;
        [self addSubview:self.contentView];
        MQTabInputContentView *tabInputContentView = (MQTabInputContentView *) contentView;
        tabInputContentView.textField.backgroundColor = ZJCOLOR.color_c12;
        tabInputContentView.layer.cornerRadius = 4.f;
        tabInputContentView.layer.masksToBounds = YES;
        [tabInputContentView.layer setBorderWidth:1.0];;
        CGColorRef color = ZJCOLOR.color_c16.CGColor;
        [tabInputContentView.layer setBorderColor:color];
        
        if (!self.contentView) {
            _contentView = [[MQInputContentView alloc] init];
        }
        
        //        buttonContainerView = [[UIView alloc] init];
        //        //[self addSubview:buttonContainerView];
        
        YBDefaultButton *leftButton = [[YBDefaultButton alloc] init];
        [leftButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                            @"message_voice_h",
                                            ZJProjectLoadImageDefault)
                    forState:UIControlStateSelected];
        [leftButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_MESSAGE,
                                            @"message_keyboard_n",
                                            ZJProjectLoadImageDefault)
                    forState:UIControlStateNormal];
        [leftButton addTarget:self
                       action:@selector(leftButtonClick:)
             forControlEvents:UIControlEventTouchUpInside];
        self.leftButton = leftButton;

        [self addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
            make.bottom.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
            make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(28.f));
        }];
        
        YBDefaultButton *rightOtherFuncButton = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_MESSAGE
                                                                                   imageNamed:@"message_plus"
                                                                                         type:ZJProjectButtonSetImageDefault
                                                                                       target:self
                                                                                     selector:@selector(otherFuncButtonClick:)];
        rightOtherFuncButton.tag = 1003;
        self.otherFuncButton = rightOtherFuncButton;
        [self addSubview:rightOtherFuncButton];
        [rightOtherFuncButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
            make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(28.f));
        }];
        
        YBDefaultButton *emojiButton = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_MESSAGE
                                                                          imageNamed:@"message_smiling"
                                                                                type:ZJProjectButtonSetImageDefault
                                                                              target:self
                                                                            selector:@selector(emojiButtonClick:)];
        emojiButton.tag = 1002;
        self.emojiButton = emojiButton;
        [self addSubview:emojiButton];
        [emojiButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(rightOtherFuncButton.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-10.f));
            make.centerY.width.height.mas_equalTo(rightOtherFuncButton);
        }];
        
        [self addSubview:self.displayRecordView];
        [self.displayRecordView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.mas_equalTo(contentView);
        }];
        
        [self setup];
    }
    return self;
}

- (void)selectShowFunctionViewWithIndex:(NSInteger)index
{
    NSAssert(index < self.functionViews.count, @"requested index is out of bounds");
    UIView *functionView = [self.functionViews objectAtIndex:index];
    for (UIView *view in buttonContainerView.subviews) {
        [view removeFromSuperview];
    }
    [buttonContainerView addSubview:functionView];
    
    [UIView animateWithDuration:0.25 animations:^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(inputBar:willChangeHeight:)]) {
            [self.delegate inputBar:self willChangeHeight:self.contentView.frame.size.height + self.buttonGroupBar.frame.size.height + CGRectGetMaxY(functionView.frame)];
        }
        
        buttonContainerViewHeightConstraint.constant = CGRectGetMaxY(functionView.frame);
        [self setNeedsUpdateConstraints];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        _functionViewVisible = true;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(inputBar:didChangeHeight:)]) {
            [self.delegate inputBar:self didChangeHeight:self.contentView.frame.size.height + self.buttonGroupBar.frame.size.height + buttonContainerViewHeightConstraint.constant];
        }
    }];
}

- (void)hideSelectedFunctionView
{
    CGFloat height = self.frame.size.height - buttonContainerViewHeightConstraint.constant;
    
    [UIView animateWithDuration:0.25 animations:^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(inputBar:willChangeHeight:)]) {
            [self.delegate inputBar:self willChangeHeight:height];
        }
        
        buttonContainerViewHeightConstraint.constant = 0;
        [self setNeedsUpdateConstraints];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        for (UIView *view in buttonContainerView.subviews) {
            [view removeFromSuperview];
        }
        _functionViewVisible = false;
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(inputBar:didChangeHeight:)]) {
            [self.delegate inputBar:self didChangeHeight:height];
        }
    }];
}

- (void)setInputView:(UIView *)inputView resignFirstResponderBlock:(void (^)())block
{
    _inputView = inputView;
    resignFirstResponderBlock = block;
}

- (void)setup
{
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonGroupBar.translatesAutoresizingMaskIntoConstraints = NO;
    buttonContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.buttonGroupBar.padding = UIEdgeInsetsMake(0, 5, 0, 5);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_contentView]-88-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_buttonGroupBar]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_buttonGroupBar)]];
    //    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonContainerView]-0-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(buttonContainerView)]];
    
    //    buttonContainerViewHeightConstraint = [NSLayoutConstraint constraintWithItem:buttonContainerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    //    [self addConstraint:buttonContainerViewHeightConstraint];
    
    //NSString *vfl = @"V:|-0-[_contentView(44)]-0-[_buttonGroupBar(44)]-0-[buttonContainerView]-0-|";
    NSString *vfl = @"V:|-7-[_contentView]-7-|";
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:NSDictionaryOfVariableBindings(_contentView, _buttonGroupBar)]];
    self.buttonGroupBar.hidden = YES;
}

-(void)setContentViewDelegate:(id<MQInputContentViewDelegate>)contentViewDelegate
{
    self.contentView.delegate = contentViewDelegate;
}

-(void)setButtonGroupDelegate:(id<MQButtonGroupBarDelegate>)buttonGroupDelegate
{
    self.buttonGroupBar.delegate = buttonGroupDelegate;
}

-(id<MQButtonGroupBarDelegate>)buttonGroupDelegate
{
    return self.buttonGroupBar.delegate;
}

#pragma mark - Utilities
- (void)updateConstraint:(NSLayoutConstraint *)constraint withConstant:(CGFloat)constant
{
    if (constraint.constant == constant) {
        return;
    }
    
    constraint.constant = constant;
}

#pragma mark - Override
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(BOOL)resignFirstResponder
{
    _inputView = nil;
    if (resignFirstResponderBlock) {
        ((void (^)())resignFirstResponderBlock)();
    }
    return [super resignFirstResponder];
}

-(void)setFrame:(CGRect)frame
{
    YBLog(@"%@", NSStringFromCGRect(frame));
    [super setFrame:frame];
    [self setNeedsDisplay];
}

-(void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //绘制顶部的边线
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextSetLineCap(context, kCGLineCapSquare);
    //    CGContextSetLineWidth(context, 0.5);
    //    CGContextSetRGBStrokeColor(context, 198/255.0, 203/255.0, 208/255.0, 1.0);
    //    CGContextMoveToPoint(context, 0, 0);
    //    CGContextAddLineToPoint(context, rect.size.width, 0);
    //    CGContextStrokePath(context);
}

#pragma make - InputContentLayoutDelegate
- (void)inputContentView:(MQInputContentView *)inputContentView didChangeHeight:(CGFloat)height
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputBar:didChangeHeight:)]) {
        [self.delegate inputBar:self didChangeHeight:height + self.buttonGroupBar.frame.size.height + buttonContainerViewHeightConstraint.constant];
    }
}

- (void)inputContentView:(MQInputContentView *)inputContentView willChangeHeight:(CGFloat)height
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputBar:willChangeHeight:)]) {
        [self.delegate inputBar:self willChangeHeight:height + self.buttonGroupBar.frame.size.height + buttonContainerViewHeightConstraint.constant];
    }
}

- (void)inputContentTextDidChange:(NSString *)newString {
    if ([newString length] > 0) {
        if ([self.delegate respondsToSelector:@selector(textContentDidChange:)]) {
            [self.delegate textContentDidChange:newString];
        }
    }
}

- (YBRecorderView *)displayRecordView {
    if (!_displayRecordView) {
        _displayRecordView = [[YBRecorderView alloc] initWithFrame: CGRectMake(0, 0, self.width, 258)];
        _displayRecordView.delegate = self;
        _displayRecordView.backgroundColor = ZJCOLOR.color_c0;
        _displayRecordView.alpha = 0;
    }
    return _displayRecordView;
}

@end
