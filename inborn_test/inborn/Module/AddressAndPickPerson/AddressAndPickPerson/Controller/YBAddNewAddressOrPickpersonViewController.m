//
//  YBAddressOrPickpersonViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAddNewAddressOrPickpersonViewController.h"
#import "ZJBaseBarButtonItem.h"
#import "YBAddressAndPickpersonService.h"
#import "MOFSPickerManager.h"
#import "SXAddressBookManager.h"
#import <ContactsUI/ContactsUI.h>
#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPersonViewController.h>
#import "YBTopAlert.h"
#import "YBPlaceHolderTextView.h"
#import "UITextView+YBTextView.h"
#import "JXTAlertManagerHeader.h"

static NSString *ADDNEWADDRESSORPICKPEROSNCELLINDIFITER = @"ADDNEWADDRESSORPICKPEROSNCELLINDIFITER";
@interface YBAddNewAddressOrPickpersonViewController ()<UITableViewDelegate,UITableViewDataSource,ABPeoplePickerNavigationControllerDelegate,UITextFieldDelegate>

@property(nonatomic,assign) ViewControllerType VcType;
@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong) NSArray * dataArr;
@property(nonatomic,strong) NSArray * celltitleArr;

@property(nonatomic,strong) UITextField * nameTextfiled;
@property(nonatomic,strong) UITextField * phoneTextfiled;
@property(nonatomic,strong) UITextField * idcardTextfiled;
@property(nonatomic,strong) UILabel * addressorginlable;
@property(nonatomic,strong) YBPlaceHolderTextView * addressDeatilTextview;
@property(nonatomic,strong) UISwitch * myswich;

@property(nonatomic,assign) BOOL  isEditBool;
/**
 新增 第一个时 直接默认设为默认
 */
@property(nonatomic,assign) BOOL  isAddFristBool;

@property(nonatomic,strong)NSArray<SXPersonInfoEntity *>*personEntityArray;

/**
 地址 选择器返回后，截取的数组
 */
@property(nonatomic,strong) NSArray * addrArr;
@end

@implementation YBAddNewAddressOrPickpersonViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setDataModel:(YBAddressAndPickPersonModel *)dataModel
{
    _dataModel = dataModel;
    
}

- (void)setModelToViewWithdataModel:(YBAddressAndPickPersonModel *)dataModel
{
    if (self.isEditBool) {
        self.phoneTextfiled.text = dataModel.addrMobile;
        self.nameTextfiled.text = dataModel.addrName;
        self.idcardTextfiled.text = dataModel.addrIdcard;
        self.addressorginlable.text = [NSString stringWithFormat:@"%@%@%@",dataModel.addrProv,dataModel.addrCity,dataModel.addrCounty];
        self.addressDeatilTextview.text = dataModel.addrDetail;
        
        if (dataModel.addrIdcard.length !=0 && dataModel.addrIdcard !=nil) {
            self.nameTextfiled.userInteractionEnabled = NO;
            self.idcardTextfiled.userInteractionEnabled = NO;
        }
    }else{
        self.nameTextfiled.userInteractionEnabled = YES;
        self.idcardTextfiled.userInteractionEnabled = YES;
    }
}

#pragma mark - Third.点击事件

/**
 保存 提交信息
 */
