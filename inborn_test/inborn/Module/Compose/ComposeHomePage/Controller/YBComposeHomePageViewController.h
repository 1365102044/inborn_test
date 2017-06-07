//
//  YBComposeHomePageViewController.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewController.h"

@interface YBComposeHomePageViewController : ZJBaseViewController

/**
 获取发布界面

 @param goodsId         goodsId
 @param extend          extend
 @return                发布界面
 */
+ (instancetype)composeHomePageViewControllerGoodsId:(NSString *)goodsId
                                              extend:(id)extend;

@end
