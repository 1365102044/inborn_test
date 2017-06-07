//
//  YXMyWalletSetPassWordViewController.m
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/20.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXMyWalletSetPassWordViewController.h"
#import "UILabel+Extension.h"
#import "YXPerfectAccountInformationViewController.h"
#import "YBTopAlert.h"

@interface YXMyWalletSetPassWordViewController ()<UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate>

@property(nonatomic,strong) UITableView * tableview;

@property(nonatomic,strong) UITextField * newtextfield;
@property(nonatomic,strong) UITextField * comfirTextfiled;

@end

@implementation YXMyWalletSetPassWordViewController

#pragma mark <UITextFieldDelegate>

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (![textField.text ex_isPassword]) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:LOGIN_TIPS_PWD_STRINGKEY
                                                         type:YBTopAlertError eventCallBackBlock:^(id sender) {
                                                             
                                                         }];
        return;
    }
}

-(void)clickpassNextBtn:(UIButton *)sender{
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    if (![self checkParam]) {
        return;
    }
    
    YXPerfectAccountInformationViewController *perfectVC = [[YXPerfectAccountInformationViewController alloc]init];
    perfectVC.passwordStr = [self.newtextfield.text ex_sha1String];
    [self.navigationController pushViewController:perfectVC animated:YES];
    
}

-(BOOL)checkParam{
    if(self.newtextfield.text.length ==0){
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"密码不能为空！"
                                                         type:YBTopAlertError eventCallBackBlock:^(id sender) {
                                                             
                                                         }];
        return NO;
    }
    if(![self.newtextfield.text ex_isPassword]
       || ![self.comfirTextfiled.text ex_isPassword]){
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:LOGIN_TIPS_PWD_STRINGKEY
                                                         type:YBTopAlertError eventCallBackBlock:^(id sender) {
                                                             
                                                         }];
        return NO;
    }
    
    if (![self.newtextfield.text isEqualToString:self.comfirTextfiled.text]) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"两次密码不一致！"
                                                         type:YBTopAlertError eventCallBackBlock:^(id sender) {
                                                             
                                                         }];
        return NO;
    }
    
    if (![self.newtextfield.text ex_isPassword]) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:LOGIN_TIPS_PWD_STRINGKEY
                                                         type:YBTopAlertError eventCallBackBlock:^(id sender) {
                                                             
                                                         }];
        return NO;
    }
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置钱包支付密码";
    self.view.backgroundColor = ZJCOLOR.color_c4;
    [self.view addSubview:self.tableview];
    UIView *headerview  =  [self setUI];
    self.tableview.tableHeaderView = headerview;
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

