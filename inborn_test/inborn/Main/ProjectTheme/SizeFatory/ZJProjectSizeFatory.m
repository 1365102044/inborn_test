//
//  ZJProjectSizeFatory.m
//  inborn
//
//  Created by 郑键 on 17/5/11.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJProjectSizeFatory.h"

@implementation ZJProjectSizeFatory

/**
 屏幕尺寸适配
 
 @param adjustPercentFloat      需要适配尺寸
 @return                        按百分比适配后尺寸
 */
+ (CGFloat)projectSizeFatoryAdjustPercentFloat:(CGFloat)adjustPercentFloat
{
    if (SCREEN_SCALE == 1) {
        
        /**
         *  小屏幕
         */
        return (adjustPercentFloat * SCREEN_WIDTH / 375);
        
    }else if (SCREEN_SCALE == 2){
    
        /**
         *  iphone6
         */
        if (iPhone5SE) {
            
            return (adjustPercentFloat * SCREEN_WIDTH / 375);
        }else{
            return (adjustPercentFloat * 375 / 375);
        }
        
    }else if (SCREEN_SCALE == 3){
        
        /**
         *  iphone6Plus
         */
        return (adjustPercentFloat * 375 / 375);
        
    }else{
        
        return (adjustPercentFloat * SCREEN_WIDTH / 375);
    }
}

@end
