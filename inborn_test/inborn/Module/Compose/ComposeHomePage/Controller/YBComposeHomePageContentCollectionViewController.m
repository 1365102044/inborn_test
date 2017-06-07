//
//  YBComposeHomePageContentCollectionViewController.m
//  inborn
//
//  Created by 郑键 on 17/3/27.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBComposeHomePageContentCollectionViewController.h"
#import "YBComposeHomePageDetailHeaderView.h"
#import "YBComposeHomePageImageCell.h"
#import "YBComposeHomePageGoodPartCell.h"
#import "YBComposeHomePageDefaultCell.h"
#import "YBComposeHomePageFooterView.h"
#import "YBImagePickerController.h"
#import "YBBranceTableViewController.h"
#import "YBBranceModel.h"
#import "YBPlaceHolderTextView.h"
#import "YBComsposeResultViewController.h"
#import "ZJBaseNavigationController.h"
#import "JXTAlertManagerHeader.h"
#import "YBWeChatCameraViewController.h"
#import "YBSaleAgreementViewController.h"
#import "YBWeChatPhotoBrowserViewController.h"
#import "YBTopAlert.h"

@interface YBComposeHomePageContentCollectionViewController () <YBComposeHomePageImageCellDelegate, YBComposeHomePageGoodPartCellDelegate, YBBranceTableViewControllerDelegate, YBDefaultCollectionViewCellDelegate, YBComposeHomePageFooterViewDelegate>

@end

@implementation YBComposeHomePageContentCollectionViewController

/**
 *  最大选中图片数量
 */
NSInteger maxSelectedPhotoCount                                                 = 9;

/**
 *  是否显示照相按钮
 */
bool isShowCamerButton                                                          = YES;

/**
 *  是否可以选择视频
 */
bool canSelectedVideo                                                           = YES;

/**
 *  是否可以选择图片
 */
bool canSelectedImage                                                           = YES;

/**
 *  是否可以选择原图
 */
bool canPickingOriginaImage                                                     = NO;

/**
 *  是否排序
 */
bool canSortAscending                                                           = YES;

#pragma mark - First.通知

- (void)userSellerDescDidChange:(NSNotification *)no
{
    YBLog(@"%@", no.userInfo);
    YBPlaceHolderTextView *placHolderTextView = (YBPlaceHolderTextView *)no.object;
    [self.composeHomePageViewModel inputSellerDesc:placHolderTextView.text success:^(id model) {
        
    } faileBlock:^(id error) {
        
    }];
}

#pragma mark - Second.赋值

- (void)setGoodsId:(NSString *)goodsId
{
    _goodsId = goodsId;
    
    [self.composeHomePageViewModel composeGoodsInfoWithGoodsId:self.goodsId success:^(id model) {
        self.composeHomePageViewModel = (YBComposeHomePageViewModel *)model;
        [self canShowAddImageButton];
    } faileBlock:^(id error) {
        
    }];
}

- (void)setComposeHomePageViewModel:(YBComposeHomePageViewModel *)composeHomePageViewModel
{
    [self.collectionView reloadData];
    [self hiddenMaskView];
}

#pragma mark - Third.点击事件

- (void)compose
{
    /**
     *  发布
     */
    [self.composeHomePageViewModel composeWithGoodsId:self.goodsId success:^(id model) {
        
        /**
         *  弹出成功页面
         */
        YBComsposeResultViewController *resultViewController = [[YBComsposeResultViewController alloc] init];
        ZJBaseNavigationController *baseNavigationController = [[ZJBaseNavigationController alloc] initWithRootViewController:resultViewController];
        resultViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:baseNavigationController animated:YES completion:nil];
        
    } faileBlock:^(id error) {
        
    }];
}

#pragma mark - Fourth.代理方法

#pragma mark <YBComposeHomePageFooterViewDelegate>

/**
 协议按钮点击事件
 
 @param composeHomePageFooterView       footer
 @param button                          button
 */
