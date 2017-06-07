//
//  YBSearchBarView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "ZJTextField.h"
/**
 canEditType,               能编辑的搜索框
 notEditType                点击跳转的搜索框
 */
typedef NS_ENUM(NSInteger, searchBarType) {
    canEditType,
    notEditType
};

/**
 点击回调
 */
typedef void(^clickSearchBarBlock)(NSString *textfile,searchBarType type);

@interface YBSearchBarView :ZJBaseView

/**
 初始化
 */
+ (instancetype)creatSearchBarViewWithType:(searchBarType)Type textfieldPlacehodler:(NSString *)placeholder
                                clickBlock:(clickSearchBarBlock)clickBlock;
/**
 称成为第一响应
 */
- (void)becomFristResponder;

- (void)resginFristResponder;
@end
