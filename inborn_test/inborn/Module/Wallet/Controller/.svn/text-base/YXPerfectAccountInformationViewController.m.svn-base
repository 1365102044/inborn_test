//
//  YXPerfectAccountInformationViewController.m
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/20.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXPerfectAccountInformationViewController.h"
#import "MOFSPickerManager.h"
#import "YXUploadIDPhotoViewController.h"
#import "YXMyWalletRequestTool.h"
#import "YXMyWalletMainViewController.h"
#import "YBTopAlert.h"
static CGFloat seactionHeight = 40;

@interface YXPerfectAccountInformationViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong) UITableView * tableview;
@property(nonatomic,strong) NSArray * cellLeftArr;
@property(nonatomic,strong) MOFSPickerView * leixingpicker;
@property(nonatomic,strong) UILabel  * IDtypelable;
@property(nonatomic,strong) UITextField * nametextfiled;
@property(nonatomic,strong) UITextField * IDnumbertextfiled;
@property(nonatomic,strong) UILabel * joblable;
@property(nonatomic,strong) UILabel * addresslable;
@property(nonatomic,strong) UITextField * addressDeatiltextfiled;
@property(nonatomic,strong) UIButton * choosedatebtn;
@property(nonatomic,strong) NSArray * jobPickerArr;
//长期有效
@property(nonatomic,strong) UIButton * LongTimeBtn;
@property(nonatomic,strong) NSString * addreCode;
@property(nonatomic,strong) NSString * RealNameStr;
@property(nonatomic,strong) NSString * IDCardStr;
@property(nonatomic,strong) UIButton * SMSBtn;
@property(nonatomic,strong) UITextField * SMSTextfiled;
@property(nonatomic,assign) NSInteger  cutTimerNumber;

//是否实名认证
@property(nonatomic,assign) BOOL  IsRealName;
@property(nonatomic,strong) NSString * SMSToken;
@end

@implementation YXPerfectAccountInformationViewController

/**
******** 钱包直接开户接口 *********
参数:
* @param name_user 姓名
* @param pwd_pay 支付密码
* @param no_idcard  身份证号
* @param exp_idcard 身份证过期时间(格式YYYYMMDD) , 非永久时必传
* @param type_expidcard  身份证有效期类型: 0非永久(默认)，1永久
* @param addr_conn 联系地址
* @param addr_pro  省级地区编号
* @param addr_city 市级地区编号
* @param addr_dist 区级地区编号
*/
-(void)CommitRequestData{
 
    if(![self checkParamStr]){
        return;
    }
//    获取职业编号
    NSString *jobNumber;
    NSString *addr_pro;
    NSString *addr_city;
    NSString *addr_dist;
    NSString *timetype;
    NSString *titmestr;
    NSString *SMSCode;
    timetype = self.LongTimeBtn.selected ? @"1":@"0";
    titmestr = [self.choosedatebtn.titleLabel.text stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]]){
        SMSCode = self.SMSTextfiled.text;
    }else{
        NSInteger jobIndex = [self.jobPickerArr indexOfObject:self.joblable.text];
        jobNumber = [NSString stringWithFormat:@"%02ld",(long)jobIndex+1];
        NSArray *addressCodeArr = [self.addreCode componentsSeparatedByString:@"-"];
        addr_pro = addressCodeArr[0];
        if (addressCodeArr.count>1) {
            addr_city = addressCodeArr[1];
            if (addressCodeArr.count>2) {
                addr_dist = addressCodeArr[2];
            }
        }
    }
    
    [[YXMyWalletRequestTool sharedTool] RequestOpenMyWalletWith:self.nametextfiled.text
                                                        pwd_pay:self.passwordStr
                                                      no_idcard:self.IDnumbertextfiled.text
                                                     exp_idcard:titmestr
                                                 type_expidcard:timetype
                                                      addr_conn:self.addressDeatiltextfiled.text
                                                       addr_pro:addr_pro
                                                      addr_city:addr_city
                                                      addr_dist:addr_dist
                                                        oid_job:jobNumber
                                                        SMSCode:SMSCode
                                                       SMSToken:self.SMSToken
                                                     IsRealName:self.IsRealName
                                            SourceViewControler:self.SourceViewController
                                                        Success:^(id objc, id respodHeader) {
        
        if ([objc[@"status"] isEqualToString:@"1"]) {
            
            YXUploadIDPhotoViewController *uploadphotoVC = [[YXUploadIDPhotoViewController alloc]init];
            [self.navigationController pushViewController:uploadphotoVC animated:YES];
        }else{
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:objc[@"errorMsg"] type:YBTopAlertError eventCallBackBlock:^(id sender) {
                
            }];
        }
    } failure:^(NSError *error) {
    }];
}

