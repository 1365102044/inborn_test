//
//  System_LocalData.m
//  Project
//
//  Created by 郑键 on 17/1/24.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "System_LocalData.h"
#import "twlt_uuid_util.h"
#import "ZJLocalDataManager.h"

@implementation System_LocalData

- (NSString *)UUID
{
    if (!_UUID) {
        _UUID = twlt_uuid_create();
    }
    return _UUID;
}

@end
