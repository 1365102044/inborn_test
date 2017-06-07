//
//  YBPenToPayController.m
//  inborn
//
//  Created by 郑键 on 17/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPenToPayController.h"
#import "YBPaymentViewModel.h"
#import "YBAttributedStringLabel.h"
#import "ZJBaseBarButtonItem.h"
#import "YBStringTool.h"
#import "YBGoodsDeatilNaviMoreView.h"
#import "MQCustomerServiceManager.h"
#import "YBStringTool.h"

@interface YBPenToPayController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet ZJBaseImageView *payTypeLogoImageView;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet YBDefaultButton *payButton;

@property (strong, nonatomic) IBOutletCollection(YBDefaultLabel) NSArray *firstSectionTitleLabelArray;
@property (strong, nonatomic) IBOutletCollection(ZJBaseLabel) NSArray *firstSectionDetailLabelArray;

@property (strong, nonatomic) IBOutletCollection(YBDefaultLabel) NSArray *secondSectionTitleLabelArray;
@property (strong, nonatomic) IBOutletCollection(YBDefaultLabel) NSArray *secondSectionDetailLabelArray;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *bottomLineArray;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *footerButtonTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *footerButtonLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *footerButtonRightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *footerButtonHeightCons;

@end

@implementation YBPenToPayController

#pragma mark - First.通知

- (void)textFieldDidChanged:(NSNotification *)no
{
    /**
     *  判断输入金额
     */
    YBDefaultLabel *titleLabel = self.secondSectionTitleLabelArray.lastObject;
    if (self.amountTextField.text.integerValue < 2000) {
        
        titleLabel.text = @"金额低于最低分笔限额，单笔不能低于2000元";
        self.payButton.enabled = NO;
    }else if (self.amountTextField.text.integerValue * 100 > self.paymentViewModel.paymentModel.payAmount.integerValue) {
        
        /**
         *  大于付款金额
         */
            titleLabel.text = @"金额大于应付金额";
            self.payButton.enabled = NO;
    }else{
        titleLabel.text = [NSString stringWithFormat:@"应付金额为：¥%@",
                           [[YBStringTool share] strmethodCommaWith:self.paymentViewModel.paymentModel.payAmount]];
        self.payButton.enabled = YES;
    }
}

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)tapClick:(UIGestureRecognizer *)tap
{
    self.amountTextField.text = [NSString stringWithFormat:@"%zd", self.paymentViewModel.paymentModel.payAmount.integerValue / 100];
    self.payButton.enabled = YES;
}

- (IBAction)payButtonClick:(ZJBaseButton *)sender
{
    /**
     *  发起支付请求
     *  当为认证支付时，调用认证支付的预支付接口
     */
    if (self.paymentViewModel.paymentType == ZJProjectPaymentCertified) {
        
        [self.paymentViewModel certifiedPayAmont:[NSString stringWithFormat:@"%.0f", self.amountTextField.text.floatValue * 100] sourceController:self];
        
    }else{
        [self.paymentViewModel payAmont:[NSString stringWithFormat:@"%.0f", self.amountTextField.text.floatValue * 100] sourceController:self];
    }
}

#pragma mark - Fourth.代理方法

#pragma mark <UITextFieldDelegate>

#pragma mark - Fifth.控制器生命周期

- (instancetype)init
{
    if (self == [super init]) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:NSStringFromClass([YBPenToPayController class])
                                                     bundle:nil];
        self = [sb instantiateInitialViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomUI];
    
    [self setupFirstSection];
    [self setupSecondSection];
    [self setupBottomButton];
    
    /**
     *  配置底边线
     */
    [self.bottomLineArray enumerateObjectsUsingBlock:^(ZJBaseView *  _Nonnull obj,
                                                       NSUInteger idx,
                                                       BOOL * _Nonnull stop) {
        obj.backgroundColor = ZJCOLOR.color_c16;
    }];
    
    ZJBaseBarButtonItem *rightButtonItem                = [ZJBaseBarButtonItem barButtonItemWithImageFilePath:IMAGEFILEPATH_PUBLIC
                                                                                                   imageNamed:@"public_more"
                                                                                                     callBack:^(id sender) {
                                                                                                         [self clickRightItem];
                                                                                                         
                                                                                                     }];
    self.navigationItem.rightBarButtonItem              = rightButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [SYSTEM_NOTIFICATIONCENTER addObserver:self
                                  selector:@selector(textFieldDidChanged:)
                                      name:UITextFieldTextDidChangeNotification
                                    object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self
                                         name:UITextFieldTextDidChangeNotification
                                       object:nil];
}

/**
 点击 更多rightitem
 */
- (void)clickRightItem
{
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
    
}
#pragma mark - Sixth.界面配置

