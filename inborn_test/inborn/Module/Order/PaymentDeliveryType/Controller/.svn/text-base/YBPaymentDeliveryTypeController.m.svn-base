//
//  YBPaymentDeliveryTypeController.m
//  inborn
//
//  Created by 郑键 on 17/3/29.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBPaymentDeliveryTypeController.h"
#import "YBPaymentDeliveryTypeViewModel.h"
#import "YBPaymentDeliveryTypeDefaultCell.h"
#import "YBPaymentDeliveryTypeDefaultHeaderView.h"
#import "YBPaymentDeliveryTypeTipsCell.h"
#import "YBPaymentDeliveryTypeAddressCell.h"
#import "YBPaymentDeliveryTypeFooterView.h"

@interface YBPaymentDeliveryTypeController () <YBPaymentDeliveryTypeBaseCellDelegate, YBPaymentDeliveryTypeFooterViewDelegate>

/**
 订单数据
 */
@property (nonatomic, weak) YBConfirmOrderViewModel *confirmOrderViewModel;

/**
 YBPaymentDeliveryTypeViewModel
 */
@property (nonatomic, strong) YBPaymentDeliveryTypeViewModel *paymentDeliveryTypeViewModel;

/**
 回调点击事件
 */
@property (nonatomic, copy) YBPaymentDeliverTypeControllerCallBack callBack;

@end

@implementation YBPaymentDeliveryTypeController

/**
 *  YBPaymentDeliveryTypeDefaultCell
 */
static NSString * const YBPaymentDeliveryTypeDefaultCellReuseIdentifier                         = @"YBPaymentDeliveryTypeDefaultCellReuseIdentifier";

/**
 *  YBPaymentDeliveryTypeDefaultHeaderView
 */
static NSString * const YBPaymentDeliveryTypeDefaultHeaderViewReuseIdentifier                   = @"YBPaymentDeliveryTypeDefaultHeaderViewReuseIdentifier";

/**
 *  YBPaymentDeliveryTypeTipsCell
 */
static NSString * const YBPaymentDeliveryTypeTipsCellReuseIdentifier                            = @"YBPaymentDeliveryTypeTipsCellReuseIdentifier";

/**
 *  YBPaymentDeliveryTypeAddressCell
 */
static NSString * const YBPaymentDeliveryTypeAddressCellReuseIdentifier                         = @"YBPaymentDeliveryTypeAddressCellReuseIdentifier";

/**
 *  YBPaymentDeliveryTypeFooterView
 */
static NSString * const YBPaymentDeliveryTypeFooterViewReuseIdentifier                          = @"YBPaymentDeliveryTypeFooterViewReuseIdentifier";

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

#pragma mark - Fourth.代理方法

#pragma mark <YBPaymentDeliveryTypeFooterViewDelegate>

/**
 确定按钮点击代理回调

 @param paymentDeliveryTypeFooterView paymentDeliveryTypeFooterView
 @param button button
 */
