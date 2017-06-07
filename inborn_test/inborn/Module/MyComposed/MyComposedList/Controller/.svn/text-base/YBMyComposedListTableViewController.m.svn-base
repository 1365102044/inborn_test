//
//  YBMyComposedListTableViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMyComposedListTableViewController.h"
#import "YBMyComposedListCell.h"
#import "YBMyComposedViewModel.h"
#import "MQCustomerServiceManager.h"
#import "YBComposeHomePageViewController.h"
#import "ZJBaseNavigationController.h"
#import "YXShareSDKManager.h"
#import "YBApplyRefundViewController.h"
#import "YBPaymentController.h"
#import "YBPopoverView.h"
#import "YBGoodsDeatilImageViewController.h"
#import "ZJBaseNavigationController.h"
#import "YBCommitLogitcsViewController.h"
#import "JXTAlertManagerHeader.h"
#import "YBComposeService.h"

@interface YBMyComposedListTableViewController () <YBMyComposedListCellDelegate>

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBMyComposedViewModel *myComposedViewModel;

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBGoodModel *currentEditModel;

/**
 <#descrption#>
 */
@property (nonatomic, strong) NSIndexPath *currentIndexPath;

@end

@implementation YBMyComposedListTableViewController

#pragma mark - First.通知

- (void)payment:(NSNotification *)no
{
    /**
     *  支付成功
     */
    if ([self.title isEqualToString:@"全部"]) {
        
        /**
         *  修改状态
         *  支付鉴定费/支付保证金
         */
        [self.myComposedViewModel queryGoodsWithGoodsModel:self.currentEditModel
                                          currentIndexpath:self.currentIndexPath
                                      successCallBackBlock:^(id model) {
                                          [self.tableView reloadData];
        } failureCallBack:^(id error) {
            
        }];
        
    }else{
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.myComposedViewModel.composeListArray];
        [tempArray removeObject:self.currentEditModel];
        self.myComposedViewModel.composeListArray = tempArray.copy;
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
        if (self.myComposedViewModel.composeListArray.count == 0) {
            [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                      tipsString:@"暂无数据"
                                     buttonTitle:nil];
        }
    }
}

#pragma mark - Second.赋值

- (void)setMyComposedViewModel:(YBMyComposedViewModel *)myComposedViewModel
{
    _myComposedViewModel = myComposedViewModel;
    
    [self.tableView reloadData];
}

#pragma mark - Third.点击事件

- (void)countDown
{
    /**
     *  通知viewModel倒计时
     */
    [self.myComposedViewModel countDown];
}

/**
 加载新数据
 */
- (void)loadNewData
{
    [self.tableView.mj_footer resetNoMoreData];
    
    /**
     *  根据分类获取数据
     */
    [self.myComposedViewModel composeListWithCurPage:@"1"
                                            pageSize:[NSString stringWithFormat:@"%zd", SEVRIES_PAGESIZE]
                                           goodsType:[NSString stringWithFormat:@"%zd", self.view.tag]
                                successCallBackBlock:^(id model) {
                                    
                                    [self.tableView.mj_header endRefreshing];
                                    
                                    if (!self.myComposedViewModel.composeListArray
                                        || self.myComposedViewModel.composeListArray.count == 0) {
                                        [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                                  tipsString:@"暂无数据"
                                                                 buttonTitle:nil];
                                    }else{
                                        [self hiddenMaskView];
                                    }
                                    /**
                                     *  赋值
                                     */
                                    self.myComposedViewModel = (YBMyComposedViewModel *)model;
                                    
                                } failureCallBack:^(id error) {
                                    
                                    [self.tableView.mj_header endRefreshing];
                                    
                                    if (!self.myComposedViewModel.composeListArray
                                        || self.myComposedViewModel.composeListArray.count == 0) {
                                        [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                                  tipsString:@"暂无数据"
                                                                 buttonTitle:nil];
                                    }
                                    
                                    /**
                                     *  如果errorCode == -1009 无网络
                                     */
//                                    if ([error code] == -1009) {
//                                        [self showTempViewWithLogoImageNamed:@"blank_net_bg"
//                                                                  tipsString:@"糟糕，网络好像出问题了"
//                                                                 buttonTitle:nil];
//                                    }
                                    
                                }];
}

/**
 加载更多
 */
