//
//  YBFuncButtonView.h
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBButton.h"
@class YBFuncButtonView;

@protocol YBFuncButtonViewDelegate <NSObject>

/**
 点击回调

 @param funcButtonView      funcButtonView
 @param button              button
 */
- (void)funcButtonView:(YBFuncButtonView *)funcButtonView
                button:(UIButton *)button;

@end

@interface YBFuncButtonView : ZJBaseView

/**
 配置按钮

 @param buttonModelArray buttonModelArray
 */
- (void)setButtonWithButtonArray:(NSArray<YBButton *> *)buttonModelArray;

/**
 <#descrption#>
 */
@property (nonatomic, weak) id<YBFuncButtonViewDelegate> delegate;

@end
