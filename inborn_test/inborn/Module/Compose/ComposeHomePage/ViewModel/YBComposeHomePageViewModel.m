//
//  YBComposeHomePageViewModel.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageViewModel.h"
#import "YBComposeService.h"
#import "YXUploadFile.h"
#import "YBBranceModel.h"
#import "YBTopAlert.h"

@interface YBComposeHomePageViewModel()

/**
 选择照片处最后两个按钮
 */
@property (nonatomic, strong) NSArray *systemSelectedImageArray;

/**
 当前照片编号
 */
@property (nonatomic, assign) NSInteger selectedImageNum;

/**
 选中的商品配件
 */
@property (nonatomic, strong) NSArray *selectedGoodsPartArray;

/**
 选中的品牌
 */
@property (nonatomic, strong) YBBranceModel *selectedGoodsBrandModel;

/**
 商品描述
 */
@property (nonatomic, copy) NSString *sellerDesc;

@end

@implementation YBComposeHomePageViewModel

/**
 重新上传失败的图片
 
 @param uploadImageModel        uploadImageArray
 @param callBackBlock           callBackBlock
 */
- (void)reuploadImageWithUploadImageModel:(YBUploadImageModel *)uploadImageModel
                            callBackBlock:(ZJEventCallBackBlock)callBackBlock
{
    YXUploadFile *uploadFile = [[YXUploadFile alloc] init];
    [uploadFile uploadImagesWithImagesArray:@[uploadImageModel] andUploadImageUrlString:COMPOSE_UPLOADIMAGE_URL];
}

/**
 选中图片
 
 @param callBackBlock 选中图片回调
 */
- (void)selectedImageArray:(NSArray *)imageArray callBackBlock:(ZJEventCallBackBlock)callBackBlock
{
    /**
     *  初始化临时数组
     */
    NSMutableArray *tempArray = [NSMutableArray array];
    YXUploadFile *uploadFile = [[YXUploadFile alloc] init];
    [imageArray enumerateObjectsUsingBlock:^(UIImage *  _Nonnull image,
                                             NSUInteger idx,
                                             BOOL * _Nonnull stop) {
        
        YBUploadImageModel *uploadImageModel = [[YBUploadImageModel alloc] init];
        uploadImageModel.isSystemButton = NO;
        uploadImageModel.originalImage = image;
        uploadImageModel.num = self.selectedImageNum;
        self.selectedImageNum += 1;
        [tempArray addObject:uploadImageModel];
    }];
    
    /**
     *  上传图片，传递模型，以供进度更新
     */
    [uploadFile uploadImagesWithImagesArray:tempArray.copy andUploadImageUrlString:COMPOSE_UPLOADIMAGE_URL];
    
    NSMutableArray *totalImageArray = [NSMutableArray arrayWithArray:self.composeModel.pubImgList];
    [totalImageArray insertObjects:tempArray.copy atIndex:totalImageArray.count - 1];
    self.composeModel.pubImgList = totalImageArray.copy;
    callBackBlock(nil);
}

/**
 选中视频
 
 @param callBackBlock 选中视频回调
 */
- (void)selectedVideo:(id)video callBackBlock:(ZJEventCallBackBlock)callBackBlock
{
    
}

- (NSString *)userInputSellerDesc
{
    if (!_userInputSellerDesc
        && self.composeModel) {
        
        _userInputSellerDesc = self.composeModel.goods.sellerDesc;
        self.sellerDesc = _userInputSellerDesc;
    }
    return _userInputSellerDesc;
}

