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
@interface YBChangeLoginPwViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong) UITableView * tableview;
@property(nonatomic,strong) UITextField * oldTextfield;
@property(nonatomic,strong) UITextField * newpTextfield;
@property(nonatomic,strong) NSArray * titleArr;
@property(nonatomic,strong) UIButton * commitBtn;

@end

@implementation YBChangeLoginPwViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
- (void)clickcommit:(UIButton *)sender
{
    if (self.oldTextfield.text.length == 0||self.newpTextfield.text.length ==0) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"密码不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
        }];
        return;
    }
    if (![self.oldTextfield.text ex_isPassword] || ![self.newpTextfield.text ex_isPassword]) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:LOGIN_TIPS_PWD_STRINGKEY type:YBTopAlertError eventCallBackBlock:^(id sender) {
        }];
        return;
    }
    
    [[ZJMineService share] changeLoginPassWordInfoWitholdPwd:self.oldTextfield.text
                                                      newPwd:self.newpTextfield.text
                                                     Success:^(id objc, id requestInfo) {
                                                         [self.navigationController popViewControllerAnimated:YES];
    } fail:^(id error, id requestInfo) {
        
    }];
    
}
#pragma mark - Fourth.代理方法


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
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
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)creatcellsubview:(NSIndexPath *)indexpath{
    UIView *view = [[UIView alloc]init];
    YBDefaultLabel *leftlable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14) text:self.titleArr[indexpath.row] textColor:ZJCOLOR.color_c4];
    [view addSubview:leftlable];
    
    UITextField *righttextfled = [[UITextField alloc]init];
    righttextfled.font = SYSTEM_REGULARFONT(14);
    righttextfled.delegate = self;
    [view addSubview:righttextfled];
    righttextfled.textAlignment= NSTextAlignmentRight;
    
    [leftlable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.height.mas_equalTo(view);
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(100));
        make.centerY.mas_equalTo(view);
    }];
    
    [righttextfled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.height.mas_equalTo(view);
        make.left.mas_equalTo(leftlable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.centerY.mas_equalTo(view);
    }];
    if (indexpath.row ==0) {
        righttextfled.placeholder = @"请输入旧密码";
        self.oldTextfield = righttextfled;
    }else if (indexpath.row ==1){
        righttextfled.placeholder = @"请输入新密码";
        self.newpTextfield = righttextfled;
    }
    return view;
}

-(void)textfiledEditChanged:(NSNotification *)notification{
    
    // 拿到文本改变的 text field
    UITextField *textField = (UITextField *)notification.object;
    
    if (textField == self.oldTextfield) {
        
        if (self.oldTextfield.left>=8) {
            
        }
    }
    
    if (textField == self.newpTextfield) {
    }
    if (self.oldTextfield.text.length>=8 && self.newpTextfield.text.length >=8) {
        
        self.commitBtn.backgroundColor = ZJCOLOR.color_c2;
    }
}
- (UIView *)creatfooterview
{
    UIView *footerview = [[UIView alloc]init];
    
    self.commitBtn =[[UIButton alloc]init];
    self.commitBtn.backgroundColor = ZJCOLOR.color_c6;
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
        make.top.mas_equalTo(footerview).mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.centerX.mas_equalTo(footerview.mas_centerX);
    }];
    
    return footerview;
}
#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArr = @[@"旧密码",@"新密码"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfiledEditChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    [self.view addSubview:self.tableview];

    self.tableview.tableFooterView = [self creatfooterview];
    self.tableview.tableFooterView.height = ADJUST_PERCENT_FLOAT(66);
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
        _tableview.rowHeight = 46;
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.backgroundColor = ZJCOLOR.color_c12
        ;    }
    return _tableview;
}
@end
