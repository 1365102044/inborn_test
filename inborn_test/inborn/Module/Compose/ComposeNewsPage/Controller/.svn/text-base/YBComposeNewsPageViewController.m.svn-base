//
//  YBComposeNewsPageViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeNewsPageViewController.h"
#import "YBVerticalButton.h"
#import "YBAttributedStringLabel.h"
#import "YBComposeHomePageViewController.h"
#import "ZJBaseNavigationController.h"
#import "MQCustomerServiceManager.h"
#import "User_LocalData.h"
#import "JXTAlertController.h"
#import "YBLoginViewController.h"

@interface YBComposeNewsPageViewController ()

/**
 titleLabel
 */
@property (nonatomic, strong) YBDefaultLabel *titleLabel;

/**
 firstNewView
 */
@property (nonatomic, strong) ZJBaseView *firstNewView;

/**
 secondNewView
 */
@property (nonatomic, strong) ZJBaseView *secondNewView;

/**
 buttonArray
 */
@property (nonatomic, strong) NSArray<YBVerticalButton *> *funcButtonsArray;

/**
 closeButton
 */
@property (nonatomic, strong) YBDefaultButton *closeButton;

@end

@implementation YBComposeNewsPageViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    if (sender.tag == 1004) {
        
        /**
         *  返回
         */
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    if (sender.tag == 1001) {
        
        /**
         *  发布
         */
        if ([User_LocalData getTokenId]) {
            YBComposeHomePageViewController *composeHomePageViewController = [[YBComposeHomePageViewController alloc] init];
            composeHomePageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            ZJBaseNavigationController *navigationController = [[ZJBaseNavigationController alloc] initWithRootViewController:composeHomePageViewController];
            [self presentViewController:navigationController animated:YES completion:^{}];
        }else{
            [self jxt_showAlertWithTitle:ZJSTRING(@"提示") message:ZJSTRING(@"您尚未登录，没有发布权限") appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {

                alertMaker.
                        addActionCancelTitle(ZJSTRING(@"取消")).
                        addActionDefaultTitle(ZJSTRING(@"去登陆"));

                alertMaker.view.tintColor = ZJCOLOR.color_c4;
            } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                if (buttonIndex == 1) {
                    YBLoginViewController *loginViewController          = [YBLoginViewController creatLoginViewControllerWithType:generalLoginType extend:nil];
                    ZJBaseNavigationController *navigtionController     = [[ZJBaseNavigationController alloc] initWithRootViewController:loginViewController];
                    loginViewController.modalTransitionStyle            = UIModalTransitionStyleCrossDissolve;
                    [self presentViewController:navigtionController animated:YES completion:^{

                    }];
                }
            }];
        }
    }
    
    if (sender.tag == 1002) {
        
        /**
         *  IM消息
         */
        [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
    }
    
    if (sender.tag == 1003) {
        
        /**
         *  草稿功能
         */
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

/**
 视图加载完毕
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:UIStatusBarAnimationFade];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO
                                            withAnimation:UIStatusBarAnimationFade];
}

#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.firstNewView];
    [self.view addSubview:self.secondNewView];
    [self.view addSubview:self.closeButton];
    
//    CGFloat itemWidth = self.view.width / self.funcButtonsArray.count;
    [self.funcButtonsArray enumerateObjectsUsingBlock:^(YBVerticalButton * _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
        [self.view addSubview:obj];
//        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(self.closeButton.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-64.f));
//            make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(107.f));
//            make.width.mas_equalTo(itemWidth);
//            make.left.mas_equalTo(self.view).mas_offset(idx * itemWidth);
//        }];
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(18.75));
        make.top.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(64.5));
    }];
    
    [self.firstNewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(18.f));
        make.left.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(18.f));
        make.right.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-18.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(75.f));
    }];
    
    [self.secondNewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.firstNewView.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(10.f));
        make.left.right.mas_equalTo(self.firstNewView);
        make.height.mas_equalTo(self.firstNewView);
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(ADJUST_PERCENT_FLOAT(-8.f));
        make.height.with.mas_equalTo(ADJUST_PERCENT_FLOAT(33.f));
    }];
    
    [self.funcButtonsArray[0] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.closeButton.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-64.f));
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(106.f));
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(74.f));
        make.centerX.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(-75.f));
    }];
    
    [self.funcButtonsArray[2] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view).mas_offset(ADJUST_PERCENT_FLOAT(75.f));
        make.centerY.mas_equalTo(self.funcButtonsArray[0]);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(106.f));
        make.width.mas_equalTo(ADJUST_PERCENT_FLOAT(74.f));
    }];
    
    //** =========================================================================================== */
    //** ========================================三个按钮的布局======================================= */
    //** =========================================================================================== */
    
//    [self.funcButtonsArray[0] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view);
//        make.bottom.mas_equalTo(self.funcButtonsArray[1]);
//        make.height.with.mas_equalTo(self.funcButtonsArray[1]);
//    }];
//    
//    [self.funcButtonsArray[1] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.funcButtonsArray[0].mas_right);
//        make.right.mas_equalTo(self.funcButtonsArray[2].mas_left);
//        make.bottom.mas_equalTo(self.closeButton.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(-64.f));
//        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(107.f));
//    }];
//    
//    [self.funcButtonsArray[2] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(self.view);
//        make.bottom.mas_equalTo(self.funcButtonsArray[1]);
//        make.height.with.mas_equalTo(self.funcButtonsArray[1]);
//    }];
    
    //self.view.backgroundColor = [UIColor ex_colorWithHexString:@"#1B1D23" alpha:1];
    self.view.backgroundColor = [UIColor colorWithPatternImage:ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH, @"publish_bg", ZJProjectLoadImageDefault)];
    [self.view ex_setBlurEffect:UIBlurEffectStyleDark];
}

