//
//  YBGoodsDeatilImageBoomBtnView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
#import "YBGoodsDeatilModel.h"
typedef void(^clickDeatilImageBoomBtnBlock)(NSInteger tag);
@interface YBGoodsDeatilImageBoomBtnView : ZJBaseView
@property(nonatomic,copy) clickDeatilImageBoomBtnBlock  clickDeatilImBoomBtnViewBlock;

@property(nonatomic,strong) YBGoodsDeatilModel * goodsDeatilModel;

- (void)setIsCollectChangeNumber:(BOOL)iscollect;
@property(nonatomic,strong) YBDefaultButton * likebtn;
@property(nonatomic,strong) YBDefaultButton * numberBtn;

@end
