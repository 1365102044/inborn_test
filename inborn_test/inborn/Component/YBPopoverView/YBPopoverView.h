//
//  YBPopoverView.h
//  inborn
//
//  Created by 郑键 on 17/5/2.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "PopoverView.h"

@interface YBPopoverView : PopoverView

+ (void)showPopoverToView:(UIView *)sender
         actionTitleArray:(NSArray *)actionTitleArray
            callBackBlock:(ZJEventCallBackBlock)callBackBlock;

@end