#pragma mark - Seventh.懒加载

- (YBDefaultButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_PUBLISH
                                                          imageNamed:@"publish_output"
                                                                type:ZJProjectButtonSetImage
                                                              target:self
                                                            selector:@selector(buttonClick:)];
        _closeButton.backgroundColor = [UIColor clearColor];
        _closeButton.tag = 1004;
    }
    return _closeButton;
}

- (NSArray<YBVerticalButton *> *)funcButtonsArray
{
    if (!_funcButtonsArray) {
        
        NSArray *dataArray = @[@{@"titleStringKey":@"发布",
                                 @"imageFilePath":IMAGEFILEPATH_PUBLISH,
                                 @"imageNamed":@"publish_deliver",
                                 @"tag":@1001},
                               @{@"titleStringKey":@"IM发布",
                                 @"imageFilePath":IMAGEFILEPATH_PUBLISH,
                                 @"imageNamed":@"publish_imdeliver",
                                 @"tag":@1002},
                               @{@"titleStringKey":@"IM发布",
                                 @"imageFilePath":IMAGEFILEPATH_PUBLISH,
                                 @"imageNamed":@"publish_imdeliver",
                                 @"tag":@1002}];
        /**
         *
         @{@"titleStringKey":@"从草稿发布",
         @"imageFilePath":IMAGEFILEPATH_PUBLISH,
         @"imageNamed":@"publish_draft",
         @"tag":@1003}
         */
        
        NSMutableArray *tempArray = [NSMutableArray array];
        
        [dataArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
            
            YBVerticalButton *verticalButton = [YBVerticalButton buttonImageAndTitleWithTitleStringKey:obj[@"titleStringKey"]
                                                                                            titleColor:ZJCOLOR.color_c0
                                                                                             titleFont:SYSTEM_REGULARFONT(14.f)
                                                                                         imageFilePath:obj[@"imageFilePath"]
                                                                                            imageNamed:obj[@"imageNamed"]
                                                                                                  type:ZJProjectButtonSetImage
                                                                                                target:self
                                                                                              selector:@selector(buttonClick:)];
            if (idx == 1) {
                verticalButton.hidden = YES;
            }
            verticalButton.tag              = [obj[@"tag"] integerValue];
            verticalButton.backgroundColor  = [UIColor clearColor];
            [tempArray addObject:verticalButton];
            
        }];
        
        _funcButtonsArray = tempArray.copy;
        
    }
    return _funcButtonsArray;
}

