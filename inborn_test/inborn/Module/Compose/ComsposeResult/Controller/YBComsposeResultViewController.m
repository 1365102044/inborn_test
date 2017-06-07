//
//  YBComsposeResultViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/25.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComsposeResultViewController.h"
#import "YBAttributedStringLabel.h"
#import "ZJBaseBarButtonItem.h"
#import "YBComposeSkillViewController.h"
#import "MQCustomerServiceManager.h"
#import "ZJBaseNavigationController.h"

@interface YBComsposeResultViewController ()

@property (weak, nonatomic) IBOutlet ZJBaseImageView *logoImageView;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *statusTipsLabel;
@property (weak, nonatomic) IBOutlet YBDefaultButton *firstFuncButton;
@property (weak, nonatomic) IBOutlet YBDefaultButton *secondFuncButton;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *tipsLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logoImageViewWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *statusTipsLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstFuncButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondFuncButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsLabelTopMarginCons;

@end

@implementation YBComsposeResultViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (IBAction)firstFuncButtonClick:(UIButton *)sender
{
    UITabBarController *rootController = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    rootController.selectedIndex = 0;
    UIViewController *rootVC = self.presentingViewController;
    while (rootVC.presentingViewController) {
        rootVC = rootVC.presentingViewController;
    }
    [rootVC dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)secondFuncButtonClick:(UIButton *)sender
{
    [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - Sixth.界面配置

- (void)setupUI
{
    self.logoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_BLANK, @"blank_success_bg", ZJProjectLoadImageDefault);
    
    self.statusTipsLabel.font = SYSTEM_MEDIUMFONT(14.f);
    self.statusTipsLabel.textColor = ZJCOLOR.color_c4;
    self.statusTipsLabel.text = @"恭喜你，发布成功！";
    self.statusTipsLabel.textAlignment = NSTextAlignmentCenter;
    
    UIImage *norImage1   = [UIImage imageNamed:@"public_blank_btn_n"];
    UIImage *selImage1   = [UIImage imageNamed:@"public_blank_btn_h"];
    
    [self.firstFuncButton setBackgroundImage:norImage1 forState:UIControlStateNormal];
    [self.firstFuncButton setBackgroundImage:selImage1 forState:UIControlStateHighlighted];
    [self.firstFuncButton setTitle:ZJSTRING(@"到别处逛逛")
                          forState:UIControlStateNormal];
    [self.firstFuncButton setTitleColor:ZJCOLOR.color_c6
                               forState:UIControlStateNormal];
    self.firstFuncButton.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    
    UIImage *norImage2   = [UIImage imageNamed:@"public_blank_btn_n"];
    UIImage *selImage2   = [UIImage imageNamed:@"public_blank_btn_h"];
    [self.secondFuncButton setBackgroundImage:norImage2 forState:UIControlStateNormal];
    [self.secondFuncButton setBackgroundImage:selImage2 forState:UIControlStateHighlighted];
    [self.secondFuncButton setTitle:ZJSTRING(@"找客服快速上架")
                           forState:UIControlStateNormal];
    [self.secondFuncButton setTitleColor:ZJCOLOR.color_c6
                                forState:UIControlStateNormal];
    self.secondFuncButton.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    
    [self.tipsLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c5,
                                                            @"content" : @"1，发布后的商品会在1个工作日内进行初步审核，审核过程中工作人员可能会与你电话沟通商品出售信息。\n2，可在“我的”-“我发布的”中预览商品详情，对待审核的信息进行修改。",
                                                            @"size" : SYSTEM_REGULARFONT(12.f),
                                                            @"lineSpacing": @12,
                                                            }]];
    
    self.navigationItem.title = @"发布";
    ZJBaseBarButtonItem *backButtonItem                 = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_off"
                                                                                                     callBack:^(id sender) {
                                                                                                         UIViewController *rootVC = self.presentingViewController;
                                                                                                         while (rootVC.presentingViewController) {
                                                                                                             rootVC = rootVC.presentingViewController;
                                                                                                         }
                                                                                                         [rootVC dismissViewControllerAnimated:YES completion:nil];
                                                                                                     }];
    self.navigationItem.leftBarButtonItem               = backButtonItem;
    ZJBaseBarButtonItem *rightButtonItem                = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLISH
                                                                                                   imageNamed:@"publish_help"
                                                                                                     callBack:^(id sender) {
                                                                                                         YBComposeSkillViewController *composeSkillViewController = [[YBComposeSkillViewController alloc]init];
                                                                                                         composeSkillViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                                                                                                         ZJBaseNavigationController *navigationController = [[ZJBaseNavigationController alloc] initWithRootViewController:composeSkillViewController];
                                                                                                         [self presentViewController:navigationController animated:YES completion:^{
                                                                                                             
                                                                                                         }];
                                                                                                         
                                                                                                     }];
    self.navigationItem.rightBarButtonItem              = rightButtonItem;
    
    self.logoImageViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(53.f);
    self.logoImageViewHeightCons.constant = ADJUST_PERCENT_FLOAT(120.f);
    self.logoImageViewWidthCons.constant = ADJUST_PERCENT_FLOAT(147.f);
    self.statusTipsLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(30.f);
    self.firstFuncButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(42.f);
    self.secondFuncButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(24.f);
    self.buttonHeightCons.constant = ADJUST_PERCENT_FLOAT(44.f);
    self.buttonWidthCons.constant = ADJUST_PERCENT_FLOAT(226.f);
    self.tipsLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(32.f);
}

#pragma mark - Seventh.懒加载

@end
