//
//  YBFeedBackViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/31.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBFeedBackViewController.h"
#import "YBPlaceHolderTextView.h"
#import "ZJMineService.h"
#import "YBTopAlert.h"
#import "ZJBaseBarButtonItem.h"
#import "YBGoodsDeatilNaviMoreView.h"
#import "User_LocalData.h"
#import "YBHelpCenterViewController.h"
#import "NSString+Extension.h"
#import "MQCustomerServiceManager.h"
@interface YBFeedBackViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
@property(nonatomic,strong) UITableView * tableview;
@property(strong,nonatomic) UIButton *commitBtn;
@property(nonatomic,strong) YBPlaceHolderTextView * feedbookTextView;
//@property(nonatomic,strong) YBDefaultLabel * phonelable;
@property(nonatomic,strong) UILabel * numberLable;
@property(nonatomic,strong) NSString * alltextstr;
@property(nonatomic,strong) NSString * phoneStr;
//@property(nonatomic,strong) YBGoodsDeatilNaviMoreView * NaviMoreView;
@property(nonatomic,strong) UILabel * daojishizishu;
@end

@implementation YBFeedBackViewController
#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件
-(void) clickcommit:(UIButton *)sender
{
    if ([self.feedbookTextView.text ex_isEmpty]) {
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"内容不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
        }];
        return;
    }
    
    [[ZJMineService share] commitFeedBackcontentInfoFeedBackConten:self.feedbookTextView.text
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return ADJUST_PERCENT_FLOAT(140);
    }else{
        return ADJUST_PERCENT_FLOAT(46);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
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
    
    if (indexPath.section == 0) {
        UIView *cellview = [self creatcellsubview:indexPath];
        cellview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(140));
        [cell.contentView addSubview:cellview];
    }else if (indexPath.section == 1)
    {
        UIView *cellview = [self creatcellsubview:indexPath];
        cellview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(46));
        [cell.contentView addSubview:cellview];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)creatcellsubview:(NSIndexPath *)indexpath{
    UIView *view = [[UIView alloc]init];
    
    if (indexpath.section ==0) {
        
        YBPlaceHolderTextView *textview = [[YBPlaceHolderTextView alloc]init];
        textview.placeholder = @"请输入您的意见";
        self.feedbookTextView = textview;
        textview.delegate = self;
        [view addSubview:textview];
        [view addSubview:self.daojishizishu];
        _feedbookTextView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
        
        [textview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(view);
            make.center.mas_equalTo(view);
        }];
        
        [_daojishizishu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(100, 15));
            make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-15));
            make.bottom.mas_equalTo(view.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(-5));
        }];
    }else if (indexpath.section == 1){
        
        self.phoneStr = [self.phoneStr ex_replaceStringWithReplaceString:@"*" startLocation:3 lenght:4];
        YBDefaultLabel *phonelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14) text:self.phoneStr textColor:ZJCOLOR.color_c4];
        [view addSubview:phonelable];
        [phonelable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(150), ADJUST_PERCENT_FLOAT(46)));
            make.centerY.mas_equalTo(view.centerY);
        }];
    }
    return view;
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length >500) {
        self.feedbookTextView.text = self.alltextstr;
        return;
    }
        self.daojishizishu.text = [NSString stringWithFormat:@"%lu/500",textView.text.length];
    self.alltextstr = textView.text;
}
#pragma mark - Fifth.控制器生命周期
+ (instancetype)creatFeedBackViewControllerWith:(NSString *)phone extend:(id)extend
{
    YBFeedBackViewController *viewcontroller = [[YBFeedBackViewController alloc]init];
    viewcontroller.phoneStr = [phone ex_isEmpty]  ? @"" : phone;
    return viewcontroller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.phoneStr = [User_LocalData getUserData].mobile;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textviewEditChanged:) name:UITextViewTextDidChangeNotification object:nil];
    self.title = @"意见反馈";
    
    [self.view addSubview:self.tableview];
    self.tableview.tableFooterView = [self creatfooterview];
    self.tableview.tableFooterView.height = ADJUST_PERCENT_FLOAT(66);
    
    [self setnaviview];
}

-(void)textviewEditChanged:(NSNotification *)notification{
    
    if (self.feedbookTextView.text.length>=2 ) {
        
        self.commitBtn.backgroundColor = ZJCOLOR.color_c2;
    }else{
        self.commitBtn.backgroundColor = ZJCOLOR.color_c6;
    }
}

#pragma mark - Sixth.界面配置
- (void)setnaviview
{
    ZJBaseBarButtonItem *rightitem = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_DETAIL
                                                                              imageNamed:@"details_more"
                                                                                callBack:^(id sender) {
                                                                                    
                                                                                    [[YBGoodsDeatilNaviMoreView share] addMoreViewWithOrigin:CGPointMake(ADJUST_PERCENT_FLOAT(SCREEN_WIDTH-30),
                                                                                                                                                         ADJUST_PERCENT_FLOAT(65))
                                                                                                                                       Width:ADJUST_PERCENT_FLOAT(115)
                                                                                                                                      Height:ADJUST_PERCENT_FLOAT(40)
                                                                                                                                   Direction:WBArrowDirectionUp3
                                                                                                                                      sourVC:self
                                                                                                                                     dataArr:@[@"联系客服",]
                                                                                                                                    ImageArr:@[@"details_message_kefu_icon"]
                                                                                                                                  cellHeight:40
                                                                                                                              clickCellBlcok:^(NSInteger row) {
                                                                                                                                  
                                                                                                                                  [[MQCustomerServiceManager  share] showCustomerServiceWithViewController:self];
                                                                                                                                  
                                                                                                                              }];
                                                                                    [[YBGoodsDeatilNaviMoreView share] popView];

                                                                                    
                                                                                }];
    self.navigationItem.rightBarButtonItem = rightitem;
}
#pragma mark - Seventh.懒加载

- (UIView *)creatfooterview
{
    UIView *footerview = [[UIView alloc]init];
    
    self.commitBtn =[[UIButton alloc]init];
    self.commitBtn.backgroundColor = ZJCOLOR.color_c15;
    self.commitBtn.titleLabel.font = SYSTEM_REGULARFONT(14);
    [self.commitBtn setTitle:@"提交" forState:UIControlStateNormal];
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
#pragma mark - Sixth.界面配置
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
#pragma mark - Seventh.懒加载

/**
 懒加载
 */
-(UITableView *)tableview{
    
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.backgroundColor = ZJCOLOR.color_c12 ;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

- (UILabel *)daojishizishu {
    if (!_daojishizishu) {
        _daojishizishu = [[UILabel alloc]init];
        _daojishizishu.text = @"0/500";
        _daojishizishu.textAlignment = NSTextAlignmentRight;
        _daojishizishu.textColor = ZJCOLOR.color_c5;
        _daojishizishu.font = SYSTEM_REGULARFONT(15);
    }
    return _daojishizishu;
}

@end