- (void)paymentDeliveryTypeFooterView:(YBPaymentDeliveryTypeFooterView *)paymentDeliveryTypeFooterView
                               button:(UIButton *)button
{
    /**
     *  回调
     */
    self.callBack(self.paymentDeliveryTypeViewModel.userDeliveryType,
                  self.paymentDeliveryTypeViewModel.userPaymentMethod);
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark <YBPaymentDeliveryTypeBaseCellDelegate>

/**
 配送方式及付款方式按钮点击回调
 
 @param paymentDeliveryTypeBaseCell paymentDeliveryTypeBaseCell
 @param sender sender
 */
- (void)paymentDeliveryTypeBaseCell:(YBPaymentDeliveryTypeBaseCell *)paymentDeliveryTypeBaseCell
                             button:(ZJBaseButton *)sender
{
    NSIndexPath *currentIndexPath = [self.collectionView indexPathForCell:paymentDeliveryTypeBaseCell];
    
    YBLog(@"%@", currentIndexPath);
    
    if (currentIndexPath.section == 0) {
        
        /**
         *  选择配送方式
         */
        WEAKSELF(self);
        [self.paymentDeliveryTypeViewModel selectedDeliveryTypeButton:sender
                                                            indexPath:currentIndexPath
                                                        callBackBlock:^(id sender) {
                                                            [weakself.collectionView reloadData];
                                                        }];
    }
    
    if (currentIndexPath.section == 2) {
        
        /**
         *  付款方式
         */
        WEAKSELF(self);
        [self.paymentDeliveryTypeViewModel selectedPaymentTypeButton:sender
                                                           indexPath:currentIndexPath
                                                       callBackBlock:^(id sender) {
                                                           [weakself.collectionView reloadData];
                                                       }];
    }
}

#pragma mark <UICollectionViewDataSource>

/**
 多少组
 
 @param collectionView collectionView
 
 @return 组数
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.paymentDeliveryTypeViewModel.dataArray.count;
}

/**
 多少行
 
 @param collectionView collectionView
 @param section        section
 
 @return 组对应行数
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *tempArray = self.paymentDeliveryTypeViewModel.dataArray[section][@"data"];
    return tempArray.count;
}

/**
 自定义cell
 
 @param collectionView collectionView
 @param indexPath      indexPath
 
 @return 自定义样式cell
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *tempArray                      = self.paymentDeliveryTypeViewModel.dataArray[indexPath.section][@"data"];
    YBPaymentDliveryTypeModel *model        = tempArray[indexPath.row];
    
    YBPaymentDeliveryTypeBaseCell *cell     = [collectionView dequeueReusableCellWithReuseIdentifier:model.cellReID
                                                                                        forIndexPath:indexPath];
    if ([cell isKindOfClass:[YBPaymentDeliveryTypeBaseCell class]]) {
        cell.paymentDeliveryTypeModel           = model;
        cell.delegate                           = self;
    }
    
    return cell;
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
    if (section == 0
        || section == 2) {
        return CGSizeMake(self.view.frame.size.width,
                          ADJUST_PERCENT_FLOAT(56.f));
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
    if (section == 3) {
        return CGSizeMake(self.view.width, SCREEN_HEIGHT);
    }
    
    return CGSizeMake(0, 0);
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
    NSArray *tempArray                      = self.paymentDeliveryTypeViewModel.dataArray[indexPath.section][@"data"];
    YBPaymentDliveryTypeModel *model        = tempArray[indexPath.row];
    return model.itemSize;
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
    NSArray *tempArray                      = self.paymentDeliveryTypeViewModel.dataArray[indexPath.section][@"data"];
    YBPaymentDliveryTypeModel *model        = tempArray[indexPath.row];
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        if (indexPath.section == 0
            || indexPath.section == 2) {
            
            YBPaymentDeliveryTypeDefaultHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                                    withReuseIdentifier:YBPaymentDeliveryTypeDefaultHeaderViewReuseIdentifier
                                                                                                           forIndexPath:indexPath];
            headerView.paymentDeliveryTypeModel = model;
            
            return headerView;
        }else{
            return nil;
        }
        
    } else if (kind == UICollectionElementKindSectionFooter) {
        
        if (indexPath.section == 3) {
            
            YBPaymentDeliveryTypeFooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                                                             withReuseIdentifier:YBPaymentDeliveryTypeFooterViewReuseIdentifier
                                                                                                    forIndexPath:indexPath];
            footerView.delegate = self;
            return footerView;
            
        }else{
            return nil;
        }
    }
    return nil;
}

/**
 设置collectionView内边距
 
 @param collectionView       collectionView
 @param collectionViewLayout 布局
 @param section              组
 
 @return 返回间距
 */
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
//        return UIEdgeInsetsMake(14.f,
//                                12.f,
//                                11.f,
        //                                12.f);
        return UIEdgeInsetsMake(ADJUST_PERCENT_FLOAT(27.5),
                                ADJUST_PERCENT_FLOAT(12.f),
                                ADJUST_PERCENT_FLOAT(11.5),
                                ADJUST_PERCENT_FLOAT(12.f));
        
    }
    
    if (section == 1) {
        return UIEdgeInsetsMake(11.f,
                                12.f,
                                6.f,
                                12.f);
        
    }
    
    if (section == 2) {
//        return UIEdgeInsetsMake(6.f,
//                                12.f,
//                                12.f,
//                                12.f);
        return UIEdgeInsetsMake(ADJUST_PERCENT_FLOAT(27.5),
                                ADJUST_PERCENT_FLOAT(12.f),
                                ADJUST_PERCENT_FLOAT(11.5f),
                                ADJUST_PERCENT_FLOAT(12.f));
        
    }
    
    if (section == 3) {
//        return UIEdgeInsetsMake(14.f,
//                                12.f,
//                                14.f,
        //                                12.f);
        return UIEdgeInsetsMake(11.f,
                                12.f,
                                14.f,
                                12.f);
        
    }
    return UIEdgeInsetsMake(0.f,
                            12.f,
                            0.f,
                            12.f);
}