-(BOOL)checkParamStr{

    if (!self.IsRealName) {
        if (self.nametextfiled.text.length==0) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"姓名不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
                
            }];
            return NO;
        }
        if(self.IDnumbertextfiled.text.length ==0){
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"身份证号不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
                
            }];
            return NO;
        }
//        if (![self.IDnumbertextfiled.text]) {
//            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"身份证号格式不对" type:YBTopAlertError eventCallBackBlock:^(id sender) {
//                
//            }];
//            return NO;
//        }
    }
    if([self.choosedatebtn.titleLabel.text isEqualToString:@"请选择"]&&self.LongTimeBtn.selected==NO){
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"有效期不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
            
        }];
        return NO;
    }
    if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]]){
        if (self.SMSTextfiled.text.length==0) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"验证码不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
                
            }];
            return NO;
        }
    }else{
        if([self.joblable.text isEqualToString:@"请选择"]){
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"职业不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
                
            }];
            return NO;
        }
        if([self.addresslable.text  isEqualToString:@"请选择"]){
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"常用地址不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
                
            }];
            return NO;
        }
        if(self.addressDeatiltextfiled.text.length==0){
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"街道地区不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
                
            }];
            return NO;
        }
    }
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     01:公务员 02:事业单位员工 03:企业高管 04:私营业主 05:金融从业人员 06:律师 07:会计师 08:医护人员 09:学生 10:公司员工 11:商业服务人员 12:工人 13:农林牧副渔 14:军人武警 15:文体工作者 16:家庭主妇 17:退休 18:自由职业者 19:其他
     */
    self.jobPickerArr  =@[@"公务员",@"事业单位员工",@"企业高管",@"私营业主",@"金融从业人员",@"律师",@"会计师",@"医护人员",@"学生",@"公司员工",@"商业服务人员",@"工人",@"农林牧副渔",@"军人武警",@"文体工作者",@"家庭主妇",@"退休",@"自由职业者",@"其他"];
    self.IsRealName = NO;
    [self QueryRealnameInfor];
    
    self.title = @"完善账号信息";
    self.view.backgroundColor = ZJCOLOR.color_c12;

    self.cellLeftArr = @[@"真实姓名",@"证件类型",@"证件号码",@"有效期",@"职业类型",@"常用地址",@"街道地区"];
    [self.view addSubview:self.tableview];
    
    self.tableview.tableFooterView =  [self addFooterView];
    [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(textViewEditChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    
    if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]]) {
        
        self.title = @"修改证件有效期";
    }
}

//查询实名认证信息
-(void)QueryRealnameInfor{
    [[YXMyWalletRequestTool sharedTool] RequestQueryRealNameInformationSuccess:^(id objc, id respodHeader) {
        if ([objc[@"status"] isEqualToString:@"1"]) {
            self.IsRealName = YES;
            self.RealNameStr = objc[@"name"];
            self.IDCardStr = objc[@"idCard"];
            [SYSTEM_USERDEFAULTS setObject:@"2" forKey:@"validateStatus"];
        }
        [self.tableview reloadData];
    } failure:^(NSError *error) {
        
    }];
}

/**
 *  当 text field 文本内容改变时 会调用此方法
 *
 *  @param notification
 */
-(void)textViewEditChanged:(NSNotification *)notification{
    
    // 拿到文本改变的 text field
    UITextField *textField = (UITextField *)notification.object;
    
    if (textField == self.nametextfiled) {
        
        [self limitTextFiledEditChange:textField LimitNumber:20];
    }
    if (textField == self.addressDeatiltextfiled) {
        [self limitTextFiledEditChange:textField LimitNumber:255];
    }
    if(textField == self.IDnumbertextfiled)
    {
        [self limitTextFiledEditChange:textField LimitNumber:18];
    }
}