- (void)loadMoreData
{
    /**
     *  刷新时避免加载更多
     */
    if ([self.tableView.mj_header isRefreshing]) {
        return;
    }
    
    if ([self.myComposedViewModel.pageDataModel.curPage integerValue] + 1 > ([self.myComposedViewModel.pageDataModel.totalRows integerValue] % SEVRIES_PAGESIZE == 0 ? [self.myComposedViewModel.pageDataModel.totalRows integerValue] / SEVRIES_PAGESIZE : [self.myComposedViewModel.pageDataModel.totalRows integerValue] / SEVRIES_PAGESIZE + 1)) {
        
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    
    /**
     *  根据分类获取数据
     */
    [self.myComposedViewModel composeListWithCurPage:[NSString stringWithFormat:@"%zd", [self.myComposedViewModel.pageDataModel.curPage integerValue] + 1]
                                            pageSize:[NSString stringWithFormat:@"%zd", SEVRIES_PAGESIZE]
                                           goodsType:[NSString stringWithFormat:@"%zd", self.view.tag]
                                successCallBackBlock:^(id model) {
                                    [self.tableView.mj_footer endRefreshing];
                                    
                                    /**
                                     *  赋值
                                     */
                                    self.myComposedViewModel = (YBMyComposedViewModel *)model;
                                    
                                } failureCallBack:^(id error) {
                                    [self.tableView.mj_footer endRefreshing];
                                }];
}

#pragma mark - Fourth.代理方法

#pragma mark <YBMyComposedListCellDelegate>

/**
 cell按钮点击事件
 
 @param myComposedListCell  myComposedListCell
 @param button              button
 */
- (void)myComposedListCell:(YBMyComposedListCell *)myComposedListCell
                    button:(UIButton *)button
{
    NSIndexPath *currentIndexPath = [self.tableView indexPathForCell:myComposedListCell];
    YBGoodModel *goodModel = self.myComposedViewModel.composeListArray[currentIndexPath.row];
    self.currentEditModel = goodModel;
    self.currentIndexPath = currentIndexPath;
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"更多")]) {
        if ([goodModel.goodsStatus isEqualToString:@"1"]) {
            
            /*
             * 不符合
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"删除",
                                                                       @"预览",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"删除")]) {
                                       [self delGoodsWithGoodModel:goodModel currentIndexPath:currentIndexPath];
                                   }else if ([sender.title isEqualToString:ZJSTRING(@"预览")]) {
                                       [self showPreviewWebViewControllerWithGoodModel:goodModel];
                                   }else if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
            
        } else if ([goodModel.goodsStatus isEqualToString:@"10"]) {
            
            /*
             * 待审核
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"删除",
                                                                       @"修改",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"删除")]) {
                                       [self delGoodsWithGoodModel:goodModel currentIndexPath:currentIndexPath];
                                   }else if ([sender.title isEqualToString:ZJSTRING(@"修改")]) {
                                       [self editGoodInformationWithGoodModel:goodModel];
                                   }else if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"20"]) {
            
            /*
             * 待确认
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"30"]) {
            
            /*
             * 待付费
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"预览",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"预览")]) {
                                       [self showPreviewWebViewControllerWithGoodModel:goodModel];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"40"]) {
            
            /*
             * 待鉴定
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"50"]) {
            
            /*
             * 待上架
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"60"]) {
            
            /*
             * 出售中
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"分享",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"分享")]) {
                                       [self shareWithGoodModel:goodModel];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"61"]) {
            
            /*
             * 出售中/延期下架
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"分享",
                                                                       @"查看商品",
                                                                       @"下架",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"分享")]) {
                                       [self shareWithGoodModel:goodModel];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"下架")]) {
                                       [self offShelveWithGoodsModel:goodModel currentIndexPath:currentIndexPath];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"查看商品")]) {
                                       [self checkGoodDetailWithGoodsModel:goodModel];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"62"]) {
            
            /*
             * 出售中/顶一下下架
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"分享",
                                                                       @"查看商品",
                                                                       @"下架",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"分享")]) {
                                       [self shareWithGoodModel:goodModel];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"下架")]) {
                                       [self offShelveWithGoodsModel:goodModel currentIndexPath:currentIndexPath];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"查看商品")]) {
                                       [self checkGoodDetailWithGoodsModel:goodModel];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"70"]) {
            
            /*
             * 已出售
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"71"]) {
            
            /*
             * 线下销售
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"80"]) {
            
            /*
             * 已下架
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"重新上架",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"重新上架")]) {
                                       [self refreshShelveWithGoodsModel:goodModel currentIndexPath:currentIndexPath];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"81"]) {
            
            /*
             * 已下架/已下架退担保金
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"重新上架",
                                                                       @"预览",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"预览")]) {
                                       [self showPreviewWebViewControllerWithGoodModel:goodModel];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"重新上架")]) {
                                       [self refreshShelveWithGoodsModel:goodModel currentIndexPath:currentIndexPath];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"82"]) {
            
            /*
             * 已下架/已下架退货
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"预览",
                                                                       @"申请退回",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"申请退回")]) {
                                       [self applyForReturnWithGoodModel: goodModel];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"预览")]) {
                                       [self showPreviewWebViewControllerWithGoodModel:goodModel];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"90"]) {
            
            /*
             * 待退回
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"91"]) {
            
            /*
             * 退回中
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"92"]) {
            
            /*
             * 已退回
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"预览",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"预览")]) {
                                       [self showPreviewWebViewControllerWithGoodModel:goodModel];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"93"]) {
            
            /*
             * 已取消
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"预览",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"预览")]) {
                                       [self showPreviewWebViewControllerWithGoodModel:goodModel];
                                   }
                                   
                               }];
        } else if ([goodModel.goodsStatus isEqualToString:@"94"]) {
            
            /*
             * 未支付已取消
             */
            [YBPopoverView showPopoverToView:button actionTitleArray:@[@"预览",
                                                                       @"联系客服"]
                               callBackBlock:^(PopoverAction * sender) {
                                   
                                   if ([sender.title isEqualToString:ZJSTRING(@"联系客服")]) {
                                       [self loadCustomer];
                                   } else if ([sender.title isEqualToString:ZJSTRING(@"预览")]) {
                                       [self showPreviewWebViewControllerWithGoodModel:goodModel];
                                   }
                                   
                               }];
        } else{
            
            
        }
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"删除")]) {
        [self delGoodsWithGoodModel:goodModel currentIndexPath:currentIndexPath];
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"联系客服")]) {
        [self loadCustomer];
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"修改")]) {
        [self editGoodInformationWithGoodModel:goodModel];
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"预览")]) {
        [self showPreviewWebViewControllerWithGoodModel:goodModel];
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"查看商品")]) {
        [self checkGoodDetailWithGoodsModel:goodModel];
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"顶一下")]
        || [button.titleLabel.text isEqualToString:ZJSTRING(@"延期")]) {
        [self refreshGoodTimeWithGoodsModel:goodModel];
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"重新上架")]) {
        [self refreshShelveWithGoodsModel:goodModel currentIndexPath:currentIndexPath];
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"申请退款")]) {
        YBApplyRefundViewController *refundVC = [YBApplyRefundViewController creatApplyRefundViewControllerWithrefundAmount:goodModel.refundMoney
                                                                                                                    orderId:@""
                                                                                                                     extend:goodModel.customId];
        /**
         *  修改状态为93
         */
        refundVC.callBackBlock = ^(id sender) {
            goodModel.goodsStatus = @"93";
            [self.tableView reloadData];
        };
        
        [self.navigationController pushViewController:refundVC animated:YES];
        
        return;
    }
    
    if ([button.titleLabel.text isEqualToString:ZJSTRING(@"立即支付")]) {
        
        YBPaymentController *paymentController = [YBPaymentController paymentControllerWithOrderId:goodModel.customId
                                                                                     paymentMethod:ZJProjectPaymentMethodAll
                                                                                  paymentEventType:goodModel.consignWay.integerValue
                                                                                            extend:nil];
        [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                      selector:@selector(payment:)
                                          name:PAY_RESULT_SUCCESS_NOTIFICATION
                                        object:nil];
        [self.navigationController pushViewController:paymentController animated:YES];
        
        return;
    }
}

