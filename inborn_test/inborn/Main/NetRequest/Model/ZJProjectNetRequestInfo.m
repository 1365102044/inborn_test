//
//  ZJProjectNetRequestInfo.m
//  Project
//
//  Created by 郑键 on 17/2/16.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJProjectNetRequestInfo.h"

@implementation ZJProjectNetRequestInfo

- (void)setResponseObject:(id)responseObject
{
    if ([responseObject isKindOfClass:[NSHTTPURLResponse class]]) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)responseObject;
        _responseObject = response.allHeaderFields;
        
    }else{
        _responseObject = @{@"errorMsg":@"响应头错误"};
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"sessionTask-%@\nurlString-%@\nrequestParam-%@\ntimeStamp-%@\nresponseObject-%@",
            _sessionTask,
            _urlString,
            _requestParam,
            _timeStamp,
            _responseObject];
}

@end
