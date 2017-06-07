//
//  YBMeMainViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMeMainViewController.h"
#import "YBMeMainSeactionOneView.h"
#import "YBMeMainCellView.h"
#import "YBMeMainHeaderView.h"
#import "YBLoginViewController.h"
#import "ZJMineService.h"
#import "User_LocalData.h"
#import "YBMeMainDataModel.h"
#import "YBAddressAndPickListViewController.h"
#import "YBThridBindingViewController.h"
#import "YBMyInforViewController.h"
#import "YBLikeAndRecordListViewController.h"
#import "YBSettingViewController.h"
#import "YBCertificationHomePageViewController.h"
#import "YBOrderListViewController.h"
#import "YBHelpCenterViewController.h"
#import "YBLogisticsViewController.h"
#import "YBApplyRefundViewController.h"
#import "YBStringTool.h"
#import "YBPublicConfigure_LocalData.h"
#import "YBRefundDeatilViewController.h"
#import "MQCustomerServiceManager.h"
#import "User_LocalData.h"
#import "YXWebPagePayViewController.h"
#import "JXTAlertManagerHeader.h"
#import "YBMeMianBlankViewController.h"
#import "YBCertificationResultViewController.h"
#import "YXMyWalletMainViewController.h"
#import "YXMyWalletAgreementViewController.h"
#import "YBMyComposedListViewController.h"
#import "ZJBaseNavigationController.h"
#import "YXPerfectAccountInformationViewController.h"
#import "YBCertificationInputInformationViewController.h"

static CGFloat ODERVIEWHEIGHT = 125;
static CGFloat SEATIONTWOCELLHEIGHT = 46;
@interface YBMeMainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) YBMeMainHeaderView * headerView;
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) YBMeMainSeactionOneView * seactionOrderView;
@property(nonatomic,strong) NSArray * seationCellTitleArr;
@property(nonatomic,assign) BOOL  isShowWalt;
@property(nonatomic,strong) YBMeMainDataModel * dataModle;
/**
 是否需要改变tabbarindex(反馈中 rightitem)
 */
@property(nonatomic,assign) BOOL  isneedChageTabbarindex;
@property(nonatomic,assign) NSInteger  needpushtabbarindex;
/**
 导航栏
 */
@property(nonatomic,strong) UIView * NavView;
@property(nonatomic,strong) YBDefaultLabel * NavTitle;
@property(nonatomic,strong) UIButton * NavSetBtn;
@end

@implementation YBMeMainViewController

#pragma mark - First.通知
/**
 直接跳到订单列表
 */
- (void)directPushToOrderListViewControllerextend:(id)extend
{
    if ([extend isEqualToString:@"thirdbindvc"]) {
        
        /**
         第三方绑定
         */
        YBThridBindingViewController *thridvc = [YBThridBindingViewController creatThridBindingViewControllerWitVCtype:thridBindingType Extend:nil];
        [self.navigationController pushViewController:thridvc animated:NO];
        return;
    }else if ([extend isEqualToString:@"apprasialOrder"]){
    
        [self.navigationController pushViewController:[YBOrderListViewController creatOrderListViewControllerWithCutrtentIndex:0
                                                                                                               OrderListVcType:AppraisalOrderType
                                                                                                                        Extend:nil]
                                             animated:YES];
        return;

    }
    
    [self clickSeactionOrderViewSelectionWithtag:5];
}

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
/**
 点击header view上的事件
 btn.tag:
 10     喜欢
 11     足迹
 12     设置
 13     个人信息
 */
