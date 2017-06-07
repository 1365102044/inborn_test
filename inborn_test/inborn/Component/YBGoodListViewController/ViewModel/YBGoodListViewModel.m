//
//  YBGoodListViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListViewModel.h"
#import "ZJHomePageService.h"

@implementation YBGoodListViewModel

- (NSArray<NSString *> *)adsImageUrlStrings
{
    if (!_adsImageUrlStrings) {
        
        NSMutableArray *tempArray = [NSMutableArray array];
        
        [self.adsArray enumerateObjectsUsingBlock:^(YBGoodListAdsModel * _Nonnull obj,
                                                    NSUInteger idx,
                                                    BOOL * _Nonnull stop) {
            [tempArray addObject: ZJIMAGEURLSTRING(ZJProjectImageURLStringMid,
                                                   obj.adPic)];
        }];
        
        _adsImageUrlStrings = tempArray.copy;
    }
    return _adsImageUrlStrings;
}

/**
 添加喜欢
 
 @param goodId                      goodId
 @param successCallBackBlock        successCallBackBlock
 @param failedCallBackBlock         failedCallBackBlock
 */
- (void)addCollectionWithGoodId:(NSString *)goodId
           successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
            failedCallBackBlock:(ZJViewModelCallBackFailureBlock)failedCallBackBlock
{
    [[ZJHomePageService share] addCollectionWithGoodId:goodId
                                               success:^(id objc, id requestInfo) {
                                                   successCallBackBlock(nil);
                                               } fail:^(id error, id requestInfo) {
                                                   failedCallBackBlock(error);
                                               }];
}

/**
 取消喜欢
 
 @param goodId                      goodId
 @param successCallBackBlock        successCallBackBlock
 @param failedCallBackBlock         failedCallBackBlock
 */
- (void)cancelCollectionWithGoodId:(NSString *)goodId
              successCallBackBlock:(ZJViewModelCallBackSuccessBlock)successCallBackBlock
               failedCallBackBlock:(ZJViewModelCallBackFailureBlock)failedCallBackBlock
{
    [[ZJHomePageService share] cancelCollectionWithGoodId:goodId
                                                  success:^(id objc, id requestInfo) {
                                                      successCallBackBlock(nil);
                                                  } fail:^(id error, id requestInfo) {
                                                      failedCallBackBlock(error);
                                                  }];
}

@end
