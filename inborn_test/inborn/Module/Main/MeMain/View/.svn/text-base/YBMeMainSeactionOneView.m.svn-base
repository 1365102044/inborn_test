//
//  YBMeMainSeactionOneView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMeMainSeactionOneView.h"
#import "YBMeMainSectionOneItemView.h"

@interface YBMeMainSeactionOneView ()
{
    UILabel *titleLable;
    YBDefaultButton *returnGoodsBtn;
    UIImageView *imageview;
    UIView *line;
    
    UIView *itemBackView;
    YBMeMainSectionOneItemView *itemView;
    NSArray *dataarr;
}
@end

@implementation YBMeMainSeactionOneView

/**
 赋值
 */
-(void)setDataModel:(YBMeMainDataModel *)dataModel
{
    _dataModel = dataModel;
    NSMutableArray *numberArr = [NSMutableArray array];
    [numberArr addObject:[NSString stringWithFormat:@"%ld",(long)dataModel.noPayOrder]];
    [numberArr addObject:[NSString stringWithFormat:@"%ld",(long)dataModel.hasPayOrder]];
    [numberArr addObject:[NSString stringWithFormat:@"%ld",(long)dataModel.getOrder]];
    [numberArr addObject:[NSString stringWithFormat:@"%ld",(long)dataModel.confrimOrder]];
    for (YBMeMainSectionOneItemView *views in itemBackView.subviews) {
        if (views.tag>=1) {
            views.orderNumber = numberArr[views.tag-1];
        }
    }
}

-(void)Clickreturngoods:(UIButton *)sender{
    if (self.clickItemBlock) {
        self.clickItemBlock(5);
    }
}
- (void)ClickItem:(UITapGestureRecognizer *)tap
{
    YBLog(@"----%ld",tap.view.tag);
    if (self.clickItemBlock) {
        self.clickItemBlock(tap.view.tag);
    }
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        titleLable = [[UILabel alloc]initWithFrame:CGRectMake(ADJUST_PERCENT_FLOAT(10), ADJUST_PERCENT_FLOAT(10), ADJUST_PERCENT_FLOAT(100), ADJUST_PERCENT_FLOAT(30))];
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = SYSTEM_REGULARFONT(14);
        titleLable.text = ZJSTRING(MINE_HOMEPAGE_USER_BOUGHT_STRINGKEY);
        titleLable.textColor = ZJCOLOR.color_c4;
        [self addSubview:titleLable];


        UIImageView *jiantouimage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - ADJUST_PERCENT_FLOAT(32), ADJUST_PERCENT_FLOAT(10), ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22))];
//        jiantouimage.image = ZJIMAGE(IMAGEFILEPATH_MINE, @"mine_moreitem", ZJProjectLoadImageDefault).firstObject;
        jiantouimage.image = [UIImage imageNamed:@"details_moreitem_n"];
        [self addSubview:jiantouimage];
        jiantouimage.centerY = titleLable.centerY;
        returnGoodsBtn = [YBDefaultButton buttonImageAndTitleWithTitleStringKey:@""
                                                                     titleColor:ZJCOLOR.color_c6
                                                                      titleFont:SYSTEM_REGULARFONT(12) imageFilePath:@""
                                                                     imageNamed:@""
                                                                           type:ZJProjectButtonSetBackgroundImage
                                                                         target:self
                                                                       selector:@selector(Clickreturngoods:)];
        returnGoodsBtn.frame = CGRectMake(titleLable.right, ADJUST_PERCENT_FLOAT(3.5), SCREEN_WIDTH-titleLable.right-jiantouimage.width-ADJUST_PERCENT_FLOAT(10), ADJUST_PERCENT_FLOAT(38));
        [returnGoodsBtn setTitle:ZJSTRING(MINE_HOMEPAGE_USER_ALLORDER_STRINGKEY) forState:UIControlStateNormal];
        [returnGoodsBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -returnGoodsBtn.imageView.size.width-5, 0, returnGoodsBtn.imageView.size.width+5)];
        [returnGoodsBtn setImageEdgeInsets:UIEdgeInsetsMake(0, returnGoodsBtn.titleLabel.bounds.size.width, 0, -returnGoodsBtn.titleLabel.bounds.size.width)];
        returnGoodsBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [self addSubview:returnGoodsBtn];
        returnGoodsBtn.centerY = titleLable.centerY;
//        [returnGoodsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(jiantouimage.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-12));
//            make.left.mas_equalTo(titleLable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
//            make.height.mas_offset(ADJUST_PERCENT_FLOAT(38));
//            make.centerY.mas_equalTo(titleLable.centerY);
//        }];
//        
        
        line = [[UIView alloc]initWithFrame:CGRectMake(ADJUST_PERCENT_FLOAT(10), titleLable.bottom+5, SCREEN_WIDTH, 0.5)];
        line.backgroundColor = ZJCOLOR.color_c16;
        [self addSubview:line];
        
        
        itemBackView = [[UIView alloc]initWithFrame:CGRectMake(0, line.bottom+5, SCREEN_WIDTH, 80)];
        [self addSubview:itemBackView];
        
        dataarr = [NSArray new];
        dataarr = @[MINE_HOMEPAGE_USER_BOUGHT_PENDINGPAYMENT_STRINGKEY,
                    MINE_HOMEPAGE_USER_BOUGHT_WAITFORDELIVERY_STRINGKEY,
                    MINE_HOMEPAGE_USER_BOUGHT_WAITFORRECEIVED_STRINGKEY,
                    MINE_HOMEPAGE_USER_BOUGHT_WAITFORCONFIRMED_STRINGKEY];
        NSArray * imageArr = [NSArray array];
        imageArr = @[@"mine_unpay",@"mine_undeliver",@"mine_take",@"mine_affirm"];
        CGFloat W = (SCREEN_WIDTH-60)/dataarr.count;
        for (int i=0; i<dataarr.count; i++) {
            
            YBMeMainSectionOneItemView *item = [[YBMeMainSectionOneItemView alloc]init];
            item.frame = CGRectMake(i*(W+20), 0, W, itemBackView.height);
            item.backgroundColor = [UIColor clearColor];
            item.tag = i+1;
            [item setItemTitle:ZJSTRING(dataarr[i]) image:ZJIMAGE(IMAGEFILEPATH_MINE, imageArr[i], ZJProjectLoadImageDefault).firstObject];
            
            [itemBackView addSubview:item];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ClickItem:)];
            item.tag = i+1;
            [item addGestureRecognizer:tap];
        }
    }
    return self;
}

@end