- (NSArray<YBComposeHomePageModel *> *)composeModelArray
{
    if (!_composeModelArray
        && self.composeModel) {
        
        YBComposeHomePageModel *composeModel1 = [[YBComposeHomePageModel alloc] init];
        composeModel1.title = @"入手价格";
        composeModel1.detailText = @"选填";
        composeModel1.isInput = YES;
        composeModel1.isShowAccessImageView = NO;
        if (!self.composeModel.goods.sellerBuyPrice
            || self.composeModel.goods.sellerBuyPrice.length == 0
            || [self.composeModel.goods.sellerBuyPrice isEqualToString:@""]) {
            
        }else{
            composeModel1.placholder = YES;
            composeModel1.userInputText = [NSString stringWithFormat:@"%zd", self.composeModel.goods.sellerBuyPrice.integerValue / 100];
        }
        
        YBComposeHomePageModel *composeModel2 = [[YBComposeHomePageModel alloc] init];
        composeModel2.title = @"理想售价";
        composeModel2.detailText = @"希望出售的价格";
        composeModel2.isShowFuncButton = YES;
        composeModel2.imageFilePath = IMAGEFILEPATH_PUBLISH;
        composeModel2.imageNamed = @"publish_pricehelp";
        composeModel2.isInput = YES;
        composeModel2.isShowAccessImageView = NO;
        if (!self.composeModel.goods.sellerPsychicPrice
            || self.composeModel.goods.sellerPsychicPrice.length == 0
            || [self.composeModel.goods.sellerPsychicPrice isEqualToString:@""]) {
            
        }else{
            composeModel2.placholder = YES;
            composeModel2.userInputText = self.composeModel.goods.sellerPsychicPrice;
        }
        
        YBComposeHomePageModel *composeModel3 = [[YBComposeHomePageModel alloc] init];
        composeModel3.title = @"品牌";
        composeModel3.detailText = @"请选择商品品牌";
        composeModel3.isInput = NO;
        composeModel3.isShowAccessImageView = YES;
        if (!self.composeModel.goods.brand) {
            
        }else{
            composeModel3.placholder = YES;
            composeModel3.userInputText = [NSString stringWithFormat:@"%@/%@", self.composeModel.goods.brand.brandEnName,
                                           self.composeModel.goods.brand.brandCnName];
            YBBranceModel *branceModel = [[YBBranceModel alloc] init];
            branceModel.brandName = composeModel3.userInputText;
            branceModel.brandId = self.composeModel.goods.brand.customId;
            self.selectedGoodsBrandModel = branceModel;
        }
        
        YBComposeHomePageModel *composeModel4 = [[YBComposeHomePageModel alloc] init];
        composeModel4.title = @"商品配件";
        composeModel4.detailText = @"点击下方标签添加";
        composeModel4.isInput = NO;
        composeModel4.isShowAccessImageView = NO;
        if (!self.composeModel.goods.sellerGoodsParts
            || self.composeModel.goods.sellerGoodsParts.length == 0
            || [self.composeModel.goods.sellerGoodsParts isEqualToString:@""]) {
            
        }else{
            composeModel4.placholder = YES;
            composeModel4.userInputText = self.composeModel.goods.sellerGoodsParts;
            
            NSMutableArray *temArray = [NSMutableArray array];
            [self.composeModel.accessoryList enumerateObjectsUsingBlock:^(YBGoodPartModel *  _Nonnull obj,
                                                                          NSUInteger idx,
                                                                          BOOL * _Nonnull stop) {
                if (obj.goodsPartStatus) {
                    [temArray addObject:obj];
                }
            }];
            self.selectedGoodsPartArray = temArray.copy;
        }
        
        _composeModelArray = @[composeModel1,
                               composeModel2,
                               composeModel3,
                               composeModel4];
    }
    return _composeModelArray;
}

- (NSArray *)systemSelectedImageArray
{
    if (!_systemSelectedImageArray) {
        
        YBUploadImageModel *uploadImageModel1 = [[YBUploadImageModel alloc] init];
        uploadImageModel1.isSystemButton = YES;
        uploadImageModel1.imgUrl = IMAGEFILEPATH_PUBLISH;
        uploadImageModel1.imageNamed = @"publish_addphoto";
        
        //        YBUploadImageModel *uploadImageModel2 = [[YBUploadImageModel alloc] init];
        //        uploadImageModel2.isSystemButton = YES;
        //        uploadImageModel2.imageUrlString = IMAGEFILEPATH_PUBLISH;
        //        uploadImageModel2.imageNamed = @"publish_addvideo";
        
        _systemSelectedImageArray = @[uploadImageModel1];
    }
    return _systemSelectedImageArray;
}

#pragma mark - 网络请求

/**
 查询商品的发布信息，当无发布信息时，不传goodsId，返回商品配件
 
 @param goodsId                     商品编号
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)composeGoodsInfoWithGoodsId:(NSString *)goodsId
                            success:(ZJViewModelCallBackSuccessBlock)successCallBack
                         faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    [[YBComposeService share] composeGoodsInfoWithGoodsId:goodsId success:^(id objc, id requestInfo) {
        YBLog(@"%@\n%@", objc, requestInfo);
        self.composeModel = [YBComposeModel modelWithDictionary:objc[@"data"]];
        [self setupSelectedImage];
        successCallBack(self);
    } fail:^(id error, id requestInfo) {
        YBLog(@"%@\n%@", error, requestInfo);
        failBlock(error);
    }];
}

- (void)setupSelectedImage
{
    /**
     *  为图片处添加选择按钮
     */
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.composeModel.pubImgList];
    [tempArray addObjectsFromArray:self.systemSelectedImageArray];
    self.composeModel.pubImgList  = tempArray.copy;
}

