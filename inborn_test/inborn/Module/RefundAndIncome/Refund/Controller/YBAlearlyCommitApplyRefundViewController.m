//
//  YBAlearlyCommitApplyRefundViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/7.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAlearlyCommitApplyRefundViewController.h"

//#import "YBAlearlyCommitApplyView.h"
#import "YBAlearlyCommitApplyHeaderView.h"
#import "ZJBaseBarButtonItem.h"

@interface YBAlearlyCommitApplyRefundViewController ()

@property(nonatomic,strong) YBAlearlyCommitApplyHeaderView * alearlyCommitApplyView;
@property(nonatomic,strong) YBRefundModel * refundmodle;

@end

@implementation YBAlearlyCommitApplyRefundViewController
+ (instancetype)creatAlearlyCommitApplyRefundVCwith:(YBRefundModel *)refundmodel
{
    YBAlearlyCommitApplyRefundViewController *vc =[[YBAlearlyCommitApplyRefundViewController alloc]init];
    vc.refundmodle = refundmodel;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"申请已提交";
    self.tableview.tableHeaderView = self.alearlyCommitApplyView;
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /**
     *  配置左侧按钮点击事件
     */
    YBDefaultButton *button = [YBDefaultButton buttonImageWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                 imageNamed:@"public_back"
                                                                       type:ZJProjectButtonSetImageDefault
                                                                     target:self
                                                                   selector:@selector(buttonClick:)];
    ZJBaseBarButtonItem *backButtonItem = [[ZJBaseBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem     = backButtonItem;
}

-(void)buttonClick:(UIButton *)sender
{
    [self.navigationController popToViewController:self.navigationController.viewControllers[self.navigationController.viewControllers.count -3]
                                          animated:YES];
}


/**
 懒加载
 */
-(YBAlearlyCommitApplyHeaderView *)alearlyCommitApplyView
{
    if (!_alearlyCommitApplyView) {
        _alearlyCommitApplyView =   [YBAlearlyCommitApplyHeaderView  creatAlearlyCommitApplyHeaderView];
        _alearlyCommitApplyView.frame = self.view.bounds;
        _alearlyCommitApplyView.refundmodle = self.refundmodle;
    }
    
    return  _alearlyCommitApplyView;
}

@end
