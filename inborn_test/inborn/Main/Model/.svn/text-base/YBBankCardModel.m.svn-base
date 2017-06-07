//
//  YBBankCardModel.m
//  inborn
//
//  Created by 郑键 on 17/4/7.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBBankCardModel.h"

@implementation YBBankCardModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return@{@"customId" : @"id"};
}

- (void)setCardType:(NSString *)cardType
{
    if ([cardType isEqualToString:@"2"]) {
        _cardType = @"储蓄卡";
    }else if ([cardType isEqualToString:@"3"]) {
        _cardType = @"信用卡";
    }
}

-(void)setCard_type:(NSString *)card_type
{
    if ([card_type isEqualToString:@"2"]) {
        _card_type = @"储蓄卡";
    }else if ([card_type isEqualToString:@"3"]) {
        _card_type = @"信用卡";
    }
}

@end
