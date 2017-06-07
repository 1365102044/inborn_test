//
//  YBComposeService.h
//  inborn
//
//  Created by 郑键 on 17/4/24.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface YBComposeService : ZJBaseService

/**
 *  获取商品品牌列表
 *
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)getGoodBranceSuccess:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消获取商品品牌列表请求
 */
- (void)cancelGetGoodBranceNetRequest;

/**
 *  获取商品发布信息
 *
 *  @param goodsId             商品编号
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)composeGoodsInfoWithGoodsId:(NSString *)goodsId
                            success:(ZJNetRequestSuccessBlock)successBlock
                               fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消获取商品发布信息请求
 */
- (void)cancelComposeGoodsInfoNetRequest;

/**
 *  删除图片网络请求
 *
 *  @param urlString           图片地址
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)delImageWithImageUrlString:(NSString *)urlString
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消删除图片网络请求
 */
- (void)cancelDelImageNetRequest;

/**
 *  发布/修改商品
 *
 *  @param goodsId              被修改商品编号，传入goodsId时为编辑，新生成时传nil
 *  @param sellerDesc           卖家描述
 *  @param sellerBuyPrice       卖家入手价格(单位:分)
 *  @param sellerPsychicPrice   卖家理想价格 (是字符串填什么传什么)
 *  @param sellerGoodsParts     卖家商品配件(多个用逗号隔开,如:发票,保修卡)
 *  @param brandId              品牌编号 传编号不是名称
 *  @param prodImages          	修改后所有上传图片返回信息逗号连接一起
 *  @param videoUrl             视频地址
 *  @param pubImgRandNum        商品图片随机数
 *  @param successBlock         成功回调
 *  @param failBlock            失败回调
 */
- (void)composeWithGoodsId:(NSString *)goodsId
                sellerDesc:(NSString *)sellerDesc
            sellerBuyPrice:(NSString *)sellerBuyPrice
        sellerPsychicPrice:(NSString *)sellerPsychicPrice
          sellerGoodsParts:(NSString *)sellerGoodsParts
                   brandId:(NSString *)brandId
                prodImages:(NSString *)prodImages
                  videoUrl:(NSString *)videoUrl
             pubImgRandNum:(NSString *)pubImgRandNum
                   success:(ZJNetRequestSuccessBlock)successBlock
                      fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消发布/修改商品网络请求
 */
- (void)cancelComposeNetRequest;

/**
 *  发布列表
 *
 *  @param curPage             当前页
 *  @param pageSize            页面大小
 *  @param goodsType           商品类型
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)composeListWithCurPage:(NSString *)curPage
                      pageSize:(NSString *)pageSize
                     goodsType:(NSString *)goodsType
                       success:(ZJNetRequestSuccessBlock)successBlock
                          fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消发布列表请求
 */
- (void)cancelComposeListNetRequest;

/**
 *  删除商品
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)delGoodWithGoodsId:(NSString *)goodsId
                   success:(ZJNetRequestSuccessBlock)successBlock
                      fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消删除商品请求
 */
- (void)cancelDelGoodNetRequest;

/**
 *  商品下架
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)offShelveWithGoodsId:(NSString *)goodsId
                     success:(ZJNetRequestSuccessBlock)successBlock
                        fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消商品下架请求
 */
- (void)cancelOffShelveNetRequest;

/**
 *  商品重新上架
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)refreshShelveWithGoodsId:(NSString *)goodsId
                         success:(ZJNetRequestSuccessBlock)successBlock
                            fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消商品重新上架请求
 */
- (void)cancelRefreshShelveNetRequest;

/**
 *  商品延期/顶一下
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)refreshGoodTimeWithGoodsId:(NSString *)goodsId
                           success:(ZJNetRequestSuccessBlock)successBlock
                              fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消商品延期/顶一下请求
 */
- (void)cancelRefreshGoodTimeNetRequest;

/**
 *  申请退担保金
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)refundDepositWithGoodsId:(NSString *)goodsId
                         success:(ZJNetRequestSuccessBlock)successBlock
                            fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消申请担保金请求
 */
- (void)cancelRefundDepositNetRequest;

/**
 *  我发布的查看单个商品
 *
 *  @param goodsId             商品id
 *  @param successBlock        成功回调
 *  @param failBlock           失败回调
 */
- (void)queryGoodsWithGoodsId:(NSString *)goodsId
                      success:(ZJNetRequestSuccessBlock)successBlock
                         fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消我发布的查看单个商品请求
 */
- (void)cancelQueryGoodsNetRequest;

@end
