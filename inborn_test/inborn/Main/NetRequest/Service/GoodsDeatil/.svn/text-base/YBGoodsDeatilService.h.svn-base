//
//  YBGoodsDeatilService.h
//  inborn
//
//  Created by 刘文强 on 2017/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseService.h"

@interface YBGoodsDeatilService : ZJBaseService

/**
 *  获取商品详情A(大图模式)的数据
 *  @param goodsId                 商品编号 (必传)
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getGoodsDeatilBigImageInfoWithgoodsId:(NSString *)goodsId
                                    isPreview:(BOOL)isPreview
                                      Success:(ZJNetRequestSuccessBlock)successBlock
                                         fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消获取商品详情A(大图模式)的数据
 */
- (void)cancelGetGoodsDeatilBigImageInfoNetRequest;


/**
 *  获取商品详情B(详细模式)的数据
 *  @param goodsId                 商品编号 (必传)
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)getGoodsDeatilInfoWithgoodsId:(NSString *)goodsId
                              Success:(ZJNetRequestSuccessBlock)successBlock
                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消获取商品详情A(大图模式)的数据
 */
- (void)cancelGetGoodsDeatilInfoNetRequest;


/**
 *  添加关注
 *  @param goodsId                 商品编号 (必传)
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)addCollectGoodsInGoodsDeatilWithgoodsId:(NSString *)goodsId
                              Success:(ZJNetRequestSuccessBlock)successBlock
                                 fail:(ZJNetRequestFailureBlock)failBlock;

/**
 *  取消关注
 *  @param goodsId                 商品编号 (必传)
 *  @param successBlock            成功
 *  @param failBlock               失败
 */
- (void)cancleCollectGoodsInGoodsDeatilWithgoodsId:(NSString *)goodsId
                                        Success:(ZJNetRequestSuccessBlock)successBlock
                                           fail:(ZJNetRequestFailureBlock)failBlock;


/**
 *  猜你喜欢
 goodsId	string	是	当前浏览的商品的id
 curPage	string	是	当前页
 pageSize	string	是	每页大小
 */
- (void)guessLikeGoodsInGoodsDeatilWithgoodsId:(NSString *)goodsId
                                           curPage:(NSInteger )curPage
                                          pageSize:(NSInteger )pageSize
                                           Success:(ZJNetRequestSuccessBlock)successBlock
                                              fail:(ZJNetRequestFailureBlock)failBlock;
@end
