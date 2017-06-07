//
//  YBMessageService.h
//  inborn
//
//  Created by 刘文强 on 2017/4/8.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJBaseService.h"
@interface YBMessageService : ZJBaseService

+ (instancetype)share;

/**
 *  获取消息未读数
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageListNureadNewsNmuberInforSuccess:(ZJNetRequestSuccessBlock)successBlock
                             fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消获取消息未读数
 */
- (void)cancelgetMessageListNureadNewsNmuberInforNetRequest;

/**
 *  获取订单消息列表
 *  pageSize	string	是	没有大小
 *  curPage	string	是	当前页
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageOrderListInforWith:(NSInteger)pageSize
                             curPage:(NSInteger)curPage
                             Success:(ZJNetRequestSuccessBlock)successBlock
                                              fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消获取订单消息列表
 */
- (void)cancelgetMessageOrderListInforNetRequest;


/**
 *  获取系统消息列表
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageSystemNewsListInforWith:(NSInteger)pageSize
                                  curPage:(NSInteger)curPage
                                  Success:(ZJNetRequestSuccessBlock)successBlock
                                              fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消获取系统消息列表
 */
- (void)cancelgetMessageSystemNewsListInforNetRequest;


/**
 *  获取鉴定订单消息列表
 *
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageAppraisalNewsListInforWith:(NSInteger)pageSize
                                     curPage:(NSInteger)curPage
                                     Success:(ZJNetRequestSuccessBlock)successBlock
                                              fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消获取鉴定订单消息列表
 */
- (void)cancelgetMessageAppraisalNewsListInforNetRequest;


/**
 *  获取担保金订单消息列表
 *  pageSize	string	是	没有大小
 *  curPage	string	是	当前页
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getMessageDepositNewsListInforWith:(NSInteger)pageSize
                                   curPage:(NSInteger)curPage
                                   Success:(ZJNetRequestSuccessBlock)successBlock
                                      fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消获取担保金订单消息列表
 */
- (void)cancelgetMessageDespositNewsListInforNetRequest;
@end