-(void)limitTextFiledEditChange:(UITextField *)textField LimitNumber:(NSInteger)Number
{
    
    // 需要限制的长度
    NSUInteger maxLength = 0;
    maxLength = Number;
    if (maxLength == 0) return;
    
    // text field 的内容
    NSString *contentText = textField.text;
    // 获取高亮内容的范围
    UITextRange *selectedRange = [textField markedTextRange];
    // 这行代码 可以认为是 获取高亮内容的长度
    NSInteger markedTextLength = [textField offsetFromPosition:selectedRange.start toPosition:selectedRange.end];
    // 没有高亮内容时,对已输入的文字进行操作
    if (markedTextLength == 0) {
        // 如果 text field 的内容长度大于我们限制的内容长度
        if (contentText.length > maxLength) {
            // 截取从前面开始maxLength长度的字符串
            //            textField.text = [contentText substringToIndex:maxLength];
            // 此方法用于在字符串的一个range范围内，返回此range范围内完整的字符串的range
            NSRange rangeRange = [contentText rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
            textField.text = [contentText substringWithRange:rangeRange];
        }
    }
    
}

-(void)clicknextBtn:(UIButton *)sender{
    [self CommitRequestData];
}
-(UIView *)addFooterView{
    UIView *footerview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    UIButton *nextbtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 30, SCREEN_WIDTH-30, 50)];
    [nextbtn addTarget:self action:@selector(clicknextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [nextbtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextbtn.backgroundColor = ZJCOLOR.color_c6;
    [nextbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextbtn.titleLabel.font = SYSTEM_REGULARFONT(15);
    nextbtn.layer.masksToBounds = YES;
    nextbtn.layer.cornerRadius  =4;
    [footerview addSubview:nextbtn];
    return footerview;
}
/**
    tableview-delegate
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]]) {
        return 2;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]]) {
        if (section==0) return 4;
        else return 1;
    }else return 7;
        
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *seactionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, seactionHeight)];
    
    UILabel *desclable = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30, seactionHeight)];
    desclable.text = @"验证码已发送到您的手机，请输入验证码完成验证";
    desclable.textColor = [UIColor colorWithHexString:@"0xaaa7a7"];
    desclable.font = SYSTEM_REGULARFONT(13);
    [seactionView addSubview:desclable];
    if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]]) {
        if (section==1) return  seactionView;
    }
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str;
     str = [NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        //删除cell的所有子视图
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    if (indexPath.section==0) {
        [cell.contentView addSubview:[self creatCellView:indexPath.row]];
    }else if (indexPath.section==1){
        [cell.contentView addSubview:[self  CreatSmsCellView]];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    
        if (indexPath.row==1) {
                if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]])return;
        MOFSPickerView *picker = [[MOFSPickerView alloc]init];
        [picker showMOFSPickerViewWithDataArray:@[@"身份证"] commitBlock:^(NSString *string) {
            
             self.IDtypelable.text = @"身份证";
        } cancelBlock:^{
            
             self.IDtypelable.text = @"身份证";
        }];
    }
//    职业类型
    else if (indexPath.row ==4) {
        MOFSPickerView *picker = [[MOFSPickerView alloc]init];
        [picker showMOFSPickerViewWithDataArray:self.jobPickerArr commitBlock:^(NSString *string) {
            
            self.joblable.text = string;
        } cancelBlock:^{
            
        }];
    }
//    地址
    else if (indexPath.row ==5){
        [[MOFSPickerManager shareManger] showMOFSAddressPickerWithTitle:nil cancelTitle:@"取消" commitTitle:@"完成" commitBlock:^(NSString *address, NSString *zipcode) {
            self.addresslable.text = address;
            self.addreCode = zipcode;
        } cancelBlock:^{
            
        }];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]]) {
        if (section==0) return 10;
        else if (section==1) return seactionHeight;
    }else{
        if (section==0) return 10;
        else return 0.00001;
    }
    return 0.000001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.SourceViewController isKindOfClass:[YXMyWalletMainViewController class]]) {
        if (indexPath.section==0) {
            if (indexPath.row>3) {
                return 0;
            }
        }
    }
    return 50;
}


/**
 创建 验证码view
 */
-(UIView *)CreatSmsCellView{
    
    UIView *cellview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    
    self.SMSBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-130, 0, 120, 50)];
    [self.SMSBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.SMSBtn setTitleColor:[UIColor colorWithHexString:@"0x108ee9"] forState:UIControlStateNormal];
    [self.SMSBtn addTarget:self action:@selector(clickSMSBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cellview addSubview:self.SMSBtn];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(self.SMSBtn.ex_x-1, 0, 1, 50)];
    line.backgroundColor = [UIColor colorWithHexString:@"0xe5e5e5"];
    [cellview addSubview:line];
    
    self.SMSTextfiled = [[UITextField alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-30-self.SMSBtn.width, 50)];
    self.SMSTextfiled.placeholder = @"请输入短信验证码";
    self.SMSTextfiled.font = SYSTEM_REGULARFONT(15);
    self.SMSTextfiled.keyboardType = UIKeyboardTypeNumberPad;
    self.SMSTextfiled.delegate = self;
    [cellview addSubview:self.SMSTextfiled];
    return cellview;
}

/**
 显示提示
 
 @param objc objc
 */
- (void)showTipsWithObjc:(id)objc
{
    if ([objc[@"errorMsg"] isKindOfClass:[NSString class]]) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:objc[@"errorMsg"] type:YBTopAlertError eventCallBackBlock:^(id sender) {
            
        }];
        
        return;
    }
    
    NSDictionary *errorMsg;
    NSString *ret_msg;
    @try {
        errorMsg = objc[@"errorMsg"];
        ret_msg = errorMsg[@"ret_msg"];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }
    
    [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:ret_msg type:YBTopAlertError eventCallBackBlock:^(id sender) {
        
    }];
}
/**
 发送验证码
 */
