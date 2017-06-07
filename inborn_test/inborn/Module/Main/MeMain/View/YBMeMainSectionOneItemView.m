//
//  YBMeMainSectionOneItemView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMeMainSectionOneItemView.h"
static CGFloat imageW = 28;
@interface YBMeMainSectionOneItemView ()

{
    UILabel *numberlable;
    UIImageView *iconimageview;
    UILabel *namelable;
}

@end

@implementation YBMeMainSectionOneItemView

//-(void)setItemTitle:(NSString *)ItemTitle{
//    namelable.text = ItemTitle;
//    iconimageview.image = [UIImage imageNamed:ItemTitle];
//}
/**
 赋值
 */
- (void)setItemTitle:(NSString *)title image:(UIImage *)image
{
    namelable.text = title;
    iconimageview.image = image;
}

-(void)setOrderNumber:(NSString *)orderNumber{
    
    numberlable.text = orderNumber;
    if ([orderNumber isEqualToString:@"0"]||orderNumber.length == 0) {
        numberlable.hidden = YES;
    }else{
        numberlable.hidden = NO;
        if ([orderNumber integerValue]>99) {
            numberlable.text = @"99";
        }
        CGFloat Width = 18;
        numberlable.frame = CGRectMake(iconimageview.width-Width*2/3, -Width/3, Width, 18);
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat W = (SCREEN_WIDTH-60)/4;
        iconimageview = [[UIImageView alloc]initWithFrame:CGRectMake((W-imageW)/2, 8, imageW, imageW)];
        iconimageview.image = [UIImage imageNamed:@""];
        iconimageview.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:iconimageview];
        
        namelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13) text:@"" textColor:ZJCOLOR.color_c4];
        namelable.frame = CGRectMake(0, iconimageview.bottom+5, W, 20);
        namelable.text = @"test";
        namelable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:namelable];
        
        
        numberlable = [[UILabel alloc]initWithFrame:CGRectMake(iconimageview.width-18*2/3, -18/3, 18, 18)];
        numberlable.textColor = ZJCOLOR.color_c0;
        numberlable.font = SYSTEM_REGULARFONT(10);
        numberlable.layer.masksToBounds = YES;
        numberlable.layer.cornerRadius = numberlable.width/2;
        numberlable.textAlignment = NSTextAlignmentCenter;
        numberlable.backgroundColor = ZJCOLOR.color_c13;
        [iconimageview addSubview:numberlable];   
    }
    return self;
}

@end
