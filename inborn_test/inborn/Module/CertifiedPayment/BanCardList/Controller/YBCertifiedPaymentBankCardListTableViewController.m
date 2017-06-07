//
//  YBCertifiedPaymentBankCardListTableViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertifiedPaymentBankCardListTableViewController.h"
#import "YBBankCardTableViewCell.h"
#import "YBPaymentService.h"
#import "YBBankCardModel.h"
#import "JXTAlertManagerHeader.h"
#import "YBCertifiedPaymentBankCardListViewModel.h"
#import "YBTopAlert.h"
#import "YBCertifiedPaymentChangePhoneNumberController.h"
#import "YBCertifiedPaymentBankCardResultController.h"

@interface YBCertifiedPaymentBankCardListTableViewController ()

/**
 bankCardArray
 */
@property (nonatomic, strong) NSArray<YBBankCardModel *> *bankCardArray;

/**
 viewModel
 */
@property (nonatomic, strong) YBCertifiedPaymentBankCardListViewModel *certifiedPaymentBankCardListViewModel;

@end

@implementation YBCertifiedPaymentBankCardListTableViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setBankCardArray:(NSArray<YBBankCardModel *> *)bankCardArray
{
    _bankCardArray = bankCardArray;
    
    /**
     *  刷新界面
     */
    [self.tableView reloadData];
}

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

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
    return self.bankCardArray.count;
}

/**
 自定义cell
 
 @param tableView tableView
 @param indexPath indexPath
 
 @return 自定义cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBBankCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YBBankCardTableViewCellReusableIdentifier
                                                                    forIndexPath:indexPath];
    cell.bankCardModel = self.bankCardArray[indexPath.row];
    return cell;
}

/**
 点击事件
 
 @param tableView tableView
 @param indexPath indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YBBankCardModel *bankCardModel = self.self.bankCardArray[indexPath.row];
    
    WEAKSELF(self);
    [self jxt_showActionSheetWithTitle:nil
                               message:nil
                     appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                         
                         alertMaker.
                         addActionCancelTitle(ZJSTRING(@"取消")).
                         addActionDestructiveTitle(@"删除").
                         addActionDefaultTitle(@"更换手机号");
                         
                         alertMaker.view.tintColor = ZJCOLOR.color_c4;
                         
                     } actionsBlock:^(NSInteger buttonIndex,
                                      UIAlertAction * _Nonnull action,
                                      JXTAlertController * _Nonnull alertSelf) {
                         
                         YBLog(@"%zd", buttonIndex);
                         if (buttonIndex == 1) {
                             
                             /**
                              *  删除
                              */
                             [self.certifiedPaymentBankCardListViewModel delBankCardWithBankCardId:bankCardModel.customId success:^(id model) {
                                 
                                 YBCertifiedPaymentBankCardResultController *resultController = [[YBCertifiedPaymentBankCardResultController alloc] init];
                                 resultController.type = YBCertifiedPaymentBankCardResultControllerSuccess;
                                 [self.navigationController pushViewController:resultController animated:YES];
                                 
                                 NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.bankCardArray];
                                 [tempArray removeObject:bankCardModel];
                                 self.bankCardArray = tempArray.copy;
                                 [self.tableView reloadData];
                                 
                             } faileBlock:^(id error) {
                                 
                                 YBCertifiedPaymentBankCardResultController *resultController = [[YBCertifiedPaymentBankCardResultController alloc] init];
                                 resultController.type = YBCertifiedPaymentBankCardResultControllerFailed;
                                 [self.navigationController pushViewController:resultController animated:YES];
                                 
                             }];
                         }
                         
                         if (buttonIndex == 2) {
                             
                             /**
                              *  更换手机号
                              */
                             YBCertifiedPaymentChangePhoneNumberController *certifiedPaymentChangePhoneNumberController = [[YBCertifiedPaymentChangePhoneNumberController alloc] init];
                             certifiedPaymentChangePhoneNumberController.bankCardModel = bankCardModel;
                             [weakself.navigationController pushViewController:certifiedPaymentChangePhoneNumberController animated:YES];
                         }
                     }];
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = ADJUST_PERCENT_FLOAT(86.f);
    self.tableView.backgroundColor = ZJCOLOR.color_c12;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationItem.title = @"我的银行卡";
    self.certifiedPaymentBankCardListViewModel = [[YBCertifiedPaymentBankCardListViewModel alloc] init];
    
    [self registerSubViews];
    
    [[YBPaymentService share] certifiedPayBankListSuccess:^(id objc, id requestInfo) {
        
        NSArray *tempArray = objc[@"data"];
        
        if (tempArray
            && tempArray.count != 0) {
            
            NSMutableArray *tempBankCarModelArray = [NSMutableArray array];
            [tempArray enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
                [tempBankCarModelArray addObject:[YBBankCardModel modelWithDictionary:obj]];
            }];
            self.bankCardArray = tempBankCarModelArray.copy;
            
        }else{
            
            /**
             *  展示空页面
             */
            
        }
        
    } fail:^(id error, id requestInfo) {
        
        /**
         *  展示空页面
         */
    }];
}

#pragma mark - Sixth.界面配置

- (void)registerSubViews
{
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YBBankCardTableViewCell class])
                                               bundle:nil]
         forCellReuseIdentifier:YBBankCardTableViewCellReusableIdentifier];
}

#pragma mark - Seventh.懒加载

@end
