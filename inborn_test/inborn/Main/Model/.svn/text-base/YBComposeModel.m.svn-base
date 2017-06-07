//
//  YBComposeModel.m
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeModel.h"

@implementation YBComposeModel

- (void)setAccessoryList:(NSArray *)accessoryList
{
    NSMutableArray *tempArray = [NSMutableArray array];
    [accessoryList enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
        [tempArray addObject:[YBGoodPartModel modelWithDictionary:obj]];
    }];
    _accessoryList = tempArray.copy;
}

- (void)setPubImgList:(NSArray *)pubImgList
{
    NSMutableArray *tempArray = [NSMutableArray array];
    [pubImgList enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                                NSUInteger idx,
                                                BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[YBUploadImageModel class]]) {
            [tempArray addObject:obj];
        }else{
            [tempArray addObject:[YBUploadImageModel modelWithDictionary:obj]];
        }
    }];
    _pubImgList = tempArray.copy;
}

@end
