//
//  YBListViewController.m
//  inborn
//
//  Created by 郑键 on 17/4/26.
//  Copyright © 2017年 inborn. All rights reserved.
//

#import "YBListViewController.h"
#import "ZJBaseScrollView.h"

@interface YBListViewController () <UIScrollViewDelegate>

@property (nonatomic,strong) YBDefaultButton *naviLeftBtn;
@property (nonatomic,strong) ZJBaseView *btnIndicator;
@property (nonatomic,  weak) YBDefaultButton *seletedBtn;

@end

@implementation YBListViewController

#pragma mark - First.通知

#pragma mark - Second.赋值

#pragma mark - Third.点击事件

//按钮点击事件
-(void)btnClick:(UIButton *)btn {
    
    /**
     *  按钮状态
     */
    self.seletedBtn.enabled = YES;
    btn.enabled = NO;
    self.seletedBtn = (YBDefaultButton *)btn;
    
    /**
     *  控制器view的滚动
     */
    CGPoint offset = self.scrollview.contentOffset;
    offset.x = btn.tag * self.scrollview.width;
    [self.scrollview setContentOffset:offset animated:YES];
    
}

#pragma mark - Fourth.代理方法

#pragma  mark <UIScrollViewDelegate>

/**
 *  滚动监听
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    /**
     *  让我们的标签进行颜色值的变化及缩放
     */
    float value = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    /**
     *  左边的索引
     */
    int leftIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    /**
     *  右边的索引=左边的索引 + 1;
     */
    int rightIndex = leftIndex + 1;
    
    UIButton *leftButton = self.titleView.subviews[leftIndex];
    UIButton *rightButton = self.titleView.subviews[rightIndex];
    
    /**
     *  右边的比率
     */
    CGFloat rightScale = value - leftIndex;
    
    /**
     *  左边的比率
     */
    CGFloat leftScale = 1- rightScale;
    
    if (rightScale > leftScale) {
        
        /**
         *  修改按钮状态
         */
        self.seletedBtn.enabled = YES;
        rightButton.enabled = NO;
        self.seletedBtn = (YBDefaultButton *)rightButton;
        
        if (self.titleView.contentSize.width >= [UIScreen mainScreen].bounds.size.width) {
            [self scrollTitlesViewWithSelectedButton:rightButton];
        }
    }else{
        // 修改按钮状态
        self.seletedBtn.enabled = YES;
        leftButton.enabled = NO;
        self.seletedBtn = (YBDefaultButton *)leftButton;
        
        if (self.titleView.contentSize.width >= [UIScreen mainScreen].bounds.size.width) {
            [self scrollTitlesViewWithSelectedButton:leftButton];
        }
        
        // 动画
        [UIView animateWithDuration:0.25 animations:^{
            self.btnIndicator.width = leftButton.width;
            self.btnIndicator.centerX = leftButton.centerX;
        }];
    }
}

- (void)scrollTitlesViewWithSelectedButton:(UIButton *)sender
{
    /**
     *  计算channelScrollView应该滚动的偏移量
     */
    CGFloat needScrollOffsetX = sender.center.x - self.titleView.bounds.size.width * 0.5;
    
    if (needScrollOffsetX < 0) {
        needScrollOffsetX = 0;
    }
    
    CGFloat maxScrollOffsetX = self.titleView.contentSize.width - self.titleView.bounds.size.width ;
    
    if (needScrollOffsetX > maxScrollOffsetX) {
        needScrollOffsetX = maxScrollOffsetX;
    }
    
    [self.titleView setContentOffset:CGPointMake(needScrollOffsetX, 0) animated:YES];
}

/**
 *  结束滚动时动画
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    UITableViewController *viewVc = self.childViewControllers[index];
    viewVc.view.ex_x = scrollView.contentOffset.x;
    viewVc.view.ex_y = 0;
    viewVc.view.height = scrollView.height;
    CGFloat top = CGRectGetMaxY(self.titleView.frame);
    CGFloat bottom = ADJUST_PERCENT_FLOAT(100.f);
    viewVc.tableView.contentInset = UIEdgeInsetsMake(top,
                                                     viewVc.tableView.contentInset.left,
                                                     bottom,
                                                     viewVc.tableView.contentInset.right);
    viewVc.tableView.scrollIndicatorInsets = viewVc.tableView.contentInset;
    [scrollView addSubview:viewVc.view];
}

/**
 *  滚动减速时
 */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    [self btnClick:self.titleView.subviews[index]];
}

