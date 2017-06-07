//
//  System_LocalData.h
//  Project
//
//  Created by 郑键 on 17/1/24.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "Base_LocalData.h"

@interface System_LocalData : Base_LocalData

/**
 当前系统版本
 */
@property (nonatomic, copy) NSString *currentSystemVersion;

/**
 服务器最新的补丁版本
 */
@property (nonatomic, copy) NSString *severCurrentVersionPatchBuild;

/**
 UUID
 */
@property (nonatomic, copy) NSString *UUID;

@end
