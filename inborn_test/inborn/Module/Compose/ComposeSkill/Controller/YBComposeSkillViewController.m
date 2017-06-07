//
//  YBComposeSkillViewController.m
//  inborn
//
//  Created by 郑键 on 17/5/4.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeSkillViewController.h"
#import "YBAttributedStringLabel.h"

@interface YBComposeSkillViewController ()

#pragma mark - 控件

@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (weak, nonatomic) IBOutlet ZJBaseView *topMarginView;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *tipsLabel;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *tipsTitleLabel;

@property (weak, nonatomic) IBOutlet YBDefaultLabel *firstImageTipsTitleLabel;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *firstTipsImageView;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *firstTipsFalseImageView;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *firstRightTipsImageView;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *firstFalseTipsImageView;

@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *secondImageTipsTitleLabel;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *secondTipsImageView;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *secondTipsFaceImageView;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *secondTipsBackImageView;

@property (weak, nonatomic) IBOutlet YBDefaultLabel *thirdImageTipsTitleLabel;
@property (weak, nonatomic) IBOutlet ZJBaseImageView *thirdTipsImageView;

@property (weak, nonatomic) IBOutlet YBDefaultButton *closeButton;

#pragma mark - 布局

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsLabelLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsLabelRightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsLabelHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsTitleLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstTipsViewTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstTipsViewLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstTipsViewRightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstTipsViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsImageHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsImageWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsImageLeftMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *tipsImageMarginConsArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstRightTipsImageTopMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *rightAndFalseTipsImageWidthAndHeightConsArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondTipsViewTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondTipsViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thirdTipsViewTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thirdTipsViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *closeButtonBottomMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *closeButtonWidthAndHeightConsArray;


@end

@implementation YBComposeSkillViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (IBAction)closeButtonClick:(UIButton *)sender
{
    /**
     *  关闭
     */
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
    [self autoLayoutSubViews];
    self.view.backgroundColor = [UIColor colorWithPatternImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH,
                                                                              @"publish_skill_bg",
                                                                              ZJProjectLoadImageDefault)];
    UIBlurEffect *blur                      = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectview          = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame                        = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view insertSubview:effectview atIndex:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO
                                            withAnimation:UIStatusBarAnimationFade];
    
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    self.navigationController.navigationBar.hidden = YES;
    
    self.titleLabel.font = SYSTEM_REGULARFONT(18.f);
    self.titleLabel.textColor = ZJCOLOR.color_c0;
    self.titleLabel.text = ZJSTRING(@"发布技巧");
    
    self.topMarginView.backgroundColor = [ZJCOLOR.color_c0 colorWithAlphaComponent:0.12];
    [self.tipsLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c0,
                                                            @"content" : @"·尽可能详细描述，例如购买时间、使用情况、破损情况等\n·图片要清晰，可展示细节、多个不同角度",
                                                            @"size" : SYSTEM_MEDIUMFONT(13.f),
                                                            @"lineSpacing": @(ADJUST_PERCENT_FLOAT(15.f)),
                                                            }]];
    
    self.tipsTitleLabel.font = SYSTEM_REGULARFONT(16.f);
    self.tipsTitleLabel.text = ZJSTRING(@"示例");
    self.tipsTitleLabel.textColor = ZJCOLOR.color_c0;
    
    self.firstImageTipsTitleLabel.font = SYSTEM_REGULARFONT(12.f);
    self.firstImageTipsTitleLabel.text = ZJSTRING(@"1，图片要清晰，对焦在主体上");
    self.firstImageTipsTitleLabel.textColor = ZJCOLOR.color_c0;
    
    self.firstTipsImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH, @"publish_P1_bg", ZJProjectLoadImageDefault);
    self.firstTipsFalseImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH, @"publish_P2_bg", ZJProjectLoadImageDefault);
    
    [self.secondImageTipsTitleLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c0,
                                                                            @"content" : @"2，更丰富的细节，请拍摄正面、背面、底部、侧面、手柄、\n提带、五金件等",
                                                                            @"size" : SYSTEM_REGULARFONT(12.f),
                                                                            @"lineSpacing": @(ADJUST_PERCENT_FLOAT(9.f)),
                                                                            }]];
    
    self.secondTipsImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH, @"publish_P3_bg", ZJProjectLoadImageDefault);
    self.secondTipsFaceImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH, @"publish_P4_bg", ZJProjectLoadImageDefault);
    self.secondTipsBackImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH, @"publish_P5_bg", ZJProjectLoadImageDefault);
    
    self.thirdImageTipsTitleLabel.font = SYSTEM_REGULARFONT(12.f);
    self.thirdImageTipsTitleLabel.text = ZJSTRING(@"3，特写拍摄划痕、褪色、磨损等部位");
    self.thirdImageTipsTitleLabel.textColor = ZJCOLOR.color_c0;
    
    self.thirdTipsImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH, @"publish_P6_bg", ZJProjectLoadImageDefault);
    
    self.firstRightTipsImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_AUTHENTICATION, @"authentication_right_icon", ZJProjectLoadImageDefault);
    self.firstFalseTipsImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_AUTHENTICATION, @"authentication_wrong_icon", ZJProjectLoadImageDefault);
    
    [self.closeButton setImage:ZJIMAGE(IMAGEFILEPATH_PUBLISH,
                                       @"publish_output",
                                       ZJProjectLoadImageDefault).firstObject
                      forState:UIControlStateNormal];
    
    [self.closeButton setImage:ZJIMAGE(IMAGEFILEPATH_PUBLISH,
                                       @"publish_output",
                                       ZJProjectLoadImageDefault).lastObject
                      forState:UIControlStateHighlighted];
    [self.closeButton setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
}

- (void)autoLayoutSubViews
{
    self.tipsLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(24.f);
    self.tipsLabelLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(16.f);
    self.tipsLabelRightMarginCons.constant = ADJUST_PERCENT_FLOAT(16.f);
    self.tipsLabelHeightCons.constant = ADJUST_PERCENT_FLOAT(70.f);
    self.tipsTitleLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(24.f);
    self.firstTipsViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(20.f);
    self.firstTipsViewLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(24.f);
    self.firstTipsViewRightMarginCons.constant = ADJUST_PERCENT_FLOAT(24.f);
    self.firstTipsViewHeightCons.constant = ADJUST_PERCENT_FLOAT(121.f);
    self.tipsImageHeightCons.constant = ADJUST_PERCENT_FLOAT(71.f);
    self.tipsImageWidthCons.constant = ADJUST_PERCENT_FLOAT(71.f);
    self.tipsImageLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(18.f);
    [self.tipsImageMarginConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint * obj, NSUInteger idx, BOOL *stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(39.f);
    }];
    self.firstRightTipsImageTopMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    [self.rightAndFalseTipsImageWidthAndHeightConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint * obj, NSUInteger idx, BOOL *stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(12.f);
    }];
    self.secondTipsViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(14.f);
    self.secondTipsViewHeightCons.constant = ADJUST_PERCENT_FLOAT(123.f);
    self.thirdTipsViewTopMarginCons.constant = ADJUST_PERCENT_FLOAT(14.f);
    self.thirdTipsViewHeightCons.constant = ADJUST_PERCENT_FLOAT(97.f);
    self.closeButtonBottomMarginCons.constant = ADJUST_PERCENT_FLOAT(27.5f);
    [self.closeButtonWidthAndHeightConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint * obj, NSUInteger idx, BOOL *stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(33.f);
    }];
}

#pragma mark - Seventh.懒加载

@end