- (void)clickHeaderViewSubViewBtnWithtag:(NSInteger)btntag
{
    if (btntag == 12) {
        YBSettingViewController *settingvc = [[YBSettingViewController alloc]init];
        [self.navigationController pushViewController:settingvc animated:YES];
        
    }else if (btntag ==11) {
        YBLikeAndRecordListViewController *vc = [YBLikeAndRecordListViewController creatLikeAndRecordListViewControllerWith:RecordVcType extend:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (btntag ==10) {
        YBLikeAndRecordListViewController *vc = [YBLikeAndRecordListViewController creatLikeAndRecordListViewControllerWith:liekVcType extend:nil];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btntag == 13){
        YBMyInforViewController *inforvc = [YBMyInforViewController creatMyInforViewControllExtend:nil];
        [self.navigationController pushViewController:inforvc animated:YES];
    }
}
- (void)clickNavSetBtn
{
    [self clickHeaderViewSubViewBtnWithtag:12];
}
/**
 点击我购买的视图上的按钮
 tag:
 1          待付款
 2          代发货
 3          待收货
 4          待确认
 5          全部订单
 */
- (void)clickSeactionOrderViewSelectionWithtag:(NSInteger )tag
{
    NSInteger toindex = 0;
    if (tag >=1 && tag < 5) toindex = tag;
    if (tag == 5) toindex = 0;
    [self.navigationController pushViewController:[YBOrderListViewController creatOrderListViewControllerWithCutrtentIndex:toindex
                                                                                                           OrderListVcType:MyBuyOrderType
                                                                                                                    Extend:nil]
                                         animated:YES];
}

#pragma mark  *** 网路请求
- (void)loadMeMainData
{
    if (![User_LocalData getTokenId]
        || [[User_LocalData getTokenId] ex_isEmpty]) {
        return;
    }
    
    [[ZJMineService share] getMineAccountInfoSuccess:^(id objc, id requestInfo) {
        
        self.dataModle = [YBMeMainDataModel modelWithDictionary:objc[@"data"]];
        self.isShowWalt = self.dataModle.isShowMoney== 0 ? NO :YES;
        self.headerView.dataModel = self.dataModle;
        self.NavTitle.text = self.dataModle.nickname;
        [self.tableView reloadData];
        [self loadinfro];
    } fail:^(id error, id requestInfo) {
        YBLog(@"--error-%@--",error);
    }];
}

/**
 更新个人信息
 */
- (void)loadinfro
{
    if ([User_LocalData getTokenId]) {
        [[ZJMineService share] getPersonInfoSuccess:^(id objc, id requestInfo) {
            [User_LocalData setUserDataWith:objc[@"data"]];
        } fail:^(id error, id requestInfo) {
            YBLog(@"%@", error);
        }];
    }
}

#pragma mark - Fourth.代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) return 1;
    else if (section==1) return self.isShowWalt ? 1 : 0;
    else if (section>1) return  [self.seationCellTitleArr[section-2] count];
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1) return self.isShowWalt ? 10 : 0.0001;
    else return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) return ODERVIEWHEIGHT;
    else  return SEATIONTWOCELLHEIGHT;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *seactionheaderview = [[UIView alloc]init];
    seactionheaderview.backgroundColor  = ZJCOLOR.color_c12;
    return seactionheaderview;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str;
    if (indexPath.section<2) {
        str = @"cell";
    }else{
        str = [NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    WEAKSELF(self);
    if (indexPath.section == 0) {
        self.seactionOrderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, ODERVIEWHEIGHT);
        self.seactionOrderView.clickItemBlock = ^(NSInteger tag){
            [weakself clickSeactionOrderViewSelectionWithtag:tag];
        };
        self.seactionOrderView.dataModel = self.dataModle;
        [cell.contentView addSubview:self.seactionOrderView];
        
    }else if (indexPath.section==1){
        if(!self.isShowWalt) return cell;
        YBMeMainCellView *tableCell = [[YBMeMainCellView alloc]init];
        tableCell.frame = CGRectMake(0, 0, SCREEN_WIDTH, SEATIONTWOCELLHEIGHT);
        tableCell.backgroundColor = [UIColor whiteColor];
        tableCell.CellTitleKey = MINE_HOMEPAGE_USER_WALLET_STRINGKEY;
        [tableCell SetBaseMyAccountInforWithIndexPath:indexPath titleArr:nil dataModel:self.dataModle];
        tableCell.lineview.hidden = YES;
        [cell.contentView addSubview:tableCell];
    }else{
        YBMeMainCellView *tableCell = [[YBMeMainCellView alloc]init];
        tableCell.frame = CGRectMake(0, 0, SCREEN_WIDTH, SEATIONTWOCELLHEIGHT);
        tableCell.backgroundColor = [UIColor whiteColor];
        tableCell.CellTitleKey = self.seationCellTitleArr[indexPath.section-2][indexPath.row];
        [tableCell SetBaseMyAccountInforWithIndexPath:indexPath titleArr:nil dataModel:self.dataModle];
        [cell.contentView addSubview:tableCell];
        
        if ((indexPath.section == 2 && indexPath.row == 3) ||
            (indexPath.section == 3 && indexPath.row == 4) ||
            (indexPath.section == 4 && indexPath.row == 1)) {
            tableCell.lineview.hidden = YES;
        }else{
            tableCell.lineview.hidden = NO;
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    YBLog(@"个人中心--点击--section:%ld+row:%ld",(long)indexPath.section,(long)indexPath.row);
    
    if (indexPath.section == 1
        && indexPath.row == 0) {
        
        /**
         *  点击了钱包
         */
        if (self.dataModle.openingStatus == 1) {
            YXMyWalletMainViewController *walletHomePage = [YXMyWalletMainViewController new];
            [self.navigationController pushViewController:walletHomePage animated:YES];
        }else{
            
            [self.navigationController pushViewController:[YXMyWalletAgreementViewController creatMyWalletAgreementViewControllerWihtIsShowBoomView:YES
                                                                                                                                             extend:nil]
                                                 animated:YES];
        }
        return;
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            /**
             *  我发布的
             */
            YBMyComposedListViewController *myComposedListViewController = [[YBMyComposedListViewController alloc] init];
            [self.navigationController pushViewController:myComposedListViewController animated:YES];
            return;
            
        }else if (indexPath.row == 1) {
            
            [self.navigationController pushViewController:[YBOrderListViewController creatOrderListViewControllerWithCutrtentIndex:0
                                                                                                                   OrderListVcType:AppraisalOrderType
                                                                                                                            Extend:nil]
                                                 animated:YES];
            return;
        }else if (indexPath.row == 2){
            [self.navigationController pushViewController:[YBOrderListViewController creatOrderListViewControllerWithCutrtentIndex:0
                                                                                                                   OrderListVcType:MySellOutOrderType
                                                                                                                            Extend:nil]
                                                 animated:YES];
            return;
        }else if (indexPath.row == 3){
            [self.navigationController pushViewController:[YBOrderListViewController creatOrderListViewControllerWithCutrtentIndex:0
                                                                                                                   OrderListVcType:MyGoodsOrderType
                                                                                                                            Extend:nil]
                                                 animated:YES];
            return;
        }
        /**
         跳到 空白页
         */
        YBMeMianBlankViewController *blankvc = [YBMeMianBlankViewController creatMeMainBlankVCwith:self.seationCellTitleArr[indexPath.section-2][indexPath.row]
                                                                                            extend:nil];
        
        [self.navigationController pushViewController:blankvc
                                             animated:YES];
        
    }
    
    if (indexPath.section ==3) {
        if (indexPath.row==0) {
            /**
             账户安全
             */
            NSString *ishowstr = @"";
            if (self.isShowWalt && self.dataModle.openingStatus == 1) {
                ishowstr = @"YES";
            }
            YBThridBindingViewController *surityvc = [YBThridBindingViewController creatThridBindingViewControllerWitVCtype:accountSurityType Extend:@{@"isShowWallt": ishowstr}];
            [self.navigationController pushViewController:surityvc animated:YES];
        }else if (indexPath.row==1)
        {
            /**
             第三方绑定
             */
            YBThridBindingViewController *thridvc = [YBThridBindingViewController creatThridBindingViewControllerWitVCtype:thridBindingType Extend:nil];
            [self.navigationController pushViewController:thridvc animated:YES];
        }
        if (indexPath.row==3) {
            YBAddressAndPickListViewController * addressVC = [YBAddressAndPickListViewController creatAddressAndPickPersonViewControllerWithType:addressType Extend:nil];
            [self.navigationController pushViewController:addressVC animated:YES];
        }else if (indexPath.row ==4) {
            YBAddressAndPickListViewController * pickVC = [YBAddressAndPickListViewController creatAddressAndPickPersonViewControllerWithType:pickPersonType Extend:nil];
            [self.navigationController pushViewController:pickVC animated:YES];
        }
        
        /**
         *  账号认证
         */
        if (indexPath.row == 2) {
            
            /**
             *  判断是否认证过
             */
            User_LocalData *userLocalData = [[User_LocalData alloc] init];
            if ([[NSString stringWithFormat:@"%@",userLocalData.idcardStatus] isEqualToString:@"0"]) {
                YBCertificationInputInformationViewController *certificationInputInformationViewController = [YBCertificationInputInformationViewController new];
                [self.navigationController pushViewController:certificationInputInformationViewController animated:YES];
            }else{
                YBCertificationResultViewController *certificationResult = [[YBCertificationResultViewController alloc] init];
                [self.navigationController pushViewController:certificationResult animated:YES];
            }
        }
    }
    
    
    if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            
            YBHelpCenterViewController *helpCenterViewController = [[YBHelpCenterViewController alloc] init];
            [self.navigationController pushViewController:helpCenterViewController animated:YES];
            
        }else if (indexPath.row == 1)
        {
            [self KefuAlearview];
        }
    }
}

