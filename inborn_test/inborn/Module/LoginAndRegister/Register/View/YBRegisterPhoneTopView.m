//
//  YBRegisterPhoneTopView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBRegisterPhoneTopView.h"
#import "YBPhoneNumberTextField.h"
#import "YBAttributedStringLabel.h"
@interface YBRegisterPhoneTopView ()<textfiledchangeDelegate>

@property(nonatomic,strong) YBAttributedStringLabel * titleLable;
@property(nonatomic,strong) YBPhoneNumberTextField * phoneTextField;
@property(nonatomic,strong) UIButton * reginsterBtn;
@property(nonatomic,strong) YBAttributedStringLabel * loginLable;
@property(nonatomic,assign) sourceVcType  sourcVcType;


@property(nonatomic,copy) textFieldBlock  textFieldBlock;
@property(nonatomic,copy) textFieldBeiginBlocks textFieldBeginBlock;

@end

@implementation YBRegisterPhoneTopView

- (void)mytextfiled:(UIView *)mytextfiled textfiledstr:(NSString *)textfieldstr
{
    if (textfieldstr.length>= 11 ) {
        _reginsterBtn.backgroundColor = ZJCOLOR.color_c2;
        _reginsterBtn.userInteractionEnabled = YES;
    }else{
        _reginsterBtn.backgroundColor = ZJCOLOR.color_c5;
        _reginsterBtn.userInteractionEnabled = NO;
    }
}

/**
 输入框上的block
 */
- (void)registerPhoneWithtextFieldWithEndEditing:(textFieldBlock)textfieldendEditing textfieldBeginEditingBlock:(textFieldBeiginBlocks)textfieldBeginEditingBlock
{
    self.textFieldBlock = textfieldendEditing;
    self.textFieldBeginBlock = textfieldBeginEditingBlock;
}

/**
 点击事件
 tag:
    1 注册
    2 登录
 */
- (void)clickTopViewBtn:(UIButton *)sender
{
    if (self.clickBtnBlock) {
        self.clickBtnBlock(sender.tag);
    }
}
/**
 登录的lable 添加的手势
 */
- (void)clickLoginBtn:(UITapGestureRecognizer *)tap
{
    if (self.clickBtnBlock) {
        self.clickBtnBlock(2);
    }
}

/**
 初始化
 */
+ (instancetype)creatReginsterTopViewWithSourceVcType:(sourceVcType)sourVcType
{
    YBRegisterPhoneTopView *view       = [[YBRegisterPhoneTopView alloc]init];
    view.sourcVcType                   = sourVcType;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setSourcVcType:(sourceVcType)sourcVcType
{
    _sourcVcType = sourcVcType;
    [self setSubview];
    [self setSubviewContrans];
    [self.phoneTextField becomeFirstResponder];
}

/**
 子视图
 */
- (void)setSubview
{
    NSString *desc;
    NSString *btnStr;
    if (self.sourcVcType == registerType||_sourcVcType == thridWXLoginType || _sourcVcType == thridQQLoginType) {
        desc = ZJSTRING(REIGSTER_TITLE_PHONEREG_STRINGKEY);
        btnStr = LOGIN_BUTTON_REGISTER_STRINGKEY;
    } else if (self.sourcVcType == forgetpasswordType) {
        desc = ZJSTRING(LOGIN_FORGETPWD_TITLE_STRINGKEY);
        btnStr = PUBLIC_NEXT_STRINGKEY;
    } else {
        desc = ZJSTRING(REIGSTER_TITLE_PHONEREG_STRINGKEY);
        btnStr = LOGIN_BUTTON_REGISTER_STRINGKEY;
    }
    _titleLable = [[YBAttributedStringLabel alloc]init];
    [_titleLable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c4,
                                                         @"content":desc,
                                                         @"size":SYSTEM_REGULARFONT(24),
                                                         @"lineSpacing":@10}]];
    _titleLable.textAlignment          = NSTextAlignmentCenter;
    [self addSubview:_titleLable];
    
    _phoneTextField = [YBPhoneNumberTextField textFieldWithEndEditingCallBackBlock:^(UITextField *textField) {
        if (self.textFieldBlock) {
            self.textFieldBlock(phoneType,textField.text);
        }
        
    } beginEditingCallBackBlock:^(UITextField *textField) {
        if (self.textFieldBeginBlock) {
            self.textFieldBeginBlock(phoneType);
        }
    }];
    _phoneTextField.texfiledDelegate = self;
    [self addSubview:_phoneTextField];
    

    _reginsterBtn = [[UIButton alloc]init];
    _reginsterBtn.titleLabel.font = SYSTEM_REGULARFONT(14);
    [_reginsterBtn addTarget:self action:@selector(clickTopViewBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_reginsterBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
    [_reginsterBtn setTitle:ZJSTRING(btnStr) forState:UIControlStateNormal];
    _reginsterBtn.tag                       = 1;
    _reginsterBtn.layer.masksToBounds = YES;
    _reginsterBtn.layer.cornerRadius  = ADJUST_PERCENT_FLOAT(20);
    _reginsterBtn.backgroundColor =  ZJCOLOR.color_c5;
    _reginsterBtn.userInteractionEnabled = NO;
    [self addSubview:_reginsterBtn];
    
    
    _loginLable = [[YBAttributedStringLabel alloc]init];
    [_loginLable  setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c5,
                                                          @"content":ZJSTRING(REIGSTER_BUTTON_ALREADY_STRINGKEY),
                                                          @"size":SYSTEM_REGULARFONT(12),
                                                          @"lineSpacing":@0},
                                                        @{@"color":ZJCOLOR.color_c4,
                                                          @"content":ZJSTRING(LOGIN_BUTTON_LOGINRIGHTNOW_STRINGKEY),
                                                          @"size":SYSTEM_REGULARFONT(12),
                                                          @"lineSpacing":@0}]];
    _loginLable.tag                                     = 2;
    _loginLable.userInteractionEnabled                  = YES;
    _loginLable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_loginLable];
    
    UITapGestureRecognizer *taplogin                    = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLoginBtn:)];
    [_loginLable addGestureRecognizer:taplogin];
}

/**
 约束
 */
- (void)setSubviewContrans
{
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(105));
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-20));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(70));
    }];
    
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.left.and.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(PROJECT_CUSTOM_TEXTFIELD_HEIGHT));
    }];
    
    [_reginsterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_phoneTextField.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(35));
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-55));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(40));
        
    }];
    
    if (self.sourcVcType == registerType) {
        [_loginLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_reginsterBtn.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(25));
            make.centerX.mas_equalTo(self.mas_centerX);
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(180), ADJUST_PERCENT_FLOAT(30)));
        }];
    }
    
}
                             
@end
