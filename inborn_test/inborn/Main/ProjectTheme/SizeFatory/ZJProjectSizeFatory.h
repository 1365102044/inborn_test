//
//  ZJProjectSizeFatory.h
//  inborn
//
//  Created by 郑键 on 17/5/11.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZJProjectSizeFatory : NSObject

/**
 屏幕尺寸适配

 @param adjustPercentFloat      需要适配尺寸
 @return                        按百分比适配后尺寸
 */
+ (CGFloat)projectSizeFatoryAdjustPercentFloat:(CGFloat)adjustPercentFloat;

@end
