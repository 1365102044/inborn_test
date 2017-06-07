//
//  YBComposeHomePageViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageViewController.h"
#import "YBComposeHomePageContentCollectionViewController.h"
#import "ZJBaseBarButtonItem.h"
#import "YBComposeSkillViewController.h"
#import "MQCustomerServiceManager.h"
#import "ZJBaseNavigationController.h"

@interface YBComposeHomePageViewController ()

/**
 当前的goodId
 */
@property (nonatomic, copy) NSString *goodsId;

/**
 发布按钮
 */
@property (nonatomic, strong) YBDefaultButton *composeButton;

/**
 内容视图
 */
@property (nonatomic, strong) YBComposeHomePageContentCollectionViewController *contentCollectionViewController;

/**
 客服按钮
 */
@property (nonatomic, strong) YBDefaultButton *customerButton;

@end

@implementation YBComposeHomePageViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

/**
 发布按钮点击事件

 @param sender 发布按钮点击事件
 */
- (void)composeButtonClick:(UIButton *)sender
{
    [self.contentCollectionViewController compose];
}

/**
 在线客服

 @param sender  sender
 */
- (void)customerButtonClick:(UIButton *)sender
{
    [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

+ (instancetype)composeHomePageViewControllerGoodsId:(NSString *)goodsId extend:(id)extend
{
    YBComposeHomePageViewController *composeHomePageViewController          = [[YBComposeHomePageViewController alloc] init];
    composeHomePageViewController.goodsId                                   = goodsId;
    return composeHomePageViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
    [self setupNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden     = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden     = NO;
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    self.contentCollectionViewController.goodsId = self.goodsId;
    [self addChildViewController:self.contentCollectionViewController];
    [self.view addSubview:self.contentCollectionViewController.collectionView];
    [self.view addSubview:self.composeButton];
    
    [self.contentCollectionViewController.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [self.composeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
    }];
    
    ZJBaseView *marginLineView                          = [ZJBaseView new];
    marginLineView.backgroundColor                      = ZJCOLOR.color_c16;
    [self.view addSubview:marginLineView];
    [marginLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(self.view).mas_offset(1.f);
    }];
    
    [self.view addSubview:self.customerButton];
    [self.customerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-12.f));
        make.bottom.mas_equalTo(self.composeButton.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-18.f));
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(50.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(66.f));
    }];
}

- (void)setupNavigationBar
{
    self.navigationItem.title = @"发布";
    ZJBaseBarButtonItem *backButtonItem                 = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_off"
                                                                                                     callBack:^(id sender) {
                                                                                                         [self.view endEditing:YES];
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
}

#pragma mark - Seventh.懒加载

- (YBDefaultButton *)customerButton
{
    if (!_customerButton) {
        
        _customerButton = [[YBDefaultButton alloc] init];
        [_customerButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH,
                                                 @"publish_customerservice_bg",
                                                 ZJProjectLoadImageDefault)
                         forState:UIControlStateNormal];
        [_customerButton setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH,
                                                 @"publish_customerservice_bg",
                                                 ZJProjectLoadImageDefault)
                         forState:UIControlStateHighlighted];
        [_customerButton addTarget:self action:@selector(customerButtonClick:)
                  forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _customerButton;
}

- (YBComposeHomePageContentCollectionViewController *)contentCollectionViewController
{
    if (!_contentCollectionViewController) {
        _contentCollectionViewController = [[YBComposeHomePageContentCollectionViewController alloc] init];
    }
    return _contentCollectionViewController;
}

- (YBDefaultButton *)composeButton
{
    if (!_composeButton) {
        _composeButton = [YBDefaultButton buttonFourthWithTitleStringKey:@"发布"
                                                              titleColor:ZJCOLOR.color_c0
                                                               titleFont:SYSTEM_REGULARFONT(18.f)
                                                                  target:self
                                                                selector:@selector(composeButtonClick:)];
    }
    return _composeButton;
}

@end
