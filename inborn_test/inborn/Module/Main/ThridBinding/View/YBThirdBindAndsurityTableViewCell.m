//
//  YBThirdBindAndsurityTableViewCell.m
//  inborn
//
//  Created by 刘文强 on 2017/3/30.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBThirdBindAndsurityTableViewCell.h"

@interface YBThirdBindAndsurityTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *rigltImageView;

@property (weak, nonatomic) IBOutlet UILabel *descLable;
@end

@implementation YBThirdBindAndsurityTableViewCell

/**
 赋值
 */
- (void)settitle:(NSString *)title desc:(NSString *)desc vctype:(NSString *)vctype
{
    self.rigltImageView.image = [UIImage imageNamed:@"details_moreitem_n"];
    self.titleLable.text = title;
    
    if ([vctype isEqualToString:@"third"]) {
        self.descLable.hidden = NO;
        self.descLable.text = desc;
    }else if ([vctype isEqualToString:@"account"]){
        self.descLable.hidden = YES;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"YBThirdBindAndsurityTableViewCell" owner:nil options:nil].lastObject;
    
    }
    return self;
}

@end
