//
//  YBCertifiedPaymentBankCardResultController.m
//  inborn
//
//  Created by 郑键 on 17/4/12.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBankCardResultController.h"

@interface YBCertifiedPaymentBankCardResultController ()

@end

@implementation YBCertifiedPaymentBankCardResultController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)tempViewButtonClick:(UIButton *)sender
{
    [super tempViewButtonClick:sender];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = ZJSTRING(@"完成");
    
    if (self.type == YBCertifiedPaymentBankCardResultControllerSuccess) {
        
        [self showTempViewWithLogoImageNamed:@"blank_successcard_bg"
                                  tipsString:@"喔，好棒，你已成功解绑了银行卡"
                                 buttonTitle:@"返回"];
    }
    
    if (self.type == YBCertifiedPaymentBankCardResultControllerFailed) {
        
        [self showTempViewWithLogoImageNamed:@"blank_failcard_bg"
                                  tipsString:@"糟了，解绑失败了，别灰心，再试一次！"
                                 buttonTitle:@"再试一次"];
        
    }
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
