//
//  YBLoginBoomView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/15.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBLoginViewController.h"

typedef void(^clickBoomViewBtnBlock)(NSInteger btnTag);

@interface YBLoginBoomView : ZJBaseView

/**
 初始化view
 */
+ (instancetype)creatLoginBoomViewWithType:(loginTypeEnum)Type
                                isHiddenWX:(BOOL)isHiddenWX;

@property(nonatomic,copy) clickBoomViewBtnBlock  boomViewBlock;


/**
 更改类型
 */
@property(nonatomic,assign) loginTypeEnum  updateloginType;

@end
