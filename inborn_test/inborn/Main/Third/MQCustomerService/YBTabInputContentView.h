//
//  YBTabInputContentView.h
//  inborn
//
//  Created by 郑键 on 17/5/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <MeiQiaSDK/MeiQiaSDK.h>
#import "MQInputContentView.h"
#import "MEIQIA_HPGrowingTextView.h"

@interface YBTabInputContentView : MQInputContentView <UITextFieldDelegate>

@property (strong, nonatomic) MEIQIA_HPGrowingTextView *textField;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setupButtons;

@end
