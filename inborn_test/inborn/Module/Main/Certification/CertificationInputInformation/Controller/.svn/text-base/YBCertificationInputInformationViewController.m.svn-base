//
//  YBCertificationInputInformationViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertificationInputInformationViewController.h"
#import "YBRightImageButton.h"
#import "YBVerticalButton.h"
#import "ZJMineService.h"
#import "MOFSPickerManager.h"
#import "ZJBaseBarButtonItem.h"
#import "YBTopAlert.h"
#import "User_LocalData.h"
#import "YBCertificationResultViewController.h"
#import "YBStringTool.h"

@interface YBCertificationInputInformationViewController ()

/**
 顶部提示信息button
 */
@property (weak, nonatomic) IBOutlet YBDefaultButton *titleTipsButton;

/**
 真实姓名输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

/**
 身份证输入框
 */
@property (weak, nonatomic) IBOutlet UITextField *idCardTextField;

/**
 titlelaebl集合
 */
@property (strong, nonatomic) IBOutletCollection(YBDefaultLabel) NSArray *titleLabelsArray;

/**
 选择有效期button
 */
@property (weak, nonatomic) IBOutlet YBDefaultButton *selectedDateButton;

/**
 底部分割线集合
 */
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *bottomMarginLineViewArray;

/**
 永久button
 */
@property (weak, nonatomic) IBOutlet YBRightImageButton *foreverButton;

/**
 下一步按钮
 */
@property (weak, nonatomic) IBOutlet YBDefaultButton *nextButton;

/**
 实名认证后，您的账户将得到更完整的保护.....
 */
@property (weak, nonatomic) IBOutlet YBDefaultLabel *tipsLabelSafeLabel;

/**
 优势titleLabel
 */
@property (weak, nonatomic) IBOutlet YBDefaultLabel *advantageTitleLabel;

/**
 tipsButton集合
 */
@property (strong, nonatomic) IBOutletCollection(YBVerticalButton) NSArray *tipsButtonArray;

/**
 身份证有效日期
 */
@property (nonatomic, copy) NSString *idCardTimeStr;

//** =========================================================================================== */
//** ============================================布局=========================================== */
//** =========================================================================================== */

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleButtonHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *informationViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextButtonHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsLabelSafeTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *advantageTitleLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsButtonHeightCons;

@end