-(void)KefuAlearview
{
    [self jxt_showActionSheetWithTitle:ZJSTRING(@"联系客服") message:nil
                     appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                         
                         alertMaker.
                         addActionDefaultTitle(ZJSTRING(@"在线客服")).
                         addActionDefaultTitle(ZJSTRING(@"电话客服")).
                         addActionCancelTitle(ZJSTRING(@"取消"));
                         
                         alertMaker.view.tintColor = ZJCOLOR.color_c4;
                         
                     } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                         
                         if (buttonIndex == 0) {
                             [[MQCustomerServiceManager share] showCustomerServiceWithViewController:self];
                         }
                         
                         if (buttonIndex == 1) {
                             [YBStringTool CallPhoneWith:self.view phone:[[YBPublicConfigure_LocalData new] customerPhone]];
                         }
                     }];
}

#pragma mark - Fifth.控制器生命周期
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([SYSTEM_USERDEFAULTS objectForKey:@"formeTabbar"]) {
        self.navigationController.navigationBar.hidden = YES;
    }else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    self.tabBarController.tabBar.hidden = NO;
    
    if (![User_LocalData getTokenId]||[User_LocalData getTokenId].length == 0) {
        loginTypeEnum type = generalLoginType;
        if ([[User_LocalData getUserData] isHaveRealphone]) {
            type = haveAcountLoginType;
        }
        YBLoginViewController *loginvc = [YBLoginViewController creatLoginViewControllerWithType:type extend:nil];
        ZJBaseNavigationController *nav = [[ZJBaseNavigationController alloc]initWithRootViewController:loginvc];
        [self presentViewController:nav animated:YES completion:nil];
        return;
    }
    
    [self loadMeMainData];

    
    /**
     反馈中 跳转tabbarindex
     */
    if (self.isneedChageTabbarindex) {
        self.tabBarController.selectedIndex = self.needpushtabbarindex;
        self.isneedChageTabbarindex = NO;
    }
    
    self.tabBarController.tabBar.ex_y                   = SCREEN_HEIGHT - self.tabBarController.tabBar.height;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
     if ([SYSTEM_USERDEFAULTS objectForKey:@"formeTabbar"]) {
         self.navigationController.navigationBar.hidden = NO;
     }else{
         [self.navigationController setNavigationBarHidden:NO animated:YES];
     }
    [SYSTEM_USERDEFAULTS removeObjectForKey:@"formeTabbar"];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.seationCellTitleArr  = @[@[MINE_HOMEPAGE_USER_COMPOSE_STRINGKEY,
                                    MINE_HOMEPAGE_USER_IDENTIFICATION_STRINGKEY,
                                    MINE_HOMEPAGE_USER_SELL_STRINGKEY,
                                    MINE_HOMEPAGE_USER_ITEMS_STRINGKEY],
                                  @[MINE_HOMEPAGE_ACCOUNT_SAFE_STRINGKEY,
                                    MINE_HOMEPAGE_ACCOUNT_THIRDLOGIN_STRINGKEY,
                                    MINE_HOMEPAGE_ACCOUNT_REALNAME_STRINGKEY,
                                    MINE_HOMEPAGE_ACCOUNT_ADDRESS_STRINGKEY,
                                    MINE_HOMEPAGE_ACCOUNT_PICKUP_STRINGKEY],
                                  @[MINE_HOMEPAGE_ACCOUNT_HELPCENTER_STRINGKEY,
                                    MINE_HOMEPAGE_ACCOUNT_CUSTOMERSERVICE_STRINGKEY]];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headerView;
    self.tabBarController.tabBar.hidden = NO;
    
    /**
     反馈中
     */
    [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(changetababrindex:) name:@"formefeedbookchangetabbarindex" object:nil];
    
    [self.view addSubview:self.NavView];
    [self.NavView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(64));
    }];
}

