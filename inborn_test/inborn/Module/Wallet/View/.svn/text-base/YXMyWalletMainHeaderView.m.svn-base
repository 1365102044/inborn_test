//
//  YXMyWalletMainHeaderView.m
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/20.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXMyWalletMainHeaderView.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "User_LocalData.h"

@interface YXMyWalletMainHeaderView ()
{
    UIImageView *backimage;
    UIImageView *iconimageview;
    UIButton *setbtn;
    UILabel *namelable;
    UILabel *desclable;
}
@end

@implementation YXMyWalletMainHeaderView

-(void)setDataModel:(YXMyWalletAccountInformModle *)dataModel{
    _dataModel = dataModel;
    NSString *headerstr = [User_LocalData getUserData].headImage;
    if (headerstr.length==0) {
        NSData *headerdata = [SYSTEM_USERDEFAULTS objectForKey:@"headerimagedata"];
        iconimageview.image = [UIImage imageWithData:headerdata];
        if (!iconimageview.image) {
            iconimageview.image = [UIImage imageNamed:@"mine_defaultphoto_icon"];
        }
    }else{
        [iconimageview sd_setImageWithURL:[NSURL URLWithString:ZJIMAGEURLSTRING(ZJProjectImageUrlStringHeaderIcon, headerstr)] placeholderImage:[UIImage imageNamed:@"mine_defaultphoto_icon"]];
    }
    [setbtn setTitle:dataModel.name_user forState:UIControlStateNormal];
    namelable.text = dataModel.mob_bind;
    
    if ([dataModel.kyc_status containsString:@" "]) {
        
        NSMutableAttributedString* des = [[NSMutableAttributedString alloc] initWithString:dataModel.kyc_status];
        [des addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 2)];
        [des addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:51.f/255.f green:143.f/255.f blue:240.f/255.f alpha:1.0] range:NSMakeRange(2, des.length-2)];
        desclable.attributedText = des;
    }else{
        //实名认证中 ， 认证成功， 认证失败，
        NSString *des;
        if ([dataModel.kyc_status isEqualToString:@"3"]) {
            des =  @"实名认证中";
        }else if ([dataModel.kyc_status isEqualToString:@"4"]){
            des =  @"实名认证成功";
        }else if ([dataModel.kyc_status isEqualToString:@"5"] || [dataModel.kyc_status isEqualToString:@"1"]){
            des =  @"实名认证失败";
        }else if ([dataModel.kyc_status isEqualToString:@"0"]){
            des =  @"未实名认证";
        }
        desclable.text = des;
        desclable.textColor = [UIColor colorWithRed:51.f/255.f green:143.f/255.f blue:240.f/255.f alpha:1.0];
    }
}

-(void)clickDescLableTap:(UITapGestureRecognizer *)tap
{
    if (self.clickDescLableblock) {
        self.clickDescLableblock([_dataModel.kyc_status integerValue]);
    }
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        backimage = [[UIImageView alloc]init];
        backimage.image = [UIImage imageNamed:@"icon_mywalletBackImage"];
        [self addSubview:backimage];
        
        iconimageview = [[UIImageView alloc]init];
        iconimageview.layer.cornerRadius = 37.5;
        iconimageview.layer.masksToBounds = YES;
        [self addSubview:iconimageview];
        
        
        setbtn = [[UIButton alloc]init];
        [setbtn setTitle:@"" forState:UIControlStateNormal];
        [setbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        setbtn.titleLabel.font = SYSTEM_REGULARFONT(15);
        setbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self addSubview:setbtn];
        
        namelable = [[UILabel alloc]init];
        namelable.textColor = [UIColor whiteColor];
        namelable.font= SYSTEM_REGULARFONT(15);
        [self addSubview:namelable];
        
        desclable = [[UILabel alloc]init];
        desclable.textColor = [UIColor whiteColor];
        desclable.font= SYSTEM_REGULARFONT(15);
        desclable.userInteractionEnabled = YES;
        [self addSubview:desclable];
        
        UITapGestureRecognizer *clickdesc = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickDescLableTap:)];
        [desclable addGestureRecognizer:clickdesc];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    backimage.frame = self.bounds;
    iconimageview.frame = CGRectMake(35, 55, 75, 75);
    setbtn.frame = CGRectMake(iconimageview.right+20, iconimageview.ex_y, SCREEN_WIDTH-iconimageview.right-30, 30);
    namelable.frame = CGRectMake(setbtn.ex_x, setbtn.bottom+5, setbtn.width, 20);
    desclable.frame = CGRectMake(setbtn.ex_x, namelable.bottom+5, setbtn.width, 20);
}

@end
