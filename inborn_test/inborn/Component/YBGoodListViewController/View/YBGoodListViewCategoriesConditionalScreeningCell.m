//
//  YBGoodListViewCategoriesConditionalScreeningCell.m
//  inborn
//
//  Created by 郑键 on 17/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListViewCategoriesConditionalScreeningCell.h"
#import "YBRightImageButton.h"

@interface YBGoodListViewCategoriesConditionalScreeningCell()

/**
 当前选中的按钮
 */
@property (nonatomic, strong) YBRightImageButton *currentButton;

/**
 价格筛选条件类别
 */
@property (nonatomic, assign) ZJProjectConditionalScreenPriceType priceType;

@end

@implementation YBGoodListViewCategoriesConditionalScreeningCell

#pragma mark - First.通知

#pragma mark - Second.赋值

- (void)setSelectedConditional:(NSString *)conditional
{
    [self.currentButton setTitle:conditional forState:UIControlStateNormal];
}

- (void)setResetButtonStatus:(BOOL)resetButtonStatus
{
    _resetButtonStatus = resetButtonStatus;
    
    [self buttonClick:self.currentButton];
}

#pragma mark - Third.点击事件

/**
 按钮点击事件

 @param sender sender
 */
- (void)buttonClick:(YBRightImageButton *)sender
{
    if (sender.tag == 1001
        || sender.tag == 1002
        || sender.tag == 1004) {
        
        YBRightImageButton *priceButton             = (YBRightImageButton *)[self.contentView viewWithTag:1003];
        if (priceButton.selected) {
            priceButton.selected                    = NO;
            self.priceType                          = ZJProjectConditionalScreenPriceDefault;
        }
        
        /**
         *  重置按钮时，
         */
        [self setButtonStatusWithButton:self.currentButton];
        
        /**
         *  综合排序
         */
        [self setButtonStatusWithButton:sender];
        
        /**
         *  商户自营
         */
        
        /**
         *  筛选
         *  TODO:暂时使用禁用状态，考虑筛选功能为下拉菜单，需要切换为选中状态
         */
    }
    
    if (sender.tag == 1003) {
        
        if (self.currentButton) {
            [self setButtonStatusWithButton:self.currentButton];
            self.currentButton              = nil;
        }
        
        /**
         *  价格高低
         */
        if (self.priceType == ZJProjectConditionalScreenPriceUp) {
            [sender setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_HOMEPAGE,
                                            @"home_pricepoint_h",
                                            ZJProjectLoadImageDefault)
                    forState:UIControlStateSelected];
            sender.selected                 = !sender.selected;
            self.priceType                  = ZJProjectConditionalScreenPriceDefault;
            sender.titleLabel.font          = SYSTEM_LIGHTFONT(14.f);
            
        }else if (self.priceType == ZJProjectConditionalScreenPriceDown) {
            
            /**
             *  二次选中
             */
            [sender setImage:ZJCURRENTIMAGE(IMAGEFILEPATH_HOMEPAGE,
                                            @"home_pricepoint1_h",
                                            ZJProjectLoadImageDefault)
                    forState:UIControlStateSelected];
            self.priceType                  = ZJProjectConditionalScreenPriceUp;
            sender.titleLabel.font          = SYSTEM_REGULARFONT(14.f);
            
        }else if (self.priceType == ZJProjectConditionalScreenPriceDefault) {
            
            sender.selected                 = !sender.selected;
            self.priceType                  = ZJProjectConditionalScreenPriceDown;
            sender.titleLabel.font          = SYSTEM_REGULARFONT(14.f);
        }
    }
    
    /**
     *  重置按钮状态时，不发送通知
     */
    if (self.resetButtonStatus) {
    
        _resetButtonStatus = NO;
        
        return;
    }
    [SYSTEM_NOTIFICATIONCENTER postNotificationName:GOODLIST_CONDITIONALSCREENING_CLICK_NOTIFICATION
                                             object:nil
                                           userInfo:@{@"button":sender,
                                                      @"priceType":[NSString stringWithFormat:@"%zd", self.priceType],
                                                      @"cell":self}];
}

/**
 设置button状态

 @param sender 按钮
 */
