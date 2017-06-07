//
//  YBCommitLogitcsViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCommitLogitcsViewController.h"
#import "YBCommitLogitcsTableViewCell.h"
#import "YBLogitcsCompayAndNumberTableViewCell.h"
#import "YBAppraisalApplyReturnTableViewCell.h"
#import "YBLogitcsCompayAndNumberTableViewCell.h"
#import "YBAppraisalService.h"
#import "YBAppraisalModel.h"
#import "MOFSPickerView.h"
#import "YBTopAlert.h"
#import "YBAddressAndPickListViewController.h"
#import "YBAddressAndPickPersonModel.h"
#import "YXPayZBarViewController.h"
#import "YBAddressAndPickpersonService.h"
#import "YBAddNewAddressOrPickpersonViewController.h"
#import "YBMySellOutService.h"
#import "YBSupplyNumberTableViewCell.h"

static NSString *GOODSIMAGECELLINDIFTER = @"GOODSIMAGECELLINDIFTER";
static NSString *LOGINTCSCOMPANYORNUMBERINDIFITER = @"LOGINTCSCOMPANYORNUMBERINDIFITER";
static NSString *APPLYRETURNCELLIDIFITER = @"APPLYRETURNCELLIDIFITER";
/**
 提供单号cell
 */
static NSString *SUPPLAYNUMBERCELLINDIFITER = @"SUPPLAYNUMBERCELLINDIFITER";
@interface YBCommitLogitcsViewController ()<YBAddressAndPickListViewControllerDelegate,YBAddNewAddressOrPickpersonViewControllerDelegate>

@property (strong,nonatomic) UIView *footerview;
/**
 当前控制的类型
 */
@property(nonatomic,assign) viewcontrollerType  currentVcType;
/**
 鉴定id
 */
@property(nonatomic,strong) NSString * appraisalId;

@property(nonatomic,strong) YBAppraisalModel * appraisalModel;
/**
 输入的订单号
 */
@property(nonatomic,strong) NSString * deliverNumber;

/**
 物流公司的数组
 */
@property(nonatomic,strong) NSMutableArray * logitcsComArr;
/**
 物流公司的数组ID
 */
@property(nonatomic,strong) NSMutableArray * logitcsComIDArr;

/**
 选中的物流公司
 */
@property(nonatomic,strong) NSString * selsectLogintcsCom;

/**
 物流方式 （来店自提，快递送货）
 */
@property(nonatomic,strong) NSString * logitcsTypeStr;

/**
 地址和提货人数据模型
 */
@property (nonatomic, strong) YBAddressAndPickPersonModel * addressOrPickModel;

@property(nonatomic,strong) YBAppraisalApplyReturnTableViewCell * addreorPickInforCell;

/**
 最新的addreID
 */
@property(nonatomic,strong) NSString * NowAddressId;
@property(nonatomic,strong) NSString * NowPickId;
/**
 提货人信息数据 大模型
 */
@property(nonatomic,strong) YBAddressBaseModel * addressDataBaseModel;

/**
 是否有提货人信息 1 有； 0 没有
 */
@property(nonatomic,assign) NSInteger  havePick;

@property(nonatomic,assign) NSInteger  haveAddre;


@end

@implementation YBCommitLogitcsViewController

#pragma mark - First.通知

#pragma mark - Second.赋值


#pragma mark  *** 网络请求

/**
 进入后 获取的页面信息
 */
- (void)requestInfor
{
    if (_currentVcType == CommitLogitcsType ||
        _currentVcType == SendAppraisalType) {
        [[YBAppraisalService share] GetCommitLogiticsInforWithappraisalId:_appraisalId
                                                                  success:^(id objc, id requestInfo) {
                                                                      self.appraisalModel = [YBAppraisalModel modelWithDictionary:objc[@"data"]];
                                                                      self.NowAddressId = self.appraisalModel.addrId;
                                                                      [self getlogintcsComArr];
                                                                      self.appraisalModel.VCType = _currentVcType;
                                                                      [self.tableView reloadData];
                                                                  } fail:^(id error, id requestInfo) {
                                                                      
                                                                  }];
    }else if(_currentVcType == ApplyReturnType){
        [[YBAppraisalService share] AppraisalApplyReturnWithappraisalId:_appraisalId
                                                                success:^(id objc, id requestInfo) {
                                                                    self.appraisalModel = [YBAppraisalModel modelWithDictionary:objc[@"data"]];
                                                                    self.appraisalModel.VCType = _currentVcType;
                                                                    self.NowAddressId = self.appraisalModel.addrId;
                                                                    [self.tableView reloadData];
                                                                } fail:^(id error, id requestInfo) {
                                                                    
                                                                }];
    }else if (_currentVcType == DeliverGoodsType) {
        
        [[YBMySellOutService share] GetMySellOutSendGoodsInforWithorderId:_appraisalId
                                                                  success:^(id objc, id requestInfo) {
                                                                      self.appraisalModel = [YBAppraisalModel modelWithDictionary:objc[@"data"]];
                                                                      self.NowAddressId = self.appraisalModel.addrId;
                                                                      [self getlogintcsComArr];
                                                                      self.appraisalModel.VCType = _currentVcType;
                                                                      [self.tableView reloadData];
                                                                  } fail:^(id error, id requestInfo) {
                                                                      
                                                                  }];
    }
}

