//
//  YBPopoverView.m
//  inborn
//
//  Created by 郑键 on 17/5/2.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPopoverView.h"

@implementation YBPopoverView

+ (void)showPopoverToView:(UIView *)sender
         actionTitleArray:(NSArray *)actionTitleArray
            callBackBlock:(ZJEventCallBackBlock)callBackBlock
{
    NSMutableArray *tempArray = [NSMutableArray array];
    YBPopoverView *popoverView = [YBPopoverView popoverView];
    popoverView.style = PopoverViewStyleDark;
    popoverView.hideAfterTouchOutside = YES; // 点击外部时不允许隐藏
    [actionTitleArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        PopoverAction *action = [PopoverAction actionWithTitle:obj
                                                       handler:^(PopoverAction *action) {
                                                           callBackBlock(action);
                                                       }];
        [tempArray addObject:action];
    }];
    [popoverView showToView:sender withActions:tempArray.copy];
}

@end
