//
//  YBMeMainCellView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/23.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBMeMainDataModel.h"
@interface YBMeMainCellView : ZJBaseView

@property(nonatomic,strong) NSString * CellTitleKey;

@property(nonatomic,strong) UIView *lineview;
/**
 赋值
 */
-(void)SetBaseMyAccountInforWithIndexPath:(NSIndexPath *)indexPath titleArr:(NSArray *)titleArr dataModel:(YBMeMainDataModel *)dataModel;

@end