@implementation YBCertificationInputInformationViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (IBAction)buttonClick:(UIButton *)sender
{
    if (sender.tag == 1001) {
        
        /**
         *  选择有效期
         */
        [[MOFSPickerManager shareManger] showDatePickerWithTag:3 datePickerMode:UIDatePickerModeDate commitBlock:^(NSDate *date) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
            NSString *strDate = [dateFormatter stringFromDate:date];
            
            NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
            [dateFormatter2 setDateFormat:@"YYYYMMDD"];
            self.idCardTimeStr = [dateFormatter2 stringFromDate:date];
            
            [self.selectedDateButton setTitle:[strDate componentsSeparatedByString:@" "][0] forState:UIControlStateNormal];
            [self.selectedDateButton setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
        } cancelBlock:^{
        }];
    }
    
    if (sender.tag == 1002) {
        
        /**
         *  选择长期
         */
        sender.selected = !sender.selected;
    }
    
    if (sender.tag == 1003) {
        
        /**
         *  下一步
         */
        [[ZJMineService share] doCertWithName:self.userNameTextField.text
                                       idCard:self.idCardTextField.text
                                typeExpIdcard:[NSString stringWithFormat:@"%zd", self.foreverButton.selected]
                               validPeriodEnd:self.idCardTimeStr
                                      success:^(id objc, id requestInfo) {
                                          
                                          YBLog(@"%@\n%@", objc, requestInfo);
                                          if ([objc[@"status"] isEqualToString:@"1"]) {
                                           
                                              [User_LocalData setUserDataWith:@{@"idcardStatus":@"2",
                                                                                @"name":[self.userNameTextField.text ex_replaceStringWithReplaceString:@"*" startLocation:0 lenght:1],
                                                                                @"idCard":[self.idCardTextField.text ex_replaceStringWithReplaceString:@"*" startLocation:1 lenght:self.idCardTextField.text.length - 1]}];
                                              YBCertificationResultViewController *certificationResult = [[YBCertificationResultViewController alloc] init];
                                              [self.navigationController pushViewController:certificationResult animated:YES];
                                          }else{
                                              [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"错误")
                                                                                      tipsStringKey:objc[@"errorMsg"]
                                                                                               type:YBTopAlertError
                                                                                 eventCallBackBlock:^(id sender) {
                                                                                     
                                                                                 }];
                                          
                                          }
                                          
                                      } fail:^(id error, id requestInfo) {
                                          YBLog(@"%@\n%@", error, requestInfo);
                                          [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"错误")
                                                                                  tipsStringKey:[error userInfo][@"errorInfo"]
                                                                                           type:YBTopAlertError
                                                                             eventCallBackBlock:^(id sender) {
                                                                                 
                                                                             }];
                                      }];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = ZJSTRING(@"实名认证");
    
    [self.titleTipsButton setImage:ZJCURRENTIMAGE(@"",
                                                  @"",
                                                  ZJProjectLoadImageDefault)
                          forState:UIControlStateNormal];
    [self.titleTipsButton setTitle:ZJSTRING(@"请填写真实的身份信息")
                          forState:UIControlStateNormal];
    [self.titleTipsButton setTitleColor:ZJCOLOR.color_c4
                               forState:UIControlStateNormal];
    self.titleTipsButton.titleLabel.font = SYSTEM_REGULARFONT(12.f);
    self.titleTipsButton.backgroundColor = ZJCOLOR.color_c12;
    self.titleTipsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    NSArray *tempArray = @[@{@"titleStringKey":@"真实姓名"},
                           @{@"titleStringKey":@"身份证号"},
                           @{@"titleStringKey":@"身份证有效期"}];
    
    [self.titleLabelsArray enumerateObjectsUsingBlock:^(YBDefaultLabel *  _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
        NSDictionary *dict = tempArray[idx];
        obj.textColor = ZJCOLOR.color_c4;
        obj.font = SYSTEM_REGULARFONT(14.f);
        obj.text = ZJSTRING(dict[@"titleStringKey"]);
    }];
    
    self.userNameTextField.font = SYSTEM_REGULARFONT(13.f);
    self.idCardTextField.font = SYSTEM_REGULARFONT(13.f);
    self.userNameTextField.textAlignment = NSTextAlignmentRight;
    self.idCardTextField.textAlignment = NSTextAlignmentRight;
    self.userNameTextField.placeholder = ZJSTRING(@"请输入真实姓名");
    self.idCardTextField.placeholder = ZJSTRING(@"请输入身份证号");
    
    [self.selectedDateButton setTitleColor:ZJCOLOR.color_c5
                                  forState:UIControlStateNormal];
    [self.selectedDateButton setTitle:ZJSTRING(@"选择有效期")
                             forState:UIControlStateNormal];
    self.selectedDateButton.titleLabel.font = SYSTEM_REGULARFONT(12.f);
    self.selectedDateButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    [self.foreverButton setTitleColor:ZJCOLOR.color_c5
                             forState:UIControlStateNormal];
    [self.foreverButton setTitle:ZJSTRING(@"长期")
                        forState:UIControlStateNormal];
    
    [self.foreverButton setImage:ZJIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                         @"authentication_right",
                                         ZJProjectLoadImageDefault).firstObject
                        forState:UIControlStateNormal];
    [self.foreverButton setImage:ZJIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                         @"authentication_right",
                                         ZJProjectLoadImageDefault).lastObject
                        forState:UIControlStateSelected];
    
    self.foreverButton.titleLabel.font = SYSTEM_REGULARFONT(12.f);
    
    [self.bottomMarginLineViewArray enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj,
                                                                 NSUInteger idx,
                                                                 BOOL * _Nonnull stop) {
        obj.backgroundColor = ZJCOLOR.color_c16;
    }];
    
    [self.nextButton setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                                @"public_next_btn",
                                                ZJProjectLoadImageDefault).firstObject
                               forState:UIControlStateNormal];
    [self.nextButton setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                                @"public_next_btn",
                                                ZJProjectLoadImageDefault).lastObject
                               forState:UIControlStateHighlighted];
    [self.nextButton setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                                @"public_next_btn",
                                                ZJProjectLoadImageDefault)[1]
                               forState:UIControlStateDisabled];
    [self.nextButton setTitle:ZJSTRING(@"下一步")
                     forState:UIControlStateNormal];
    self.nextButton.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    
    self.tipsLabelSafeLabel.text = ZJSTRING(@"实名认证后，您的账户将得到更完整的保护，支付更安全");
    self.tipsLabelSafeLabel.backgroundColor = ZJCOLOR.color_c12;
    self.tipsLabelSafeLabel.font = SYSTEM_REGULARFONT(12.f);
    self.tipsLabelSafeLabel.textColor = ZJCOLOR.color_c5;
    
    self.advantageTitleLabel.text = ZJSTRING(@"实名认证优势");
    self.advantageTitleLabel.backgroundColor = ZJCOLOR.color_c12;
    self.advantageTitleLabel.font = SYSTEM_REGULARFONT(14.f);
    self.advantageTitleLabel.textColor = ZJCOLOR.color_c5;
    
    NSArray *dataArray = @[@{@"titleStringKey":@"保障账户安全",
                             @"imageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"imageNamed":@"authenticaticon_safe_icon"},
                           @{@"titleStringKey":@"专属优惠",
                             @"imageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"imageNamed":@"authenticaticon_sale_icon"},
                           @{@"titleStringKey":@"支付更便捷",
                             @"imageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"imageNamed":@"authenticaticon_card_icon"}];
    
    [self.tipsButtonArray enumerateObjectsUsingBlock:^(YBDefaultButton *  _Nonnull obj,
                                                       NSUInteger idx,
                                                       BOOL * _Nonnull stop) {
        NSDictionary *dict = dataArray[idx];
        obj.userInteractionEnabled = NO;
        [obj setImage:ZJCURRENTIMAGE(dict[@"imageFilePath"],
                                     dict[@"imageNamed"],
                                     ZJProjectLoadImageDefault)
             forState:UIControlStateNormal];
        [obj setTitle:ZJSTRING(dict[@"titleStringKey"])
             forState:UIControlStateNormal];
        obj.titleLabel.font = SYSTEM_REGULARFONT(12.f);
        [obj setTitleColor:ZJCOLOR.color_c5
                  forState:UIControlStateNormal];
    }];
    
    self.view.backgroundColor = ZJCOLOR.color_c12;
    self.titleButtonHeightCons.constant = ADJUST_PERCENT_FLOAT(32.f);
    self.informationViewHeightCons.constant = ADJUST_PERCENT_FLOAT(44.f);
    self.leftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.rightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.titleLabelWidthCons.constant = ADJUST_PERCENT_FLOAT(103.f);
    self.nextButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(46.5);
    self.nextButtonHeightCons.constant = ADJUST_PERCENT_FLOAT(44.f);
    self.tipsLabelSafeTopMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.advantageTitleLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(76.f);
    self.tipsButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(28.f);
    self.tipsButtonHeightCons.constant = ADJUST_PERCENT_FLOAT(50.f);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    ZJBaseBarButtonItem *backButtonItem                 = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_back"
                                                                                                     callBack:^(id sender) {
                                                                                                         
                                                                                                         [self.navigationController popToRootViewControllerAnimated:YES];
                                                                                                         
                                                                                                     }];
    backButtonItem.offSet = YES;
    self.navigationItem.leftBarButtonItem     = backButtonItem;
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