#pragma mark - Fifth.控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     *  配置标题数组，可扩展构造方法，传入数组
     */

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = ZJCOLOR.color_c12;
    [self setNaviBar];
    [self setupChildViewControllers];
    [self.view addSubview:self.scrollview];
    [self.view addSubview:self.titleView];
    [self setupTitleBtn];
    [self.titleView addSubview:self.btnIndicator];
}

#pragma mark - Sixth.界面配置

-(void)setupTitleBtn
{
    NSMutableArray *tempTitlesArray = [NSMutableArray array];
    [self.titlesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [tempTitlesArray addObject:obj[@"title"]];
    }];
    NSArray *titles = tempTitlesArray.copy;
    NSInteger count = titles.count;
    for (NSInteger i = 0; i<count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:ZJCOLOR.color_c4 forState:UIControlStateNormal];
        btn.titleLabel.font = SYSTEM_REGULARFONT(13);
        [btn setTitleColor:ZJCOLOR.color_c6 forState:UIControlStateDisabled];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.titleView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self.titleView);
            if (i == 0) {
                make.left.mas_equalTo(self.titleView).mas_offset(ADJUST_PERCENT_FLOAT(12.f));
            }else{
                make.left.mas_equalTo(self.titleView.subviews[self.titleView.subviews.count - 2].mas_right).mas_offset(ADJUST_PERCENT_FLOAT(34.f));
            }
        }];
        
        [self.titleView layoutSubviews];
        
        /**
         *  默认选中第一个按钮
         */
        if (btn.tag == 0) {
            btn.enabled = NO;
            self.seletedBtn = (YBDefaultButton *)btn;
            [btn.titleLabel sizeToFit];
            
            self.btnIndicator.width = btn.titleLabel.width;
            self.btnIndicator.centerX = btn.centerX;
        }
    }
    
    self.titleView.contentSize = CGSizeMake(CGRectGetMaxX(self.titleView.subviews.lastObject.frame) + ADJUST_PERCENT_FLOAT(12.f), 0);
    self.titleView.showsVerticalScrollIndicator = NO;
    self.titleView.showsHorizontalScrollIndicator = NO;
}

-(void)setupChildViewControllers
{
    [self.titlesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *controllerName = obj[@"controllerName"];
        Class class = NSClassFromString(controllerName);
        UIViewController *viewController = [[class alloc] init];
        viewController.view.tag = idx;
        viewController.title = obj[@"title"];
        [self addChildViewController:viewController];
    }];
}

-(void)setNaviBar
{
    
}

#pragma mark - Seventh.懒加载

- (ZJBaseScrollView *)scrollview
{
    if (_scrollview == nil) {
        _scrollview = [[ZJBaseScrollView alloc]init];
        _scrollview.frame = self.view.bounds;
        _scrollview.delegate = self;
        _scrollview.pagingEnabled = YES;//分页
        _scrollview.contentSize = CGSizeMake(_scrollview.width * self.childViewControllers.count , 0);
        // 添加第一个控制器的view
        [self scrollViewDidEndScrollingAnimation:self.scrollview];
        
    }
    return _scrollview;
}

- (ZJBaseView *)btnIndicator
{
    if (_btnIndicator == nil) {
        _btnIndicator = [[ZJBaseView alloc] init];
        _btnIndicator.backgroundColor = ZJCOLOR.color_c6;
        
        _btnIndicator.height = 2;
        _btnIndicator.ex_y = self.titleView.height - _btnIndicator.height;
    }
    return _btnIndicator;
}



- (ZJBaseScrollView *)titleView
{
    if (_titleView == nil) {
        _titleView = [[ZJBaseScrollView alloc] init];
        _titleView.frame = CGRectMake(0, 0, self.view.width, ADJUST_PERCENT_FLOAT(33.f));
        _titleView.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];
    }
    return _titleView;
}


- (YBDefaultButton *)naviLeftBtn
{
    if (_naviLeftBtn == nil) {
        _naviLeftBtn = [YBDefaultButton buttonWithType:UIButtonTypeCustom];
        [_naviLeftBtn setBackgroundImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
        [_naviLeftBtn setBackgroundImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
        _naviLeftBtn.size = _naviLeftBtn.currentBackgroundImage.size;
    }
    return _naviLeftBtn;
}


@end
