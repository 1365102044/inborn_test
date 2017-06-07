//
//  YBLoginTopBigView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBLoginViewController.h"
#import "YBMessageCodeTextField.h"

/**
 phoneType,             手机号
 passWordType,          密码
 messageCodeType        短信
 */
typedef NS_ENUM(NSInteger, textFieldType) {
    phoneType,
    passWordType,
    messageCodeType
};
/**
 点击 登录 或者 忘记密码
 BtnType:
 1 忘记密码;
 2 登录;
 */
typedef void(^clickLoginBtnOrForgetBtn)(NSInteger BtnType);

/**
 下面的btn
 */
typedef void(^clickBoomBtnBlock)(NSString *btnstr);

/**
 输入框的回调
 */
typedef void(^textFieldBlock)(textFieldType type, NSString *textStr);
typedef void(^textFieldBeiginBlock)(textFieldType type ,UITextField *textfiled);
typedef void(^textFieldRequestMessageCodeBlock)();

@interface YBLoginTopBigView : ZJBaseView

/**
 初始化view
 */
+ (instancetype)creatLoginTopViewWithType:(loginTypeEnum)Type isShowWXicon:(BOOL)isShowWXicon clickTopBtnBlock:(clickLoginBtnOrForgetBtn)clickTopBlock clickBoomBtnBlock:(clickBoomBtnBlock)clickBoomBtnBlock;




/**
 textfield的开始编辑和编辑完成后
 */
- (void)textFieldbeginEditingCallBackBlock:(textFieldBeiginBlock)textfieldBegin  EndEditingCallBackBlock:(textFieldBlock)textfieldEndeditingBlock requestMessageCodeBlock:(textFieldRequestMessageCodeBlock)requestMessageCodeBlock;



/**
 更改类型
 */
@property(nonatomic,assign) loginTypeEnum  updateloginType;
@property(nonatomic,strong) YBMessageCodeTextField * messageCodeTextField;



@end