-(void)clickSMSBtn:(UIButton *)sender{
    
    if([self.choosedatebtn.titleLabel.text isEqualToString:@"请选择"]&&self.LongTimeBtn.selected==NO){
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误" tipsStringKey:@"有效期不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {
            
        }];
        return ;
    }
    
    [[YXMyWalletRequestTool sharedTool] RequestChangeIDCardoutTimeInformationGetSMSCodeSuccess:^(id objc, id respodHeader) {
        if ([objc[@"status"] isEqualToString:@"1"]) {
            self.SMSToken = objc[@"data"][@"token"];
            [self StarDownTime];
        }else{
            [self showTipsWithObjc:objc];
        }
    } failure:^(NSError *error) {

    }];
    
}
-(void)StarDownTime{
    self.cutTimerNumber = 60;
    NSTimer *mytimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updatewalletCutNumber:) userInfo:nil repeats:YES];
    [mytimer fire];
}
-(void)updatewalletCutNumber:(NSTimer *)timer{
    self.cutTimerNumber --;
    self.SMSBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.SMSBtn setTitle:[NSString stringWithFormat:@"%ld s",(long)self.cutTimerNumber] forState:UIControlStateNormal];
    [self.SMSBtn setTitleColor:[UIColor colorWithHexString:@"0xaaa7a7"] forState:UIControlStateNormal];
    self.SMSBtn.userInteractionEnabled = NO;
    if (self.cutTimerNumber <= 0)
    {
        [timer invalidate];
        [self.SMSBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.SMSBtn setTitleColor:[UIColor colorWithHexString:@"0x108ee9"] forState:UIControlStateNormal];
        self.SMSBtn.userInteractionEnabled = YES;
    }
}

/**
    textfiled-delegate
 */
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.addressDeatiltextfiled||textField == self.SMSTextfiled) {
        [UIView animateWithDuration:0.25 animations:^{
            self.tableview.ex_y = SCREEN_WIDTH>320 ? -50 : -75;
        }];
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.addressDeatiltextfiled||textField == self.SMSTextfiled) {
        [UIView animateWithDuration:0.25 animations:^{
            self.tableview.ex_y = 0;
        }];
    }
}
/**
 选择有效期
 */
-(void)clickchoosedatebtn:(UIButton *)sender{
    if (self.LongTimeBtn.selected) {
        return;
    }
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [[MOFSPickerManager shareManger] showDatePickerWithTag:3 datePickerMode:UIDatePickerModeDate commitBlock:^(NSDate *date) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
        NSString *strDate = [dateFormatter stringFromDate:date];
        [self.choosedatebtn setTitle:[strDate componentsSeparatedByString:@" "][0] forState:UIControlStateNormal];
    } cancelBlock:^{
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = ZJCOLOR.color_c12;
    }
    return _tableview;
}

-(UILabel *)rightlable
{
    UILabel *rightlable = [[UILabel alloc]initWithFrame:CGRectMake(90+10, 0, SCREEN_WIDTH-90-30, 50)];
    rightlable.textColor = [UIColor colorWithHexString:@"0xcccccc"];
    rightlable.textAlignment = NSTextAlignmentRight;
    return  rightlable;
}
-(UITextField *)righttextfiled{
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(90+10, 0, SCREEN_WIDTH-90-20, 50)];
    textfield.textColor = ZJCOLOR.color_c4;
//    textfield.placeholder = @"test";
    textfield.delegate = self;
    textfield.textAlignment = NSTextAlignmentRight;
    return textfield;
}
/**
 点击选择 长期的有效
 */
