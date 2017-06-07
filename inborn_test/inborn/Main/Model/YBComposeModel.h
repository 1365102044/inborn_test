//
//  YBComposeModel.h
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseModel.h"
#import "YBUploadImageModel.h"
#import "YBGoodPartModel.h"
#import "YBGoodModel.h"

@interface YBComposeModel : ZJBaseModel

/**
 <#descrption#>
 */
@property (nonatomic, strong) NSArray *accessoryList;

/**
 <#descrption#>
 */
@property (nonatomic, strong) NSArray *pubImgList;

/**
 <#descrption#>
 */
@property (nonatomic, copy) NSString *pubImgRandNum;

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBGoodModel *goods;

@end