- (void)changetababrindex:(NSNotification *)noti
{
    if ([noti.userInfo[@"ischangetabbar"] isEqualToString:@"YES"]) {
        self.isneedChageTabbarindex = YES;
    }
    self.needpushtabbarindex = [noti.userInfo[@"tabbarindex"] integerValue];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollerY = scrollView.contentOffset.y;
 

    if (scrollerY < ADJUST_PERCENT_FLOAT(300)) {
        _tableView.backgroundColor = [UIColor whiteColor];
    }else{
        _tableView.backgroundColor = ZJCOLOR.color_c12;
    }
    
    CGFloat tempAlpha ;
    if (scrollerY >= 110) {
        tempAlpha = scrollerY / 150 ;
    }else{
        tempAlpha = 0;
    }
    self.NavView.alpha = tempAlpha;
}
#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorColor = ZJCOLOR.color_c16;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.bounces = NO;
    }
    return _tableView;
}

- (YBMeMainSeactionOneView *)seactionOrderView {
    if (!_seactionOrderView) {
        _seactionOrderView = [[YBMeMainSeactionOneView alloc]init];
    }
    return _seactionOrderView;
}

- (YBMeMainHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[YBMeMainHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(290))];
        WEAKSELF(self);
        _headerView.clickBtnBlock = ^(NSInteger btntag){
            [weakself clickHeaderViewSubViewBtnWithtag:btntag];
        };
    }
    return _headerView;
}