- (void)saveInfor
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    NSString *addrName = self.nameTextfiled.text;
    NSString *addrmobile = self.phoneTextfiled.text;
    NSString *addrprov;
    NSString *addrcity;
    NSString *addrcounty;
    NSString *addrestypestr;
    if (self.addrArr.count>0) {
        addrprov = self.addrArr[0];
    }
    if (self.addrArr.count>1) {
        addrcity = self.addrArr[1];
    }
    if (self.addrArr.count>2) {
        addrcounty = self.addrArr[2];
    }
    if (self.isEditBool) {
        if (self.addrArr.count ==0 || self.addrArr == nil) {
            addrprov = _dataModel.addrProv;
            addrcity = _dataModel.addrCity;
            addrcounty = _dataModel.addrCounty;
        }else{
            @try {
                if (self.addrArr.count>0) {
                    addrprov = self.addrArr[0];
                }
                if (self.addrArr.count>1) {
                    addrcity = self.addrArr[1];
                }
                if (self.addrArr.count>2) {
                    addrcounty = self.addrArr[2];
                }
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
          
        }
    }
    NSString *addrdeatil = self.addressDeatilTextview.text;
    NSString *isdefault = self.myswich.isOn ? @"1":@"0";
    NSString *addridcard = self.idcardTextfiled.text;
    if (_VcType == addressType) {
        addrestypestr = @"1";
    }else if (_VcType == pickPersonType){
        addrestypestr = @"2";
    }
    if ([addrName ex_isEmpty]) {
        NSString *str;
        if (_VcType == addressType) {
            str = @"收货人不能为空";
        }else if (_VcType == pickPersonType)
        {
            str = @"提货人不能为空";
        }
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:str type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
        return;
    }
    if (self.isEditBool) {
        if (![self.phoneTextfiled.text isEqualToString:_dataModel.addrMobile]) {
            if ([addrmobile ex_isEmpty]) {
                [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"手机号不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
                return;
                
            }else{
                if (![addrmobile ex_isMobileNumber]) {
                    [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"手机号格式不对" type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
                    return;
                }
            }
        }else{
            addrmobile = nil;
        }
        
        /**
         身份已经有 清空
         */
        if (_dataModel.addrIdcard.length != 0 && [addridcard isEqualToString:_dataModel.addrIdcard]) {
            addridcard = nil;
            
        }else{
            if (addridcard.length != 0 && ![addridcard ex_validateIdentityCard]) {
                
                [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"身份证号格式不对" type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
                return;
            }
        }
        
    }else{
        
        if (addridcard.length != 0 && ![addridcard ex_validateIdentityCard]) {
            
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"身份证号格式不对" type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
            return;
        }
        
        if ([addrmobile ex_isEmpty]) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"手机号不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
            return;
        }
        
        if (![addrmobile ex_isMobileNumber]) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"手机号格式不对" type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
            return;
        }
    }
    if (_VcType == addressType) {
        if ([self.addressorginlable.text ex_isEmpty] || [self.addressorginlable.text isEqualToString:@"请选择"]) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"所在区域不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
            return;
        }
        if ([self.addressDeatilTextview.text ex_isEmpty]) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY tipsStringKey:@"详细地址不能为空" type:YBTopAlertError eventCallBackBlock:^(id sender) {}];
            return;
        }
    }
    
    if (self.isEditBool) {
        
        [[YBAddressAndPickpersonService share] changeAddressOrPickpersonInfoWithaddrName:addrName
                                                                              addrMobile:addrmobile
                                                                                addrProv:addrprov
                                                                                addrCity:addrcity
                                                                              addrCounty:addrcounty
                                                                              addrDetail:addrdeatil
                                                                               isDefault:isdefault
                                                                              addrIdcard:addridcard
                                                                                addrType:addrestypestr
                                                                                customId:_dataModel.customId
                                                                                 Success:^(id objc, id requestInfo) {
                                                                                     [self.navigationController popViewControllerAnimated:YES];
                                                                                 } fail:^(id error, id requestInfo) {
                                                                                     
                                                                                 }];
    }else{
        
        [[YBAddressAndPickpersonService share] AddNewAddressOrPickpersonInfoWithaddrName:addrName
                                                                              addrMobile:addrmobile
                                                                                addrProv:addrprov
                                                                                addrCity:addrcity
                                                                              addrCounty:addrcounty
                                                                              addrDetail:addrdeatil
                                                                               isDefault:isdefault
                                                                              addrIdcard:addridcard
                                                                                addrType:addrestypestr
                                                                                 Success:^(id objc, id requestInfo) {
                                                                                     
                                                                                     /**
                                                                                      *  判断，是否实现了代理，如果实现则回调新添加地址模型
                                                                                      */
                                                                                     if (self.delegate
                                                                                         && [self.delegate respondsToSelector:@selector(addNewAddressOrPickpersonViewController:newAddressModel:)]) {
                                                                                         /**
                                                                                          *  配置新的地址模型
                                                                                          */
                                                                                         YBAddressAndPickPersonModel *model = [[YBAddressAndPickPersonModel alloc] init];
                                                                                         model.addrName = addrName;
                                                                                         model.addrMobile = addrmobile;
                                                                                         model.addrProv = addrprov;
                                                                                         model.addrCity = addrcity;
                                                                                         model.addrCounty = addrcounty;
                                                                                         model.addrDetail = addrdeatil;
                                                                                         model.isDefault = isdefault.integerValue;
                                                                                         model.addrIdcard = addridcard;
                                                                                         model.addrType = addrestypestr.integerValue;
                                                                                         model.customId = objc[@"data"];
                                                                                         if (_VcType == addressType) {
                                                                                         model.modelType = @"addre";
                                                                                         }else if (_VcType == pickPersonType){
                                                                                         model.modelType = @"pick";
                                                                                         }
                                                                                         [self.delegate addNewAddressOrPickpersonViewController:self newAddressModel:model];
                                                                                     }
                                                                                     
                                                                                     [self.navigationController popViewControllerAnimated:YES];
                                                                                 } fail:^(id error, id requestInfo) {
                                                                                     YBLog(@"%@\n%@", error, requestInfo);
                                                                                 }];
        
    }
}