- (void)setupCustomUI
{
    self.tableView.backgroundColor = ZJCOLOR.color_c12;
    self.tableView.contentInset = UIEdgeInsetsMake(ADJUST_PERCENT_FLOAT(-20.f), 0, 0, 0);
    self.navigationItem.title = ZJSTRING(@"确认分笔金额");
}

- (void)setupFirstSection
{
    /**
     *  配置1组数据
     */
    NSArray *section1TempArray = self.paymentViewModel.penToPayDataArray.firstObject[@"data"];
    [self.firstSectionTitleLabelArray enumerateObjectsUsingBlock:^(ZJBaseLabel *  _Nonnull obj,
                                                                   NSUInteger idx,
                                                                   BOOL * _Nonnull stop) {
        YBPaymentModel *model = section1TempArray[idx];
        YBDefaultLabel *detailLabel = self.firstSectionDetailLabelArray[idx];
        
        obj.textColor = model.textColor;
        obj.font = model.font;
        obj.text = model.title;
        
        detailLabel.textColor = model.detailTextColor;
        detailLabel.font = model.detailTextFont;
        if (idx == 1) {
            YBAttributedStringLabel *attrLabel = (YBAttributedStringLabel *)detailLabel;
            [attrLabel setAttributedStringWithContentArray:@[@{@"color" : ZJCOLOR.color_c4,
                                                               @"content" : @"¥",
                                                               @"size" : SYSTEM_REGULARFONT(12.f),
                                                               @"lineSpacing": @0},
                                                             @{@"color" : model.detailTextColor,
                                                               @"content" : [[YBStringTool share] strmethodCommaWith:model.totalAmount],
                                                               @"size" : model.detailTextFont,
                                                               @"lineSpacing": @0}]];
        }else{
            detailLabel.text = model.detailTitle;
        }
    }];
}

- (void)setupSecondSection
{
    /**
     *  配置2组数据
     */
    NSArray *section2TempArray = self.paymentViewModel.penToPayDataArray.lastObject[@"data"];
    [self.secondSectionTitleLabelArray enumerateObjectsUsingBlock:^(ZJBaseLabel *  _Nonnull obj,
                                                                    NSUInteger idx,
                                                                    BOOL * _Nonnull stop) {
        YBPaymentModel *model = section2TempArray[idx];
        
        obj.textColor = model.textColor;
        obj.font = model.font;
        obj.text = model.title;
        
        if (idx >= 2) {
            
            if (idx == 2) {
                self.amountTextField.font = model.detailTextFont;
                self.amountTextField.keyboardType = UIKeyboardTypeNumberPad;
                self.amountTextField.textColor = model.detailTextColor;
            }
            
            YBDefaultLabel *detailLabel = self.secondSectionDetailLabelArray[idx - 2];
            detailLabel.font = model.detailTextFont;
            detailLabel.textColor = model.detailTextColor;
            detailLabel.text = model.detailTitle;
        }
    }];
    
    self.payTypeLogoImageView.image = ZJCURRENTIMAGE(IMAGEFILEPATH_ORDER,
                                                     self.paymentViewModel.paymentLogoImageNamed,
                                                     ZJProjectLoadImageDefault);
    
    YBDefaultLabel *detailLabel = self.secondSectionDetailLabelArray.lastObject;
    detailLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    [detailLabel addGestureRecognizer:tap];
    
    YBDefaultLabel *titleLabel = self.secondSectionTitleLabelArray.lastObject;
    titleLabel.text = [NSString stringWithFormat:@"应付金额为：¥%@",
                       [[YBStringTool share] strmethodCommaWith:self.paymentViewModel.paymentModel.payAmount]];
}

- (void)setupBottomButton
{
    self.payButton.enabled = NO;
    [self.payButton setTitle:[NSString stringWithFormat:@"打开%@付款",
                              self.paymentViewModel.paymentTypeName] forState:UIControlStateNormal];
    [self.payButton setTitleColor:ZJCOLOR.color_c0
                         forState:UIControlStateNormal];
    [self.payButton setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                               @"public_next_btn",
                                               ZJProjectLoadImageDefault).firstObject
                              forState:UIControlStateNormal];
    [self.payButton setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                               @"public_next_btn",
                                               ZJProjectLoadImageDefault).lastObject
                              forState:UIControlStateHighlighted];
    [self.payButton setBackgroundImage:ZJIMAGE(IMAGEFILEPATH_PUBLIC,
                                               @"public_next_btn",
                                               ZJProjectLoadImageDefault)[1]
                              forState:UIControlStateDisabled];
    self.payButton.titleLabel.font = SYSTEM_REGULARFONT(14.f);
    
    
    self.footerButtonHeightCons.constant = ADJUST_PERCENT_FLOAT(44.f);
    self.footerButtonTopMarginCons.constant = ADJUST_PERCENT_FLOAT(30.f);
    self.footerButtonLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.footerButtonRightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
}

#pragma mark - Seventh.懒加载

@end
