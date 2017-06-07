//
//  YXMyWalletPassWordViewController.m
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/21.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXMyWalletPassWordViewController.h"
#import "YXResetPassWordViewController.h"
#import "YXMyWalletRequestTool.h"
#import "YXWalletResultController.h"
#import "YBTopAlert.h"

@interface YXMyWalletPassWordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableview;

@property(nonatomic,assign) NSInteger  SeactionNumber;
@property(nonatomic,assign) NSInteger  RowNumber;

@property(nonatomic,strong) NSArray * SetArr;

@property(nonatomic,strong) UITextField * NewTextfield;
@property(nonatomic,strong) UITextField * ConfirmTextfield;
@property(nonatomic,strong) UITextField * OldTextfield;
@property(nonatomic,strong) UITextField * SMSTextfield;
@property(nonatomic,strong) UIButton * SmsBtn;
@property(nonatomic,assign) NSInteger  cutNumber;


@end

@implementation YXMyWalletPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户安全";
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    if (self.CurrenPassWordType == SetPayPasswordType) {
        self.SeactionNumber = 1;
        self.RowNumber = 2;
        self.SetArr = @[@[@"新密码",@"确认密码"],@[@"请输入密码",@"请输入密码"]];
    }else if (self.CurrenPassWordType == ModifyPayPasswordType){
        self.SeactionNumber = 1;
        self.RowNumber = 3;
        self.SetArr = @[@[@"旧密码",@"新密码",@"确认密码"],@[@"请输入密码",@"请输入密码",@"请输入密码"]];
    }else if (self.CurrenPassWordType == ResetPayPasswordType)
    {
        self.SetArr = @[@[@"新密码",@"确认支付密码"],@[@"请输入密码",@"请确认您的密码"]];
        self.SeactionNumber = 2;
    }
    
    [self.view addSubview:self.tableview];
    self.tableview.tableFooterView= [self addpassfooterview];
    
}
/**
 验证 密码参数
 */
-(BOOL)checkPayPassword{
    
    NSString *des = @"支持8～20个字符，至少包括字母，数字和符号中的两种及以上";
    NSString *desc = @"密码不能为空";
    if (self.NewTextfield.text.length==0) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:desc
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        
        return NO;
    }
    //    if (![YXStringFilterTool CheckPaymentPassword:self.NewTextfield.text]) {
    //        [YXAlearMnager ShowAlearViewWith:des Type:2];
    //        return NO;
    //    }
    
    if (![self.NewTextfield.text ex_isPassword]) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:des
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        
        return NO;
    }
    
    if (self.ConfirmTextfield.text.length ==0) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:desc
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        
        return NO;
    }
    //    if (![YXStringFilterTool CheckPaymentPassword:self.ConfirmTextfield.text]) {
    //        [YXAlearMnager ShowAlearViewWith:des Type:2];
    //        return NO;
    //    }
    
    if (![self.ConfirmTextfield.text ex_isPassword]) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:des
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        
        return NO;
    }
    
    if (![self.NewTextfield.text isEqualToString:self.ConfirmTextfield.text]) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:@"两次输入密码不一致！"
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        
        
        
        return NO;
    }
    
    if (self.CurrenPassWordType == ModifyPayPasswordType) {
        if (self.OldTextfield.text.length ==0) {
            
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                    tipsStringKey:desc
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
            
            return NO;
        }
        //        if (![YXStringFilterTool CheckPaymentPassword:self.OldTextfield.text]) {
        //            [YXAlearMnager ShowAlearViewWith:des Type:2];
        //            return NO;
        //        }
        
        if (![self.OldTextfield.text ex_isPassword]) {
            
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                    tipsStringKey:des
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
            
            return NO;
        }
    }
    return YES;
}
/**
 网络请求
 */
-(void)clicknexttoBtn:(UIButton *)sender
{
    
    if (![self checkPayPassword]) {
        return;
    }
    
    [[YXMyWalletRequestTool sharedTool] RequestMyWalletPayPasswordURLWith:[self.OldTextfield.text ex_sha1String] pwdPayNew:[self.NewTextfield.text ex_sha1String] currenVCType:self.CurrenPassWordType token:self.token Success:^(id objc, id respodHeader) {
        
        YBLog(@"==xiugaimima==%@--",objc);
        if ([objc[@"status"] isEqualToString:@"1"]) {
            
            /**
             修改成功
             */
            NSString *vctype ;
            if (self.CurrenPassWordType ==ModifyPayPasswordType) vctype = @"ModifyPayPassword";
            else if (self.CurrenPassWordType == SetPayPasswordType) vctype = @"ResetPayPassword";
            YXWalletResultController *walletResultController = [YXWalletResultController walletResultControllerWithType:YXWalletResultControllerDefault   extend:@{@"titleString":@"修改密码成功!",
                                                                                                                                                                   @"imageNamed":@"blank_success_bg",
                                                                                                                                                                   @"buttonTitle":@"返回",
                                                                                                                                                                   @"sourVcType":vctype}];
            [self.navigationController pushViewController:walletResultController animated:YES];
            
        }else{
            
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                    tipsStringKey:objc[@"errorMsg"]
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
            
        }
    } failure:^(NSError *error) {
    }];
}
/**
 点击 忘记密码btn
 */
