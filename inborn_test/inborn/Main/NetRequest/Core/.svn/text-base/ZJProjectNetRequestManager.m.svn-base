//
//  ZJProjectNetRequestManager.m
//  Project
//
//  Created by 郑键 on 17/2/15.
//  Copyright © 2017年 zhengjian. All rights reserved.
//

#import "ZJProjectNetRequestManager.h"
#import "ZJNetRequestEncyptFatory.h"
#import "User_LocalData.h"

@interface ZJProjectNetRequestManager()

/**
 请求第三方工具
 */
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

/**
 *  请求存储数组, 方便单个请求移除
 */
@property (nonatomic,strong) NSMutableArray *requests;

/**
 *  存储所有请求信息,方便单个请求做特殊处理
 */
@property (nonatomic,strong) NSMutableArray *requestInfo;

@end

@implementation ZJProjectNetRequestManager

#pragma mark - Zero.LifeCycle

/**
 *  获取网络请求工具类单利
 */
+ (ZJProjectNetRequestManager *)sharedNetRequestManager{
    static ZJProjectNetRequestManager *instance                 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (!instance) {
            instance = [[self alloc] init];
            
            /**
             *  启动网络监测
             */
            [instance startMonitoring];
        }
    });
    return instance;
}

#pragma mark - First.Auxiliary

/**
 *  开启网络监测
 */
- (void)startMonitoring
{
    AFNetworkReachabilityManager *mgr                           = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        /**
         *  当网络状态改变了, 就会调用这个block
         */
        self.currentNetStatus = status;
        
        /**
         *  TODO:根据状态提示用户当前是什么网络状态
         */
    }];
    
    [mgr startMonitoring];
}

#pragma mark - Second.CoreFunc

- (NSURLSessionDataTask *)connectNetWithUrl:(NSString *)url
                         requestNetworkType:(ZJProjectNetRequestType)networkRequestType
                                 parameters:(NSDictionary *)parameter
                            timeoutInterval:(NSTimeInterval)timeoutInterval
                               successBlock:(ZJNetRequestSuccessBlock)successBlock
                               failureBlock:(ZJNetRequestFailureBlock)failureBlock
{
    NSURLSessionDataTask * dataTask;
    
    /**
     *  配置请求头信息
     */
    [ZJNetRequestEncyptFatory setRequestHeaderWithSessionManager:self.sessionManager];
    
    switch (networkRequestType) {
            
            /**
             *  GET请求
             */
        case ZJProjectNetRequestGet:
            dataTask = [self getRequest:url
                             parameters:parameter
                        timeoutInterval:timeoutInterval
                           successBlock:successBlock
                           failureBlock:failureBlock];
            break;
            
            /**
             *  POST请求
             */
        case ZJProjectNetRequestPost:
            dataTask = [self postRequest:url
                              parameters:parameter
                         timeoutInterval:timeoutInterval
                            successBlock:successBlock
                            failureBlock:failureBlock];
            break;
            
        default:{
            dataTask = [self postRequest:url
                              parameters:parameter
                         timeoutInterval:timeoutInterval
                            successBlock:successBlock
                            failureBlock:failureBlock];
        }
            break;
    }
    return dataTask;
}

/**
 *  get网络请求
 *
 *  @param url                          url链接
 *  @param parameter                    请求参数
 *  @param timeoutInterval              超时时间
 *  @param successBlock                 成功block
 *  @param failureBlock                 失败block
 *
 *  @return 请求task
 */
