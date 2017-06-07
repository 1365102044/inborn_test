//
//  YBGoodsDeatilCollectionSectionView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodsDeatilCollectionSectionView.h"

@interface YBGoodsDeatilCollectionSectionView ()
{
    UILabel *lable;
    UIImageView *imageview;
        ZJBaseView *line;
    NSString *formStr;
}
@end

@implementation YBGoodsDeatilCollectionSectionView
/**
 赋值
 */
- (void)setSeactionViewWithtitle:(NSString *)title isShowIcon:(BOOL)isShowIcon index:(NSInteger)index
{
    formStr = title;
    if ([title isEqualToString:@"guess"]) {
        
        imageview = [[UIImageView alloc]init];
        imageview.image = ZJCURRENTIMAGE(IMAGEFILEPATH_DETAIL, @"details_like_bg", ZJProjectLoadImageDefault);
        [self addSubview:imageview];
        
    }else{
        
        [self setUI];
        imageview.backgroundColor = [UIColor whiteColor];
        imageview.hidden    = NO;
        
        if (index == 1 && [title isEqualToString:@"商品信息"]) {
            imageview.image    = [UIImage new];
        }
        lable.text              = title;
        
        if([title isEqualToString:@"显示更多"]||[title isEqualToString:@"收起"])
        {
            imageview.hidden = YES;
            [lable mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(200), ADJUST_PERCENT_FLOAT(self.height)));
                make.centerX.mas_equalTo(self);
                make.centerY.mas_equalTo(self);
            }];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font          = SYSTEM_REGULARFONT(12);
            lable.textColor     = ZJCOLOR.color_c5;
        }
        
        line.hidden = NO;
        if (index == 1 ) {
            line.backgroundColor= ZJCOLOR.color_c16;
        }
        
        
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

- (void)setUI
{
    lable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                     text:@""
                                textColor:ZJCOLOR.color_c4];
    [self addSubview:lable];
    line        = [[ZJBaseView alloc]init];
    line.backgroundColor = ZJCOLOR.color_c12;

    [self addSubview:line];
    line.hidden = YES;
    imageview = [[UIImageView alloc]init];
    imageview.image = ZJIMAGE(IMAGEFILEPATH_DETAIL, @"details_moreitem", ZJProjectLoadImageDefault).firstObject;
    imageview.hidden = YES;
    [self addSubview:imageview];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if ([formStr isEqualToString:@"guess"]) {

        imageview.frame = CGRectMake((SCREEN_WIDTH-151)/2, (self.height-15)/2+6, ADJUST_PERCENT_FLOAT(151), ADJUST_PERCENT_FLOAT(15));
    }else{
    
        if([lable.text isEqualToString:@"显示更多"]||[lable.text isEqualToString:@"收起"])
        {
            [lable mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(200), ADJUST_PERCENT_FLOAT(self.height)));
                make.centerX.mas_equalTo(self);
                make.centerY.mas_equalTo(self);
            }];
        }else{
            
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(10));
                make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(200), self.height));
                make.top.mas_equalTo(self).mas_offset(0);
            }];
        }
        
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-10));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22)));
            make.centerY.mas_equalTo(self);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.bottom.mas_equalTo(self.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
        }];
    }
    
}

@end
