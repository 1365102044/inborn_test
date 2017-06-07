//
//  YBChatViewController.h
//  inborn
//
//  Created by 郑键 on 17/4/10.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQChatViewConfig.h"
#import "MQChatTableView.h"
#ifdef INCLUDE_MEIQIA_SDK
#import "MQServiceToViewInterface.h"
#endif
#import "MQChatAudioTypes.h"


@interface YBChatViewController : UIViewController

/**
 * @brief 聊天界面的tableView
 */
@property (nonatomic, strong) MQChatTableView *chatTableView;

/**
 * @brief 聊天界面底部的输入框view
 */
@property (nonatomic, strong) UIView *inputBarView;

/**
 * @brief 聊天界面底部的输入框view
 */
@property (nonatomic, strong) UITextView *inputBarTextView;

/**
 * 根据配置初始化客服聊天界面
 * @param manager 初始化配置
 */
- (instancetype)initWithChatViewManager:(MQChatViewConfig *)chatViewConfig;

/**
 *  关闭聊天界面
 */
- (void)dismissChatViewController;

- (void)didSelectNavigationRightButton;

- (void)sendUrlMessage:(NSString *)urlString;

#ifdef INCLUDE_MEIQIA_SDK
/**
 *  聊天界面的委托方法
 */
@property (nonatomic, weak) id<MQServiceToViewInterfaceDelegate> serviceToViewDelegate;
#endif

@end
