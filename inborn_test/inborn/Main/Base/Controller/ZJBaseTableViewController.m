//
//  ZJBaseTableViewController.m
//  Project
//
//  Created by 郑键 on 17/1/10.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJBaseTableViewController.h"
#import "YBAttributedStringLabel.h"

@interface ZJBaseTableViewController ()

/**
 蒙版空视图
 */
@property (nonatomic, strong) ZJBaseImageView *logoImageView;

/**
 tipsLabel
 */
@property (nonatomic, strong) YBAttributedStringLabel *tipsLabel;

/**
 funcButton
 */
@property (nonatomic, strong) YBDefaultButton *funcButton;

@end

@implementation ZJBaseTableViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)tempViewButtonClick:(UIButton *)sender
{
    
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    
    /**
     *  添加蒙版视图，后期可扩展为空页面及异步加载指示器
     */
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self hiddenMaskView];
    [SVProgressHUD dismiss];
}

#pragma mark - Sixth.界面配置

/**
 展示空页面
 
 @param imageNamed imageNamed
 @param tipsString tipsString
 */
- (void)showTempViewWithLogoImageNamed:(NSString *)imageNamed
                            tipsString:(NSString *)tipsString
                           buttonTitle:(NSString *)buttonTitle
{
    [self showMaskView];
    self.logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_BLANK,
                                              imageNamed,
                                              ZJProjectLoadImageDefault);
    [self.tipsLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                            @"content" : tipsString,
                                                            @"size" : SYSTEM_MEDIUMFONT(14.f),
                                                            @"lineSpacing": @0.f,
                                                            @"alignment":@"1"}]];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.logoImageView.alpha        = 1.f;
        self.tipsLabel.alpha            = 1.f;
        if (buttonTitle) {
            self.funcButton.alpha           = 1.f;
            [self.funcButton setTitle:ZJSTRING(buttonTitle)
                             forState:UIControlStateNormal];
        }
        
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - Seventh.懒加载

- (ZJBaseView *)myMaskView
{
    if (!_myMaskView) {
        
        _myMaskView = [[ZJBaseView alloc] initWithFrame:self.tableView.bounds];
        
        _logoImageView = [[ZJBaseImageView alloc] init];
        _logoImageView.alpha = 0;
        
        _tipsLabel = [[YBAttributedStringLabel alloc] init];
        _tipsLabel.alpha = 0;
        
        _funcButton = [YBDefaultButton buttonSixWithTitleStringKey:@"重新加载"
                                                        titleColor:ZJCOLOR.color_c4
                                                         titleFont:SYSTEM_REGULARFONT(14.f)
                                                            target:self
                                                          selector:@selector(tempViewButtonClick:)];
        _funcButton.alpha = 0;
        
        [_myMaskView addSubview:_logoImageView];
        [_myMaskView addSubview:_tipsLabel];
        [_myMaskView addSubview:_funcButton];
        
        [_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_myMaskView).mas_offset(ADJUST_PERCENT_FLOAT(104.f));
            make.centerX.mas_equalTo(_myMaskView);
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(147.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(120.f));
        }];
        
        [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_myMaskView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
            make.right.mas_equalTo(_myMaskView).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
            make.top.mas_equalTo(_logoImageView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(30.f));
        }];
        
        [_funcButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_myMaskView);
            make.top.mas_equalTo(_tipsLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(42.f));
            make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(226.f));
            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
        }];
    }
    return _myMaskView;
}

#pragma mark - Eight.Other

- (void)showMaskView
{
    [self.tableView addSubview:self.myMaskView];
}

- (void)hiddenMaskView
{
    [UIView animateWithDuration:0.25 animations:^{
       self.myMaskView.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.myMaskView removeFromSuperview];
        }
    }];
}

@end