-(void)clickLongTimeBtn:(UIButton *)sender{
    
    if (self.LongTimeBtn.selected) {
        [self.LongTimeBtn setImage:[UIImage imageNamed:@"icon_Weixuanzekuang"] forState:UIControlStateNormal];

    }else{
        [self.LongTimeBtn setImage:[UIImage imageNamed:@"icon_Selcxuanzekuang"] forState:UIControlStateNormal];
    
    }
    self.LongTimeBtn.selected = !self.LongTimeBtn.selected;
}
-(UIView *)addOutDateView{
    
    UIView *big = [[UIView alloc]initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-100, 50)];
    
    UIButton *rightbtn = [[UIButton alloc]initWithFrame:CGRectMake(big.width-110, 0, 100, 50)];
    [rightbtn setTitle:@"长期" forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor colorWithHexString:@"0xcccccc"] forState:UIControlStateNormal];
    rightbtn.titleLabel.font = SYSTEM_REGULARFONT(15);
    [rightbtn setImage:[UIImage imageNamed:@"icon_Weixuanzekuang"] forState:UIControlStateNormal];
    [rightbtn setImage:[UIImage imageNamed:@"icon_Selcxuanzekuang"] forState:UIControlStateSelected];
    [rightbtn addTarget:self action:@selector(clickLongTimeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [big addSubview:rightbtn];
    rightbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightbtn.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    self.LongTimeBtn = rightbtn;
    
    UIButton *choosedatebtn = [[UIButton alloc]initWithFrame:CGRectMake(big.width-100-120, 0, 100, 50)];
    [choosedatebtn setTitle:@"请选择" forState:UIControlStateNormal];
    [choosedatebtn addTarget:self action:@selector(clickchoosedatebtn:) forControlEvents:UIControlEventTouchUpInside];
    [choosedatebtn setTitleColor:[UIColor colorWithHexString:@"0xcccccc"] forState:UIControlStateNormal];
    choosedatebtn.titleLabel.font = SYSTEM_REGULARFONT(15);
    [big addSubview:choosedatebtn];
    self.choosedatebtn = choosedatebtn;

    
    return big;
}
-(UIView *)creatCellView:(NSInteger)row{
    
    UIView *cellview  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    cellview.backgroundColor = [UIColor whiteColor];
    
    UILabel *leftlable = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, cellview.height)];
    leftlable.font = SYSTEM_REGULARFONT(15);
    leftlable.textColor = [UIColor colorWithHexString:@"0x333333"];
    [cellview addSubview:leftlable];
    leftlable.text = self.cellLeftArr[row];
    
   
    if (row==0) {
        self.nametextfiled = [self righttextfiled];
        self.nametextfiled.placeholder = @"请输入真实姓名";
        [self setTextfiledWith:self.nametextfiled];
        [cellview addSubview:self.self.nametextfiled];
    }else if (row==1){
        self.IDtypelable = [self rightlable];
        self.IDtypelable.text = @"身份证";
        [cellview addSubview:self.IDtypelable];
    }else if (row==2){
        self.IDnumbertextfiled = [self righttextfiled];
        self.IDnumbertextfiled.placeholder= @"请输入真实证件号码";
        [self setTextfiledWith:self.IDnumbertextfiled];
        [cellview addSubview:self.IDnumbertextfiled];
    }else if (row==3){
        [cellview addSubview: [self addOutDateView]];
    }else if (row==4){
        self.joblable = [self rightlable];
        self.joblable.text = @"请选择";
        [cellview addSubview:self.joblable];
    }else if (row==5){
        self.addresslable = [self rightlable];
        self.addresslable.text = @"请选择";
        [cellview addSubview:self.addresslable];
    }else if (row==6){
        self.addressDeatiltextfiled = [self righttextfiled];
        self.addressDeatiltextfiled.placeholder= @"请输入详细的街道地址";
        [cellview addSubview:self.addressDeatiltextfiled];
    }
    if (row==1||row==4||row==5) {
        UIImageView *jiantouimage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-17, (50-12.5)/2, 7, 12.5)];
        jiantouimage.image = [UIImage imageNamed:@"icon_newsjiantou"];
        jiantouimage.centerY  = cellview.centerY;
        [cellview addSubview:jiantouimage];
    }
    return cellview;
}

//如果已经实名认证过后，不能再填写姓名和身份证号
-(void)setTextfiledWith:(UITextField *)textfiled{
    if (self.IsRealName) {
        textfiled.userInteractionEnabled= NO;
        textfiled.textColor = [UIColor colorWithHexString:@"0xcccccc"];
        textfiled.text = (textfiled == self.nametextfiled) ? self.RealNameStr : self.IDCardStr;
    }
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
#pragma mark  ******************* 添加键盘俯视图**********************
#pragma mark - 懒加载
#pragma mark - 代理方法

@end