- (void)setButtonStatusWithButton:(YBRightImageButton *)sender
{
    sender.selected                     = sender.selected ? NO : YES;
    sender.titleLabel.font              = !sender.selected ? SYSTEM_LIGHTFONT(14.f) : SYSTEM_REGULARFONT(14.f);
    self.currentButton                  = sender;
}

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

/**
 初始化视图
 
 @param frame       frame
 @return return     value
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupCustomUI];
    }
    return self;
}

#pragma mark - Sixth.界面配置

/**
 配置界面
 */
- (void)setupCustomUI
{
    YBRightImageButton *integratedSortingButton = [YBRightImageButton buttonImageAndTitleWithTitleStringKey:GOODLIST_CONDITIONALSCREENING_INTEGRATEDSORTING_STRINGKEY
                                                                                              titleColorNor:ZJCOLOR.color_c5
                                                                                              titleColorSel:ZJCOLOR.color_c4
                                                                                              titleColorDis:ZJCOLOR.color_c4
                                                                                                  titleFont:SYSTEM_LIGHTFONT(14.f)
                                                                                              imageFilePath:IMAGEFILEPATH_HOMEPAGE
                                                                                                 imageNamed:@"home_point"
                                                                                                     target:self
                                                                                                   selector:@selector(buttonClick:)];
    YBRightImageButton *merchantsButton = [YBRightImageButton buttonImageAndTitleWithTitleStringKey:GOODLIST_CONDITIONALSCREENING_MERCHANT_STRINGKEY
                                                                                      titleColorNor:ZJCOLOR.color_c5
                                                                                      titleColorSel:ZJCOLOR.color_c4
                                                                                      titleColorDis:ZJCOLOR.color_c4
                                                                                          titleFont:SYSTEM_LIGHTFONT(14.f)
                                                                                      imageFilePath:nil
                                                                                         imageNamed:nil
                                                                                             target:self
                                                                                           selector:@selector(buttonClick:)];
    YBRightImageButton *priceButton = [YBRightImageButton buttonImageAndTitleWithTitleStringKey:GOODLIST_CONDITIONALSCREENING_PRICE_STRINGKEY
                                                                                  titleColorNor:ZJCOLOR.color_c5
                                                                                  titleColorSel:ZJCOLOR.color_c4
                                                                                  titleColorDis:ZJCOLOR.color_c4
                                                                                      titleFont:SYSTEM_LIGHTFONT(14.f)
                                                                                  imageFilePath:IMAGEFILEPATH_HOMEPAGE
                                                                                     imageNamed:@"home_pricepoint"
                                                                                         target:self
                                                                                       selector:@selector(buttonClick:)];
    YBRightImageButton *filterButton = [YBRightImageButton buttonImageAndTitleWithTitleStringKey:GOODLIST_CONDITIONALSCREENING_FILTER_STRINGKEY
                                                                                   titleColorNor:ZJCOLOR.color_c5
                                                                                   titleColorSel:ZJCOLOR.color_c4
                                                                                   titleColorDis:ZJCOLOR.color_c4
                                                                                       titleFont:SYSTEM_LIGHTFONT(14.f)
                                                                                   imageFilePath:IMAGEFILEPATH_HOMEPAGE
                                                                                      imageNamed:@"home_screen"
                                                                                          target:self
                                                                                        selector:@selector(buttonClick:)];
    
    integratedSortingButton.tag             = 1001;
    merchantsButton.tag                     = 1002;
    priceButton.tag                         = 1003;
    filterButton.tag                        = 1004;
    
    [self.contentView addSubview:integratedSortingButton];
    [self.contentView addSubview:merchantsButton];
    [self.contentView addSubview:priceButton];
    [self.contentView addSubview:filterButton];
    
    [integratedSortingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(self.contentView);
    }];
    
    [merchantsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(integratedSortingButton.mas_right);
        make.width.height.mas_equalTo(integratedSortingButton);
    }];
    
    [priceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(merchantsButton.mas_right);
        make.width.height.mas_equalTo(integratedSortingButton);
    }];
    
    [filterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(priceButton.mas_right);
        make.width.height.mas_equalTo(integratedSortingButton);
        make.right.mas_equalTo(self.contentView);
    }];
    
    integratedSortingButton.selected = YES;
    self.currentButton = integratedSortingButton;
}

#pragma mark - Seventh.懒加载

@end
