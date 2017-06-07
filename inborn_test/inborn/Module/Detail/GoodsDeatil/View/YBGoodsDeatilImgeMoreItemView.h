//
//  YBGoodsDeatilImgeMoreItemView.h
//  inborn
//
//  Created by 刘文强 on 2017/4/21.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, DeatilBMoreItemType) {
    TwoType,
    FourType
};

typedef void(^clickItemBlcok)(NSString *btnstr);

@interface YBGoodsDeatilImgeMoreItemView : UIView

+ (instancetype)creatMoreItemViewWith:(DeatilBMoreItemType)moreItemType currenOrgin:(CGPoint)currenOrgin collectStatus:(NSInteger)collectStatus clickItemBtn:(clickItemBlcok)clickItemBtnBlock;

- (void)showItemMoreView;

- (void)dismissItemMoreView;

@end