/**
 提交信息
 */
- (void)commitData
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
    if (_currentVcType == CommitLogitcsType ||
        _currentVcType == SendAppraisalType ||
        _currentVcType == DeliverGoodsType) {
        
        if (self.selsectLogintcsCom == nil ||self.selsectLogintcsCom.length == 0) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                                    tipsStringKey:ZJSTRING(@"物流公司不能为空")
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                               }];
            return;
        }
        
        if (self.deliverNumber == nil || self.deliverNumber.length == 0) {
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                                    tipsStringKey:ZJSTRING(@"物流单号不能为空")
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                               }];
            return;
        }
        NSString *expComId = @"";
        if ([self.logitcsComArr containsObject:self.selsectLogintcsCom]) {
            NSInteger index = [self.logitcsComArr indexOfObject:self.selsectLogintcsCom];
            expComId = [self.logitcsComIDArr objectAtIndex:index];
        }
        
        if (_currentVcType == CommitLogitcsType ||
            _currentVcType == SendAppraisalType) {
            /**
             提交物流，送鉴， 提交单号
             */
            [[YBAppraisalService share] AppraisalCommitLogiticsInforWithappraisalId:_appraisalId
                                                                           expComId:expComId
                                                                        deliveryNum:_deliverNumber
                                                                            success:^(id objc, id requestInfo) {
                                                                                [self.navigationController popViewControllerAnimated:YES];
                                                                            } fail:^(id error, id requestInfo) {
                                                                                
                                                                            }];
            
        }else if (_currentVcType == DeliverGoodsType){
            /**
             发货
             */
            [[YBMySellOutService share] GetMySellOutCommitSendGoodsInforWithorderId:_appraisalId
                                                                        deliveryNum:_deliverNumber
                                                                           expComId:expComId
                                                                            success:^(id objc, id requestInfo) {
                                                                                if (self.refreshOrderDeatilBlck) {
                                                                                    self.refreshOrderDeatilBlck();
                                                                                }
                                                                                   [self.navigationController popViewControllerAnimated:YES];
                                                                            } fail:^(id error, id requestInfo) {
                                                                                
                                                                            }];
        }
    }else if (_currentVcType == ApplyReturnType){
        NSString *logitscType ;
        NSString *alearStr;
        NSString *nowAddreOrPickId ;
        if ([self.logitcsTypeStr isEqualToString:@"来店自提"]) {
            nowAddreOrPickId = self.NowPickId;
            alearStr = @"自提人信息不能为空";
            logitscType = @"0";

            if (!self.NowPickId) {
                [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                                        tipsStringKey:ZJSTRING(alearStr)
                                                                 type:YBTopAlertError
                                                   eventCallBackBlock:^(id sender) {
                                                   }];
                return;
            }
        }else{
            logitscType = @"1";
            alearStr = @"收货人信息不能为空";
            nowAddreOrPickId = self.NowAddressId;
            if (!self.NowAddressId) {
                [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ALERT_TITLE_ERROR_STRINGKEY
                                                        tipsStringKey:ZJSTRING(alearStr)
                                                                 type:YBTopAlertError
                                                   eventCallBackBlock:^(id sender) {
                                                   }];
                return;
            }
        }
        
        [[YBAppraisalService share] AppraisalConfirmReturnWithappraisalId:_appraisalId
                                                                addressId:nowAddreOrPickId
                                                             deliveryType:logitscType
                                                                  depotId:_appraisalModel.depotId
                                                               refundType:@"1"
                                                                  success:^(id objc, id requestInfo) {
                                                                      
                                                                      if (self.callBackBlock) {
                                                                          self.callBackBlock(nil);
                                                                      }
                                                                      
                                                                      [self.navigationController popViewControllerAnimated:YES];
                                                                  } fail:^(id error, id requestInfo) {
                                                                      
                                                                  }];
    }
}

