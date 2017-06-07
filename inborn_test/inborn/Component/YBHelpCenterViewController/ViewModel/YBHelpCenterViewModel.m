//
//  YBHelpCenterViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBHelpCenterViewModel.h"
#import "YBHelpService.h"

@implementation YBHelpCenterViewModel

- (void)helpListSuccess:(ZJViewModelCallBackSuccessBlock)successCallBack
             faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    [[YBHelpService share] getHelpListWithAlias:@"帮助中心"
                                        success:^(id objc, id requestInfo) {
                                            
                                        } fail:^(id error, id requestInfo) {
                                            
                                        }];
}

@end
