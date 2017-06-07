//
//  YBRegisterMessageCodeTopView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/16.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBVerCodeTextField.h"


/**
 重新获取验证码
 */
typedef void(^clickRegetMessageCodeblock)();

@interface YBRegisterMessageCodeTopView : ZJBaseView

/**
 初始化
 */
+ (instancetype)creatReginsterMessageCodeTopView;


@property(nonatomic,strong) YBVerCodeTextField * CodeTextField;

@property(nonatomic,copy) clickRegetMessageCodeblock  clickRegerMessageBlock;

- (void)StarTimer;
@end