/**
 查询提货人的列表接口
 */
- (void)getPickerPersonInforListData
{
    [[YBAddressAndPickpersonService share] getAddressOrPickpersonListInfoWithcurPage:1
                                                                            pageSize:1
                                                                         addressType:@"2"
                                                                             Success:^(id objc, id requestInfo) {
                                                                                 self.addressDataBaseModel = [YBAddressBaseModel modelWithDictionary:objc[@"data"]];
                                                                                 if (self.addressDataBaseModel.totalRows == 0) {
                                                                                     self.havePick = 0;
                                                                                     self.addreorPickInforCell.addressOrPickModel = nil;
                                                                                     self.NowPickId = nil;
                                                                                 }else{
                                                                                     self.havePick = 1;
                                                                                     self.addressOrPickModel = self.addressDataBaseModel.dataModelArr[0];
                                                                                     self.addressOrPickModel.modelType = @"pick";
                                                                                     self.addreorPickInforCell.addressOrPickModel = self.addressOrPickModel;
                                                                                     self.NowPickId = self.addressOrPickModel.customId;
                                                                                 }
                                                                             } fail:^(id error, id requestInfo) {
                                                                                 
                                                                             }];
}

/**
 查询地址的列表接口
 */
- (void)getAddressInforListData
{
    [[YBAddressAndPickpersonService share] getAddressOrPickpersonListInfoWithcurPage:1
                                                                            pageSize:1
                                                                         addressType:@"1"
                                                                             Success:^(id objc, id requestInfo) {
                                                                                 self.addressDataBaseModel = [YBAddressBaseModel modelWithDictionary:objc[@"data"]];
                                                                                 if (self.addressDataBaseModel.totalRows == 0) {
                                                                                     self.haveAddre = 0;
                                                                                     self.appraisalModel.hasAddress = 0;
                                                                                     self.addreorPickInforCell.addressOrPickModel = nil;
                                                                                     self.NowAddressId = nil;
                                                                                 }else{
                                                                                     self.haveAddre = 1;
                                                                                     self.addressOrPickModel = self.addressDataBaseModel.dataModelArr[0];
                                                                                     self.addressOrPickModel.modelType = @"addre";
                                                                                     self.addreorPickInforCell.addressOrPickModel = self.addressOrPickModel;
                                                                                     self.NowAddressId = self.addressOrPickModel.customId;
                                                                                 }
                                                                             } fail:^(id error, id requestInfo) {
                                                                                 
                                                                             }];
}

/**
 获取物流公司数据
 */
- (void)getlogintcsComArr
{
    for (NSDictionary *dic in self.appraisalModel.expressList) {
        [self.logitcsComArr addObject:dic[@"expComName"]];
        [self.logitcsComIDArr addObject:dic[@"id"]];
    }
    if (self.logitcsComArr.count > 0) {
        self.selsectLogintcsCom = self.logitcsComArr[0];
    }
}

#pragma mark - Third.点击事件
- (void)clickCommitBtn:(UIButton *)sender
{
    [self commitData];
}

/**
 选择物流公司
 */
- (void)chooseLogitcsCompany
{
    [[YBTopAlert sharedAlert] hiddenAlert];
    [[[MOFSPickerView alloc]init] showMOFSPickerViewWithDataArray:self.logitcsComArr
                                                      commitBlock:^(NSString *string) {
                                                          self.selsectLogintcsCom = string;
                                                          [self.tableView reloadSection:1 withRowAnimation:UITableViewRowAnimationNone];
                                                      } cancelBlock:^{
                                                      }];
}

/**
 扫码
 */
- (void)ClickScanBtn
{
    YXPayZBarViewController *scanvc = [[YXPayZBarViewController alloc]init];
    scanvc.sourceViewController = self;
    scanvc.vctitle = @"扫一扫";
    scanvc.formePCPayurlBlock = ^(NSString *URL) {
        self.deliverNumber = URL;
        [self.tableView reloadSection:1 withRowAnimation:UITableViewRowAnimationNone];
    };
    [self.navigationController pushViewController:scanvc animated:YES];
}

/**
 去选择信息列表选择
 */
