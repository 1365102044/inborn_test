//
//  YBAttributedStringLabel.m
//  inborn
//
//  Created by 郑键 on 17/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBAttributedStringLabel.h"

@implementation YBAttributedStringLabel

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark - Fifth.视图生命周期

- (void)setAttributedStringWithContentArray:(NSArray *)array
{
    self.numberOfLines              = 0;
    NSMutableArray *tempArrayM      = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj,
                                        NSUInteger
                                        idx,
                                        BOOL * _Nonnull stop) {
        [tempArrayM addObject:[ZJBaseLabelAttributeStringModel modelWithDictionary: obj]];
    }];
    [super setAttributedStringWithContentArray: tempArrayM.copy];
}

#pragma mark - Sixth.界面配置

#pragma mark - Seventh.懒加载

@end