- (void)composeHomePageFooterView:(YBComposeHomePageFooterView *)composeHomePageFooterView
                           button:(UIButton *)button
{
    if (button.tag == 1001) {
        
        /**
         *  是否阅读并同意
         */
        self.composeHomePageViewModel.agreeSaleAgreement = button.selected;
    }
    
    if (button.tag == 1002) {
        
        /**
         *  查看协议
         */
        YBSaleAgreementViewController *agreementViewController = [[YBSaleAgreementViewController alloc] init];
        [self.navigationController pushViewController:agreementViewController animated:YES];
    }
}

#pragma mark <YBDefaultCollectionViewCellDelegate>

/**
 按钮点击事件
 
 @param defaultCollectionViewCell       defaultCollectionViewCell
 @param button                          button
 */
- (void)defaultCollectionViewCell:(YBDefaultCollectionViewCell *)defaultCollectionViewCell
                           button:(UIButton *)button
{
    /**
     *  弹窗
     */
    [self jxt_showAlertWithTitle:ZJSTRING(@"理想售价说明")
                         message:ZJSTRING(@"输入您希望卖出的价格，可是具体售价或价格范围") appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
                             
                             alertMaker.
                             addActionDefaultTitle(ZJSTRING(@"知道了"));
                             alertMaker.view.tintColor = ZJCOLOR.color_c6;
                             
                         } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
                             
                         }];
}

#pragma mark <YBBranceTableViewControllerDelegate>

/**
 选中的品牌
 
 @param branceTableViewController       branceTableViewController
 @param slectedBrandModel               selectedBrandText
 */
- (void)branceTableViewController:(YBBranceTableViewController *)branceTableViewController
                slectedBrandModel:(YBBranceModel *)slectedBrandModel
{
    [self.composeHomePageViewModel selectedBranceModel:slectedBrandModel success:^(id model) {
        [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:2 inSection:1]]];
        
    } faileBlock:^(id error) {
        
    }];
}

#pragma mark <YBComposeHomePageGoodPartCellDelegate>

/**
 选中商品配件
 
 @param composeHomePageGoodPartCell         composeHomePageGoodPartCell
 @param button                              button
 @param currentModel                        currentModel
 */
- (void)composeHomePageGoodPartCell:(YBComposeHomePageGoodPartCell *)composeHomePageGoodPartCell
                             button:(UIButton *)button
                       currentModel:(YBGoodPartModel *)currentModel
{
    [self.composeHomePageViewModel selectedGoodsPartWithCurrentGoodsPartModel:currentModel success:^(id model) {
        
        [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:3 inSection:1]]];
        
    } faileBlock:^(id error) {
        
    }];
}

#pragma mark <YBComposeHomePageImageCellDelegate>

/**
 图片区域点击事件
 
 @param composeHomePageImageCell composeHomePageImageCell
 @param sender sender
 */