- (void)togoChooseInfor
{
    if ([self.logitcsTypeStr isEqualToString:@"来店自提"]) {
        if (self.havePick == 1) {
            YBAddressAndPickListViewController * pickerVC = [YBAddressAndPickListViewController creatAddressAndPickPersonViewControllerWithType:pickPersonType
                                                                                                                                         Extend:self];
            pickerVC.delegate = self;
            [self.navigationController pushViewController:pickerVC animated:YES];
        }else{
            YBAddNewAddressOrPickpersonViewController *addNewAddressorPickvc = [YBAddNewAddressOrPickpersonViewController creatAddNewViewControllerWith:pickPersonType
                                                                                                                                                 Extend:nil];
            addNewAddressorPickvc.delegate = self;
            [self.navigationController pushViewController:addNewAddressorPickvc animated:YES];
        }
        
    }else{
        
        if (self.appraisalModel.hasAddress == 1) {
            YBAddressAndPickListViewController * addressVC = [YBAddressAndPickListViewController creatAddressAndPickPersonViewControllerWithType:addressType
                                                                                                                                          Extend:self];
            addressVC.delegate  = self;
            [self.navigationController pushViewController:addressVC animated:YES];
        }else{
            YBAddNewAddressOrPickpersonViewController *addNewAddressorPickvc = [YBAddNewAddressOrPickpersonViewController creatAddNewViewControllerWith:addressType
                                                                                                                                                 Extend:nil];
            addNewAddressorPickvc.delegate = self;
            [self.navigationController pushViewController:addNewAddressorPickvc animated:YES];
        }
    }
}

/**
 选择信息后的 回调代理
 */
- (void)addressAndPickListViewController:(YBAddressAndPickListViewController *)addressAndPickListViewController
                            addressModel:(YBAddressAndPickPersonModel *)addressModel
{
    if (addressModel == nil) {
        
        if ([self.logitcsTypeStr isEqualToString:@"来店自提"]) {
            [self getPickerPersonInforListData];
        }else{
            [self getAddressInforListData];
        }
    }else{
        if(addressModel.addrType == 1){
            self.appraisalModel.hasAddress = 1;
        }else if (addressModel.addrType == 2){
            self.havePick = 1;
        }
        self.addressOrPickModel = addressModel;
        self.addreorPickInforCell.addressOrPickModel = addressModel;
        
        if ([addressModel.modelType isEqualToString:@"addre"]) {
            self.NowAddressId = addressModel.customId;
        }else {
            self.NowPickId = addressModel.customId;
        }
    }
}

/**
 当独立使用添加地址控制器时，添加地址完成的回调方法
 
 @param addNewAddressOrPickpersonViewController         addNewAddressOrPickpersonViewController
 @param newAddressModel newAddressModel                 新添加的地址模型
 */
- (void)addNewAddressOrPickpersonViewController:(YBAddNewAddressOrPickpersonViewController *)addNewAddressOrPickpersonViewController
                                newAddressModel:(YBAddressAndPickPersonModel *)newAddressModel
{
    self.addressOrPickModel = newAddressModel;
    self.addreorPickInforCell.addressOrPickModel = newAddressModel;
    if ([newAddressModel.modelType isEqualToString:@"addre"]) {
        self.NowAddressId = newAddressModel.customId;
    }else {
        self.NowPickId = newAddressModel.customId;
    }
    self.havePick = 1;
}

