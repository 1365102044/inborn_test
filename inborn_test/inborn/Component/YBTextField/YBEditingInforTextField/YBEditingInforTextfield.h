//
//  YBEditingInforTextfield.h
//  inborn
//
//  Created by 刘文强 on 2017/5/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"

/**
 结束编辑的回调
 */
typedef void(^textfiledEnditingBlock)(NSString *textfiledStr, NSInteger textFiledTag);
/**
 编辑过程中的回调
 */
typedef void(^textfildeEnditingChangeBlcok)(NSString *textfiledChangeStr ,NSInteger textFiledTag);

@interface YBEditingInforTextfield : ZJBaseView

/**
 tag                    tag
 textFiledPaceHolder    站位文字
 textFiledTextFont      字体大小
 textFiledTextColor     字体颜色
 limtMaxTextNumber      最大字符限制
 textWhenEnditing       结束编辑时 回调 输入内容
 textWhenEdtingChangeBlcok  输入过程中的。内容回调
 */
+ (instancetype)creatEditingInforTextFiledwtihtag:(NSInteger)tag
                              textFiledPaceHolder:(NSString *)textFiledPaceHolder
                                textFiledTextFont:(NSInteger)textFiledTextFont
                               textFiledTextColor:(UIColor *)textFiledTextColor
                                limtMaxTextNumber:(NSInteger)limtMaxTextNumber
                             textWhenEnditingText:(textfiledEnditingBlock)textWhenEnditing
                       textWhenEdtingChangeBlcok:(textfildeEnditingChangeBlcok)textWhenEdtingChangeBlcok;

- (void)resignTextFiledFirstResponder;
- (void)becomeTextFiledFirstResponder;

@property(nonatomic,assign) BOOL  secureTextEntry;

@end