- (NSURLSessionDataTask *)getRequest:(NSString *)url
                          parameters:(NSDictionary *)parameter
                     timeoutInterval:(NSTimeInterval)timeoutInterval
                        successBlock:(ZJNetRequestSuccessBlock)successBlock
                        failureBlock:(ZJNetRequestFailureBlock)failureBlock
{
    __weak ZJProjectNetRequestManager *weakSelf                 = self;
    AFHTTPSessionManager *sessionManager                        = self.sessionManager;
    sessionManager.requestSerializer.timeoutInterval            = timeoutInterval;
    
    /**
     *  TODO:加密或特殊处理参数
     */
    //NSDictionary *parameters                                    = [JZGEncyptClass parameterSortWithDictionary:parameter];
    NSURLSessionDataTask * dataTask                             = [sessionManager GET:url
                                                                           parameters:parameter
                                                                             progress:^(NSProgress * _Nonnull downloadProgress) {}
                                                                              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                                                 
                                                                                  /**
                                                                                   *  将请求从请求数组中移除
                                                                                   */
                                                                                  [weakSelf.requests removeObject:task];
                                                                                  
                                                                                  /**
                                                                                   *  先获取对应的model对象，再从数组中移除对应的model
                                                                                   */
                                                                                  ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                                                  [self.requestInfo removeObject:infoModel];
                                                                                  
                                                                                  /**
                                                                                   *  成功回调
                                                                                   */
                                                                                  if (successBlock) {
                                                                                      infoModel.responseObject = task.response;
                                                                                      successBlock(responseObject, infoModel);
                                                                                  }
                                                                              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                                                  
                                                                                  /**
                                                                                   *  将请求从请求数组中移除
                                                                                   */
                                                                                  [weakSelf.requests removeObject:task];
                                                                                  
                                                                                  /**
                                                                                   *  先获取对应的model对象，再从数组中移除对应的model
                                                                                   */
                                                                                  ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                                                  [self.requestInfo removeObject:infoModel];
                                                                                  
                                                                                  /**
                                                                                   *  失败回调
                                                                                   */
                                                                                  if (failureBlock) {
                                                                                      failureBlock(error, infoModel);
                                                                                  }
                                                                              }];
    
    /**
     *  将请求加入请求数组中
     */
    [self.requests addObject:dataTask];
    
    /**
     *  由于ios7系统给NSURLSessionTask添加类目属性会崩溃，所以改用此方法
     */
    [self addToArrayWithNewTask:dataTask url:url info:parameter];
    return dataTask;
}

/**
 *  post网络请求
 *
 *  @param url                          url链接
 *  @param parameter                    请求参数
 *  @param timeoutInterval              超时时间
 *  @param successBlock                 成功block
 *  @param failureBlock                 失败block
 *
 *  @return 请求task
 */
- (NSURLSessionDataTask *)postRequest:(NSString *)url
                           parameters:(NSDictionary *)parameter
                      timeoutInterval:(NSTimeInterval)timeoutInterval
                         successBlock:(ZJNetRequestSuccessBlock)successBlock
                         failureBlock:(ZJNetRequestFailureBlock)failureBlock
{
    __weak ZJProjectNetRequestManager *weakSelf                 = self;
    AFHTTPSessionManager *sessionManager                        = self.sessionManager;
    sessionManager.requestSerializer.timeoutInterval            = timeoutInterval;
    
    /**
     *  TODO:加密或特殊处理参数
     */
    NSDictionary *parameters = parameter;
    
    NSURLSessionDataTask *dataTask = [sessionManager POST:url
                                               parameters:parameters
                                                 progress:^(NSProgress *uploadProgress) {}
                                                  success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
                                                      
                                                      /**
                                                       *  将请求从请求数组中移除
                                                       */
                                                      [weakSelf.requests removeObject:task];
                                                      
                                                      /**
                                                       *  先获取对应的model对象，再从数组中移除对应的model
                                                       */
                                                      ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                      [self.requestInfo removeObject:infoModel];
                                                      
                                                      /**
                                                       *  成功回调
                                                       */
                                                      if (successBlock) {
                                                          infoModel.responseObject = task.response;
                                                          successBlock(responseObject, infoModel);
                                                      }
                                                  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                      
                                                      YBLog(@"error.code==%@,description==%@",@(error.code),error.localizedDescription);
                                                      
                                                      /**
                                                       *  将请求从请求数组中移除
                                                       */
                                                      [weakSelf.requests removeObject:task];
                                                      
                                                      /**
                                                       *  先获取对应的model对象，再从数组中移除对应的model
                                                       */
                                                      ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                      [self.requestInfo removeObject:infoModel];
                                                      
                                                      /**
                                                       *  失败回调
                                                       */
                                                      if (failureBlock) {
                                                          failureBlock(error, infoModel);
                                                      }
                                                  }];
    
    /**
     *  将请求加入请求数组中
     */
    [self.requests addObject:dataTask];
    
    /**
     *  由于ios7系统给NSURLSessionTask添加类目属性会崩溃，所以改用此方法
     */
    [self addToArrayWithNewTask:dataTask url:url info:parameters];
    return dataTask;
    
}

