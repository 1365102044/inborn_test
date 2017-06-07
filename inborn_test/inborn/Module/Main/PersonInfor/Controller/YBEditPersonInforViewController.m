//
//  YBEditPersonInforViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBEditPersonInforViewController.h"
#import "ZJMineService.h"
#import "YBTopAlert.h"
#import "YBEditingInforTextfield.h"

@interface YBEditPersonInforViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong) UITableView * tableview;
@property(nonatomic,strong) UIButton * commitBtn;
@property(nonatomic,assign) NSInteger  VcType;

@property(nonatomic,strong) YBEditingInforTextfield * editTextField;

@property(nonatomic,strong) NSString * textFiledStr;

@property(nonatomic,strong) YBMemberModel * datamodel;
@property(nonatomic,strong) UIButton * clearBtn;

@end

@implementation YBEditPersonInforViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

//- (void)cleartextfileBtn:(UIButton *)sender
//{
//    self.editTextField.text = nil;
//}

- (void)clickcommit:(UIButton *)sender
{
    [self.editTextField resignTextFiledFirstResponder];
    
    if (!self.textFiledStr.length) {
        NSString *alearstr;
        if (_VcType == 1) alearstr = ZJSTRING(@"昵称不能为空");
        else if (_VcType ==2) alearstr = ZJSTRING(@"邮箱不能为空");
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:alearstr type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
        
        return;
    }
    
    NSString *nickname;
    NSString *email;
    if (_VcType == 1) {
        email = nil;
        nickname = self.textFiledStr;
        if (![nickname ex_isNickName]) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:ZJSTRING(@"支持中文、字母、数字、'-''_'的组合，4-10个字符") type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
            return;
        }
    }else if (_VcType == 2){
        email = self.textFiledStr;
        if (![email ex_isEmail]) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:ZJSTRING(@"请输入正确的邮箱格式") type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
            return;
        }
        nickname = nil;
    }
    
    [[ZJMineService share] changePersonInfonickName:nickname
                                           birthday:nil
                                                sex:0
                                              email:email
                                            Success:^(id objc, id requestInfo) {
                                                [self.navigationController popViewControllerAnimated:YES];
                                            } fail:^(id error, id requestInfo) {
                                                
                                            }];
}

#pragma mark - Fourth.代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[[UIApplication sharedApplication]keyWindow ]endEditing:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
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

- (UIView *)creatcellsubview:(NSIndexPath *)indexpath{
    UIView *view = [[UIView alloc]init];
    YBDefaultLabel *leftlable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14) text:@"" textColor:ZJCOLOR.color_c4];
    [view addSubview:leftlable];
    if (_VcType == 1) {
        leftlable.text = @"昵称";
    }else if (_VcType == 2){
        leftlable.text = @"邮箱";
    }
    
    NSString *paceholderstr ;
    NSInteger MAX = 50;
    if (_VcType ==1) {
        paceholderstr = self.datamodel.nickname;
        MAX = 30;
    }else if (_VcType == 2){
        
        paceholderstr = self.datamodel.email;
    }
    
    YBEditingInforTextfield *righttextfiled = [YBEditingInforTextfield creatEditingInforTextFiledwtihtag:0
                                                                                     textFiledPaceHolder:paceholderstr
                                                                                       textFiledTextFont:14
                                                                                      textFiledTextColor:ZJCOLOR.color_c4
                                                                                       limtMaxTextNumber:MAX
                                                                                    textWhenEnditingText:^(NSString *textfiledStr, NSInteger textFiledTag) {
                                                                                        
                                                                                        self.textFiledStr = textfiledStr;
                                                                                    }textWhenEdtingChangeBlcok:^(NSString *textfiledChangeStr, NSInteger textFiledTag) {
                                                                                        
                                                                                        if (textfiledChangeStr.length > 0) {
                                                                                            self.clearBtn.hidden = NO;
                                                                                                    self.commitBtn.userInteractionEnabled = YES;
                                                                                                    self.commitBtn.backgroundColor = ZJCOLOR.color_c6;
                                                                                        }else{
                                                                                                    self.commitBtn.backgroundColor = ZJCOLOR.color_c5;
                                                                                                    self.clearBtn.hidden = YES;
                                                                                                    self.commitBtn.userInteractionEnabled = NO;
                                                                                        }
                                                                              }];
    self.editTextField = righttextfiled;
    [view addSubview:righttextfiled];
    
    [leftlable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.height.mas_equalTo(view);
        make.width.mas_offset(ADJUST_PERCENT_FLOAT(100));
        make.centerY.mas_equalTo(view);
    }];
    
    [righttextfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftlable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.height.mas_equalTo(view);
        make.centerY.mas_equalTo(view);
        make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
    }];

    return view;
}


#pragma mark - Fifth.控制器生命周期
/**
 type 1 昵称 2 邮箱
 */
+ (instancetype )creatEditPersonInforViewControllWithType:(NSInteger )type member:(YBMemberModel *)dataModel
                                                   Extend:(id)Extend;
{
    YBEditPersonInforViewController *vc = [[YBEditPersonInforViewController alloc]init];
    vc.datamodel                        = dataModel;
    vc.VcType                           = type;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfiledEditChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    [self.view addSubview:self.tableview];
    
    self.tableview.tableFooterView = [self creatfooterview];
    self.tableview.tableFooterView.height = ADJUST_PERCENT_FLOAT(66);
    
//    if (_VcType ==1) {
//        self.title = @"修改昵称";
//        self.editTextField.placeholder = self.datamodel.nickname;
//    }else if (_VcType == 2){
//        self.title = @"修改邮箱";
//        self.editTextField.placeholder = self.datamodel.email;
//    }
    
}
- (UIView *)creatfooterview
{
    UIView *footerview = [[UIView alloc]init];
    
    self.commitBtn =[[UIButton alloc]init];
    self.commitBtn.backgroundColor = ZJCOLOR.color_c5;
    self.commitBtn.titleLabel.font = SYSTEM_REGULARFONT(14);
    [self.commitBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.commitBtn setTitleColor:ZJCOLOR.color_c0 forState:UIControlStateNormal];
    [footerview addSubview:self.commitBtn];
    self.commitBtn.layer.cornerRadius = 3;
    self.commitBtn.layer.masksToBounds = YES;
    [self.commitBtn addTarget:self action:@selector(clickcommit:) forControlEvents:UIControlEventTouchUpInside];
    self.commitBtn.userInteractionEnabled = NO;
    
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(footerview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.right.mas_equalTo(footerview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
        make.height.mas_offset(ADJUST_PERCENT_FLOAT(44));
        make.top.mas_equalTo(footerview).mas_offset(ADJUST_PERCENT_FLOAT(20));
        make.centerX.mas_equalTo(footerview.mas_centerX);
    }];
    
    return footerview;
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
