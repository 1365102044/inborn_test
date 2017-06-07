//
//  YBChangeLoginPwViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBChangeLoginPwViewController.h"
#import "YBTopAlert.h"
#import "ZJMineService.h"
#import "YBAttributedStringLabel.h"
#import "YXPerfectAccountInformationViewController.h"
#import "YBEditingInforTextfield.h"

@interface YBChangeLoginPwViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong) UITableView * tableview;
@property(nonatomic,strong) YBEditingInforTextfield * oldTextfield;
@property(nonatomic,strong) YBEditingInforTextfield * newpTextfield;
@property(nonatomic,strong) YBEditingInforTextfield * confirmfiled;
@property(nonatomic,strong) NSArray * titleArr;
@property(nonatomic,strong) UIButton * commitBtn;
@property(nonatomic,assign) CureentVcType  currentType;

@property(nonatomic,strong) NSString * oldTextStr;
@property(nonatomic,strong) NSString * newsTextStr;
@property(nonatomic,strong) NSString * comfirTextStr;

@end

@implementation YBChangeLoginPwViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
- (void)clickcommit:(UIButton *)sender
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
//    YBLog(@"----old:%@\n-----new:%@\n-----comfir:%@",self.oldTextStr,self.newsTextStr,self.comfirTextStr);
    
     if (self.oldTextStr.length <= 0 || self.newsTextStr.length <= 0 || self.comfirTextStr.length <= 0) {
         return;
     }
    if (![self.oldTextStr ex_isPassword]) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:ZJSTRING(@"旧密码格式不正确") type:YBTopAlertError eventCallBackBlock:^(id sender) {
        }];
        return;
    }
    if (![self.newsTextStr ex_isPassword]) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:ZJSTRING(@"新密码格式不正确") type:YBTopAlertError eventCallBackBlock:^(id sender) {
        }];
        return;
    }
    if (![self.comfirTextStr isEqualToString:self.newsTextStr]) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:ZJSTRING(@"新密码和确认密码不一致") type:YBTopAlertError eventCallBackBlock:^(id sender) {
        }];
        return;
    }
    if (self.currentType == changeLoginPW) {
        
        [[ZJMineService share] changeLoginPassWordInfoWitholdPwd:self.oldTextStr
                                                          newPwd:self.newsTextStr
                                                         Success:^(id objc, id requestInfo) {
                                                             [self.navigationController popViewControllerAnimated:YES];
                                                         } fail:^(id error, id requestInfo) {
                                                             
                                                         }];
    }else if (self.currentType == changePayPW){
        
        YXPerfectAccountInformationViewController *perfectVC = [[YXPerfectAccountInformationViewController alloc]init];
        perfectVC.passwordStr = [self.comfirTextStr ex_sha1String];
        [self.navigationController pushViewController:perfectVC animated:YES];

    }
}