/**
 *  上传图片网络请求（流的方式上传）
 *
 *  @param url                          url链接
 *  @param parameter                    请求参数
 *  @param images                       需要上传的图片数组
 *  @param timeInterval                 超时时间（单张图片上传超时时间）
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
                                failureBlock:(ZJNetRequestFailureBlock)failureBlock
{
    AFHTTPSessionManager *sessionManager                    = self.sessionManager;
    NSTimeInterval timeIntervals                            = 0;
    if ([images count] >= 3) {
        timeIntervals = ([images count] / 3  + 1) * timeInterval;
    }else{
        timeIntervals = timeInterval;
    }
    sessionManager.requestSerializer.timeoutInterval        = timeIntervals;
    
    /**
     *  TODO:加密或特殊处理参数
     */
    NSDictionary *parameters = parameter;
    
    NSURLSessionDataTask * dataTask = [sessionManager POST:url
                                                parameters:parameters
                                 constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                                     for (NSInteger i = 0; i < [images count]; i++) {
                                         [formData appendPartWithFileData:[images objectAtIndex:i]
                                                                     name:@"pic"
                                                                 fileName:@"image.jpg"
                                                                 mimeType:@"image/jpeg"];
                                     }
                                 }
                                                  progress:^(NSProgress * _Nonnull uploadProgress) {
                                                      
                                                  }
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                       
                                                       /**
                                                        *  将请求从请求数组中移除
                                                        */
                                                       [self.requests removeObject:task];
                                                       
                                                       /**
                                                        *  先获取对应的model对象，再从数组中移除对应的model
                                                        */
                                                       ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                       [self.requestInfo removeObject:infoModel];
                                                       
                                                       /**
                                                        *  成功回调
                                                        */
                                                       if (successBlock) {
                                                           infoModel.responseObject = task.response;
                                                           successBlock(responseObject, infoModel);
                                                       }
                                                   }
                                                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                       
                                                       /**
                                                        *  将请求从请求数组中移除
                                                        */
                                                       [self.requests removeObject:task];
                                                       
                                                       /**
                                                        *  先获取对应的model对象，再从数组中移除对应的model
                                                        */
                                                       ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                       [self.requestInfo removeObject:infoModel];
                                                       
                                                       /**
                                                        *  失败回调
                                                        */
                                                       if (failureBlock) {
                                                           failureBlock(error, infoModel);
                                                       }
                                                   }];
    
    /**
     *  将请求加入请求数组中
     */
    [self.requests addObject:dataTask];
    
    /**
     *  由于ios7系统给NSURLSessionTask添加类目属性会崩溃，所以改用此方法
     */
    [self addToArrayWithNewTask:dataTask url:url info:parameters];
    return dataTask;
}

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
                                   failureBlock:(ZJNetRequestFailureBlock)failureBlock
{
    AFHTTPSessionManager *sessionManager                        = self.sessionManager;
    sessionManager.requestSerializer.timeoutInterval            = 120;
    
    /**
     *  TODO:加密或特殊处理参数
     */
    NSDictionary *parameters                                    = parameter;
    
    NSURLSessionDataTask * dataTask = [sessionManager POST:url
                                                parameters:parameters
                                 constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                                     [formData appendPartWithFileURL:imagesZipPath
                                                                name:@"file"
                                                            fileName:@"file.zip"
                                                            mimeType:@"application/zip"
                                                               error:nil];
                                 }
                                                  progress:^(NSProgress * _Nonnull uploadProgress) {

                                                  }
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                       
                                                       /**
                                                        *  将请求从请求数组中移除
                                                        */
                                                       [self.requests removeObject:task];
                                                       
                                                       /**
                                                        *  先获取对应的model对象，再从数组中移除对应的model
                                                        */
                                                       ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                       [self.requestInfo removeObject:infoModel];
                                                       
                                                       /**
                                                        *  成功回调
                                                        */
                                                       if (successBlock) {
                                                           infoModel.responseObject = task.response;
                                                           successBlock(responseObject, infoModel);
                                                       }
                                                   }
                                                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                       
                                                       /**
                                                        *  将请求从请求数组中移除
                                                        */
                                                       [self.requests removeObject:task];
                                                       
                                                       /**
                                                        *  先获取对应的model对象，再从数组中移除对应的model
                                                        */
                                                       ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                       [self.requestInfo removeObject:infoModel];
                                                       
                                                       /**
                                                        *  失败回调
                                                        */
                                                       if (failureBlock) {
                                                           failureBlock(error, infoModel);
                                                       }
                                                   }];
    
    /**
     *  将请求加入请求数组中
     */
    [self.requests addObject:dataTask];
    
    /**
     *  由于ios7系统给NSURLSessionTask添加类目属性会崩溃，所以改用此方法
     */
    [self addToArrayWithNewTask:dataTask url:url info:parameters];
    return dataTask;
}

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
                                failureBlock:(ZJNetRequestFailureBlock)failureBlock
{
    AFHTTPSessionManager *sessionManager                                = self.sessionManager;
    sessionManager.requestSerializer.timeoutInterval                    = timeoutInterval;
    
    /**
     *  TODO:加密或特殊处理参数
     */
    NSDictionary *parameters                                            = parameter;
    NSURLSessionDataTask * dataTask = [sessionManager POST:url
                                                parameters:parameters
                                 constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                                     [formData appendPartWithFileURL:videoPath
                                                                name:@""
                                                            fileName:@""
                                                            mimeType:@"mpeg4/mov"
                                                               error:nil];
                                 }
                                                  progress:^(NSProgress * _Nonnull uploadProgress) {
                                                      
                                                  }
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                       
                                                       /**
                                                        *  将请求从请求数组中移除
                                                        */
                                                       [self.requests removeObject:task];
                                                       
                                                       /**
                                                        *  先获取对应的model对象，再从数组中移除对应的model
                                                        */
                                                       ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                       [self.requestInfo removeObject:infoModel];
                                                       
                                                       /**
                                                        *  成功回调
                                                        */
                                                       if (successBlock) {
                                                           infoModel.responseObject = task.response;
                                                           successBlock(responseObject, infoModel);
                                                       }
                                                   }
                                                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                       
                                                       /**
                                                        *  将请求从请求数组中移除
                                                        */
                                                       [self.requests removeObject:task];
                                                       
                                                       /**
                                                        *  先获取对应的model对象，再从数组中移除对应的model
                                                        */
                                                       ZJProjectNetRequestInfo *infoModel = [self getInfoModelWithTask:task];
                                                       [self.requestInfo removeObject:infoModel];
                                                       
                                                       /**
                                                        *  失败回调
                                                        */
                                                       if (failureBlock) {
                                                           failureBlock(error, infoModel);
                                                       }
                                                   }];
    
    /**
     *  将请求加入请求数组中
     */
    [self.requests addObject:dataTask];
    
    /**
     *  由于ios7系统给NSURLSessionTask添加类目属性会崩溃，所以改用此方法
     */
    [self addToArrayWithNewTask:dataTask url:url info:parameters];
    return dataTask;
}