- (void)composeHomePageImageCell:(YBComposeHomePageImageCell *)composeHomePageImageCell
                     clickButton:(UIButton *)sender
                           model:(YBUploadImageModel *)model
{
    NSIndexPath *currentIndexPath = [self.collectionView indexPathForCell:composeHomePageImageCell];
    
    if (sender.tag == -1001) {
        
        [self jxt_showActionSheetWithTitle:nil message:nil appearanceProcess:^(JXTAlertController * _Nonnull alertMaker) {
            
            alertMaker.
            addActionDefaultTitle(ZJSTRING(@"拍摄")).
            addActionDefaultTitle(ZJSTRING(@"从手机相册选择")).
            addActionCancelTitle(ZJSTRING(@"取消"));
            
            alertMaker.view.tintColor = ZJCOLOR.color_c4;
            
        } actionsBlock:^(NSInteger buttonIndex, UIAlertAction * _Nonnull action, JXTAlertController * _Nonnull alertSelf) {
            
            if (buttonIndex == 1) {
                
                /**
                 *  添加图片
                 */
                WEAKSELF(self);
                YBImagePickerController *imagePicker = [YBImagePickerController imagePickerControllerWithMaxCount:maxSelectedPhotoCount - self.composeHomePageViewModel.composeModel.pubImgList.count + 1
                                                                                                    callBackBlock:^(NSArray *imageArray, NSArray *assetArray, BOOL isBool) {
                                                                                                        [weakself.composeHomePageViewModel selectedImageArray:imageArray callBackBlock:^(id sender) {
                                                                                                            [self canShowAddImageButton];
                                                                                                            [weakself.collectionView reloadData];
                                                                                                        }];
                                                                                                    }];
                
                /**
                 *  你可以通过block或者代理，来得到用户选择的照片.
                 */
                [self presentViewController:imagePicker animated:YES completion:nil];
            }
            
            if (buttonIndex == 0) {
                
                [YBWeChatCameraViewController showWeChatCameraViewControllerWithSourceController:self callBackBlock:^(id sender) {
                    YBLog(@"%@", sender);
                    if ([sender isKindOfClass:[NSURL class]]) {
                        
                    }else{
                        if (sender) {
                            [self.composeHomePageViewModel selectedImageArray:@[sender] callBackBlock:^(id sender) {
                                [self canShowAddImageButton];
                                [self.collectionView reloadData];
                            }];
                        }else{
                        
                            [[YBTopAlert sharedAlert] showAlertWithTitleStringKey:ZJSTRING(@"错误")
                                                                    tipsStringKey:ZJSTRING(@"获取照片失败")
                                                                             type:YBTopAlertError
                                                               eventCallBackBlock:^(id sender) {
                                                                                 
                                                                             }];
                        }
                    }
                }];
            }
        }];
    }
    
    if (sender.tag == -1002) {
        
        /**
         *  删除图片
         */
        [self.composeHomePageViewModel delImageWithImageUrlString:model.imgUrl
                                                     currentModel:model
                                                          success:^(id viewModel) {
                                                              self.composeHomePageViewModel = (YBComposeHomePageViewModel *)viewModel;
                                                              [self canShowAddImageButton];
                                                          } faileBlock:^(id error) {
                                                              
                                                          }];
    }
    
    if (sender.tag == -1003) {
        
        /**
         *  重新上传
         */
        [self.composeHomePageViewModel reuploadImageWithUploadImageModel:model callBackBlock:^(id sender) {
            
        }];
    }
    
    if (sender.tag == -1009) {
        
        /**
         *  查看大图
         */
        [YBWeChatPhotoBrowserViewController showPhotoBroswerWithUploadImageModelArray:self.composeHomePageViewModel.composeModel.pubImgList
                                                                     sourceController:self
                                                                           sourceView:sender
                                                                                index:currentIndexPath.item
                                                                        callBackBlock:^(NSArray *imageArray, NSArray *assetArray, BOOL sender) {
                                                                            
                                                                        }];
    }
}

/**
 是否可以展示添加图片按钮
 */
- (void)canShowAddImageButton
{
    [self.composeHomePageViewModel canShowAddImageButtonSuccess:^(id model) {
        
    } faileBlock:^(id error) {
        
    }];
}

#pragma mark <UICollectionViewDataSource>

/**
 多少组
 
 @param collectionView collectionView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

/**
 多少行
 
 @param collectionView collectionView
 @param section        section
 
 @return 组对应行数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.composeHomePageViewModel.composeModel.pubImgList.count;
    }
    
    if (section == 1) {
        return self.composeHomePageViewModel.composeModelArray.count;
    }
    
    if (section == 2) {
        return self.composeHomePageViewModel.composeModel.accessoryList.count;
    }
    
    return 0;
}

/**
 自定义cell
 
 @param collectionView collectionView
 @param indexPath      indexPath
 
 @return 自定义样式cell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  商品描述及图片组
     */
    if (indexPath.section == 0) {
        
        YBComposeHomePageImageCell *imageCell = [collectionView dequeueReusableCellWithReuseIdentifier:YBComposeHomePageImageCellReuseIdentifier
                                                                                          forIndexPath:indexPath];
        imageCell.uploadImageModle      = self.composeHomePageViewModel.composeModel.pubImgList[indexPath.item];
        imageCell.delegate              = self;
        return imageCell;
    }
    
    /**
     *  普通信息组
     */
    if (indexPath.section == 1) {
        
        YBComposeHomePageDefaultCell *defaultCell = [collectionView dequeueReusableCellWithReuseIdentifier:YBComposeHomePageDefaultCellReuseIdentifier
                                                                                              forIndexPath:indexPath];
        defaultCell.composeModel        = self.composeHomePageViewModel.composeModelArray[indexPath.item];
        defaultCell.delegate            = self;
        return defaultCell;
    }
    
    /**
     *  商品配件组
     */
    if (indexPath.section == 2) {
        
        YBComposeHomePageGoodPartCell *goodPartCell = [collectionView dequeueReusableCellWithReuseIdentifier:YBComposeHomePageGoodPartCellReuseIdentifier
                                                                                                forIndexPath:indexPath];
        goodPartCell.goodPartModel      = self.composeHomePageViewModel.composeModel.accessoryList[indexPath.item];
        goodPartCell.delegate           = self;
        return goodPartCell;
    }
    return nil;
}

