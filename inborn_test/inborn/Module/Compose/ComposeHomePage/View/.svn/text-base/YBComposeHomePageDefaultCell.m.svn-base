//
//  YBComposeHomePageDefaultCell.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageDefaultCell.h"
#import "YBComposeHomePageModel.h"

/**
 *  defaultCell
 */
NSString * const YBComposeHomePageDefaultCellReuseIdentifier             = @"YBComposeHomePageDefaultCellReuseIdentifier";

@interface YBComposeHomePageDefaultCell() <UITextFieldDelegate>

@end

@implementation YBComposeHomePageDefaultCell

#pragma mark - First.通知

- (void)textFieldDidChange:(NSNotification *)no
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.composeModel.userInputText = self.detailTextField.text;
        
        if ([self.detailTextField.text isEqualToString:@""]
            || self.detailTextField.text.length == 0) {
            self.composeModel.placholder = NO;
        }else{
            self.composeModel.placholder = YES;
        }
    });
}

#pragma mark - Second.赋值

- (void)setComposeModel:(YBComposeHomePageModel *)composeModel
{
    _composeModel                       = composeModel;
    
    self.titleLabel.text                = composeModel.title;
    if (composeModel.placholder) {
        @try {
            self.detailTextField.text       = composeModel.userInputText;
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
    }else{
        self.detailTextField.text           = @"";
    }
    self.detailTextField.placeholder    = composeModel.detailText;
    self.funcButton.hidden              = !composeModel.isShowFuncButton;
    self.accessImageView.hidden         = !composeModel.isShowAccessImageView;
    YBLog(@"%zd", composeModel.isShowAccessImageView);
    self.detailTextField.userInteractionEnabled = composeModel.isInput;
    if (composeModel.isShowFuncButton) {
        [self.funcButton setImage:ZJIMAGE(composeModel.imageFilePath,
                                          composeModel.imageNamed,
                                          ZJProjectLoadImageDefault).firstObject
                         forState:UIControlStateNormal];
        [self.funcButton setImage:ZJIMAGE(composeModel.imageFilePath,
                                          composeModel.imageNamed,
                                          ZJProjectLoadImageDefault).lastObject
                         forState:UIControlStateHighlighted];
    }
    if ([composeModel.title isEqualToString:@"理想售价"]) {
        self.detailTextField.keyboardType = UIKeyboardTypeDefault;
    }else{
        self.detailTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
}

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    [super buttonClick:sender];
    
    /**
     *  弹出提示视图
     */
    if ([self.delegate respondsToSelector:@selector(defaultCollectionViewCell:button:)]) {
        [self.delegate defaultCollectionViewCell:self button:sender];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark <UITextFieldDelegate>

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *totalString;
    
    if (string.length <= 0) {
        totalString = [textField.text substringToIndex:textField.text.length-1];
    }
    else {
        totalString = [NSString stringWithFormat:@"%@%@",textField.text,string];
    }
    
    if (totalString.length == 20 + 1) {
        return NO;
    }
    return YES;
}

#pragma mark - Fifth.视图生命周期

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    YBLog(@"%zd", self.accessImageView.hidden);
    [self.detailTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.titleLabel);
        make.right.mas_equalTo(self.contentView).mas_offset(self.accessImageView.hidden ? ADJUST_PERCENT_FLOAT(-12.f) : ADJUST_PERCENT_FLOAT(-38.5));
        make.width.mas_equalTo(self.contentView).multipliedBy(0.5);
    }];
}

- (void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [super setupCustomUI];
    [self.contentView addSubview:self.detailTextField];
    
    [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark - Seventh.懒加载

- (UITextField *)detailTextField
{
    if (!_detailTextField) {
        _detailTextField                        = [[UITextField alloc] init];
        _detailTextField.font                   = SYSTEM_REGULARFONT(13.f);
        _detailTextField.keyboardType           = UIKeyboardTypeNumberPad;
        _detailTextField.textAlignment          = NSTextAlignmentRight;
        _detailTextField.textColor              = ZJCOLOR.color_c4;
        _detailTextField.delegate               = self;
    }
    return _detailTextField;
}

@end