/**
 申请退回

 @param goodModel           goodModel
 */
- (void)applyForReturnWithGoodModel:(YBGoodModel *)goodModel
{
    YBCommitLogitcsViewController *commotlogitcsVC = [YBCommitLogitcsViewController creatViewCotrollerWithVcWithtype:ApplyReturnType
                                                                                                         appraisalId:goodModel.customId
                                                                                                              extend:nil];
    /**
     *  回调改变状态为90
     */
    commotlogitcsVC.callBackBlock = ^(id sender) {
        goodModel.goodsStatus = @"90";
        [self.tableView reloadData];
    };
    
    [self.navigationController pushViewController:commotlogitcsVC animated:YES];
}

/**
 加载客服
 */
- (void)loadCustomer
{
    [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
}

/**
 删除商品

 @param goodModel           商品模型
 @param currentIndexPath    当前商品所处的indexPath
 */
- (void)delGoodsWithGoodModel:(YBGoodModel *)goodModel
             currentIndexPath:(NSIndexPath *)currentIndexPath
{
    [self jxt_showAlertWithTitle:ZJSTRING(@"提示")
                         message:ZJSTRING(@"确定删除发布的商品？")
               appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                   
                   alertMaker.
                   addActionDefaultTitle(ZJSTRING(@"确定")).
                   addActionCancelTitle(ZJSTRING(@"取消"));
                   
                   alertMaker.view.tintColor = ZJCOLOR.color_c6;
                   
               } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                   
                   if (buttonIndex == 0) {
                       
                       [self.myComposedViewModel delGoodWithGoodsModel:goodModel successCallBackBlock:^(id model) {
                           
                           [self.tableView reloadData];
                           [self.tableView.mj_footer endRefreshing];
                           if (self.myComposedViewModel.composeListArray.count == 0) {
                               [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                                         tipsString:@"暂无数据"
                                                        buttonTitle:nil];
                           }
                           
                       } failureCallBack:^(id error) {
                           
                       }];
                       
                   }
                   
               }];
}

