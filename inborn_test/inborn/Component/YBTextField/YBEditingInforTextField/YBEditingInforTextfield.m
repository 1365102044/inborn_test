//
//  YBEditingInforTextfield.m
//  inborn
//
//  Created by 刘文强 on 2017/5/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBEditingInforTextfield.h"
#import "UITextField+Extension.h"
@interface YBEditingInforTextfield ()<UITextFieldDelegate>

@property(nonatomic,strong) UITextField *textfiled;
@property(nonatomic,strong) UIButton * clearBtn;
@property(nonatomic,copy) textfiledEnditingBlock textWhenEnditing;
@property(nonatomic,copy) textfildeEnditingChangeBlcok textWhenEdtingChangeBlcok;
@property(nonatomic,strong) NSString * textFiledPaceHolder;
@property(nonatomic,strong) UIColor * textfiledTextColor;
@property(nonatomic,assign) NSInteger  textfiledTextFont;
@property(nonatomic,assign) NSInteger  limtMaxTextNumber;
@property(nonatomic,assign) NSInteger  TextFiledtag;

@end

@implementation YBEditingInforTextfield

- (void)setSecureTextEntry:(BOOL)secureTextEntry
{
    self.textfiled.secureTextEntry = secureTextEntry;
}

- (void)becomeTextFiledFirstResponder
{
    [self.textfiled becomeFirstResponder];
}

- (void)resignTextFiledFirstResponder
{
    [self.textfiled resignFirstResponder];
}

+ (instancetype)creatEditingInforTextFiledwtihtag:(NSInteger)tag
                              textFiledPaceHolder:(NSString *)textFiledPaceHolder
                                textFiledTextFont:(NSInteger)textFiledTextFont
                               textFiledTextColor:(UIColor *)textFiledTextColor
                                limtMaxTextNumber:(NSInteger)limtMaxTextNumber
                             textWhenEnditingText:(textfiledEnditingBlock)textWhenEnditing
                        textWhenEdtingChangeBlcok:(textfildeEnditingChangeBlcok)textWhenEdtingChangeBlcok
{
    YBEditingInforTextfield *textfiled = [[YBEditingInforTextfield alloc]init];
    textfiled.tag = tag;
    textfiled.TextFiledtag = tag;
    textfiled.textWhenEnditing = textWhenEnditing;
    textfiled.textWhenEdtingChangeBlcok = textWhenEdtingChangeBlcok;
    textfiled.textFiledPaceHolder = textFiledPaceHolder;
    textfiled.textfiledTextFont = textFiledTextFont;
    textfiled.textfiledTextColor = textFiledTextColor;
    textfiled.limtMaxTextNumber = limtMaxTextNumber;
    [textfiled registerUI];
    return textfiled;
}

- (void)ClearBtn:(UIButton *)sender
{
    self.textfiled.text = nil;
    if (self.textWhenEdtingChangeBlcok) {
        self.textWhenEdtingChangeBlcok(self.textfiled.text, self.tag);
    }
}

- (void)registerUI
{
    [self addSubview: self.textfiled];
    [self addSubview:self.clearBtn];
    
    [self.clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(20), ADJUST_PERCENT_FLOAT(20)));
        make.centerY.mas_equalTo(self);
    }];
    
    [self.textfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_equalTo(self.mas_height);
        make.left.mas_equalTo(self.mas_left);
        make.centerY.mas_equalTo(self);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textfiledEditChanged:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
}

-(void)textfiledEditChanged:(NSNotification *)notification{
    
    // 拿到文本改变的 text field
    UITextField *textField = (UITextField *)notification.object;
    [textField limitTextFiledEditLimitNumber:_limtMaxTextNumber];
    
    if (self.textWhenEdtingChangeBlcok) {
        self.textWhenEdtingChangeBlcok(textField.text, textField.tag);
    }
}

#pragma  textfielddelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.clearBtn.hidden = YES;
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.clearBtn.alpha = 0;
                         [self.textfiled mas_remakeConstraints:^(MASConstraintMaker *make) {
                             make.right.mas_equalTo(self.mas_right);
                             make.height.mas_equalTo(self.mas_height);
                             make.left.mas_equalTo(self.mas_left);
                             make.centerY.mas_equalTo(self);
                         }];
                     }];
    if (self.textWhenEnditing) {
        self.textWhenEnditing(textField.text,textField.tag);
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.clearBtn.hidden = NO;
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.clearBtn.alpha = 1;
                         [self.textfiled mas_remakeConstraints:^(MASConstraintMaker *make) {
                             make.right.mas_equalTo(_clearBtn.mas_left);
                             make.height.mas_equalTo(self.mas_height);
                             make.left.mas_equalTo(self.mas_left);
                             make.centerY.mas_equalTo(self);
                         }];
                     }];
}


- (UITextField *)textfiled {
    if (!_textfiled) {
        _textfiled = [[UITextField alloc]init];
        _textfiled.placeholder = _textFiledPaceHolder;
        _textfiled.delegate = self;
        _textfiled.textAlignment = NSTextAlignmentRight;
        _textfiled.textColor = _textfiledTextColor;
        _textfiled.font = SYSTEM_REGULARFONT(_textfiledTextFont);
        _textfiled.tag = _TextFiledtag;
    }
    return _textfiled;
}

- (UIButton *)clearBtn {
    if (!_clearBtn) {
        _clearBtn = [[UIButton alloc]init];
        _clearBtn.hidden = YES;
        [_clearBtn setImage:[UIImage imageNamed:@"changeinfor_close_n"] forState:UIControlStateNormal];
        [_clearBtn addTarget:self action:@selector(ClearBtn:) forControlEvents:UIControlEventTouchUpInside];
        _clearBtn.alpha = 0;
    }
    return _clearBtn;
}
- (void)dealloc
{

}
@end