#pragma mark - Fourth.代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        if (_currentVcType == ApplyReturnType) return 1;
        else return 2;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return ADJUST_PERCENT_FLOAT(10);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) return ADJUST_PERCENT_FLOAT(90);
        if (indexPath.row == 1) return self.appraisalModel.addressHeight > 37 ? ADJUST_PERCENT_FLOAT(101) + self.appraisalModel.addressHeight - 30 :  ADJUST_PERCENT_FLOAT(101);
    }else if (indexPath.section == 1){
        if (_currentVcType == CommitLogitcsType ||
            _currentVcType == SendAppraisalType ||
            _currentVcType == DeliverGoodsType) {
            return ADJUST_PERCENT_FLOAT(92);
        }else if (_currentVcType == AppraisalOrderType){
            return ADJUST_PERCENT_FLOAT(150);
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            YBCommitLogitcsTableViewCell *cell = [[YBCommitLogitcsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GOODSIMAGECELLINDIFTER"];
            if (self.appraisalModel) cell.appraisalModel = self.appraisalModel;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            YBSupplyNumberTableViewCell *cell = [[YBSupplyNumberTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SUPPLAYNUMBERCELLINDIFITER];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            if (self.appraisalModel) cell.dataModel = self.appraisalModel;
            return cell;
        }
    }else if(indexPath.section == 1){
        if (_currentVcType == CommitLogitcsType ||
            _currentVcType == DeliverGoodsType ||
            _currentVcType == SendAppraisalType) {
            YBLogitcsCompayAndNumberTableViewCell *cell = [[YBLogitcsCompayAndNumberTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LOGINTCSCOMPANYORNUMBERINDIFITER"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setviewGetDeliverNumblock:^(NSString *delivernum) {
                self.deliverNumber = delivernum;
            } chooseLogitcsBlock:^{
                [self chooseLogitcsCompany];
            } clickScanBtnBlcok:^{
                [self ClickScanBtn];
            }];
            
            if (self.logitcsComArr.count>0) {
                cell.DefultLogitcsCom = self.logitcsComArr[0];
            }
            if (self.selsectLogintcsCom) {
                [cell.chooselogintcsBtn setTitle:ZJSTRING(self.selsectLogintcsCom) forState:UIControlStateNormal];
            }
            if (self.deliverNumber) {
                cell.ScanDeliverNumber = self.deliverNumber;
            }
            return cell;
        }else if (_currentVcType == ApplyReturnType){
            YBAppraisalApplyReturnTableViewCell *cell = [[YBAppraisalApplyReturnTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"APPLYRETURNCELLIDIFITER"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell setapplyViewblock:^{
                [self togoChooseInfor];
            } clickInforViewBlock:^{
                [self togoChooseInfor];
            } chooselogitcsTypeBlock:^(NSString *types) {
                self.logitcsTypeStr = types;
                if ([types isEqualToString:@"来店自提"]) {
                    [self getPickerPersonInforListData];
                }
            }];
            if (self.appraisalModel) {
                cell.appraisalModel = self.appraisalModel;
            }
            self.addreorPickInforCell = cell;
            return cell;
        }else {
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            return cell;
        }
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        return cell;
    }
}

#pragma mark - Fifth.控制器生命周期

+ (instancetype)creatViewCotrollerWithVcWithtype:(viewcontrollerType)VCtype
                                     appraisalId:(NSString *)appraisalId
                                          extend:(id)extend
{
    YBCommitLogitcsViewController *vc   = [[YBCommitLogitcsViewController alloc]init];
    vc.appraisalId                      = appraisalId;
    vc.currentVcType                    = VCtype;
    return vc;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return  [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    self.title = @"提交物流";
    //    if (_currentVcType == CommitLogitcsType) {
    //    }else if (_currentVcType == ApplyReturnType){
    //        self.title = @"申请退回";
    //    }else if (_currentVcType == SupplyNumberType){
    //        self.title = @"提供单号";
    //    }
    
    self.footerview.frame = CGRectMake(0, 0, SCREEN_WIDTH, ADJUST_PERCENT_FLOAT(80));
    self.tableView.tableFooterView = self.footerview;
    
    [self requestInfor];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (UIView *)footerview {
    if (!_footerview) {
        
        _footerview = [[UIView alloc]init];
        _footerview.backgroundColor = [UIColor clearColor];
        
        UIButton *btn = [[UIButton alloc]init];
        NSString *btnstr;
        if (_currentVcType == CommitLogitcsType ||
            _currentVcType == SendAppraisalType ||
            _currentVcType == DeliverGoodsType) {
            btnstr = @"提交";
        }else if (_currentVcType == ApplyReturnType){
            btnstr = @"确认退回";
        }
        [btn setTitle:ZJSTRING(btnstr) forState:UIControlStateNormal];
        btn.backgroundColor = ZJCOLOR.color_c6;
        btn.titleLabel.font = SYSTEM_REGULARFONT(14);
        [btn addTarget:self action:@selector(clickCommitBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_footerview addSubview:btn];
        btn.layer.cornerRadius = 4;
        btn.layer.masksToBounds = YES;
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_footerview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.mas_equalTo(_footerview.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(-12));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(44));
            make.top.mas_offset(ADJUST_PERCENT_FLOAT(30));
        }];
    }
    return _footerview;
}


- (NSMutableArray *)logitcsComArr {
    if (!_logitcsComArr) {
        _logitcsComArr = [NSMutableArray array];
    }
    return _logitcsComArr;
}
- (NSMutableArray *)logitcsComIDArr {
    if (!_logitcsComIDArr) {
        _logitcsComIDArr = [NSMutableArray array];
    }
    return _logitcsComIDArr;
}

@end
