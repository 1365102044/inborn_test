//
//  YBInputToolBar.h
//  inborn
//
//  Created by 郑键 on 17/4/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQButtonGroupBar.h"
#import "MQInputContentView.h"
#import "YBRecorderView.h"

@class YBInputToolBar;

@protocol MQInputToolBarDelegate <UIToolbarDelegate>

@optional
- (void)inputBar:(YBInputToolBar *)inputBar willChangeHeight:(CGFloat)height;
- (void)inputBar:(YBInputToolBar *)inputBar didChangeHeight:(CGFloat)height;
- (void)textContentDidChange:(NSString *)newString;

/**
 点击的button

 @param inputToolBar    inputToolBar
 @param sender          sender
 */
- (void)inputToolBar:(YBInputToolBar *)inputToolBar sender:(UIButton *)sender;

/**
 发送语音请求

 @param inputToolBar        inputToolBar
 @param pressView           pressView
 */
- (void)inputToolBar:(YBInputToolBar *)inputToolBar pressView:(UIView *)pressView longPress:(UILongPressGestureRecognizer *)longPress;

- (void)recordEnd;

- (void)recordStarted;

- (void)recordCanceld;

- (void)inputToolBar:(YBInputToolBar *)inputToolBar type:(YBRecorderViewType)type extend:(id)extend;

- (void)inputToolBar:(YBInputToolBar *)inputToolBar changeVoiceValue:(NSInteger)value;

@end

@interface YBInputToolBar : UIToolbar <MQInputContentViewDelegate, MQInputContentViewLayoutDelegate>

@property (weak, nonatomic) id<MQInputToolBarDelegate> delegate;
@property (weak, nonatomic) id<MQInputContentViewDelegate> contentViewDelegate;
@property (weak, nonatomic) id<MQButtonGroupBarDelegate> buttonGroupDelegate;

@property (strong, nonatomic, readonly) MQInputContentView *contentView;

@property (strong, nonatomic, readonly) MQButtonGroupBar *buttonGroupBar;

@property (strong, nonatomic) UIView *inputView;

/** 扩展功能的view，显示在MCButtonGroupBar下面 */
@property (strong, nonatomic, readonly) NSMutableArray<UIView *> *functionViews;
/** 功能View当前是否可见 */
@property (assign, nonatomic, readonly) BOOL functionViewVisible;

- (instancetype)initWithFrame:(CGRect)frame contentView:(MQInputContentView *)contentView;

/**
 *  显示一个functionView
 *
 *  @param index functionViews的下标，用于指定显示哪个functionView
 */
- (void)selectShowFunctionViewWithIndex:(NSInteger)index;

/**
 *  隐藏当前显示的functionView
 */
- (void)hideSelectedFunctionView;

/**
 *  给inputView复制，并设置当InputBar失去焦点时的回调。
 */
- (void)setInputView:(UIView *)inputView resignFirstResponderBlock:(void (^)())block;

@end