- (UIView *)NavView {
    if (!_NavView) {
        _NavView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        _NavView.backgroundColor = ZJCOLOR.color_c0;
        
        _NavView.alpha = 0;
        [_NavView addSubview:self.NavTitle];
        [_NavView addSubview:self.NavSetBtn];
        
        [self.NavTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_NavView.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(30));
            make.right.mas_equalTo(_NavView.mas_right).mas_offset(-ADJUST_PERCENT_FLOAT(30));
            make.height.mas_offset(22);
            make.bottom.mas_equalTo(_NavView.mas_bottom).mas_offset(-11);
        }];
        [self.NavSetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_NavView.mas_right).mas_offset(- 18);
            make.size.mas_offset(CGSizeMake(22, 22));
            make.bottom.mas_equalTo(_NavView.mas_bottom).mas_offset(-11);
        }];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = ZJCOLOR.color_c16;
        [_NavView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(_NavView);
            make.height.mas_offset(0.5);
            make.bottom.mas_equalTo(_NavView.mas_bottom).mas_offset(-0.5);
        }];
        
    }
    return _NavView;
}

- (YBDefaultLabel *)NavTitle {
    if (!_NavTitle) {
        _NavTitle = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(18)
                                             text:@""
                                        textColor:ZJCOLOR.color_c2];
        _NavTitle.textAlignment = NSTextAlignmentCenter;
    }
    return _NavTitle;
}

- (UIButton *)NavSetBtn {
    if (!_NavSetBtn) {
        _NavSetBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                              titleColor:ZJCOLOR.color_c4
                                                               titleFont:SYSTEM_LIGHTFONT(10)
                                                           imageFilePath:IMAGEFILEPATH_MINE
                                                              imageNamed:@"mine_setting"
                                                                    type:ZJProjectButtonSetImage
                                                                  target:self
                                                                selector:@selector(clickNavSetBtn)];
    }
    return _NavSetBtn;
}
@end
