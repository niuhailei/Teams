//
//  InfoViewController.m
//  时间印记
//
//  Created by lanou3g on 15/10/24.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()<UIScrollViewDelegate,UIApplicationDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIButton *therdButton;
- (IBAction)firstAction:(UIButton *)sender;
- (IBAction)secondAction:(UIButton *)sender;
- (IBAction)therdAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    self.pageControl.numberOfPages = 3;
    
    self.pageControl.currentPage = 0;
    
    self.pageControl.backgroundColor = [UIColor redColor];

    [self.pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];

    self.scrollView.delegate = self;



}

-(void)pageControlAction:(UIPageControl *)sender{
    
    //可以通过currentPage获取当前第几个点
    NSLog(@"%ld",(long)sender.currentPage);
    
    CGPoint offset = CGPointMake(self.scrollView.frame.size.width*sender.currentPage, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}



//当视图完全停止的时候执行（减速结束）
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //使用偏移量 除以 scrollView 的宽度，得到当前页数的下标
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    //赋值给小点点
    self.pageControl.currentPage = index;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)firstAction:(UIButton *)sender {
    
    self.pageControl.currentPage = 1;
    CGPoint offset = CGPointMake(self.scrollView.frame.size.width*1, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (IBAction)secondAction:(UIButton *)sender {
    self.pageControl.currentPage = 2;
    CGPoint offset = CGPointMake(self.scrollView.frame.size.width*2, 0);
    [self.scrollView setContentOffset:offset animated:YES];

}

- (IBAction)therdAction:(UIButton *)sender {
    
    
    NSLog(@"已经不是第一次启动了");

    
    
    
    
    
        
    
//    MainViewController *mainVC = [[UIStoryboard storyboardWithName:@"NIU" bundle:nil] instantiateViewControllerWithIdentifier:@"mainVC"];
    
    MainNavigationViewController *mainNavigationController = [[UIStoryboard storyboardWithName:@"NIU" bundle:nil] instantiateViewControllerWithIdentifier:@"mainNavigation"];
    
    
        
    
   
    [self showViewController:mainNavigationController sender:nil];
    
    
}














@end