/**
 *  将请求相关数据添加到数组中
 *
 *  @param dataTask         dataTask
 *  @param url              url
 *  @param info             info
 */
-(void)addToArrayWithNewTask:(NSURLSessionTask *)dataTask
                          url:(NSString *)url
                         info:(NSDictionary *)info
{
    /**
     *  由于ios7系统给NSURLSessionTask添加类目属性会崩溃，所以改用此方法
     */
    ZJProjectNetRequestInfo *requestInfoModel                   = [[ZJProjectNetRequestInfo alloc]init];
    requestInfoModel.sessionTask                                = dataTask;
    requestInfoModel.urlString                                  = url;
    requestInfoModel.requestParam                               = info;
    requestInfoModel.timeStamp                                  = [NSDate ex_getCurrentTimeStamp];
    [self.requestInfo addObject:requestInfoModel];
}

/**
 *  根据task，从requestInfo数组中找到对应的model
 *
 *  @param dataTask dataTask
 *  @return model
 */
- (ZJProjectNetRequestInfo *)getInfoModelWithTask:(NSURLSessionTask *)dataTask
{
    __block ZJProjectNetRequestInfo *infoModel;
    [self.requestInfo enumerateObjectsUsingBlock:^(ZJProjectNetRequestInfo *  _Nonnull obj,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        if ([dataTask isEqual:obj.sessionTask]) {
            infoModel               = obj;
            *stop                   = YES;
        }
    }];
    
    return infoModel;
}

