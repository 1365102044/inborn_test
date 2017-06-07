//
//  YBMeMainCellView.m
//  inborn
//
//  Created by 刘文强 on 2017/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMeMainCellView.h"

#import "YBStringTool.h"
@interface YBMeMainCellView ()

{
    UIImageView *rightimageview;
    YBDefaultLabel *titlelable;
    YBDefaultLabel *desclable;
    
}

@end

@implementation YBMeMainCellView


/**
 赋值
 */
-(void)SetBaseMyAccountInforWithIndexPath:(NSIndexPath *)indexPath titleArr:(NSArray *)titleArr dataModel:(YBMeMainDataModel *)dataModel
{
    desclable.hidden = NO;
    if (dataModel==nil) return;
    if (indexPath.section ==1) {
        if (dataModel.isShowMoney!=1) {
            return;
        }
        titlelable.text = @"我的钱包";
        if(dataModel.openingStatus){
            NSString *myaccount_fen = [NSString stringWithFormat:@"%.0f",[dataModel.balanceMoney floatValue]*100];
            desclable.text = [[YBStringTool share] strmethodCommaWith:myaccount_fen];
        }else{
            desclable.text = @"申请开通钱包";
        }
        desclable.textColor = ZJCOLOR.color_c6;
    }else if (indexPath.section ==2){
        desclable.textColor = ZJCOLOR.color_c5;
        NSMutableArray *numberArr = [NSMutableArray array];
        [numberArr addObject:[NSString stringWithFormat:@"%ld",(long)dataModel.publishCount]];
        [numberArr addObject:[NSString stringWithFormat:@"%ld",(long)dataModel.identifyCount]];
        [numberArr addObject:[NSString stringWithFormat:@"%ld",(long)dataModel.sellCount]];
        [numberArr addObject:[NSString stringWithFormat:@"%ld",(long)dataModel.myGoodsCount]];
        desclable.text = numberArr[indexPath.row];
    }else if (indexPath.section==3){
        desclable.textColor = ZJCOLOR.color_c6;
        if (indexPath.row==1) {
            if (dataModel.qqCount==0&&dataModel.wechatCount==0) {
                desclable.text = @"立即绑定";
            }
        }else if (indexPath.row==2){
            /**
             * 实名认证状态：0=未认证，1=认证中，2=认证成功，3=认证失败
             */
            if (dataModel.idcard_status !=2) {
                desclable.text = @"立即认证";
            }
        }else if (indexPath.row==3){
            if (!dataModel.consigneeCount) {
                desclable.text = @"添加地址";
            }
        }else if (indexPath.row ==4){
            if (!dataModel.pickupCount) {
                desclable.text = @"添加提货人";
            }
        }
    }else if (indexPath.section==4){
        desclable.hidden= YES;
    }
}

-(void)setCellTitleKey:(NSString *)CellTitleKey
{
    titlelable.text = ZJSTRING(CellTitleKey);
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        rightimageview = [[UIImageView alloc]init];
//        rightimageview.image = ZJIMAGE(IMAGEFILEPATH_MINE, @"mine_moreitem", ZJProjectLoadImageDefault).firstObject;
        rightimageview.image = [UIImage imageNamed:@"details_moreitem_n"];
        [self addSubview:rightimageview];
        
        titlelable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(14)
                                              text:@""
                                         textColor:ZJCOLOR.color_c4];
        titlelable.text = @"";
        titlelable.textAlignment = NSTextAlignmentLeft;
        [self addSubview:titlelable];
        
        desclable = [YBDefaultLabel labelWithFont:SYSTEM_REGULARFONT(13)
                                             text:@""
                                        textColor:ZJCOLOR.color_c2];
        desclable.textAlignment = NSTextAlignmentRight;
        [self addSubview:desclable];
        desclable.hidden = YES;
        
        [rightimageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(-10));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(22), ADJUST_PERCENT_FLOAT(22)));
            make.centerY.mas_equalTo(self);
        }];
        
        [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.size.mas_offset(CGSizeMake(ADJUST_PERCENT_FLOAT(75), ADJUST_PERCENT_FLOAT(30)));
            make.centerY.mas_equalTo(self);
        }];
        
        [desclable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titlelable.mas_right).mas_offset(ADJUST_PERCENT_FLOAT(10));
            make.right.mas_equalTo(rightimageview.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(-5));
            make.height.mas_equalTo(titlelable.mas_height);
            make.centerY.mas_equalTo(self);
        }];
        
        _lineview = [[UIView alloc]init];
        _lineview.backgroundColor = ZJCOLOR.color_c16;
        [self addSubview:_lineview];
        
        [_lineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).mas_offset(ADJUST_PERCENT_FLOAT(12));
            make.right.mas_equalTo(self).mas_offset(ADJUST_PERCENT_FLOAT(0));
            make.height.mas_offset(ADJUST_PERCENT_FLOAT(0.5));
            make.bottom.mas_equalTo(self.mas_bottom);
        }];
    }
    return self;
}

@end

