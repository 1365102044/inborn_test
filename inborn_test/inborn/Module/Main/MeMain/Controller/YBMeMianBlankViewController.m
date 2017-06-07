//
//  YBMeMianBlankViewController.m
//  inborn
//
//  Created by 刘文强 on 2017/4/17.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBMeMianBlankViewController.h"

@interface YBMeMianBlankViewController ()

@property(strong,nonatomic) NSString * titlestr;

@end

@implementation YBMeMianBlankViewController
+ (instancetype)creatMeMainBlankVCwith:(NSString *)titlestr
                                extend:(id)extend
{
    YBMeMianBlankViewController *blankvc = [[YBMeMianBlankViewController alloc]init];
    blankvc.titlestr = ZJSTRING(titlestr);
    
    return blankvc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = ZJCOLOR.color_c12;
    
    self.title = self.titlestr;
    
    NSString *str = [NSString stringWithFormat:@"暂时没有%@数据",self.titlestr];
    [self showTempViewWithLogoImageNamed:@"blank_blank_bg"
                              tipsString:ZJSTRING(str)
                             buttonTitle:nil];
    self.myMaskView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
