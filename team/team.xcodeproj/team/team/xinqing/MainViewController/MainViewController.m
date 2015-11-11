//
//  MainViewController.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UIScrollViewDelegate>

//轮播图
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contondView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;



//心晴日记
@property (weak, nonatomic) IBOutlet UIView *diaryView;
- (IBAction)diaryAction:(UIButton *)sender;

//日程安排
@property (weak, nonatomic) IBOutlet UIView *scheduleView;
- (IBAction)scheduleAction:(UIButton *)sender;

//生日提醒
@property (weak, nonatomic) IBOutlet UIView *birthdayView;
- (IBAction)birthdayAction:(UIButton *)sender;

//每日推荐
- (IBAction)recommendedDaily:(UIButton *)sender;

//天气查询
- (IBAction)weatherAction:(UIButton *)sender;

//扫一扫
- (IBAction)QRCodeAction:(UIButton *)sender;

 @property (nonatomic,strong)NSTimer *timer;                 //设置动画

 @property (nonatomic,assign) BOOL isDragging;               //是否正在拖动


//日历视图（需要切成圆角）
@property(nonatomic,strong)UIView *calendarView;
@property(nonatomic,strong)UIButton *calendarButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.calendarView = [[UIView alloc] initWithFrame:CGRectMake(self.scheduleView.frame.size.width*0.5, self.diaryView.frame.origin.y+self.diaryView.frame.size.height*0.5+69, self.diaryView.frame.size.height, self.diaryView.frame.size.height)];
    self.calendarView.backgroundColor = [UIColor redColor];
    
    //切成圆角
    self.calendarView.layer.cornerRadius = self.diaryView.frame.size.height*0.5;
    
    //self.calendarView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.calendarView];
    
    self.calendarButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.calendarButton.frame = CGRectMake(self.calendarView.frame.origin.x, self.calendarView.frame.origin.y, self.calendarView.frame.size.width, self.calendarView.frame.size.height);
    [self.calendarButton setTitle:@"日历" forState:(UIControlStateNormal)];
    //self.calendarButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.calendarButton];
    
    
    //title
    
    self.title = @"心晴";
    
    
    
    

    //是否整屏（页）滑动 （默认NO）
     self.scrollView.pagingEnabled = YES;
    
    //是否开启边界回弹效果 (默认YES)
    self.scrollView.bounces = NO;

    //        隐藏指示条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    
    
    //设置点点的个数
    self.pageControl.numberOfPages = 4;
    self.pageControl.backgroundColor = [UIColor redColor];
    //给小点点绑定事件
    [self.pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];

    //设置滚动视图的代理
    self.scrollView.delegate = self;
    
    //轮播图
    [self lunbotu];
   
}

-(void)lunbotu{
    //  设置时钟动画 定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(update:) userInfo:nil repeats:YES];
    
    //  将定时器添加到主线程
    
    //    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    self.isDragging = NO;
    
    [self update:self.timer];
}


-(void)pageControlAction:(UIPageControl *)sender{
    
    //可以通过currentPage获取当前第几个点
    NSLog(@"%ld",sender.currentPage);
    
    
    CGPoint offset = CGPointMake(self.scrollView.frame.size.width*sender.currentPage, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

//当视图完全停止的时候执行（减速结束）
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"%d  %s",__LINE__,__FUNCTION__);
//    
//    
//    //使用偏移量 除以 scrollView 的宽度，得到当前页数的下标
//    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
//    //赋值给小点点
//    self.pageControl.currentPage = index;
//    
//}


- (void)update:(NSTimer *)timer{
    
    //定时移动
    
    
    
    if (_isDragging == YES) {
        
        return ;
        
    }
    
    CGPoint offSet = self.scrollView.contentOffset;
    
    //offSet.x +=offSet.x;
    offSet.x = offSet.x + self.view.frame.size.width;
    if (offSet.x >= self.view.frame.size.width *5) {
        offSet.x = 0;
        [self.scrollView setContentOffset:offSet animated:YES];
        
        
       // return;
    }
    
    [self.scrollView setContentOffset:offSet animated:YES];
    
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
    
    _isDragging = YES;
    
}

//  停止滚动

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView

{
    
    _isDragging = NO;
    
    //step = 0;
    
}


// 开始拖动

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
    //使用偏移量 除以 scrollView 的宽度，得到当前页数的下标
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    //赋值给小点点
    self.pageControl.currentPage = index;

    

    
    
    
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

//日记界面
- (IBAction)diaryAction:(UIButton *)sender {
    
    WriteDiaryViewController *writeDiary = [WriteDiaryViewController new];
    [self.navigationController showViewController:writeDiary sender:nil];
    
}

//日程安排
- (IBAction)scheduleAction:(UIButton *)sender {
    
    ListTableViewController *listTVC = [[ListTableViewController alloc] init];
    [self.navigationController showViewController:listTVC sender:nil];
}

//生日提醒
- (IBAction)birthdayAction:(UIButton *)sender {
}

//每日推荐界面
- (IBAction)recommendedDaily:(UIButton *)sender {
    
    DailyViewController *dailyVC = [[UIStoryboard storyboardWithName:@"NIU" bundle:nil] instantiateViewControllerWithIdentifier:@"dailyVC"];;
    [self.navigationController showViewController:dailyVC sender:nil];
    
}

//天气界面
- (IBAction)weatherAction:(UIButton *)sender {

    tableViewTableViewController *weatherVC = [[UIStoryboard storyboardWithName:@"YC" bundle:nil] instantiateViewControllerWithIdentifier:@"tableViewTable"];
    [self.navigationController showViewController:weatherVC sender:nil];


}

//扫一扫
- (IBAction)QRCodeAction:(UIButton *)sender {
    
    QRViewController *qrVC = [QRViewController new];
    [self.navigationController showViewController:qrVC sender:nil];
    
}
@end
