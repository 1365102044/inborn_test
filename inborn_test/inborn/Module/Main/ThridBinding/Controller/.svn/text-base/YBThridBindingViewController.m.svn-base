//
//  YBThridBindingViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBThridBindingViewController.h"
#import "ZJMineService.h"
#import "YBThirdBindAndsurityTableViewCell.h"
#import "YBWeiChat.h"
#import "YBTencent.h"
#import "ZJLoginAndRegisterService.h"
#import "User_LocalData.h"
#import "YBRegisterPhoneViewController.h"
#import "YBThirdBindModel.h"
#import "YBRegisterMessageCodeViewController.h"
#import "YBChangeLoginPwViewController.h"
#import "YXMyWalletSetPassWordViewController.h"
#import "YXMyWalletPassWordViewController.h"

@interface YBThridBindingViewController ()<UITableViewDelegate,UITableViewDataSource,YBTencentLoginDelegate,YBWeChatManagerDelegate>
@property(nonatomic,strong) UITableView * tableview;

//@property(nonatomic,strong) NSMutableArray * dataArr;

@property(nonatomic,assign) viewControllerType VcType;

@property(nonatomic,strong) NSArray * titleArr;
@property(nonatomic,strong) NSMutableArray * descArr;
@property(nonatomic,strong) YBThirdBindModel * thridModel;

@property(nonatomic,strong) NSString * isShowWallt;

@end

@implementation YBThridBindingViewController

/**
 初始化
 */
+ (instancetype)creatThridBindingViewControllerWitVCtype:(viewControllerType)vctype Extend:(id)Extend
{
    YBThridBindingViewController *vc = [[YBThridBindingViewController alloc]init];
    vc.VcType                        = vctype;
    vc.isShowWallt                   = [Extend[@"isShowWallt"] ex_isEmpty] ? @"" :@"YES";
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_VcType == accountSurityType) {
        self.title = @"账户安全";
        self.titleArr = @[@"修改登录密码",@"修改支付密码"];
    }else if (_VcType == thridBindingType)
    {
        self.title = @"第三方登录";
        self.titleArr = @[@"微信",@"QQ"];
    }
    [self.view addSubview:self.tableview];
    
    [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(nohiddennav) name:@"formemessagevcnothiddennav" object:nil];
}

/**
 从扫码回来 导航栏隐藏问题
 */
- (void)nohiddennav
{
    self.navigationController.navigationBar.hidden = NO;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_VcType == thridBindingType) {
        
        [self QueryBindingThirdAccount];
    }
}

#pragma mark  *** 网络请求
/**
 查询绑定的账户请求
 */
-(void)QueryBindingThirdAccount{
    [self.descArr addObjectsFromArray:@[@"立即绑定",@"立即绑定"]];
    [[ZJMineService share] getThridBindingInfoSuccess:^(id objc, id requestInfo) {
        NSDictionary *dic = objc[@"data"];
        NSString *wxstr;
        if ([dic[@"bindWechat"] integerValue] == 1) {
            wxstr = @"解除绑定";
        }else{
            wxstr = @"立即绑定";
        }
        [self.descArr replaceObjectAtIndex:0 withObject:wxstr];
        
        NSString *qqstr;
        if ([dic[@"bindQQ"]  integerValue] ==1) {
            qqstr = @"解除绑定";
        }else{
            qqstr= @"立即绑定";
        }
        [self.descArr replaceObjectAtIndex:1 withObject:qqstr];
        [self.tableview reloadData];
    } fail:^(id error, id requestInfo) {
        
    }];
    
}

/**
 微信解绑
 */
-(void)UnbundlingWeiChatAccount{
    
    [[ZJMineService share] unBindingWXInfoSuccess:^(id objc, id requestInfo) {
        self.descArr[0] = @"立即绑定";
        [self.tableview reloadData];
    } fail:^(id error, id requestInfo) {
        
    }];
    
}

/**
 QQ解绑
 */
-(void)UnbundlingQQAccount{
    
    [[ZJMineService share] unBindingQQInfoSuccess:^(id objc, id requestInfo) {
        self.descArr[1] = @"立即绑定";
        [self.tableview reloadData];
    } fail:^(id error, id requestInfo) {
        
    }];
}
/**
 绑定微信
 */
- (void)bundingWeiChatAccount{
    [YBWeiChat share].delegate = self;
    [[YBWeiChat share] weiChatLogin];
}

/**
 绑定QQ
 */
- (void)bundingQQAccount{
    [YBTencent share].YBTenceLoginDelegate = self;
    [[YBTencent share] TencentLogin];
}

#pragma mark  *** 微信登录的代理
/**
 微信回调处理
 */
- (void)managerDidRecvAuthResponse:(SendAuthResp *)response {
    
    if (response.errCode== -4) return;
    else if (response.errCode == -2) return;
    [[ZJLoginAndRegisterService share] weChatLoginWithCode:response.code
                                                  prodBids:[[[User_LocalData alloc] init]
                                                            getBrowseRecordGoodsId]
                                                   success:^(id objc, id requestInfo) {
                                                       //                                                       @try {
                                                       //                                                           self.openid = objc[@"data"][@"openid"];
                                                       //                                                           if (self.openid) {
                                                       //                                                               [self thirdGotoCheckPhone:thridWXLoginType];
                                                       //                                                           }else{
                                                       //                                                               [self loginSuccessHandle:objc requestInfo:requestInfo];
                                                       //                                                           }
                                                       //                                                       } @catch (NSException *exception) {
                                                       //
                                                       //                                                       } @finally {
                                                       //                                                   }
                                                       self.thridModel = [YBThirdBindModel modelWithDictionary:objc[@"data"]];
                                                       [self thirdGotoCheckPhone:thridWXBindType];
                                                   } fail:^(id error, id requestInfo) {
                                                   }];
}
#pragma mark  *** qq登录 代理
/**
 * 登录成功后的回调
 */
