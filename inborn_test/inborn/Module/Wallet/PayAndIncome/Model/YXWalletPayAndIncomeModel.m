//
//  YXWalletPayAndIncomeModel.m
//  inbid-ios
//
//  Created by 郑键 on 17/2/23.
//  Copyright © 2017年 胤讯. All rights reserved.
//

#import "YXWalletPayAndIncomeModel.h"
#import "YXWalletPayAndIncomeDataModel.h"

@implementation YXWalletPayAndIncomeModel

- (void)setData:(NSArray<YXWalletPayAndIncomeDataModel *> *)data
{
    NSMutableArray *tempArray = [NSMutableArray array];
    [data enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[YXWalletPayAndIncomeDataModel class]]) {
            [tempArray addObject:obj];
        }else{
            [tempArray addObject:[YXWalletPayAndIncomeDataModel modelWithDictionary:obj]];
        }
    }];
    _data = tempArray.copy;
}

@end
