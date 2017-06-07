//
//  ZJTextField.h
//  inborn
//
//  Created by 郑键 on 17/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 textflied 内容改变的代理方法
 */
@protocol textfiledchangeDelegate <NSObject>
- (void)mytextfiled:(UIView *)mytextfiled textfiledstr:(NSString *)textfieldstr;
@end

@interface ZJTextField : UIView

/**
 子类按钮赋值
 */
@property (nonatomic, strong) ZJBaseButton *funcButton;

/**
 子类初始化项目输入框实例
 
 @param endEditingCallBackBlock         结束编辑回调
 @param beginEditingCallBackBlock       开始编辑回调
 @return                                项目输入框实例
 */
+ (instancetype)textFieldWithEndEditingCallBackBlock:(ZJTextFieldEndEditingCallBackBlock)endEditingCallBackBlock
                           beginEditingCallBackBlock:(ZJTextFieldBeginEditingCallBackBlock)beginEditingCallBackBlock;

/**
 初始化项目输入框实例

 @param keyboardType                    键盘模式
 @param maxCount                        最大输入数
 @param iconImage                       图片
 @param placeHolderStringKey            占位文字key
 @param secureTextEntry                 是否密文
 @param endEditingCallBackBlock         结束编辑回调
 @param beginEditingCallBackBlock       开始编辑回调
 
 @return                                项目输入框实例
 */
+ (instancetype)textFieldWithKeyboardType:(UIKeyboardType)keyboardType
                                 maxCount:(NSInteger)maxCount
                                iconImage:(UIImage *)iconImage
                     placeHolderStringKey:(NSString *)placeHolderStringKey
                          secureTextEntry:(BOOL)secureTextEntry
                  endEditingCallBackBlock:(ZJTextFieldEndEditingCallBackBlock)endEditingCallBackBlock
                beginEditingCallBackBlock:(ZJTextFieldBeginEditingCallBackBlock)beginEditingCallBackBlock;

/**
 配置界面
 */
- (void)setupCustomUI;

/**
 按钮点击事件

 @param sender 按钮
 */
- (void)textFieldFuncButtonClick:(UIButton *)sender;

/**
 成为第一响应
 */
- (void)becomeFirstResponder;

/**
 解除第一响应
 */
- (void)resignFirstResponder;

@property(nonatomic,weak) id <textfiledchangeDelegate>  texfiledDelegate;

@end