- (void)tencentDidLogin
{
    [[ZJLoginAndRegisterService share] qqLoginWithOpenid:[[YBTencent share] getOpenId]
                                                   token:[[YBTencent share] getToken]
                                                prodBids:[[[User_LocalData alloc] init]
                                                          getBrowseRecordGoodsId]
                                                 display:nil
                                                 success:^(id objc, id requestInfo) {
                                                     //                                                     @try {
                                                     //                                                         self.openid = objc[@"data"][@"openid"];
                                                     //                                                         if (self.openid) {
                                                     //                                                             [self thirdGotoCheckPhone:thridQQLoginType];
                                                     //                                                         }else{
                                                     //                                                             [self loginSuccessHandle:objc requestInfo:requestInfo];
                                                     //                                                         }
                                                     //
                                                     //                                                     } @catch (NSException *exception) {
                                                     //
                                                     //                                                     } @finally {
                                                     //                                                     }
                                                     //
                                                     self.thridModel = [YBThirdBindModel modelWithDictionary:objc[@"data"]];
                                                     [self thirdGotoCheckPhone:thridQQBindType];
                                                 } fail:^(id error, id requestInfo) {
                                                     
                                                 }];
    
}

/**
 * \param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled
{
    
}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork
{
}


/**
 绑定 在未绑定手机号的情况下->校验手机号（包括已注册，未注册过的）
 */
- (void)thirdGotoCheckPhone:(sourceVcType)thridbindtype
{
    if (self.thridModel.flag==1) {
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        if (self.thridModel.openid) param[@"openid"] = self.thridModel.openid;
        YBRegisterMessageCodeViewController *messagecodevc = [YBRegisterMessageCodeViewController creatRegisterMessageCodeViewControllerWithPhone:self.thridModel.phone SourceVcType:thridbindtype Extend:param];
        [self.navigationController pushViewController:messagecodevc animated:YES];
        
    }else{
        
//        NSMutableDictionary *param = [NSMutableDictionary dictionary];
//        if (self.thridModel.openid) param[@"openid"] = self.thridModel.openid;
//        [self.navigationController pushViewController:[YBRegisterPhoneViewController creatRegisterPhoneViewControllerWithSourceType:thridbindtype
//                                                                                                                             Extend:param]
//                                             animated:YES];
//
        [self QueryBindingThirdAccount];
    }
}

#pragma mark  *** tableview-delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.title isEqualToString:@"账户安全"]) {
        if ([self.isShowWallt isEqualToString:@"YES"]) {
            return 2;
        }
        return 1;
    }else{
        return self.titleArr.count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YBThirdBindAndsurityTableViewCell *cell = [[YBThirdBindAndsurityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    NSString *vctype ;
    if (_VcType == thridBindingType)
    {
        vctype = @"third";
        [cell settitle:self.titleArr[indexPath.row] desc:self.descArr[indexPath.row] vctype:vctype];
    
    }
    else if (_VcType == accountSurityType) {
        vctype = @"account";
        [cell settitle:self.titleArr[indexPath.row] desc:nil vctype:vctype];
    }
    if ([self.title isEqualToString:@"账户安全"] &&
        ![self.isShowWallt isEqualToString:@"YES"]) {
        cell.lineview.hidden = YES;
    }else{
        if (indexPath.row == 1) {
            cell.lineview.hidden = YES;
        }else{
           cell.lineview.hidden = NO;
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_VcType == thridBindingType){
        
        if ([self.descArr[indexPath.row] isEqualToString:@"立即绑定"]) {
            if (indexPath.row==0) {
                [self bundingWeiChatAccount];
            }else if (indexPath.row== 1)
            {
                [self bundingQQAccount];
            }
            
        }else if([self.descArr[indexPath.row]  isEqualToString:@"解除绑定"]){
            
            //创建AlertController对象 preferredStyle可以设置是AlertView样式或者ActionSheet样式
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"确定解除绑定？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            //创建取消按钮
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消"
                                                              style:UIAlertActionStyleCancel
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                
                                                            }];
            
            UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"确定解除"
                                                              style:UIAlertActionStyleDestructive
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                
                                                                if (indexPath.row == 0) {
                                                                    [self UnbundlingWeiChatAccount];
                                                                }else if (indexPath.row== 1){
                                                                    [self UnbundlingQQAccount];
                                                                }
                                                            }];
            //添加按钮
            [alertC addAction:action1];
            [alertC addAction:action3];
            //显示
            [self presentViewController:alertC animated:YES completion:nil];
        }
        
    }else if (_VcType == accountSurityType){
        if (indexPath.row==0) {
            /**
             修改登录密码
             */
            [self.navigationController pushViewController:[YBChangeLoginPwViewController creatChangeLoginPwOrPayPwWithCurrentVcType:changeLoginPW
                                                                                                                            extend:nil]
                                                 animated:YES];
        }else if (indexPath.row ==1)
        {
        /**
         修改支付密码
         */
            YXMyWalletPassWordViewController *passwordvc = [[YXMyWalletPassWordViewController alloc]init];
            passwordvc.CurrenPassWordType = ModifyPayPasswordType;
            [self.navigationController pushViewController:passwordvc animated:YES];
        }
    }
}


/**
 懒加载
 */
-(UITableView *)tableview{
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = ADJUST_PERCENT_FLOAT(50);
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}

- (NSArray *)titleArr {
    if (!_titleArr) {
        _titleArr = [[NSArray alloc]init];
    }
    return _titleArr;
}
- (NSMutableArray *)descArr {
    if (!_descArr) {
        _descArr = [NSMutableArray array];
    }
    return _descArr;
}
@end
