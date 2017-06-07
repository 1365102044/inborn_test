//
//  YBGoodListGoodModel.m
//  inborn
//
//  Created by 郑键 on 17/3/20.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBGoodListGoodModel.h"

@implementation YBGoodListGoodModel

- (CGFloat)textAreHeight
{
    if (!_textAreHeight) {
        
        /**
         *  计算文字高度
         *  30.4 5s
         *  34.f 6
         *  37.6 6p
         */
        if ([self checkIsOnlyLine]) {
            /**
             *  单行
             */
            _textAreHeight = 62.f + 12.f;
        }else{
            
            /**
             *  两行及以上
             */
            _textAreHeight = 80.f + 12.f;
        }
        
        YBLog(@"%f", [self.goodsName ex_getSpaceLabelHeightwithSpeace:6
                                                             withFont:SYSTEM_LIGHTFONT(12.f)
                                                            withWidth:self.itemWidth]);
        
    }
    return _textAreHeight;
}

- (BOOL)checkIsOnlyLine
{
    if ([self.goodsName ex_getSpaceLabelHeightwithSpeace:6
                                                withFont:SYSTEM_LIGHTFONT(12.f)
                                               withWidth:self.itemWidth] < 30.4
        && iPhone5SE) {
        
        return YES;
        
    }else if ([self.goodsName ex_getSpaceLabelHeightwithSpeace:6
                                                      withFont:SYSTEM_LIGHTFONT(12.f)
                                                     withWidth:self.itemWidth] < 34.f
              && iPhone6_6s) {
        return YES;
        
    }else if ([self.goodsName ex_getSpaceLabelHeightwithSpeace:6
                                                      withFont:SYSTEM_LIGHTFONT(12.f)
                                                     withWidth:self.itemWidth] < 37.6
              && iPhone6Plus_6sPlus) {
        return YES;
    }else{
        return NO;
    }
}

- (CGFloat)itemHeight
{
    if (!_itemHeight) {
        
        /**
         *  计算原图宽高比例
         */
        CGFloat precent = [self.rectangleImageH floatValue] / [self.rectangleImageW floatValue];
        
        _itemHeight = (precent == 0 ? 1 : precent) * self.itemWidth + self.textAreHeight;
        
//        YBLog(@"%f, %@", _itemHeight, self.customId);
    }
    return _itemHeight;
}

@end
