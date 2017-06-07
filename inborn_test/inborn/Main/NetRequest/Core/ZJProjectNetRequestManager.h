//
//  ZJProjectNetRequestManager.h
//  Project
//
//  Created by 郑键 on 17/2/15.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJProjectNetRequestInfo.h"
#import "ZJNetRequestError.h"

@interface ZJProjectNetRequestManager : NSObject

/**
 *  当前网络状态
 */
@property(nonatomic, assign)AFNetworkReachabilityStatus currentNetStatus;

/**
 *  获取网络请求单利对象
 *
 *  @return 网络请求管理单利对象
 */
+ (ZJProjectNetRequestManager *)sharedNetRequestManager;

/**
 *  网络请求
 *
 *  @param url                      url
 *  @param networkRequestType       请求类型
 *  @param parameter                参数字典
 *  @param timeoutInterval          超时时间
 *  @param successBlock             成功回调
 *  @param failureBlock             失败回调
 *  @return                         task
 */
- (NSURLSessionDataTask *)connectNetWithUrl:(NSString *)url
                         requestNetworkType:(ZJProjectNetRequestType)networkRequestType
                                 parameters:(NSDictionary *)parameter
                            timeoutInterval:(NSTimeInterval)timeoutInterval
                               successBlock:(ZJNetRequestSuccessBlock)successBlock
                               failureBlock:(ZJNetRequestFailureBlock)failureBlock;

/**
 *  上传图片网络请求（流的方式上传）
 *
 *  @param url                          url链接
 *  @param parameter                    请求参数
 *  @param images                       需要上传的图片数组
 *  @param timeInterval                 超时时间
 *  @param successBlock                 成功block
 *  @param failureBlock                 失败block
 *
 *  @return 请求task
 */
- (NSURLSessionDataTask *)uploadImageWithUrl:(NSString *)url
                                   parameter:(NSDictionary *)parameter
                                      images:(NSArray *)images
                             timeoutInterval:(NSTimeInterval)timeInterval
                                successBlock:(ZJNetRequestSuccessBlock)successBlock
                                failureBlock:(ZJNetRequestFailureBlock)failureBlock;

/**
 *  打包上传文件网络请求（文件的方式上传）
 *
 *  @param url                          url链接
 *  @param parameter                    请求参数
 *  @param imagesZipPath                需要上传的本地zip文件地址
 *  @param successBlock                 成功block
 *  @param failureBlock                 失败block
 *
 *  @return 请求task
 */
- (NSURLSessionDataTask *)uploadImageZipWithUrl:(NSString *)url
                                     parameters:(NSDictionary *)parameter
                                  imagesZipPath:(NSURL *)imagesZipPath
                                   successBlock:(ZJNetRequestSuccessBlock)successBlock
                                   failureBlock:(ZJNetRequestFailureBlock)failureBlock;

/**
 *  上传视频网络请求
 *
 *  @param url                          url链接
 *  @param parameter                    请求参数
 *  @param videoPath                    视频途径
 *  @param successBlock                 成功block
 *  @param failureBlock                 失败block
 *
 *  @return 请求task
 */
- (NSURLSessionDataTask *)uploadVideoWithUrl:(NSString *)url
                                  parameters:(NSDictionary *)parameter
                             timeoutInterval:(NSTimeInterval)timeoutInterval
                                   videoPath:(NSURL *)videoPath
                                successBlock:(ZJNetRequestSuccessBlock)successBlock
                                failureBlock:(ZJNetRequestFailureBlock)failureBlock;

/**
 *  取消所有网络请求
 */
- (void)cancelNetworkRequest;

/**
 *  取消单个网络请求
 *
 
 *  @param task                         需要被取消的请求task
 */
- (void)cancelNetworkRequestWithTask:(NSURLSessionTask *)task;

/**
 *  取消单个网络请求通过urlString 与👆👆👆方法二选一即可
 *
 *  @param urlString                    需要被取消的请求urlString
 *  @param type                         POST/GET
 */
- (void)cancelNetworkRequestWithUrlString:(NSString *)urlString
                                     type:(NSString *)type;

/**
 *  获取当前网络的状态，主要是看是否有网络。
 *
 *  @return 返回值 YES 说明当前网络可用， NO 说明当前网络不可用
 */
- (BOOL)netWorkingStatus;

@end
