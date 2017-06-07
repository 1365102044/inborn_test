//
//  YBMySelloutTopstatusImageView.m
//  inborn
//
//  Created by 刘文强 on 2017/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMySelloutTopstatusImageView.h"

@implementation YBMySelloutTopstatusImageView

+(instancetype)loaddeatilTopStatusImageView
{
    return [[NSBundle mainBundle] loadNibNamed:@"YBOrderDetailStepHeaderView" owner:nil options:nil].lastObject;
}

@end
