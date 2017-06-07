//
//  YBVersionUpgradeView.h
//  inborn
//
//  Created by 刘文强 on 2017/5/4.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBVersionModel.h"

@interface YBVersionUpgradeView : UIView

+ (instancetype)showVersionUpgradeVeiwWith:(CGRect)frame;


@property(nonatomic,strong) YBVersionModel * versionModle;

@end
