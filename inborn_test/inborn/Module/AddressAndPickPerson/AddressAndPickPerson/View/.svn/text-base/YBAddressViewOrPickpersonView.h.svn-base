//
//  YBAddressViewOrPickpersonView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/28.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBAddressAndPickListViewController.h"
#import "YBAddressAndPickPersonModel.h"
typedef void(^clickBtnBlock)(NSInteger tag,YBAddressAndPickPersonModel *dataModel,NSInteger indexrow);
@interface YBAddressViewOrPickpersonView : ZJBaseView

- (void)setCellViewWith:(ViewControllerType)type;

@property(nonatomic,copy) clickBtnBlock  clickBlock;

/**
 isselectindex 选中index
 indexRow       indexpath.seaction
 */
- (void)setModel:(YBAddressAndPickPersonModel *)dataModel
          vctype:(ViewControllerType)vctype
   isselectindex:(NSInteger)isselectindex
        indexRow:(NSInteger)indexRow;

@end