/**
 修改商品信息

 @param goodModel           商品模型
 */
- (void)editGoodInformationWithGoodModel:(YBGoodModel *)goodModel
{
    YBComposeHomePageViewController *composeHomePageViewController = [YBComposeHomePageViewController composeHomePageViewControllerGoodsId:goodModel.customId extend:nil];
    composeHomePageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    ZJBaseNavigationController *navigationController = [[ZJBaseNavigationController alloc] initWithRootViewController:composeHomePageViewController];
    [self presentViewController:navigationController animated:YES completion:^{}];
}

/**
 分享

 @param goodModel           商品模型
 */
- (void)shareWithGoodModel:(YBGoodModel *)goodModel
{
    [[YXShareSDKManager sharedManager] shareGoodWithImageURLString:goodModel.imgUrl
                                                      andGoodNamed:goodModel.sellerDesc
                                                     andGoodDetail:goodModel.sellerDesc
                                                         andProdId:goodModel.customId
                                                      andProdBidId:@""
                                                 andViewController:self];
}

/**
 下架商品

 @param goodModel           商品模型
 @param currentIndexPath    当前商品所处的位置
 */
- (void)offShelveWithGoodsModel:(YBGoodModel *)goodModel
               currentIndexPath:(NSIndexPath *)currentIndexPath
{
    if ([self.title isEqualToString:@"全部"]) {
        
        /**
         *  修改状态
         */
        [[YBComposeService share] offShelveWithGoodsId:goodModel.customId
                                               success:^(id objc, id requestInfo) {
                                                   [self.myComposedViewModel queryGoodsWithGoodsModel:self.currentEditModel
                                                                                     currentIndexpath:currentIndexPath
                                                                                 successCallBackBlock:^(id model) {
                                                                                     [self.tableView reloadData];
                                                                                 } failureCallBack:^(id error) {
                                                                                     
                                                                                 }];
                                                   
                                               } fail:^(id error, id requestInfo) {
                                                   
                                               }];
        
    }else{
        [self.myComposedViewModel offShelveWithGoodsModel:goodModel successCallBackBlock:^(id model) {
            
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
            if (self.myComposedViewModel.composeListArray.count == 0) {
                [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                          tipsString:@"暂无数据"
                                         buttonTitle:nil];
            }
            
        } failureCallBack:^(id error) {
            
        }];
    }
}

/**
 查看商品详情

 @param goodModel           商品模型
 */
- (void)checkGoodDetailWithGoodsModel:(YBGoodModel *)goodModel
{
    /**
     *  调转详情页
     */
    YBGoodsDeatilImageViewController *detailImageViewController = [YBGoodsDeatilImageViewController creatGoodsDeatilImageViewControllerWithGoodsId:goodModel.customId Extend:nil];
    ZJBaseNavigationController *navigationController = [[ZJBaseNavigationController alloc] initWithRootViewController:detailImageViewController];
    detailImageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:navigationController animated:YES completion:^{
        
    }];
}