/**
 删除图片
 
 @param urlString                   图片地址
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)delImageWithImageUrlString:(NSString *)urlString
                      currentModel:(YBUploadImageModel *)currentModel
                           success:(ZJViewModelCallBackSuccessBlock)successCallBack
                        faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    [[YBComposeService share] delImageWithImageUrlString:urlString success:^(id objc, id requestInfo) {
        YBLog(@"%@\n%@", objc, requestInfo);
        
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.composeModel.pubImgList];
        [tempArray removeObject:currentModel];
        self.composeModel.pubImgList = tempArray.copy;
        
        successCallBack(self);
    } fail:^(id error, id requestInfo) {
        YBLog(@"%@\n%@", error, requestInfo);
        failBlock(error);
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"错误")
                                                tipsStringKey:error
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
    }];
}

/**
 发布商品
 
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)composeWithGoodsId:(NSString *)goodsId
                   success:(ZJViewModelCallBackSuccessBlock)successCallBack
                faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    /**
     *  判断卖家描述是否为空
     */
    if (!self.sellerDesc
        || self.sellerDesc.length == 0
        || [self.sellerDesc isEqualToString:@""]) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:@"请描述您的宝贝"
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        
        return;
    }
    
    /**
     *  图片地址
     */
    if (self.composeModel.pubImgList.count == 1) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:@"请添加图片"
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        return;
    }
    
    __block NSString *totalImageUrlString;
    NSInteger idx = 0;
    for (YBUploadImageModel *obj in self.composeModel.pubImgList) {
        
        if (!obj.isFailed
            && !obj.imgUrl) {
            
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                    tipsStringKey:@"图片上传中，请稍后"
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
            return;
        }
        
        if (obj.isFailed) {
            
            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                    tipsStringKey:@"上传图片失败，请重新上传"
                                                             type:YBTopAlertError
                                               eventCallBackBlock:^(id sender) {
                                                   
                                               }];
            return;
        }
        
        if (self.composeModel.pubImgList.count == 9) {
            
            if (idx == 0) {
                totalImageUrlString = [NSString stringWithFormat:@"%@@%@@%@@%@@%@@%@@",
                                       obj.customId,
                                       [NSString stringWithFormat:@"%zd", idx + 1],
                                       obj.imgUrl,
                                       obj.imgName,
                                       obj.imgW,
                                       obj.imgH];
            }else{
                totalImageUrlString = [NSString stringWithFormat:@"%@,%@",
                                       totalImageUrlString,
                                       [NSString stringWithFormat:@"%@@%@@%@@%@@%@@%@@",
                                        obj.customId,
                                        [NSString stringWithFormat:@"%zd", idx + 1],
                                        obj.imgUrl,
                                        obj.imgName,
                                        obj.imgW,
                                        obj.imgH]];
            }
            
        }else{
            if (idx != self.composeModel.pubImgList.count - 1) {
                
                if (idx == 0) {
                    totalImageUrlString = [NSString stringWithFormat:@"%@@%@@%@@%@@%@@%@@",
                                           obj.customId,
                                           [NSString stringWithFormat:@"%zd", idx + 1],
                                           obj.imgUrl,
                                           obj.imgName,
                                           obj.imgW,
                                           obj.imgH];
                }else{
                    totalImageUrlString = [NSString stringWithFormat:@"%@,%@",
                                           totalImageUrlString,
                                           [NSString stringWithFormat:@"%@@%@@%@@%@@%@@%@@",
                                            obj.customId,
                                            [NSString stringWithFormat:@"%zd", idx + 1],
                                            obj.imgUrl,
                                            obj.imgName,
                                            obj.imgW,
                                            obj.imgH]];
                }
            }
        }
        idx++;
    }
    
    /**
     *  品牌编号
     */
    if (!self.selectedGoodsBrandModel) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:@"请选择品牌"
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        
        return;
    }
    
    /**
     *  视频地址
     */
    
    /**
     *  随机数
     */
    
    /**
     *  判断理想价格（可为空）
     */
    YBComposeHomePageModel *composeModel2 = self.composeModelArray[1];
    
    /**
     *  卖家商品配件（可为空）
     */
    YBComposeHomePageModel *composeModel3 = self.composeModelArray.lastObject;
    
    /**
     *  卖家入手价格判断是否为空（传入单位：分）
     */
    YBComposeHomePageModel *composeModel1 = self.composeModelArray.firstObject;
    
    /**
     *  是否同意胤宝协议
     */
    if (!self.agreeSaleAgreement) {
        
        [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:@"错误"
                                                tipsStringKey:@"请阅读胤宝售卖协议"
                                                         type:YBTopAlertError
                                           eventCallBackBlock:^(id sender) {
                                               
                                           }];
        return;
    }
    
    
    [[YBComposeService share] composeWithGoodsId:goodsId
                                      sellerDesc:self.sellerDesc
                                  sellerBuyPrice:composeModel1.userInputText ? [NSString stringWithFormat:@"%@00", composeModel1.userInputText] : @""
                              sellerPsychicPrice:composeModel2.userInputText
                                sellerGoodsParts:composeModel3.userInputText ? composeModel3.userInputText : @""
                                         brandId:self.selectedGoodsBrandModel.brandId
                                      prodImages:totalImageUrlString
                                        videoUrl:@""
                                   pubImgRandNum:self.composeModel.pubImgRandNum
                                         success:^(id objc, id requestInfo) {
                                             YBLog(@"%@\n%@", objc, requestInfo);
                                             successCallBack(nil);
                                         } fail:^(id error, id requestInfo) {
                                             YBLog(@"%@\n%@", error, requestInfo);
                                             failBlock(nil);
                                         }];
}