- (ZJBaseView *)secondNewView
{
    if (!_secondNewView) {
        
        _secondNewView                                      = [[ZJBaseView alloc] init];
        _secondNewView.backgroundColor                      = ZJCOLOR.color_c0;
        _secondNewView.layer.cornerRadius                   = 4.f;
        _secondNewView.layer.masksToBounds                  = YES;
        
        ZJBaseImageView *imageView                          = [[ZJBaseImageView alloc] init];
        YBAttributedStringLabel *attributedStringLabel      = [[YBAttributedStringLabel alloc] init];
        attributedStringLabel.backgroundColor               = _secondNewView.backgroundColor;
        
        imageView.image                                     = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH,
                                                                             @"publish_unterrace_n",
                                                                             ZJProjectLoadImageDefault);
        [attributedStringLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                       @"content" : ZJSTRING(@"非寄卖商品\n"),
                                                                       @"size" : SYSTEM_MEDIUMFONT(14.f),
                                                                       @"lineSpacing": @8},
                                                                     @{@"color" : ZJCOLOR.color_c5,
                                                                       @"content" : ZJSTRING(@"卖家发布商品后支付担保金，即可上架销售，买家下\n单后，卖家将商品邮寄至胤宝平台鉴定。"),
                                                                       @"size" : SYSTEM_REGULARFONT(11.f),
                                                                       @"lineSpacing": @7}]];
        
        [_secondNewView addSubview:imageView];
        [_secondNewView addSubview:attributedStringLabel];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_secondNewView);
            make.left.mas_equalTo(_secondNewView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
            make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(51.f));
        }];
        
        [attributedStringLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10.f));
        }];
        
    }
    return _secondNewView;
}

- (ZJBaseView *)firstNewView
{
    if (!_firstNewView) {
        
        _firstNewView                                       = [[ZJBaseView alloc] init];
        _firstNewView.backgroundColor                       = ZJCOLOR.color_c0;
        _firstNewView.layer.cornerRadius                    = 4.f;
        _firstNewView.layer.masksToBounds                   = YES;
        ZJBaseImageView *imageView                          = [[ZJBaseImageView alloc] init];
        YBAttributedStringLabel *attributedStringLabel      = [[YBAttributedStringLabel alloc] init];
        attributedStringLabel.backgroundColor               = _secondNewView.backgroundColor;
        
        imageView.image                                     = ZJCURRENTIMAGE(IMAGEFILEPATH_PUBLISH,
                                                                             @"publish_terrace_n",
                                                                             ZJProjectLoadImageDefault);
        [attributedStringLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                                       @"content" : ZJSTRING(@"平台寄卖商品\n"),
                                                                       @"size" : SYSTEM_MEDIUMFONT(14.f),
                                                                       @"lineSpacing": @8},
                                                                     @{@"color" : ZJCOLOR.color_c5,
                                                                       @"content" : ZJSTRING(@"将商品邮寄到胤宝，经专业鉴定师鉴定后，上架销售\n确保每件上架商品的品质，将获得更多的推荐机会"),
                                                                       @"size" : SYSTEM_REGULARFONT(11.f),
                                                                       @"lineSpacing": @7}]];
        
        [_firstNewView addSubview:imageView];
        [_firstNewView addSubview:attributedStringLabel];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_firstNewView);
            make.left.mas_equalTo(_firstNewView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
            make.width.height.mas_equalTo(ADJUST_PERCENT_FLOAT(51.f));
        }];
        
        [attributedStringLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10.f));
        }];
        
    }
    return _firstNewView;
}

- (YBDefaultLabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(22.f)
                                               text:@"胤宝新玩法"
                                          textColor:ZJCOLOR.color_c0];
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}

@end