/**
 tag:1 删除， 2 设置默认
 */
- (void)clickisdelebtn:(UIButton *)sender
{
    if(sender.tag == 1){
        NSString *alearStr;
        if (_VcType == addressType) {
            alearStr = @"确定删除收货地址?";
        }else if (_VcType == pickPersonType){
            alearStr = @"确定删除提货人信息?";
        }
        [self jxt_showActionSheetWithTitle:ZJSTRING(alearStr) message:nil
                         appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                             
                             alertMaker.
                             addActionDefaultTitle(ZJSTRING(@"确定删除")).
                             addActionCancelTitle(ZJSTRING(@"取消"));
                             alertMaker.view.tintColor = ZJCOLOR.color_c4;
                         } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                             if (buttonIndex == 0) {
                                 [[YBAddressAndPickpersonService share] deleteAddressOrPickpersonInfoWithcustomId:_dataModel.customId
                                                                                                          Success:^(id objc, id requestInfo) {
                                                                                                              [self.navigationController popViewControllerAnimated:YES];
                                                                                                          } fail:^(id error, id requestInfo) {
                                                                                                              
                                                                                                          }];
                             }
                         }];
        
    }else if (sender.tag ==2){
        
    }
}

/**
 点击手机号 调用通讯录
 */
- (void)clickphonebtn:(UIButton *)sender
{
    [self checkStatus1];
    
    [[SXAddressBookManager manager]presentPageOnTarget:self chooseAction:^(SXPersonInfoEntity *person) {
        @try {
            NSString *tempPhoneNumber;
            
            if ([person.phoneNumber containsString:@"-"]) {
                tempPhoneNumber = [person.phoneNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
            }else{
                tempPhoneNumber = person.phoneNumber;
            }
            self.phoneTextfiled.text = tempPhoneNumber;
        } @catch (NSException *exception) {
            YBLog(@"%@", exception);
        } @finally {
            
        }
    }];
}

/**
 点击地址区域
 山西省-长治市-襄垣县
 */
- (void)clickaddressOrigin:(UITapGestureRecognizer *)tap
{
    [[[UIApplication sharedApplication]keyWindow] endEditing:YES];
    [[MOFSPickerManager shareManger] showMOFSAddressPickerWithTitle:nil cancelTitle:@"取消" commitTitle:@"完成" commitBlock:^(NSString *address, NSString *zipcode) {
        //self.addressorginlable.text = address;
        self.addrArr = [address componentsSeparatedByString:@"-"];
        NSString *str1 = @"";
        for (NSString *str in self.addrArr) {
            str1 = [NSString stringWithFormat:@"%@%@",str1,str];
        }
        self.addressorginlable.text = str1;
    } cancelBlock:^{
    }];
}

/**
 点击地址区域
 */
- (void)clickjaintouaddressorgin:(UIButton *)sender
{
    [[[UIApplication sharedApplication]keyWindow] endEditing:YES];
    [[MOFSPickerManager shareManger] showMOFSAddressPickerWithTitle:nil cancelTitle:@"取消" commitTitle:@"完成" commitBlock:^(NSString *address, NSString *zipcode) {
        //self.addressorginlable.text = address;
        self.addrArr = [address componentsSeparatedByString:@"-"];
        NSString *str1= @"";
        for (NSString *str in self.addrArr) {
            str1 = [NSString stringWithFormat:@"%@%@",str1,str];
        }
        self.addressorginlable.text = str1;
    } cancelBlock:^{
    }];
}

/**
 set default
 */
- (void)clickSwith:(UISwitch *)sender
{
    
}

#pragma mark - Fourth.代理方法

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.isEditBool) {
        if (textField == self.phoneTextfiled) {
            self.phoneTextfiled.text = nil;
        }
    }
}

#pragma mark --ABPeoplePickerNavigationControllerDelegate

