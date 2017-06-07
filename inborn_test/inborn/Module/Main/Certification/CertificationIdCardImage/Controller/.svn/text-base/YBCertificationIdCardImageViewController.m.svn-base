//
//  YBCertificationIdCardImageViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBCertificationIdCardImageViewController.h"
#import "YBAttributedStringLabel.h"
#import "YBTopAlert.h"

@interface YBCertificationIdCardImageViewController ()

/**
 详情描述
 */
@property (weak, nonatomic) IBOutlet YBAttributedStringLabel *detailLaebl;

/**
 正面照片
 */
@property (weak, nonatomic) IBOutlet YBDefaultButton *faceButton;

/**
 反面照片
 */
@property (weak, nonatomic) IBOutlet YBDefaultButton *backgorundButton;

/**
 分割线title
 */
@property (weak, nonatomic) IBOutlet YBDefaultLabel *marginTitleLabel;

/**
 分割线
 */
@property (strong, nonatomic) IBOutletCollection(ZJBaseView) NSArray *marginLinesArray;

/**
 提示图片数组
 */
@property (strong, nonatomic) IBOutletCollection(ZJBaseImageView) NSArray *tipsImageViewArray;

/**
 提示文字按钮数组
 */
@property (strong, nonatomic) IBOutletCollection(YBDefaultButton) NSArray *tipsTextButtonArray;

/**
 upLoad
 */
@property (nonatomic, strong) YBDefaultButton *uploadButton;

//** =========================================================================================== */
//** ============================================布局=========================================== */
//** =========================================================================================== */

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailLabelTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *idCardLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *idCardRightMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *idCardHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *idCardTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *idCardsMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginTitleTopMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsViewBottomMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsImageViewHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsButtonHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsViewLeftMarginCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tipsViewRightMarginCons;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *tipsViewMarginConsArray;

@end

@implementation YBCertificationIdCardImageViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

