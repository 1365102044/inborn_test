//
//  YBServieceAgreementViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/5.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBServieceAgreementViewController.h"

@interface YBServieceAgreementViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView * scrollerview;


@end

@implementation YBServieceAgreementViewController

-(UIScrollView*)scrollerview
{
    if (!_scrollerview) {
        
        _scrollerview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _scrollerview.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT+46);
        _scrollerview.delegate= self;
        
    }
    return _scrollerview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"胤宝用户协议";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollerview];
    
    UIImage *helpimage = [UIImage imageNamed:@"胤宝服务协议"];
    UIImageView *helpimageview = [[UIImageView alloc]init];
    helpimageview.frame = CGRectMake(0, 0, SCREEN_WIDTH, helpimage.size.height);
    helpimageview.image = helpimage;
    
    [self.scrollerview addSubview:helpimageview];
    self.scrollerview.contentSize = CGSizeMake(SCREEN_WIDTH, helpimage.size.height+46);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