/**
 设置组头组尾的方法
 
 @param collectionView collectionView
 @param kind           组头组尾
 @param indexPath      下标
 
 @return 返回组头或组尾
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        if (indexPath.section == 0) {
            
            YBComposeHomePageDetailHeaderView *detailHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                                     withReuseIdentifier:YBComposeHomePageDetailHeaderViewReuseIdentifier
                                                                                                            forIndexPath:indexPath];
            detailHeaderView.userInputText = self.composeHomePageViewModel.userInputSellerDesc;
            return detailHeaderView;
        }else{
            return nil;
        }
        
    } else if (kind == UICollectionElementKindSectionFooter) {
        
        if (indexPath.section == 0
            || indexPath.section == 2) {
            
            YBComposeHomePageFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                         withReuseIdentifier:YBComposeHomePageFooterViewReuseIdentifier
                                                                                                forIndexPath:indexPath];
            if (indexPath.section == 0) {
                footerView.isShowFuncButton = NO;
            }
            
            if (indexPath.section == 2) {
                footerView.isShowFuncButton = YES;
            }
            footerView.delegate = self;
            
            return footerView;
        }else{
            return nil;
        }
    }
    return nil;
}

#pragma mark <UICollectionViewDelegate>

/**
 点击事件
 
 @param collectionView collectionView
 @param indexPath indexPath
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  选中图片点击事件
     */
    if (indexPath.section == 0) {
        
    }
    
    /**
     *  选择品牌点击事件
     */
    if (indexPath.section == 1
        && indexPath.item == 2) {
        YBBranceTableViewController *branceTableViewController = [[YBBranceTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        branceTableViewController.selectedDelegate  = self;
        [self.navigationController pushViewController:branceTableViewController animated:YES];
    }
    
    /**
     *  商品配件选择
     */
    if (indexPath.section == 2) {
        
    }
}

/**
 设置collectionView的ItemSize
 
 @param collectionView       collectionView
 @param collectionViewLayout 布局
 @param indexPath            下标
 
 @return 返回itemSize大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CGFloat itemWidth = (self.view.width - (6 * ADJUST_PERCENT_FLOAT(12.f))) / 5;
        return CGSizeMake(itemWidth,
                          itemWidth);
    }
    
    if (indexPath.section == 1) {
        return CGSizeMake(SCREEN_WIDTH,
                          46.f);
    }
    
    if (indexPath.section == 2) {
        CGFloat itemWidth = (self.view.width - 2 * ADJUST_PERCENT_FLOAT(12.f) - 3 * ADJUST_PERCENT_FLOAT(21.f)) / 4;
        return CGSizeMake(itemWidth,
                          ADJUST_PERCENT_FLOAT(28.f));
    }
    
    return CGSizeMake(0, 0);
}

/**
 设置collectionView的组间距
 
 @param collectionView       collectionView
 @param collectionViewLayout 布局
 @param section              组
 
 @return 返回间距
 */
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(12,
                                12,
                                12,
                                12);
    }
    
    if (section == 1) {
        return UIEdgeInsetsMake(0,
                                0,
                                0,
                                0);
    }
    
    if (section == 2) {
        return UIEdgeInsetsMake(14.f,
                                12.f,
                                14.f,
                                12.f);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

/**
 返回最小间距
 
 @param collectionView       collectionView
 @param collectionViewLayout collectionViewLayout
 @param section              section
 
 @return return 最小间距
 */
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 0) {
        return 0.1f;
    }
    
    if (section == 1) {
        return 0.1f;
    }
    
    if (section == 2) {
        return 0.1f;
    }
    
    return 0;
}