- (void)buttonClick:(UIButton *)sender
{
    /**
     *  上传点击
     */
    [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"提示")
                                            tipsStringKey:ZJSTRING(@"点击了上传按钮")
                                                     type:YBTopAlertSuccess eventCallBackBlock:^(id sender) {
        
    }];
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = ZJSTRING(@"上传身份证件");
    self.view.backgroundColor = ZJCOLOR.color_c0;
    
    [self.faceButton setBackgroundImage:ZJCURRENTIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                                       @"authentication_front_bg",
                                                       ZJProjectLoadImageDefault)
                               forState:UIControlStateNormal];
    [self.faceButton setImage:ZJIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                      @"authentication_camera",
                                      ZJProjectLoadImageDefault).firstObject
                     forState:UIControlStateNormal];
    [self.faceButton setImage:ZJIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                      @"authentication_camera",
                                      ZJProjectLoadImageDefault).lastObject
                     forState:UIControlStateHighlighted];
    
    [self.backgorundButton setBackgroundImage:ZJCURRENTIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                                             @"authentication_back_bg",
                                                             ZJProjectLoadImageDefault)
                                     forState:UIControlStateNormal];
    [self.backgorundButton setImage:ZJIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                            @"authentication_camera",
                                            ZJProjectLoadImageDefault).firstObject
                           forState:UIControlStateNormal];
    [self.backgorundButton setImage:ZJIMAGE(IMAGEFILEPATH_AUTHENTICATION,
                                            @"authentication_camera",
                                            ZJProjectLoadImageDefault).lastObject
                           forState:UIControlStateHighlighted];
    
    self.marginTitleLabel.font = SYSTEM_REGULARFONT(12.f);
    self.marginTitleLabel.textColor = ZJCOLOR.color_c4;
    self.marginTitleLabel.text = ZJSTRING(@"拍摄照片要求");
    
    [self.marginLinesArray enumerateObjectsUsingBlock:^(ZJBaseView *  _Nonnull obj,
                                                        NSUInteger idx,
                                                        BOOL * _Nonnull stop) {
        obj.backgroundColor = ZJCOLOR.color_c16;
    }];
    
    NSArray *tipsArray = @[@{@"tipsStringKey":@"标准拍摄",
                             @"imageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"imageNamed":@"authentication_rightphoto_icon",
                             @"iconImageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"iconImageNamed":@"authentication_right_icon"},
                           @{@"tipsStringKey":@"边框缺失",
                             @"imageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"imageNamed":@"authentication_wrongphoto1_icon",
                             @"iconImageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"iconImageNamed":@"authentication_wrong_icon"},
                           @{@"tipsStringKey":@"照片模糊",
                             @"imageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"imageNamed":@"authentication_wrongphoto2_icon",
                             @"iconImageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"iconImageNamed":@"authentication_wrong_icon"},
                           @{@"tipsStringKey":@"闪光强烈",
                             @"imageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"imageNamed":@"authentication_wrongphoto3_icon",
                             @"iconImageFilePath":IMAGEFILEPATH_AUTHENTICATION,
                             @"iconImageNamed":@"authentication_wrong_icon"}];
    [self.tipsImageViewArray enumerateObjectsUsingBlock:^(ZJBaseImageView *  _Nonnull obj,
                                                          NSUInteger idx,
                                                          BOOL * _Nonnull stop) {
        YBDefaultButton *tipsButton = self.tipsTextButtonArray[idx];
        NSDictionary *dict = tipsArray[idx];
        
        obj.image = ZJCURRENTIMAGE(dict[@"imageFilePath"],
                                   dict[@"imageNamed"],
                                   ZJProjectLoadImageDefault);
        tipsButton.titleLabel.font = SYSTEM_REGULARFONT(12.f);
        [tipsButton setTitleColor:ZJCOLOR.color_c4
                         forState:UIControlStateNormal];
        [tipsButton setImage:ZJCURRENTIMAGE(dict[@"iconImageFilePath"],
                                            dict[@"iconImageNamed"],
                                            ZJProjectLoadImageDefault)
                    forState:UIControlStateNormal];
        [tipsButton setTitle:ZJSTRING(dict[@"tipsStringKey"])
                    forState:UIControlStateNormal];
        
    }];
    
    [self.view addSubview:self.uploadButton];
    [self.uploadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.height.mas_equalTo(ADJUST_PERCENT_FLOAT(44.f));
    }];
    
    self.detailLabelTopMarginCons.constant = ADJUST_PERCENT_FLOAT(29.f);
    self.idCardLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(62.f);
    self.idCardRightMarginCons.constant = ADJUST_PERCENT_FLOAT(62.f);
    self.idCardHeightCons.constant = ADJUST_PERCENT_FLOAT(150.f);
    self.idCardTopMarginCons.constant = ADJUST_PERCENT_FLOAT(18.f);
    self.idCardsMarginCons.constant = ADJUST_PERCENT_FLOAT(15.f);
    self.marginTitleTopMarginCons.constant = ADJUST_PERCENT_FLOAT(34.f);
    self.tipsViewHeightCons.constant = ADJUST_PERCENT_FLOAT(79.f);
    self.tipsViewBottomMarginCons.constant = ADJUST_PERCENT_FLOAT(84.f);
    self.tipsImageViewHeightCons.constant = ADJUST_PERCENT_FLOAT(44.f);
    self.tipsButtonHeightCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.tipsViewLeftMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    self.tipsViewRightMarginCons.constant = ADJUST_PERCENT_FLOAT(12.f);
    [self.tipsViewMarginConsArray enumerateObjectsUsingBlock:^(NSLayoutConstraint *  _Nonnull obj,
                                                               NSUInteger idx,
                                                               BOOL * _Nonnull stop) {
        obj.constant = ADJUST_PERCENT_FLOAT(22.f);
    }];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

- (YBDefaultButton *)uploadButton
{
    if (!_uploadButton) {
        _uploadButton = [YBDefaultButton buttonFourthWithTitleStringKey:@"上传"
                                                             titleColor:ZJCOLOR.color_c0
                                                              titleFont:SYSTEM_REGULARFONT(18.f)
                                                                 target:self
                                                               selector:@selector(buttonClick:)];
    }
    return _uploadButton;
}

@end
