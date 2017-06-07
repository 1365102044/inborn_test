//
//  YBSellerInforView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBSellerInforView.h"

@interface YBSellerInforView ()
{
    YBDefaultButton *sellerBtn;
    YBDefaultButton *RealNameBtn;
    YBDefaultButton *Btn;
}
@end

@implementation YBSellerInforView


-(void)setDataModel:(YBGoodsDeatilModel *)dataModel
{
    _dataModel = dataModel;
    
    /**
     实名认证: 0,实名认证状态：0未认证，1认证中，2认证成功，3认证失败
     */
    if (dataModel.MemberModel.idcardStatus == 2) {
        [RealNameBtn setTitle:ZJSTRING(MINE_HOMEPAGE_CERTIFICATION_ALREADYREALNAME_STRINGKEY)
                          forState:UIControlStateNormal];
    }else {
        [RealNameBtn setTitle:ZJSTRING(MINE_HOMEPAGE_CERTIFICATION_NOTREALNAME_STRINGKEY)
                          forState:UIControlStateNormal];
    }
    
    RealNameBtn.hidden = YES;
    /**
     会员类型： 10 普通会员， 20 普通商家
     */
    if (dataModel.MemberModel.memberType == 10) {
        [sellerBtn setTitle:@"会员"
                             forState:UIControlStateNormal];
        RealNameBtn.hidden = NO;
    }else if (dataModel.MemberModel.memberType == 20) {
        [sellerBtn setTitle:ZJSTRING(MINE_HOMEPAGE_IDENTITYMARK_BUSINESSMEN_STRINGKEY)
                             forState:UIControlStateNormal];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        sellerBtn       = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                                      titleColor:ZJCOLOR.color_c4
                                                                       titleFont:SYSTEM_REGULARFONT(12)
                                                                   imageFilePath:IMAGEFILEPATH_DETAIL
                                                                      imageNamed:@"details_shopblack_icon"
                                                                            type:ZJProjectButtonSetImage
                                                                          target:self
                                                                        selector:nil];
        sellerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        [self addSubview:sellerBtn];
        
        RealNameBtn     = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                                      titleColor:ZJCOLOR.color_c4
                                                                       titleFont:SYSTEM_REGULARFONT(12)
                                                                   imageFilePath:IMAGEFILEPATH_DETAIL
                                                                      imageNamed:@"details_reallynblack_icon"
                                                                            type:ZJProjectButtonSetImage
                                                                          target:self
                                                                        selector:nil];
        RealNameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        [self addSubview:RealNameBtn];
//        Btn             = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
//                                                                      titleColor:ZJCOLOR.color_c4
//                                                                       titleFont:SYSTEM_REGULARFONT(12)
//                                                                   imageFilePath:IMAGEFILEPATH_DETAIL
//                                                                      imageNamed:@"details_zhimablack_icon"
//                                                                            type:ZJProjectButtonSetImage
//                                                                          target:self
//                                                                        selector:nil];
//        Btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        sellerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        RealNameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        [self addSubview:Btn];
        [sellerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.left.mas_equalTo(self);
            make.height.mas_equalTo(self);
            make.width.mas_offset(ADJUST_PERCENT_FLOAT(50));
        }];
        
        [RealNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sellerBtn.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(5));
            make.height.mas_equalTo(sellerBtn);
            make.width.mas_offset(ADJUST_PERCENT_FLOAT(60));
            make.centerY.mas_equalTo(sellerBtn.mas_centerY);
        }];
        
//        [Btn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(sellerBtn.mas_height);
//            make.left.mas_equalTo(RealNameBtn.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(5));
//            //            make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-5));
//            make.width.mas_offset(ADJUST_PERCENT_FLOAT(60));
//            make.centerY.mas_equalTo(sellerBtn.mas_centerY);
//        }];
        
        [self setTestData];
    }
    return self;
}

- (void)setTestData
{
    [sellerBtn setTitle:@"商家" forState:UIControlStateNormal];
    [RealNameBtn setTitle:@"已实名" forState:UIControlStateNormal];
//    [Btn setTitle:@"800" forState:UIControlStateNormal];
}

@end