/**
 最小间距
 
 @param collectionView       collectionView
 @param collectionViewLayout collectionViewLayout
 @param section              section
 
 @return 最小间距
 */
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    if (section == 0) {
        return 21.f;
    }
    
    if (section == 1) {
        return 0.f;
    }
    
    if (section == 2) {
        return 13.f;
    }
    
    return 0;
}

/**
 返回组头高度
 
 @param collectionView       collectionView
 @param collectionViewLayout 布局
 @param section              组
 
 @return 组头高度
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(self.view.frame.size.width, ADJUST_PERCENT_FLOAT(110));
    }
    
    if (section == 1) {
        return CGSizeMake(self.view.frame.size.width, 0.0f);
    }
    
    if (section == 2) {
        return CGSizeMake(self.view.frame.size.width, 0.0f);
    }
    
    return CGSizeMake(0, 0);
}

/**
 返回组尾高度
 
 @param collectionView          collectionView
 @param collectionViewLayout    布局
 @param section                 组
 @return                        组尾高度
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(self.view.frame.size.width,
                          ADJUST_PERCENT_FLOAT(10.f));
    }
    
    if (section == 1) {
        return CGSizeMake(self.view.frame.size.width,
                          0.0f);
    }
    
    if (section == 2) {
        return CGSizeMake(self.view.frame.size.width,
                          ADJUST_PERCENT_FLOAT(194.f));
    }
    return CGSizeMake(0, 0);
}

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

#pragma mark - Fifth.控制器生命周期

- (instancetype)init
{
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc] init];
    if (self == [super initWithCollectionViewLayout:fl]) {
        
    }
    return self;
}

/**
 视图加载完毕
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showMaskView];
    _composeHomePageViewModel               = [[YBComposeHomePageViewModel alloc] init];
    self.collectionView.bounces             = NO;
    
    [self registerViews];
    [self registerNotification];
    
    self.composeHomePageViewModel.agreeSaleAgreement = YES;
    /**
     *  加载数据
     */
    //    [self.composeHomePageViewModel composeGoodsInfoWithGoodsId:self.goodsId success:^(id model) {
    //        self.composeHomePageViewModel = (YBComposeHomePageViewModel *)model;
    //    } faileBlock:^(id error) {
    //
    //    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)dealloc
{
    [self removeNotification];
}

#pragma mark - Sixth.界面配置

/**
 Register
 */
- (void)registerViews
{
    [self.collectionView registerClass:[YBComposeHomePageDetailHeaderView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:YBComposeHomePageDetailHeaderViewReuseIdentifier];
    [self.collectionView registerClass:[YBComposeHomePageImageCell class]
            forCellWithReuseIdentifier:YBComposeHomePageImageCellReuseIdentifier];
    [self.collectionView registerClass:[YBComposeHomePageGoodPartCell class]
            forCellWithReuseIdentifier:YBComposeHomePageGoodPartCellReuseIdentifier];
    [self.collectionView registerClass:[YBComposeHomePageDefaultCell class]
            forCellWithReuseIdentifier:YBComposeHomePageDefaultCellReuseIdentifier];
    [self.collectionView registerClass:[YBComposeHomePageFooterView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:YBComposeHomePageFooterViewReuseIdentifier];
}

- (void)registerNotification
{
    [SYSTEM_NOTIFICATIONCENTER addObserver:self selector:@selector(userSellerDescDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)removeNotification
{
    [SYSTEM_NOTIFICATIONCENTER removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

#pragma mark - Seventh.懒加载


@end