#pragma mark - Fourth.代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }else{
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    UIView *cellview = [self creatcellsubview:indexPath];
    cellview.frame = CGRectMake(0, 0, SCREEN_WIDTH, 46);
    [cell.contentView addSubview:cellview];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *seactionview = [[UIView alloc]init];
    
    NSString *desc = @"支持8～20个字符，至少包括字母、数字和符号中的两种及以上的组合，要牢记密码哦";
    YBAttributedStringLabel *desclable = [YBAttributedStringLabel labelWithFont:SYSTEM_REGULARFONT(12)
                                                                           text:ZJSTRING(desc)
                                                                      textColor:ZJCOLOR.color_c5];
    desclable.numberOfLines = 2;
    [desclable setAttributedStringWithContentArray:@[@{@"color":ZJCOLOR.color_c5,
                                                       @"content":desc,
                                                       @"size":SYSTEM_REGULARFONT(12),
                                                       @"lineSpacing":@"5"}]];
    desclable.backgroundColor = ZJCOLOR.color_c12;
    [seactionview addSubview:desclable];
    
    [desclable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(seactionview.mas_top);
        make.left.mas_equalTo(seactionview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.right.mas_equalTo(seactionview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(50));
    }];
    return seactionview;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(60);
}
- (UIView *)creatcellsubview:(NSIndexPath *)indexpath{
    UIView *view = [[UIView alloc]init];
    
    YBDefaultLabel *leftlable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                                         text:self.titleArr[indexpath.row]
                                                    textColor:ZJCOLOR.color_c4];
    [view addSubview:leftlable];
    
    NSString *pacehodlerStr;
    if (indexpath.row == 0) {
        pacehodlerStr = @"请输入旧密码";
    }else if (indexpath.row == 1){
        if (self.currentType == changeLoginPW) {
            pacehodlerStr = @"请输入8~20位登录密码";
        }else if (self.currentType == changePayPW){
            pacehodlerStr = @"请输入8~20位支付密码";
        }
    }else if (indexpath.row == 2){
     
        if (self.currentType == changeLoginPW) {
            pacehodlerStr = @"请输入确认登录密码";
        }else if (self.currentType == changePayPW){
            pacehodlerStr = @"请输入确认支付密码";
        }
    }
  YBEditingInforTextfield *rightTextFiled = [YBEditingInforTextfield creatEditingInforTextFiledwtihtag:indexpath.row + 100
                                                                                   textFiledPaceHolder:pacehodlerStr
                                                                                     textFiledTextFont:14
                                                                                    textFiledTextColor:ZJCOLOR.color_c4
                                                                                     limtMaxTextNumber:20
                                                                                  textWhenEnditingText:^(NSString *textfiledStr, NSInteger textFiledTag) {
                                                                                      if (textFiledTag == 100)  self.oldTextStr = textfiledStr;
                                                                                      if (textFiledTag == 101)   self.newsTextStr = textfiledStr;
                                                                                      if (textFiledTag == 102)  self.comfirTextStr = textfiledStr;

                                                                                  }textWhenEdtingChangeBlcok:^(NSString *textfiledChangeStr, NSInteger textFiledTag) {
                                                                                      
                                                                                      if (textFiledTag == 100)  self.oldTextStr = textfiledChangeStr;
                                                                                      if (textFiledTag == 101)   self.newsTextStr = textfiledChangeStr;
                                                                                      if (textFiledTag == 102)  self.comfirTextStr = textfiledChangeStr;
                                                                                      
                                                                                      if (self.oldTextStr.length> 0 &&
                                                                                          self.newsTextStr.length > 0 &&
                                                                                          self.comfirTextStr.length > 0) {
                                                                                          self.commitBtn.backgroundColor = ZJCOLOR.color_c6;
                                                                                      }else{
                                                                                          self.commitBtn.backgroundColor = ZJCOLOR.color_c5;
                                                                                      }
                                                                                  }];
    rightTextFiled.secureTextEntry = YES;
    [view addSubview:rightTextFiled];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = ZJCOLOR.color_c16;
    [view addSubview:line];
    
    [leftlable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.height.mas_equalTo(view);
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(100));
        make.centerY.mas_equalTo(view);
    }];
    
    [rightTextFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.height.mas_equalTo(view);
        make.left.mas_equalTo(leftlable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.centerY.mas_equalTo(view);
    }];
    if (indexpath.row ==0) {
        self.oldTextfield = rightTextFiled;
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.bottom.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
        }];
    }else if (indexpath.row ==1){
        self.newpTextfield = rightTextFiled;
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.bottom.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
        }];
    }else if (indexpath.row == 2){
        self.confirmfiled = rightTextFiled;
    }
    return view;
}

- (UIView *)creatfooterview
{
    UIView *footerview = [[UIView alloc]init];
    footerview.backgroundColor = ZJCOLOR.color_c12;
    
    self.commitBtn =[[UIButton alloc]init];
    self.commitBtn.backgroundColor = ZJCOLOR.color_c5;
    self.commitBtn.titleLabel.font = SYSTEM_REGULARFONT(14);
    [self.commitBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.commitBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
    [footerview addSubview:self.commitBtn];
    self.commitBtn.layer.cornerRadius = 3;
    self.commitBtn.layer.masksToBounds = YES;
    [self.commitBtn addTarget:self action:@selector(clickcommit:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(footerview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.right.mas_equalTo(footerview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(44));
        make.top.mas_equalTo(footerview).mas_offset(ADJUST_PERCENT_FLOAT(10));
        make.centerX.mas_equalTo(footerview.mas_centerX);
    }];
    
    return footerview;
}

#pragma mark - Fifth.控制器生命周期

+ (instancetype) creatChangeLoginPwOrPayPwWithCurrentVcType:(CureentVcType)CurrentVcType
                                                     extend:(id)extend
{
    YBChangeLoginPwViewController *vc = [[YBChangeLoginPwViewController alloc]init];
    vc.currentType = CurrentVcType;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.currentType == changeLoginPW) {
        self.title = @"修改登录密码";
    }else if (self.currentType == changePayPW){
        self.title = @"修改支付密码";
    }
    
    self.titleArr = @[@"旧密码",@"新密码",@"确认新密码"];
    [self.view addSubview:self.tableview];
    
    UIView *footer = [self creatfooterview];
    footer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 60);
    self.tableview.tableFooterView = footer;
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

/**
 懒加载
 */
-(UITableView *)tableview{
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.rowHeight = ADJUST_PERCENT_FLOAT(46);
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.backgroundColor = ZJCOLOR.color_c12;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableview;
}

@end
