//
//  YXMyWalletMainSeationView.m
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/20.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXMyWalletMainSeationView.h"
#import "YBStringTool.h"

@interface YXMyWalletMainSeationView ()

{
    UILabel *toptitle;
    UILabel *HaveMoneyAccoutLable;
    UILabel *CanUseMoneyLable;
    UILabel *NotCanUseMoneyLable;
    
}

@end

@implementation YXMyWalletMainSeationView


-(void)setDataModel:(YXMyWalletAccountInformModle *)dataModel{

    NSString *balance_fen_str = [NSString stringWithFormat:@"%f",[dataModel.balance floatValue] *100];
    //余额
     HaveMoneyAccoutLable.text = [[YBStringTool share] strmethodCommaWith:balance_fen_str];

    //    可用余额
    NSString *cashout_amt_fen_str = [NSString stringWithFormat:@"%f",[dataModel.cashout_amt floatValue] *100];
    CanUseMoneyLable.text = [NSString stringWithFormat:@"可用余额 %@",[[YBStringTool share] strmethodCommaWith:cashout_amt_fen_str]];

    //    冻结余额
    NSString *freeze_balance_fen_str = [NSString stringWithFormat:@"%f",[dataModel.freeze_balance floatValue] *100];
    NotCanUseMoneyLable.text = [NSString stringWithFormat:@"冻结余额 %@",[[YBStringTool share] strmethodCommaWith:freeze_balance_fen_str]];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        toptitle = [self creatLable];
        toptitle.text = @"余额";
        [self addSubview:toptitle];
        
        HaveMoneyAccoutLable  = [self creatLable];
        [self addSubview:HaveMoneyAccoutLable];
        
        CanUseMoneyLable = [self creatLable];
        CanUseMoneyLable.text = @"可用余额 0.00";
        CanUseMoneyLable.textAlignment = NSTextAlignmentRight;
        [self addSubview:CanUseMoneyLable];
        
        NotCanUseMoneyLable = [self creatLable];
        NotCanUseMoneyLable.text = @"冻结余额 0.00";
        NotCanUseMoneyLable.textAlignment = NSTextAlignmentRight;
        [self addSubview:NotCanUseMoneyLable];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    toptitle.frame = CGRectMake(30, 10, 100, 30);
    HaveMoneyAccoutLable.frame = CGRectMake(30, toptitle.bottom, 200, 30);
    CanUseMoneyLable.frame  = CGRectMake(SCREEN_WIDTH-220, toptitle.ex_y, 200, 30);
    NotCanUseMoneyLable.frame = CGRectMake(CanUseMoneyLable.ex_x, CanUseMoneyLable.bottom, CanUseMoneyLable.width, 30);
    
}
-(UILabel *)creatLable{
    UILabel *lable = [[UILabel alloc]init];
    lable.textColor = [UIColor colorWithHexString:@"0x333333"];
    lable.font = SYSTEM_REGULARFONT(15);
    return lable;
}
@end
