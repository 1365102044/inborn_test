//
//  YBComposeHomePageFooterView.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionReusableView.h"
@class YBComposeHomePageFooterView;

/**
 *  footer
 */
UIKIT_EXTERN NSString * const YBComposeHomePageFooterViewReuseIdentifier;

@protocol YBComposeHomePageFooterViewDelegate <NSObject>

/**
 按钮点击事件

 @param composeHomePageFooterView       composeHomePageFooterView
 @param button                          button
 */
- (void)composeHomePageFooterView:(YBComposeHomePageFooterView *)composeHomePageFooterView
                           button:(UIButton *)button;

@end

@interface YBComposeHomePageFooterView : ZJBaseCollectionReusableView

/**
 是否隐藏功能按钮
 */
@property (nonatomic, assign) BOOL isShowFuncButton;

/**
 <#descrption#>
 */
@property (nonatomic, weak) id<YBComposeHomePageFooterViewDelegate> delegate;

@end