/**
 返回最小间距
 
 @param collectionView       collectionView
 @param collectionViewLayout collectionViewLayout
 @param section              section
 
 @return return 最小间距
 */
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.1f;
}

/**
 最小间距
 
 @param collectionView       collectionView
 @param collectionViewLayout collectionViewLayout
 @param section              section
 
 @return 最小间距
 */
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 13.f;
}

#pragma mark <UICollectionViewDelegate>

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

/**
 创建配送方式及付款方式控制器
 
 @param deliverType         初始化的配送方式
 @param paymentMethod       初始化的支付方式
 @param callBackBLock       回调
 @return 控制器
 */
+ (instancetype)paymentDeliveryTypeControllerWithDeliveryType:(NSString *)deliverType
                                                paymentMethod:(ZJProjectPaymentMethod)paymentMethod
                                        confirmOrderViewModel:(YBConfirmOrderViewModel *)confirmOrderViewModel
                                                callBackBLock:(YBPaymentDeliverTypeControllerCallBack)callBackBLock
{
    YBPaymentDeliveryTypeController *paymentDeliveryTypeController                          = [[YBPaymentDeliveryTypeController alloc] init];
    paymentDeliveryTypeController.paymentDeliveryTypeViewModel                              = [[YBPaymentDeliveryTypeViewModel alloc] init];
    paymentDeliveryTypeController.paymentDeliveryTypeViewModel.confirmOrderViewModel        = confirmOrderViewModel;
    paymentDeliveryTypeController.paymentDeliveryTypeViewModel.userDeliveryType             = deliverType;
    paymentDeliveryTypeController.paymentDeliveryTypeViewModel.userPaymentMethod            = paymentMethod;
    paymentDeliveryTypeController.callBack                                                  = callBackBLock;
    return paymentDeliveryTypeController;
}

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
    
    self.collectionView.backgroundColor     = ZJCOLOR.color_c0;
    self.view.backgroundColor               = ZJCOLOR.color_c12;
    self.collectionView.bounces             = NO;
    self.navigationItem.title               = ZJSTRING(@"选择付款配送方式");
    self.collectionView.contentInset        = UIEdgeInsetsMake(0, 0, ADJUST_PERCENT_FLOAT(-500.f), 0);
    
    [self registerViews];
}

#pragma mark - Sixth.界面配置

/**
 Register
 */
- (void)registerViews
{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YBPaymentDeliveryTypeDefaultCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:YBPaymentDeliveryTypeDefaultCellReuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YBPaymentDeliveryTypeTipsCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:YBPaymentDeliveryTypeTipsCellReuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YBPaymentDeliveryTypeAddressCell class])
                                                    bundle:nil]
          forCellWithReuseIdentifier:YBPaymentDeliveryTypeAddressCellReuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([YBPaymentDeliveryTypeDefaultHeaderView class])
                                                    bundle:nil]
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:YBPaymentDeliveryTypeDefaultHeaderViewReuseIdentifier];
    [self.collectionView registerClass:[YBPaymentDeliveryTypeFooterView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:YBPaymentDeliveryTypeFooterViewReuseIdentifier];
    [self.collectionView registerClass:[ZJBaseCollectionViewCell class]
            forCellWithReuseIdentifier:@"cell"];
}

#pragma mark - Seventh.懒加载


@end