#pragma mark - 用户操作业务逻辑

/**
 输入描述
 
 @param sellerDesc                  商品描述
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)inputSellerDesc:(NSString *)sellerDesc
                success:(ZJViewModelCallBackSuccessBlock)successCallBack
             faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    self.sellerDesc = sellerDesc;
    self.userInputSellerDesc = sellerDesc;
}

/**
 选中配件
 
 @param currentGoodsPartModel       商品配件
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)selectedGoodsPartWithCurrentGoodsPartModel:(YBGoodPartModel *)currentGoodsPartModel
                                           success:(ZJViewModelCallBackSuccessBlock)successCallBack
                                        faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    [self selectedGoodPartWithCurrentGoodsPartModel:currentGoodsPartModel compoent:YES];
    successCallBack(nil);
}

/**
 是否需要拼接展示的配件
 
 @param currentGoodsPartModel   currentGoodsPartModel
 @param compoent                compoent
 */
- (void)selectedGoodPartWithCurrentGoodsPartModel:(YBGoodPartModel *)currentGoodsPartModel
                                         compoent:(BOOL)compoent
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.selectedGoodsPartArray];
    if (currentGoodsPartModel.goodsPartStatus) {
        [tempArray addObject:currentGoodsPartModel];
        
    }else{
        [tempArray removeObject:currentGoodsPartModel];
    }
    self.selectedGoodsPartArray = tempArray.copy;
    
    YBComposeHomePageModel *composeModel4 = self.composeModelArray.lastObject;
    NSString *string;
    if (compoent) {
        for (NSInteger i = 0; i < self.selectedGoodsPartArray.count; i++) {
            YBGoodPartModel *goodPartModel = self.selectedGoodsPartArray[i];
            if (i == 0) {
                string = goodPartModel.goodsPart;
            }else{
                string = [NSString stringWithFormat:@"%@,%@", string, goodPartModel.goodsPart];
            }
        }
    }else{
        string = self.composeModel.goods.sellerGoodsParts;
    }
    
    if (self.selectedGoodsPartArray.count == 0) {
        composeModel4.detailText = @"点击下方标签添加";
        composeModel4.placholder = NO;
    }else{
        composeModel4.userInputText = string;
        composeModel4.placholder = YES;
    }
    YBLog(@"%@\n%@", composeModel4.detailText, self.selectedGoodsPartArray);
}

/**
 选中品牌
 
 @param branceModel                 商品品牌模型
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)selectedBranceModel:(YBBranceModel *)branceModel
                    success:(ZJViewModelCallBackSuccessBlock)successCallBack
                 faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    YBComposeHomePageModel *composeModel3 = self.composeModelArray[2];
    composeModel3.userInputText = branceModel.brandName;
    composeModel3.placholder = YES;
    self.selectedGoodsBrandModel = branceModel;
    successCallBack(nil);
}

/**
 是否可以展示添加图片按钮
 
 @param successCallBack             成功
 @param failBlock                   失败
 */
- (void)canShowAddImageButtonSuccess:(ZJViewModelCallBackSuccessBlock)successCallBack
                          faileBlock:(ZJViewModelCallBackFailureBlock)failBlock
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:self.composeModel.pubImgList];
    
    /**
     *  当大于最大选中图片张数时，移除添加图片按钮模型
     */
    if (self.composeModel.pubImgList.count == 10) {
        [tempArray removeLastObject];
        self.composeModel.pubImgList = tempArray.copy;
    }else if(self.composeModel.pubImgList.count <= 9){
        if (![self.composeModel.pubImgList.lastObject isSystemButton]) {
            [self setupSelectedImage];
        }
    }
}

@end