-(UIView *)setUI{
    
    UIView *bigview= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.height)];
    bigview.backgroundColor = [UIColor colorWithHexString:@"0xf9f9f9"];
    
    UILabel *titletoplable = [[UILabel alloc]initWithFrame:CGRectMake(ADJUST_PERCENT_FLOAT(10), ADJUST_PERCENT_FLOAT(10), SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(30), ADJUST_PERCENT_FLOAT(30))];
    titletoplable.textColor = [UIColor colorWithHexString:@"0x999999"];
    titletoplable.text = @"设置支付密码";
    titletoplable.font = SYSTEM_REGULARFONT(13);
    [bigview addSubview:titletoplable];
    
    UIView *contenview = [[UIView alloc]initWithFrame:CGRectMake(0, titletoplable.bottom+5, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(100))];
    contenview.layer.borderColor = [UIColor colorWithHexString:@"0xe5e5e5"].CGColor;
    contenview.layer.borderWidth = .5;
    contenview.backgroundColor = [UIColor whiteColor];
    [bigview addSubview:contenview];
    
    UILabel *leftlable = [[UILabel alloc]initWithFrame:CGRectMake(ADJUST_PERCENT_FLOAT(10), 0, ADJUST_PERCENT_FLOAT(120), ADJUST_PERCENT_FLOAT(50))];
    leftlable.text = @"支付密码";
    leftlable.font = SYSTEM_REGULARFONT(16);
    leftlable.textColor = [UIColor colorWithHexString:@"0x333333"];
    [contenview addSubview:leftlable];
    
    UILabel *leftlable2 = [[UILabel alloc]initWithFrame:CGRectMake(ADJUST_PERCENT_FLOAT(10), leftlable.bottom, ADJUST_PERCENT_FLOAT(120), ADJUST_PERCENT_FLOAT(50))];
    leftlable2.text = @"确认支付密码";
    leftlable2.font = SYSTEM_REGULARFONT(16);
    leftlable2.textColor = [UIColor colorWithHexString:@"0x333333"];
    [contenview addSubview:leftlable2];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, ADJUST_PERCENT_FLOAT(50), SCREEN_WIDTH, 0.5)];
    line.backgroundColor= [UIColor colorWithHexString:@"0xe5e5e5"];
    [contenview addSubview:line];
    
    UITextField *righttextfield = [[UITextField alloc]initWithFrame:CGRectMake(leftlable.right, 0, SCREEN_WIDTH-leftlable.width-ADJUST_PERCENT_FLOAT(20), ADJUST_PERCENT_FLOAT(50))];
    righttextfield.placeholder = @"请输入8-20位支付密码";
    righttextfield.font = SYSTEM_REGULARFONT(16);
    righttextfield.textAlignment = NSTextAlignmentRight;
    [contenview addSubview:righttextfield];
    righttextfield.secureTextEntry = YES;
    righttextfield.delegate = self;
    self.newtextfield = righttextfield;
    
    UITextField *righttextfield2 = [[UITextField alloc]initWithFrame:CGRectMake(leftlable.right, righttextfield.bottom, SCREEN_WIDTH-leftlable.width- ADJUST_PERCENT_FLOAT(20), ADJUST_PERCENT_FLOAT(50))];
    righttextfield2.placeholder = @"请确认您的密码";
    righttextfield2.font = SYSTEM_REGULARFONT(16);
    righttextfield2.textAlignment = NSTextAlignmentRight;
    righttextfield2.secureTextEntry = YES;
    [contenview addSubview:righttextfield2];
    righttextfield2.delegate = self;
    self.comfirTextfiled = righttextfield2;
    
    UILabel *desclable = [[UILabel alloc]initWithFrame:CGRectMake(ADJUST_PERCENT_FLOAT(10), contenview.bottom+ ADJUST_PERCENT_FLOAT(10), SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(20), ADJUST_PERCENT_FLOAT(40))];
    desclable.text = @"支持8～20个字符，至少包括字母，数字和符号中的两种及以上的组合，要牢记密码哦";
    desclable.numberOfLines = 2;
    desclable.font = SYSTEM_REGULARFONT(12);
    desclable.textColor = [UIColor colorWithHexString:@"0x999999"];
    [bigview addSubview:desclable];
    [desclable setRowSpace:10];
    
    UIButton *NextBtn = [[UIButton alloc]initWithFrame:CGRectMake(ADJUST_PERCENT_FLOAT(15), desclable.bottom +ADJUST_PERCENT_FLOAT(20), SCREEN_WIDTH-ADJUST_PERCENT_FLOAT(30), ADJUST_PERCENT_FLOAT(50))];
    [NextBtn addTarget:self action:@selector(clickpassNextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [NextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [NextBtn  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NextBtn.titleLabel.font  = SYSTEM_REGULARFONT(15);
    NextBtn.backgroundColor = ZJCOLOR.color_c6;
    NextBtn.layer.masksToBounds = YES;
    NextBtn.layer.cornerRadius = 4;
    [bigview addSubview:NextBtn];
    
    return bigview;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    return cell;
}
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = 0;
        _tableview.backgroundColor = ZJCOLOR.color_c12;
    }
    return _tableview;
}
@end
