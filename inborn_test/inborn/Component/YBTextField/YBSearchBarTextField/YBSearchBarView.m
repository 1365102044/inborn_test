//
//  YBSearchBarView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSearchBarView.h"

//#define TestColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface YBSearchBarView ()<UITextFieldDelegate>

@property(nonatomic,strong)  UITextField *seachtextfield;
@property(nonatomic,assign) searchBarType searchbarType;
@property(nonatomic,strong) ZJBaseImageView *searchImage;
@property(nonatomic,strong) NSString * placeholder;
@property(nonatomic,strong) ZJBaseButton * coverBtn;
@property(nonatomic,copy) clickSearchBarBlock  clickBlock;

@end

@implementation YBSearchBarView
/**
 称成为第一响应
 */
- (void)becomFristResponder
{
    [_seachtextfield becomeFirstResponder];
}

- (void)resginFristResponder
{
    [_seachtextfield resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.seachtextfield resignFirstResponder];
    if (self.clickBlock) {
        self.clickBlock(textField.text,_searchbarType);
    }
    return YES;
}

- (void)clickNotEditSearchBar:(UIButton *)sender
{
    if (self.clickBlock) {
        self.clickBlock(nil,_searchbarType);
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //    if (self.clickBlock) {
    //        self.clickBlock(textField.text,_searchbarType);
    //    }
}
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    return  YES;
}
/**
 初始化
 */
+ (instancetype)creatSearchBarViewWithType:(searchBarType)Type textfieldPlacehodler:(NSString *)placeholder
                                clickBlock:(clickSearchBarBlock)clickBlock;
{
    YBSearchBarView *searchbarview                  = [[YBSearchBarView alloc]init];
    searchbarview.placeholder                       = placeholder;
    searchbarview.searchbarType                     = Type;
    searchbarview.clickBlock                        = clickBlock;
    return searchbarview;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor                        = ZJCOLOR.color_c11;
        [self setSubviewUI];
    }
    return self;
}

- (void)setSearchbarType:(searchBarType)searchbarType
{
    if (searchbarType == canEditType) {
        _seachtextfield.textAlignment               = NSTextAlignmentLeft;
        self.coverBtn.hidden                        = YES;
        
        [_searchImage mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(15),
                                            ADJUST_PERCENT_FLOAT(15)));
            make.centerY.mas_equalTo(self);
        }];
        
    } else if (searchbarType == notEditType) {
        _seachtextfield.textAlignment               = NSTextAlignmentLeft;
        self.coverBtn.hidden                        = NO;
        [_coverBtn setTitle:_placeholder forState:UIControlStateNormal];
    }
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _seachtextfield.placeholder   = placeholder;
    _placeholder                  = placeholder;
}

- (void)setSubviewUI
{
    [self addSubview:self.seachtextfield];
    [self addSubview:self.searchImage];
    [self addSubview:self.coverBtn];
    
    self.searchImage.image = [UIImage imageNamed:@"search_search_icon"];
    [self.coverBtn setImage:[UIImage imageNamed:@"search_search_icon"] forState:UIControlStateNormal];
    [self.coverBtn setTitle:_placeholder forState:UIControlStateNormal];
    
    [_seachtextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.top.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(30));
    }];
    
    [_coverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.top.mas_equalTo(self);
    }];
}

#pragma mark  *** 懒加载
- (UITextField *)seachtextfield{
    if (!_seachtextfield) {
        _seachtextfield                             = [[UITextField alloc]init];
        _seachtextfield.font                        = SYSTEM_REGULARFONT(10);
        _seachtextfield.delegate                    = self;
        _seachtextfield.keyboardType                = UIKeyboardTypeWebSearch;
    }
    return _seachtextfield;
}

- (ZJBaseImageView *)searchImage{
    if (!_searchImage) {
        _searchImage                                = [[ZJBaseImageView alloc]init];
        _searchImage.image                          = ZJCURRENTIMAGE(IMAGEFILEPATH_SEARCH, @"search_search_icon", ZJProjectLoadImageDefault);
    }
    return _searchImage;
}

- (ZJBaseButton *)coverBtn{
    if (!_coverBtn) {
        _coverBtn                                   = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:ZJSTRING(@"爱马仕")
                                                                                                  titleColor:ZJCOLOR.color_c10
                                                                                                   titleFont:SYSTEM_REGULARFONT(10)
                                                                                               imageFilePath:IMAGEFILEPATH_SEARCH
                                                                                                  imageNamed:@"search_search_icon"
                                                                                                        type:ZJProjectButtonSetBackgroundImage
                                                                                                      target:self
                                                                                                    selector:@selector(clickNotEditSearchBar:)];
        _coverBtn.backgroundColor                   = ZJCOLOR.color_c11;
    }
    return _coverBtn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.masksToBounds               = YES;
    self.layer.cornerRadius                = ADJUST_PERCENT_FLOAT(self.height*0.5);
}
@end
