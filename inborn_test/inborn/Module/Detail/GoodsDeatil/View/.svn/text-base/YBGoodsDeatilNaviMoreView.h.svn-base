//
//  YBGoodsDeatilNaviMoreView.h
//  inborn
//
//  Created by 刘文强 on 2017/3/22.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "ZJBaseView.h"
typedef NS_ENUM(NSUInteger,WBArrowDirection){
    
    //箭头位置
    
    WBArrowDirectionLeft1=1,//左上
    WBArrowDirectionLeft2,//左中
    WBArrowDirectionLeft3,//左下
    WBArrowDirectionRight1,//右上
    WBArrowDirectionRight2,//右中
    WBArrowDirectionRight3,//右下
    WBArrowDirectionUp1,//上左
    WBArrowDirectionUp2,//上中
    WBArrowDirectionUp3,//上右
    WBArrowDirectionDown1,//下左
    WBArrowDirectionDown2,//下中
    WBArrowDirectionDown3,//下右
    
};
typedef void(^clickTableViewCellBlock)(NSInteger row);

@interface YBGoodsDeatilNaviMoreView : ZJBaseView

+ (instancetype)share;

@property (nonatomic, strong) UIView *backView;

/**
 初始化 
 origin 箭头的坐标，
 width ，height 内容的宽度 高度
 Direction 箭头的类型
 sourVC 调用的控制器
 dataArr cell的数据
 ImageArr right的图标（没有图标为nil）
 cellHeight cell的高度
 block 点击的回调，返回：row
 */
- (void)addMoreViewWithOrigin:(CGPoint)origin
                        Width:(CGFloat)width
                       Height:(float)height
                    Direction:(WBArrowDirection)direction
                       sourVC:(UIViewController *)sourVC
                      dataArr:(NSArray *)dataArr
                     ImageArr:(NSArray *)ImageArr
                   cellHeight:(CGFloat)cellHeight
               clickCellBlcok:(clickTableViewCellBlock)block;

/**
 弹出视图
 */
-(void)popView;

/**
 隐藏视图
 */
-(void)dismiss;

@end