/**
 获取联系人电话号码
 
 @param picker          通讯录
 @param contactProperty 内容
 */
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty{
    
    //** 点击的是电话号码的时候，获取内容 */
    if ([contactProperty.key isEqualToString:@"phoneNumbers"]) {
        CNPhoneNumber *phonenumber=contactProperty.value;//将value转为cnphonenumber类型
        self.phoneTextfiled.text = phonenumber.stringValue;
    }
}
- (void)checkStatus1
{
    SXAddressBookAuthStatus status = [[SXAddressBookManager manager] getAuthStatus];
    if (status == kSXAddressBookAuthStatusNotDetermined) {
        
        [[SXAddressBookManager manager]askUserWithSuccess:^{
            self.personEntityArray = [[SXAddressBookManager manager]getPersonInfoArray];
        } failure:^{
            YBLog(@"失败");
        }];
        
    }else if (status == kSXAddressBookAuthStatusAuthorized){
        
        self.personEntityArray = [[SXAddressBookManager manager]getPersonInfoArray];
        
    }else{
        YBLog(@"没有权限");
    }
}

/**
 对输入框的限制
 */
-(void)textfiledEditChanged:(NSNotification *)notification{
    
    // 拿到文本改变的 text field
    UITextField *textField = (UITextField *)notification.object;
    
    if (textField == self.nameTextfiled) {
        
        [self.nameTextfiled  limitTextFiledEditLimitNumber:10];
    }
    if (textField == self.phoneTextfiled) {
        [self.phoneTextfiled limitTextFiledEditLimitNumber:11];
    }
    if(textField == self.idcardTextfiled){
        [self.idcardTextfiled limitTextFiledEditLimitNumber:20];
    }
}
- (void)textViewEditChanged:(NSNotification *)notification{
    
    UITextView *textview = (UITextView *)notification.object;
    if(textview == self.addressDeatilTextview){
        [self.addressDeatilTextview limitTextViewEditLimitNumber:60];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.isEditBool) {
        return 3;
    }
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_VcType == addressType) {
        if (section==0) return 5;
    }else if (_VcType == pickPersonType){
        if (section==0) return 3;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = [NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row];
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
    if (indexPath.section ==0) {
        CGFloat cellHei = 0.0;
        if (indexPath.row <3) {
            cellHei = ADJUST_PERCENT_FLOAT(46);
        }
        
        if (indexPath.row == 4) {
            cellHei = ADJUST_PERCENT_FLOAT(46);
        }
        
        if (_VcType == addressType) {
            
            if (indexPath.row==3) {
                cellHei = ADJUST_PERCENT_FLOAT(130);
            }
            
        }
        UIView *cellview= [self creatviewWithIndexpath:indexPath];
        cellview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(cellHei));
        [cell.contentView addSubview:cellview];
        
    }else if (indexPath.section > 0)
    {
        UIView*cellview= [self creatseactionviewWithIndexpath:indexPath];
        cellview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(46));
        [cell.contentView addSubview:cellview];
    }
    [self setModelToViewWithdataModel:_dataModel];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(_VcType == addressType&&indexPath.section==0&&indexPath.row==3){
        return ADJUST_PERCENT_FLOAT(130);
    }
    return ADJUST_PERCENT_FLOAT(46);
}

#pragma mark - Fifth.控制器生命周期

/**
 初始化
 */
