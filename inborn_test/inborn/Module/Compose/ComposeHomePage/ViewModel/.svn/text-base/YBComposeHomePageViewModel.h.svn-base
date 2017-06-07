//
//  YBComposeHomePageViewModel.h
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseViewModel.h"
#import "YBComposeHomePageModel.h"
#import "YBComposeModel.h"
@class YBBranceModel;

@interface YBComposeHomePageViewModel : ZJBaseViewModel

/**
 是否同意胤宝售卖协议
 */
@property (nonatomic, assign) BOOL agreeSaleAgreement;

/**
 用户输入描述/当为编辑状态时，回显使用
 */
@property (nonatomic, copy) NSString *userInputSellerDesc;

/**
 <#descrption#>
 */
@property (nonatomic, strong) YBComposeModel *composeModel;

/**
 用户输入项及界面数据模型
 */
@property (nonatomic, strong) NSArray<YBComposeHomePageModel *> *composeModelArray;

/**
 选中图片
 
 @param callBackBlock 选中图片回调
 */
- (void)selectedImageArray:(NSArray *)imageArray callBackBlock:(ZJEventCallBackBlock)callBackBlock;

/**
 选中视频
 
 @param callBackBlock 选中视频回调
 */
- (void)selectedVideo:(id)video callBackBlock:(ZJEventCallBackBlock)callBackBlock;

/**
 重新上传失败的图片
 
 @param uploadImageModel        uploadImageArray
 @param callBackBlock           callBackBlock
 */
- (void)reuploadImageWithUploadImageModel:(YBUploadImageModel *)uploadImageModel
                            callBackBlock:(ZJEventCallBackBlock)callBackBlock;

/**
 查询商品的发布信息，当无发布信息时，不传goodsId，返回商品配件
 
 @param goodsId                     商品编号
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)composeGoodsInfoWithGoodsId:(NSString *)goodsId
                            success:(ZJViewModelCallBackSuccessBlock)successCallBack
                         faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

/**
 删除图片
 
 @param urlString                   图片地址
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)delImageWithImageUrlString:(NSString *)urlString
                      currentModel:(YBUploadImageModel *)currentModel
                           success:(ZJViewModelCallBackSuccessBlock)successCallBack
                        faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

/**
 输入描述
 
 @param sellerDesc                  商品描述
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)inputSellerDesc:(NSString *)sellerDesc
                success:(ZJViewModelCallBackSuccessBlock)successCallBack
             faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

/**
 选中配件
 
 @param currentGoodsPartModel       商品配件
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)selectedGoodsPartWithCurrentGoodsPartModel:(YBGoodPartModel *)currentGoodsPartModel
                                           success:(ZJViewModelCallBackSuccessBlock)successCallBack
                                        faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

/**
 选中品牌
 
 @param branceModel                 商品品牌模型
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)selectedBranceModel:(YBBranceModel *)branceModel
                    success:(ZJViewModelCallBackSuccessBlock)successCallBack
                 faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

/**
 发布商品
 
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)composeWithGoodsId:(NSString *)goodsId
                   success:(ZJViewModelCallBackSuccessBlock)successCallBack
                faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

/**
 是否可以展示添加图片按钮

 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)canShowAddImageButtonSuccess:(ZJViewModelCallBackSuccessBlock)successCallBack
                          faileBlock:(ZJViewModelCallBackFailureBlock)failBlock;

@end