-(void)clickfotgetBtn:(UIButton *)sender{
    
    YXResetPassWordViewController *forgetVC = [[YXResetPassWordViewController alloc]init];
    [self.navigationController pushViewController:forgetVC animated:YES];
    
}
-(UIView *)addpassfooterview{
    
    UIView *footerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    
    UIButton *forgetbtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 5, 80, 30)];
    [forgetbtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetbtn addTarget:self action:@selector(clickfotgetBtn:) forControlEvents:UIControlEventTouchUpInside];
    [forgetbtn setTitleColor:[UIColor colorWithHexString:@"0x108ee9"] forState:UIControlStateNormal];
    forgetbtn.titleLabel.font =  SYSTEM_REGULARFONT(13.f);
    [footerview addSubview:forgetbtn];
    forgetbtn .contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    forgetbtn.hidden = YES;
    
    if (self.CurrenPassWordType == ModifyPayPasswordType) {
        forgetbtn.hidden = NO;
    }
    
    UIButton *nextbtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 50, SCREEN_WIDTH-30, 50)];
    [nextbtn addTarget:self action:@selector(clicknexttoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [nextbtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextbtn.backgroundColor = ZJCOLOR.color_c6;
    [nextbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextbtn.titleLabel.font = SYSTEM_REGULARFONT(15.f);
    nextbtn.layer.masksToBounds = YES;
    nextbtn.layer.cornerRadius  =4;
    [footerview addSubview:nextbtn];
    
    return footerview;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.SeactionNumber;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.CurrenPassWordType == ResetPayPasswordType) {
        if (section == 0) return 2;
        return 1;
    }
    return self.RowNumber;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        return 10;
    }
    
    if (self.CurrenPassWordType == ResetPayPasswordType) {
        if (section==1) return  30;
    }
    return 0.00001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UIView *seactionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    
    UILabel *desclable = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30, 30)];
    desclable.text = @"验证码已发送到您的手机，请输入验证码完成验证";
    desclable.textColor = [UIColor colorWithHexString:@"0xaaa7a7"];
    desclable.font = SYSTEM_REGULARFONT(13.f);
    [seactionView addSubview:desclable];
    if (self.CurrenPassWordType == ResetPayPasswordType) {
        if (section==1) return  seactionView;
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.section==0) {
        
        [cell.contentView addSubview:[self CreatCellView:indexPath.row]];
    }else if (indexPath.section==1){
        
        [cell.contentView addSubview:[self  CreatSmsCellView]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

/**
 获取短信验证码
 */
-(void)clickSmsBtn:(UIButton *)sender{
    
    [self addTimer];
}
-(void)addTimer{
    
    self.cutNumber = 60;
    NSTimer *mytimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updatewalletCutNumber:) userInfo:nil repeats:YES];
    [mytimer fire];
}

-(void)updatewalletCutNumber:(NSTimer *)timer{
    
    self.cutNumber --;
    self.SmsBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.SmsBtn setTitle:[NSString stringWithFormat:@"%ld s",(long)self.cutNumber] forState:UIControlStateNormal];
    [self.SmsBtn setTitleColor:[UIColor colorWithHexString:@"0xaaa7a7"] forState:UIControlStateNormal];
    
    self.SmsBtn.userInteractionEnabled = NO;
    if (self.cutNumber <= 0)
    {
        [timer invalidate];
        [self.SmsBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.SmsBtn setTitleColor:[UIColor colorWithHexString:@"0x108ee9"] forState:UIControlStateNormal];
        self.SmsBtn.userInteractionEnabled = YES;
    }
}

-(UIView *)CreatSmsCellView{
    
    UIView *cellview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    
    self.SmsBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-130, 0, 120, 50)];
    [self.SmsBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.SmsBtn setTitleColor:[UIColor colorWithHexString:@"0x108ee9"] forState:UIControlStateNormal];
    [self.SmsBtn addTarget:self action:@selector(clickSmsBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cellview addSubview:self.SmsBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(self.SmsBtn.ex_x-1, 0, 1, 50)];
    line.backgroundColor = [UIColor colorWithHexString:@"0xe5e5e5"];
    [cellview addSubview:line];
    
    
    self.SMSTextfield = [[UITextField alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30-self.SmsBtn.width, 50)];
    self.SMSTextfield.placeholder = @"请输入短信验证码";
    self.SMSTextfield.font = SYSTEM_REGULARFONT(15.f);
    [cellview addSubview:self.SMSTextfield];
    
    return cellview;
    
}

/**
 seaction ==0
 */
-(UIView *)CreatCellView:(NSInteger )row{
    
    UIView *cellview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    
    UILabel *leftlable = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 100, 50)];
    leftlable.font = SYSTEM_REGULARFONT(15);
    [cellview addSubview:leftlable];
    
    UITextField *righttextfield = [[UITextField alloc]initWithFrame:CGRectMake(leftlable.right+10, 0, SCREEN_WIDTH-leftlable.right-30, 50)];
    righttextfield.textAlignment = NSTextAlignmentRight;
    righttextfield.secureTextEntry = YES;
    [cellview addSubview:righttextfield];
    leftlable.text = self.SetArr[0][row];
    righttextfield.placeholder = self.SetArr[1][row];
    
    if (self.CurrenPassWordType == SetPayPasswordType||self.CurrenPassWordType == ResetPayPasswordType) {
        if (row==0) self.NewTextfield = righttextfield;
        else if (row==1) self.ConfirmTextfield = righttextfield;
    }else if (self.CurrenPassWordType == ModifyPayPasswordType){
        if (row==0) self.OldTextfield = righttextfield;
        if (row==1) self.NewTextfield = righttextfield;
        else if (row==2) self.ConfirmTextfield = righttextfield;
    }
    return cellview;
}

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = 50;
        _tableview.backgroundColor = ZJCOLOR.color_c12;
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
@end