+(instancetype)creatAddNewViewControllerWith:(ViewControllerType)VcType Extend:(id)Extend
{
    YBAddNewAddressOrPickpersonViewController *viewcontroller = [[YBAddNewAddressOrPickpersonViewController alloc]init];
    viewcontroller.VcType = VcType;
    if (Extend[@"isedit"] != nil) {
        viewcontroller.isEditBool                                 = YES;
    }else{
        viewcontroller.isAddFristBool                             = Extend[@"addFrist"] == nil ? NO :YES;
    }
    return viewcontroller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.celltitleArr = @[@[@"收货人",@"联系方式",@"所在地区",@"",@"身份证号"],@[@"提货人",@"联系方式",@"身份证号"]];
    if (_VcType == addressType) {
        self.title = @"增加新地址";
        if (_isEditBool){
            self.title = @"编辑地址";
        }
    }else if (_VcType == pickPersonType){
        self.title = @"增加提货人";
        if (_isEditBool){
            self.title = @"编辑提货人";
        }
    }
    
    [self.view addSubview:self.tableView];
    
    
    ZJBaseBarButtonItem *rightitem = [ZJBaseBarButtonItem barButtonItemWithTitleStringKey:@"保存" callBack:^(id sender) {
        [self saveInfor];
    }];
    self.navigationItem.rightBarButtonItem = rightitem;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textfiledEditChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewEditChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

#pragma mark - Sixth.界面配置

/**
 配置 设置默认， 删除地址cell
 */
- (UIView *)creatseactionviewWithIndexpath:(NSIndexPath *)indexpath
{
    UIView *view = [[UIView alloc]init];
    UIButton *leftbtn = [[UIButton alloc]init];
    leftbtn.titleLabel.font = SYSTEM_REGULARFONT(14);
    [view addSubview:leftbtn];
    NSString *str;
    UIColor *color;
    if (indexpath.section==1) {
        str = @"设置默认";
        color = ZJCOLOR.color_c4;
        
        UISwitch *swi = [[UISwitch alloc]init];
        [swi addTarget:self action:@selector(clickSwith:) forControlEvents:UIControlEventValueChanged];
        [view addSubview:swi];
        
        if ((_isEditBool && _dataModel.isDefault) || _isAddFristBool) {
            [swi setOn:YES] ;
        }
        
        [swi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(41), ADJUST_PERCENT_FLOAT(25)));
            make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.centerY.mas_equalTo(view.mas_centerY);
        }];
        self.myswich = swi;
        leftbtn.tag = 2;
    }else if (indexpath.section ==2)
    {
        if (_VcType == addressType) {
            str = @"删除地址";
        }else if(_VcType == pickPersonType){
            str = @"删除提货人信息";
        }
        color = [UIColor redColor];
        leftbtn.tag = 1;
    }
    [leftbtn setTitle:str forState:UIControlStateNormal];
    [leftbtn setTitleColor:color forState:UIControlStateNormal];
    leftbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftbtn addTarget:self action:@selector(clickisdelebtn:) forControlEvents:UIControlEventTouchUpInside];
    [leftbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.height.mas_equalTo(view.mas_height);
        make.centerY.mas_equalTo(view.mas_centerY);
        make.right.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(-70));
    }];
    
    return view;
}

/**
 配置 cell
 */
