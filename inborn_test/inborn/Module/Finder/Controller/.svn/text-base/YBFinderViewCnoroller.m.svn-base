//
//  YBFinderViewCnoroller.m
//  inborn
//
//  Created by 郑键 on 17/4/10.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBFinderViewCnoroller.h"
#import "YBAttributedStringLabel.h"

@interface YBFinderViewCnoroller ()

@property (weak, nonatomic) IBOutlet ZJBaseImageView *logoImageView;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *tipsLabel;
@property (weak, nonatomic) IBOutlet YBDefaultButton *funcButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *funcButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *funcButtonHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *funcButtonWidthCons;

@end

@implementation YBFinderViewCnoroller

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (IBAction)funcButtonClick:(UIButton *)sender
{
    self.tabBarController.selectedIndex = 0;
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    self.navigationItem.title = ZJSTRING(@"晒物");
    
    self.logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_FINDER,
                                              @"finder_blank_bg",
                                              ZJProjectLoadImageDefault);
    
    [self.tipsLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                            @"content" : ZJSTRING(@"哎呀，很抱歉~\n"),
                                                            @"size" : SYSTEM_MEDIUMFONT(14.f),
                                                            @"lineSpacing": @16,
                                                            @"alignment":@"1"},
                                                          @{@"color" : ZJCOLOR.color_c4,
                                                            @"content" : ZJSTRING(@"晒单目前正在加紧测试中，很快回来哦！"),
                                                            @"size" : SYSTEM_MEDIUMFONT(14.f),
                                                            @"lineSpacing": @16,
                                                            @"alignment":@"1"}]];
    
    NSArray *imageArray         = ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                          @"public_blank_btn",
                                          ZJProjectLoadImageDefault);
    [self.funcButton setBackgroundImage:imageArray.firstObject
                               forState:UIControlStateNormal];
    [self.funcButton setBackgroundImage:imageArray.lastObject
                               forState:UIControlStateHighlighted];
    [self.funcButton setTitle:ZJSTRING(@"到处逛逛")
                     forState:UIControlStateNormal];
    [self.funcButton setTitleColor:ZJCOLOR.color_c6
                          forState:UIControlStateNormal];
    self.funcButton.titleLabel.font = SYSTEM_MEDIUMFONT(14.f);
    
    self.logoImageViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(110.f);
    self.logoImageWidthCons.constant = ADJUST_PERCENT_FLOAT(146.f);
    self.logoImageHeightCons.constant = ADJUST_PERCENT_FLOAT(128.f);
    self.tipsLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(32.f);
    self.funcButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(56.f);
    self.funcButtonWidthCons.constant = ADJUST_PERCENT_FLOAT(227.f);
    self.funcButtonHeightCons.constant = ADJUST_PERCENT_FLOAT(44.f);
}

#pragma mark - Seventh.懒加载

@end
