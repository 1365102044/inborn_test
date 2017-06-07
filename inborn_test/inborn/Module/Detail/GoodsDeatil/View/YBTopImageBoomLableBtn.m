//
//  YBTopImageBoomLableBtn.m
//  inborn
//
//  Created by 刘文强 on 2017/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBTopImageBoomLableBtn.h"

@interface YBTopImageBoomLableBtn ()

{
    UIImageView *imageview;
    YBDefaultLabel *titlelable;
}
@property(nonatomic,copy) clickBtn  clickBtnBlock;

@end

@implementation YBTopImageBoomLableBtn

- (void)clickbtn:(UIButton *)sender
{

}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickbtn:)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)creatTopImageBoomLableWithTitle:(NSString *)title image:(UIImage *)image font:(UIFont *)font textcolor:(UIColor *)color clickbtnblock:(clickBtn)clickBtnBlock
{
    self.clickBtnBlock = clickBtnBlock;
    
    imageview = [[UIImageView alloc]init];
    [self addSubview:imageview];
    
    titlelable = [YBDefaultLabel labelWithFont:font
                                          text:title
                                     textColor:color];
    titlelable.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titlelable];
    
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
        make.height.mas_equalTo(self).multipliedBy(0.6);
        make.width.mas_equalTo(self);
        make.left.mas_equalTo(self);
    }];

    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(imageview.mas_bottom).mas_offset(ADJUST_PERCENT_FLOAT(5));
        make.height.mas_equalTo(self).multipliedBy(0.3);
        make.width.mas_equalTo(self);
        make.left.mas_equalTo(self);
    }];
    
}
@end