- (UIView *)creatviewWithIndexpath:(NSIndexPath *)indexpath
{
    UIView *view = [[UIView alloc]init];
    YBDefaultLabel *titlelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14) text:@"" textColor:ZJCOLOR.color_c4];
    if(_VcType == addressType) {
        titlelable.text =  _celltitleArr[0][indexpath.row];
    } else if(_VcType == pickPersonType) {
        
        titlelable.text =  _celltitleArr[1][indexpath.row];
    }
    
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = ZJCOLOR.color_c16;
    [view addSubview:line];
    
    if ((_VcType == addressType && indexpath.row < 4) || (_VcType == pickPersonType && indexpath.row <  2)) {
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.mas_equalTo(view.mas_right);
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
            make.bottom.mas_equalTo(view.mas_bottom);
        }];
    }
    
    [view addSubview:titlelable];
    [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(100), ADJUST_PERCENT_FLOAT(22)));
        make.left.mas_equalTo(view.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
        make.centerY.mas_equalTo(view.mas_centerY);
    }];
    
    
    if (indexpath.row ==0) {
        UITextField *nametextfield = [[UITextField alloc]init];
        nametextfield.placeholder = @"请输入收货人";
        nametextfield.textAlignment = NSTextAlignmentRight;
        [view addSubview:nametextfield];
        [nametextfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titlelable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.height.mas_equalTo(view.mas_height);
            make.centerY.mas_equalTo(view.mas_centerY);
        }];
        nametextfield.textColor= ZJCOLOR.color_c4;
        nametextfield.font = SYSTEM_REGULARFONT(13);
        self.nameTextfiled = nametextfield;
    }else if (indexpath.row ==1){
        UIButton *addbtn = [[UIButton alloc]init];
        [addbtn setImage:[UIImage imageNamed:@"address_plus_n"] forState:UIControlStateNormal];
        [addbtn addTarget:self action:@selector(clickphonebtn:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:addbtn];
        [addbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22)));
            make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.centerY.mas_equalTo(view.mas_centerY);
        }];
        
        UITextField *phonetextfield = [[UITextField alloc]init];
        phonetextfield.placeholder = @"请输入手机号";
        [view addSubview:phonetextfield];
        phonetextfield.textAlignment = NSTextAlignmentRight;
        [phonetextfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titlelable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.right.mas_equalTo(addbtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-5));
            make.height.mas_equalTo(view.mas_height);
            make.centerY.mas_equalTo(view.mas_centerY);
        }];
        phonetextfield.textColor= ZJCOLOR.color_c4;
        phonetextfield.font = SYSTEM_REGULARFONT(13);
        self.phoneTextfiled= phonetextfield;
        phonetextfield.keyboardType = UIKeyboardTypePhonePad;
        phonetextfield.delegate =self;
    }else if (indexpath.row ==2)
    {
        if (_VcType == addressType) {
            UIButton *jiantoubtn = [[UIButton alloc]init];
            [jiantoubtn setImage:ZJIMAGE(IMAGEFILEPATH_MINE, @"mine_moreitem", ZJProjectLoadImageDefault).firstObject forState:UIControlStateNormal];
            [jiantoubtn addTarget:self action:@selector(clickjaintouaddressorgin:) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:jiantoubtn];
            
            [jiantoubtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22)));
                make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
                make.centerY.mas_equalTo(view.mas_centerY);
            }];
            
            UILabel *addressrigionlable = [[UILabel alloc]init];
            addressrigionlable.text = @"请选择";
            addressrigionlable.textColor = ZJCOLOR.color_c5;
            addressrigionlable.font = SYSTEM_REGULARFONT(13);
            [view addSubview:addressrigionlable];
            addressrigionlable.textAlignment = NSTextAlignmentRight;
            
            [addressrigionlable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(titlelable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
                make.right.mas_equalTo(jiantoubtn.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-10));
                make.height.mas_equalTo(view.mas_height);
                make.centerY.mas_equalTo(view.mas_centerY);
            }];
            self.addressorginlable = addressrigionlable;
            addressrigionlable.userInteractionEnabled = YES;
            addressrigionlable.textColor= ZJCOLOR.color_c4;
            addressrigionlable.font = SYSTEM_REGULARFONT(13);
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickaddressOrigin:)];
            [addressrigionlable addGestureRecognizer:tap];
            
        }else if (_VcType == pickPersonType){
            UITextField *idcardtextfield = [[UITextField alloc]init];
            idcardtextfield.placeholder = @"请输入身份证号码";
            [view addSubview:idcardtextfield];
            idcardtextfield.textAlignment = NSTextAlignmentRight;
            [idcardtextfield mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(titlelable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
                make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
                make.height.mas_equalTo(view.mas_height);
                make.centerY.mas_equalTo(view.mas_centerY);
            }];
            idcardtextfield.textColor= ZJCOLOR.color_c4;
            idcardtextfield.font = SYSTEM_REGULARFONT(13);
            self.idcardTextfiled = idcardtextfield;
        }
    }else if (indexpath.row ==3)
    {
        YBPlaceHolderTextView *addressDeatilTextview = [[YBPlaceHolderTextView alloc]init];
        addressDeatilTextview.textColor= ZJCOLOR.color_c4;
        addressDeatilTextview.font = SYSTEM_REGULARFONT(13);
        addressDeatilTextview.showsVerticalScrollIndicator = FALSE;
        [view addSubview:addressDeatilTextview];
        addressDeatilTextview.placeholder = @"请填写详细地址";
        [addressDeatilTextview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.right.mas_equalTo(view).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.height.mas_equalTo(view.mas_height).mas_offset(-1);
            make.centerY.mas_equalTo(view.mas_centerY);
        }];
        self.addressDeatilTextview = addressDeatilTextview;
    }else if (indexpath.row == 4){
        
        UITextField *idcardtextfield = [[UITextField alloc]init];
        idcardtextfield.placeholder = @"请输入身份证号码";
        [view addSubview:idcardtextfield];
        idcardtextfield.textAlignment = NSTextAlignmentRight;
        [idcardtextfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titlelable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.right.mas_equalTo(view.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.height.mas_equalTo(view.mas_height);
            make.centerY.mas_equalTo(view.mas_centerY);
//            make.top.mas_equalTo(view.mas_top).mas_offset(ADJUST_PERCENT_FLOAT(0.5));
        }];
        idcardtextfield.textColor= ZJCOLOR.color_c4;
        idcardtextfield.font = SYSTEM_REGULARFONT(13);
        self.idcardTextfiled = idcardtextfield;
        
    }
    
    return view;
}

#pragma mark - Seventh.懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource  = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}

@end
