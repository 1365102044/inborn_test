//
//  ZJBaseViewController.h
//  Project
//
//  Created by 郑键 on 17/1/10.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJBaseViewController : UIViewController

/**
 蒙版视图
 */
@property (nonatomic, strong) ZJBaseView *myMaskView;

- (void)showMaskView;

- (void)hiddenMaskView;

- (void)showTempViewWithLogoImageNamed:(NSString *)imageNamed
                            tipsString:(NSString *)tipsString
                           buttonTitle:(NSString *)buttonTitle;

- (void)tempViewButtonClick:(UIButton *)sender;

- (void)showBadRequestMaskView;

- (void)agrinShow;
@end