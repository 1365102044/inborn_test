//
//  YBComposeHomePageDetailHeaderView.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseCollectionReusableView.h"

/**
 *  detailHeader
 */
UIKIT_EXTERN NSString * const YBComposeHomePageDetailHeaderViewReuseIdentifier;

@interface YBComposeHomePageDetailHeaderView : ZJBaseCollectionReusableView

/**
 回显使用
 */
@property (nonatomic, copy) NSString *userInputText;

@end
