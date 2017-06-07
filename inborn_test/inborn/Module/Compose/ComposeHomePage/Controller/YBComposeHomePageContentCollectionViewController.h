//
//  YBComposeHomePageContentCollectionViewController.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionViewController.h"
#import "YBComposeHomePageViewModel.h"

@interface YBComposeHomePageContentCollectionViewController : ZJBaseCollectionViewController

/**
 商品id
 */
@property (nonatomic, copy) NSString *goodsId;

/**
 viewModel
 */
@property (nonatomic, strong) YBComposeHomePageViewModel *composeHomePageViewModel;

/**
 发布
 */
- (void)compose;

@end
