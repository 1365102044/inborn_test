//
//  YBRegisterPhoneTopView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBLoginTopBigView.h"
#import "YBRegisterPhoneViewController.h"
#import "YBMessageCodeTextField.h"
typedef void(^clickTopViewBtnBlock)(NSInteger btnTag);
/**
 输入框的回调
 */
typedef void(^textFieldBlock)(textFieldType type, NSString *textStr);
typedef void(^textFieldBeiginBlocks)(textFieldType type);

@interface YBRegisterPhoneTopView : ZJBaseView
/**
 初始化
 */
+ (instancetype)creatReginsterTopViewWithSourceVcType:(sourceVcType)sourVcType;

@property(nonatomic,copy) clickTopViewBtnBlock  clickBtnBlock;


/**
 输入框上的block
 */
- (void)registerPhoneWithtextFieldWithEndEditing:(textFieldBlock)textfieldendEditing textfieldBeginEditingBlock:(textFieldBeiginBlocks)textfieldBeginEditingBlock;

@end