/**
 重新上架

 @param goodModel           商品模型
 @param currentIndexPath    当前商品所处的位置
 */
- (void)refreshShelveWithGoodsModel:(YBGoodModel *)goodModel
                   currentIndexPath:(NSIndexPath *)currentIndexPath
{
    if ([self.title isEqualToString:@"全部"]) {
        
        /**
         *  修改状态
         */
        [[YBComposeService share] refreshShelveWithGoodsId:goodModel.customId
                                                   success:^(id objc, id requestInfo) {
                                                       
                                                       [self.myComposedViewModel queryGoodsWithGoodsModel:self.currentEditModel
                                                                                         currentIndexpath:currentIndexPath
                                                                                     successCallBackBlock:^(id model) {
                                                                                         [self.tableView reloadData];
                                                                                     } failureCallBack:^(id error) {
                                                                                         
                                                                                     }];
                                                       
                                                   } fail:^(id error, id requestInfo) {
                                                       
                                                   }];
        
    }else{
        
        [self.myComposedViewModel refreshShelveWithGoodsModel:goodModel successCallBackBlock:^(id model) {
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
            if (self.myComposedViewModel.composeListArray.count == 0) {
                [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                                          tipsString:@"暂无数据"
                                         buttonTitle:nil];
            }
        } failureCallBack:^(id error) {
            
        }];
        
    }
}

/**
 延期/上架

 @param goodModel           商品模型
 */
- (void)refreshGoodTimeWithGoodsModel:(YBGoodModel *)goodModel
{
    [self.myComposedViewModel refreshGoodTimeWithGoodsModel:goodModel
                                       successCallBackBlock:^(id model) {
                                           [self.myComposedViewModel queryGoodsWithGoodsModel:self.currentEditModel
                                                                             currentIndexpath:self.currentIndexPath
                                                                         successCallBackBlock:^(id model) {
                                                                             [self.tableView reloadData];
                                                                         } failureCallBack:^(id error) {
                                                                             
                                                                         }];
                                       } failureCallBack:^(id error) {
                                           
                                       }];
}

/**
 展示预览界面

 @param goodModel           商品模型
 */
- (void)showPreviewWebViewControllerWithGoodModel:(YBGoodModel *)goodModel
{
    YBGoodsDeatilImageViewController *detailImageViewController = [YBGoodsDeatilImageViewController creatGoodsDeatilImageViewControllerWithGoodsId:goodModel.customId Extend:@{@"isPreview":@"YES"}];
    ZJBaseNavigationController *navigationController = [[ZJBaseNavigationController alloc] initWithRootViewController:detailImageViewController];
    detailImageViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:navigationController animated:YES completion:^{
        
    }];
}

#pragma mark <UITableViewDataSource>

/**
 返回组
 
 @param tableView tableView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/**
 返回行
 
 @param tableView tableView
 @param section   section
 
 @return 每组的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myComposedViewModel.composeListArray.count;
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBMyComposedListCell *cell = [tableView dequeueReusableCellWithIdentifier:YBMyComposedListCellReuseIdentifier forIndexPath:indexPath];
    cell.goodModel = self.myComposedViewModel.composeListArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myMaskView.frame                                          = CGRectMake(0, self.tableView.contentInset.top, self.view.width, self.view.height);
    self.tableView.backgroundColor                                 = ZJCOLOR.color_c12;
    self.tableView.separatorStyle                                  = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight                                       = ADJUST_PERCENT_FLOAT(183.f);
    self.tableView.mj_header                                       = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_header.automaticallyChangeAlpha              = YES;
    
    self.tableView.mj_footer                                       = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    MJRefreshAutoFooter *autoFooter                                = (MJRefreshAutoFooter *)self.tableView.mj_footer;
    autoFooter.triggerAutomaticallyRefreshPercent                  = -100;
    self.tableView.mj_footer.automaticallyChangeAlpha              = YES;
    
    [self registerSubViews];
    
    _myComposedViewModel = [[YBMyComposedViewModel alloc] init];
    [self.tableView.mj_header beginRefreshing];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:PAY_RESULT_SUCCESS_NOTIFICATION object:nil];
}

#pragma mark - Sixth.界面配置

- (void)registerSubViews
{
    [self.tableView registerClass:[YBMyComposedListCell class] forCellReuseIdentifier:YBMyComposedListCellReuseIdentifier];
}

#pragma mark - Seventh.懒加载

@end
