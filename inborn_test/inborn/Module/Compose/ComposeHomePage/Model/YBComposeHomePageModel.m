//
//  YBComposeHomePageModel.m
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageModel.h"

@implementation YBComposeHomePageModel

- (void)setDetailText:(NSString *)detailText
{
    _detailText = detailText;
    
    YBLog(@"%@", detailText);
}

@end
