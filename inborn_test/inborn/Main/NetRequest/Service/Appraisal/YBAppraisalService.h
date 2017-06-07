//
//  YBAppraisalService.h
//  inborn
//
//  Created by 刘文强 on 2017/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface YBAppraisalService : ZJBaseService

/**
 *  我的鉴定列表
 *
 *  identifyType		1:全部 2待送鉴3鉴定中4已通过5未通过
 *  curPage
 *  pageSize
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalListInforWithidentifyType:(NSInteger)identifyType
                             curPage:(NSInteger)curPage
                            pageSize:(NSInteger)pageSize
                             success:(ZJNetRequestSuccessBlock)successBlock
                                fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消鉴定列表网络请求
 */
- (void)cancelgetAppraisalListInforNetRequest;



/**
 *  鉴定获取提交物流页面信息接口
 *
 *  appraisalId
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)GetCommitLogiticsInforWithappraisalId:(NSString *)appraisalId
                                      success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock;
/**
 *  取消鉴定获取提交物流页面信息接口网络请求
 */
- (void)cancelgetGetCommitLogiticsInforNetRequest;



/**
 *  鉴定提交物流接口
 *
 *  appraisalId	string	是	鉴定id	3
 *  expComId	string	是	快递公司id	57
 *  deliveryNum	string	是	快递单号
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalCommitLogiticsInforWithappraisalId:(NSString *)appraisalId
                                           expComId:(NSString *)expComId
                                        deliveryNum:(NSString *)deliveryNum
                                            success:(ZJNetRequestSuccessBlock)successBlock
                                               fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消鉴定提交物流接口网络请求
 */
- (void)cancelgetAppraisalCommitLogiticsInforNetRequest;


/**
 *  鉴定申请退回请求页面信息接口
 *
 *  appraisalId	string	是	鉴定id	3
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalApplyReturnWithappraisalId:(NSString *)appraisalId
                                    success:(ZJNetRequestSuccessBlock)successBlock
                                       fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消鉴定申请退回请求页面信息接口网络请求
 */
- (void)cancelAppraisalApplyReturnNetRequest;



/**
 *  鉴定确认退回接口
 *
 *  goodsId         商品编号
 *  deliveryType    1需要（快递），0不需要（自提）	1
 *  addressId		地址id
 *  depotId         仓库编号
 *  refundType      退回类型：1鉴定退回，2未售出退回
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalConfirmReturnWithappraisalId:(NSString *)appraisalId
                                    addressId:(NSString *)addressId
                                 deliveryType:(NSString *)deliveryType
                                      depotId:(NSString *)depotId
                                   refundType:(NSString *)refundType
                                      success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消鉴定确认退回接口网络请求
 */
- (void)cancelAppraisalConfirmReturnNetRequest;


/**
 *  鉴定鉴定报告
 *
 *  appraisalId	string	是	鉴定id	3
 *  @param successBlock         成功
 *  @param failBlock            失败
 */
- (void)AppraisalReportWithappraisalId:(NSString *)appraisalId
                                      success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消鉴定鉴定报告接口网络请求
 */
- (void)cancelAppraisalReportNetRequest;

@end
