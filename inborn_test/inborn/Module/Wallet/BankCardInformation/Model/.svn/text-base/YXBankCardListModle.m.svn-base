//
//  YXBankCardListModle.m
//  inbid-ios
//
//  Created by 刘文强 on 2017/2/23.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXBankCardListModle.h"
#import "YXBankCardDetailInformationModel.h"

@implementation YXBankCardListModle

- (void)setAgreement_list:(NSArray *)agreement_list
{
    NSMutableArray *tempArrayM = [NSMutableArray array];
    [agreement_list enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                 NSUInteger idx,
                                                 BOOL * _Nonnull stop) {
        [tempArrayM addObject:[YXBankCardDetailInformationModel modelWithDictionary:obj]];
    }];
    
    _agreement_list = tempArrayM.copy;
}

- (NSArray *)locAgreement_list
{
    if (!_locAgreement_list) {
        
        _locAgreement_list = _agreement_list;
    }
    return _locAgreement_list;
}

@end
