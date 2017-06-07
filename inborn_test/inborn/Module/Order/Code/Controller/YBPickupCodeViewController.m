//
//  YBPickupCodeViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPickupCodeViewController.h"
#import "YBAttributedStringLabel.h"
#import "YBStringTool.h"

@interface YBPickupCodeViewController ()

@property (weak, nonatomic) IBOutlet YBDefaultButton *backButton;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *topTipsLabel;
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *bottomTipsLabel;
@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UIImageView *codeImageView;
@property (weak, nonatomic) IBOutlet YBDefaultLabel *codeLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginConst;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *backButtonHeightWidthConsArray;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTipsLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeViewTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeViewLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeViewRightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *codeViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomTipsLabelTopMarginCons;

@end

@implementation YBPickupCodeViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (IBAction)backButtonClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor ex_colorWithHexString:@"#30343F" alpha:1.0];
    self.titleView.backgroundColor = self.view.backgroundColor;
    
    [self.backButton setImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                     @"public_back",
                                      ZJProjectLoadImageDefault).firstObject forState:UIControlStateNormal];
    [self.backButton setImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                      @"public_back",
                                      ZJProjectLoadImageDefault).lastObject forState:UIControlStateNormal];
    self.titleLabel.font = SYSTEM_REGULARFONT(18.f);
    self.titleLabel.textColor =ZJCOLOR.color_c0;
    self.titleLabel.text = ZJSTRING(@"提货码");
    
    self.topTipsLabel.font = SYSTEM_REGULARFONT(14.f);
    self.topTipsLabel.textColor =ZJCOLOR.color_c0;
    self.topTipsLabel.text = ZJSTRING(@"该功能用于到店自提商品时向商家提供提货凭证");

    [self.bottomTipsLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c0,
                                                                  @"content" : ZJSTRING(@"提货时，服务人员会核对购买人及提货人身份信息。\n如身份信息与订单信息不符，平台有权拒绝提供商品\n并与购买人核实提货人身份。"),
                                                                  @"size" : SYSTEM_REGULARFONT(12.f),
                                                                  @"lineSpacing": @(ADJUST_PERCENT_FLOAT(12.f)),
                                                                  @"alignment":@"1"}]];
    
    self.codeImageView.image = [UIImage generateBarCode:self.orderPickupCode
                                                   size:self.codeImageView.size
                                                  color:[UIColor blackColor]
                                        backGroundColor:ZJCOLOR.color_c0];
    
    self.codeLabel.textAlignment = NSTextAlignmentCenter;
    self.codeLabel.font = SYSTEM_REGULARFONT(14.f);
    @try {
        NSString *temp = nil;
        for(int i =0; i < [self.orderPickupCode length]; i++) {
            if (i == 0) {
                temp = [self.orderPickupCode substringWithRange:NSMakeRange(i,1)];
            }else{
                if (i == 4
                    || i == 8) {
                    temp = [NSString stringWithFormat:@"%@ %@", temp,
                            [self.orderPickupCode substringWithRange:NSMakeRange(i,1)]];
                }else{
                    temp = [NSString stringWithFormat:@"%@%@", temp,
                            [self.orderPickupCode substringWithRange:NSMakeRange(i,1)]];
                    
                }
            }
        }
        self.codeLabel.text = temp;
    } @catch (NSException *exception) {
        self.codeLabel.hidden = YES;
    } @finally {
        
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
