//
//  YBSearchRecordTableViewCell.h
//  inborn
//
//  Created by 刘文强 on 2017/3/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 移除row
 */
@protocol removeRowDelegate <NSObject>
- (void)removeWithTitle:(NSString *)titleStr;
@end

@interface YBSearchRecordTableViewCell : UITableViewCell

@property(nonatomic,strong) NSString * searchTitle;

@property(nonatomic,weak) id<removeRowDelegate>  delegate;

@end
