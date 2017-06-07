//
//  YBLoginResultViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBLoginResultViewController.h"
#import "YBDefaultLabel.h"
#import "YBDefaultButton.h"
#import "YBLoginViewController.h"
@interface YBLoginResultViewController ()

@property(nonatomic,assign) LoginResultPageType  resultType;
@property(nonatomic,strong) YBDefaultLabel * descLable;
@property(nonatomic,strong) YBDefaultButton * firstBtn;
@property(nonatomic,strong) YBDefaultButton * secondBtn;

/**
    QQ ; WX
 */
@property(nonatomic,strong) NSString * thirdType;
@end

@implementation YBLoginResultViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

/**
 tag 1 第一个btn; 2 第二个
 */
- (void)clickBtn:(UIButton *)sender
{
    NSArray *vcarr = self.navigationController.viewControllers;
    if (self.resultType == passwordResetResultType && sender.tag == 1) {
        
        [self.navigationController popToViewController:self.navigationController.viewControllers[vcarr.count -3] animated:YES];
    }else if (self.resultType == phoneAlreadyBindOtherWXResultType) {
        if (sender.tag == 1) {
            if (vcarr.count<3) return;
            [self.navigationController popToViewController:self.navigationController.viewControllers[vcarr.count -3] animated:YES];
        }else if (sender.tag == 2) {
            if (vcarr.count<2) return;
            NSArray *vcarr = self.navigationController.viewControllers;
            [self.navigationController popToViewController:self.navigationController.viewControllers[vcarr.count - 2] animated:YES];
        }
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

/**
 初始化
 */
+ (instancetype)creatLoginResultViewControllerWithType:(LoginResultPageType)Type
                                                extend:(id)extend
{
    YBLoginResultViewController *viewcontroller         = [[YBLoginResultViewController alloc]init];
    viewcontroller.resultType                           = Type;
    if (Type == phoneAlreadyBindOtherWXResultType) {
        viewcontroller.thirdType                        = [extend[@"thirdtype"] ex_isEmpty] ? @"" : extend[@"thirdtype"];
    }
    return viewcontroller;
}

#pragma mark - Sixth.界面配置
- (void)setUI
{
    [self.view addSubview:self.descLable];
    [self.view addSubview:self.firstBtn];
    [self.view addSubview:self.secondBtn];
    if (_resultType == phoneAlreadyBindOtherWXResultType) {
        if ([_thirdType isEqualToString:@"QQ"]) {
            [self.firstBtn setTitle:@"我是这个号码主人，绑定新的QQ" forState:UIControlStateNormal];
            self.descLable.text             = @"该手机号\n已绑定其他QQ";
        }else if ([_thirdType isEqualToString:@"WX"]) {
            [self.firstBtn setTitle:ZJSTRING(REIGSTER_BUTTON_MINEWECHAT_STRINGKEY) forState:UIControlStateNormal];
            self.descLable.text             = ZJSTRING(REIGSTER_TIPS_WECHAT_STRINGKEY);
        }
        self.secondBtn.hidden           = NO;
    } else if (_resultType == passwordResetResultType) {
        self.descLable.text             = ZJSTRING(REIGSTER_TITLE_RESETEDPWD_STRINGKEY);
        [self.firstBtn setTitle:ZJSTRING(REIGSTER_BUTTON_COMEBACKLOGIN_STRINGKEY) forState:UIControlStateNormal];
        self.secondBtn.hidden           = YES;
    }
    
    [self setSubviewContrans];
}

/**
 设置约束
 */
- (void)setSubviewContrans
{
    [_descLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(100));
        make.left.and.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(120));
    }];
    
    [_firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_descLable.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(70));
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(55));
        make.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-55));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(40));
    }];
    
    [_secondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_firstBtn.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(35));
        make.left.and.right.and.height.mas_equalTo(_firstBtn);
    }];
}

#pragma mark - Seventh.懒加载
/**
 上面的描述文字
 */
- (YBDefaultLabel *)descLable
{
    if (!_descLable) {
        _descLable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(24)
                                              text:REIGSTER_TITLE_RESETEDPWD_STRINGKEY
                                         textColor:ZJCOLOR.color_c4];
        _descLable.textAlignment          = NSTextAlignmentCenter;
        _descLable.numberOfLines          = 2;
    }
    return _descLable;
}

/**
 第一个btn
 */
- (YBDefaultButton *)firstBtn
{
    if (!_firstBtn) {
        _firstBtn = [YBDefaultButton buttonDefWithTitleStringKey:REIGSTER_BUTTON_COMEBACKLOGIN_STRINGKEY
                                                   titleColor:ZJCOLOR.color_c0
                                                    titleFont:SYSTEM_REGULARFONT(14)
                                                       target:self
                                                     selector:@selector(clickBtn:)];
        _firstBtn.tag                               = 1;
    }
    return _firstBtn;
}

/**
 第二个btn
 */
- (YBDefaultButton *)secondBtn
{
    if (!_secondBtn) {
        _secondBtn = [YBDefaultButton buttonDefWithTitleStringKey:REIGSTER_BUTTON_REPLACEPHONE_STRINGKEY
                                                    titleColor:ZJCOLOR.color_c0
                                                     titleFont:SYSTEM_REGULARFONT(14)
                                                        target:self
                                                      selector:@selector(clickBtn:)];
        _secondBtn.tag                                 = 2;
    }
    return _secondBtn;
}
@end