/**
 *  取消所有网络请求
 */
- (void)cancelNetworkRequest
{
    /**
     *  可以使用该种方法直接取消所有网络请求或者遍历requests集合，逐个调用cancel方法
     */
    [self.sessionManager.operationQueue cancelAllOperations];
}

/**
 *  取消单个网络请求
 *
 *  @param task 需要被取消的请求task
 */
- (void)cancelNetworkRequestWithTask:(NSURLSessionTask *)task
{
    /**
     *  如果要取消的请求正在运行中，进行取消操作
     */
    if (task.state == NSURLSessionTaskStateRunning) {
                
        /**
         *  cancel 之后会走失败block，而失败block里已经将该task移除了，所以这里不需要移除
         */
        [task cancel];
        return;
    }else{
        
        YBLog(@"%@", @"网络请求并未运行，无需取消");
    }
}

/**
 *  取消单个网络请求通过urlString 与👆👆👆方法二选一即可
 *
 *  @param urlString                    需要被取消的请求urlString
 *  @param type                         POST/GET
 */
- (void)cancelNetworkRequestWithUrlString:(NSString *)urlString
                                     type:(NSString *)type
{
    NSError * error;
    /**
     *  根据请求的类型 以及 请求的url创建一个NSMutableURLRequest
     *  通过该url去匹配请求队列中是否有该url,如果有的话 那么就取消该请求
     */
    NSString * urlToPeCanced                                    = [[[self.sessionManager.requestSerializer requestWithMethod:type
                                                                                                                   URLString:urlString
                                                                                                                  parameters:nil
                                                                                                                       error:&error] URL] path];
    for (NSOperation * operation in self.sessionManager.operationQueue.operations) {
        if ([operation isKindOfClass:[NSURLSessionTask class]]) {
            BOOL hasMatchRequestType                            = [type isEqualToString:[[(NSURLSessionTask *)operation currentRequest] HTTPMethod]];
            BOOL hasMatchRequestUrlString                       = [urlToPeCanced isEqualToString:[[[(NSURLSessionTask *)operation currentRequest] URL] path]];
            if (hasMatchRequestType&&hasMatchRequestUrlString) {
                [operation cancel];
            }
        }
        [operation cancel];
    }
}

/**
 *  获取当前网络的状态，主要是看是否有网络。
 *
 *  @return 返回值 YES 说明当前网络可用， NO 说明当前网络不可用
 */
- (BOOL)netWorkingStatus
{
    BOOL    status;
    switch (self.currentNetStatus) {
            
            /**
             *  未知网络
             */
        case AFNetworkReachabilityStatusUnknown:
            status = NO;
            break;
            
            /**
             *  没有网络(断网)
             */
        case AFNetworkReachabilityStatusNotReachable:
            status = NO;
            break;
            
            /**
             *  手机自带网络
             */
        case AFNetworkReachabilityStatusReachableViaWWAN:
            status = YES;
            break;
            
            /**
             *  WIFI
             */
        case AFNetworkReachabilityStatusReachableViaWiFi:
            status = YES;
            break;
    }
    return status;
}

#pragma mark - Third.Lazy

- (AFHTTPSessionManager *)sessionManager
{
    if (!_sessionManager) {
        AFHTTPSessionManager *sessionManager                        = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        AFJSONResponseSerializer *serializer                        = [AFJSONResponseSerializer serializer];
        serializer.removesKeysWithNullValues                        = YES;
        serializer.acceptableContentTypes                           = [NSSet setWithObjects:
                                                                       @"application/json",
                                                                       @"text/javascript",
                                                                       @"text/json",
                                                                       @"text/plain",
                                                                       @"text/html",
                                                                       @"application/zip",
                                                                       nil];
        sessionManager.responseSerializer                           = serializer;
        _sessionManager                                             = sessionManager;
    }
    return _sessionManager;
}

- (NSMutableArray *)requests
{
    if (!_requests) {
        _requests                                                   = [NSMutableArray array];
    }
    return _requests;
}

- (NSMutableArray *)requestInfo
{
    if (!_requestInfo) {
        _requestInfo                                                = [NSMutableArray array];
    }
    return _requestInfo;
}

@end
