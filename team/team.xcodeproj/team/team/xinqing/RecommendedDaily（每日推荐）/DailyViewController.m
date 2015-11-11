//
//  DailyViewController.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "DailyViewController.h"

@interface DailyViewController ()

@property(nonatomic,strong)ModelForMeiwen *model;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *dailyView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;


@property (weak, nonatomic) IBOutlet UITextView *textView;



@end

@implementation DailyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //关闭滑动反弹
    self.scrollView.bounces = NO;
    self.scrollView.scrollEnabled = NO;
    
    self.textView.bounces = NO;
    
    //设置各个视图透明颜色
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.dailyView.backgroundColor = [UIColor clearColor];
    self.textView.backgroundColor = [UIColor clearColor];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self requerAllDatasWithString:nil];
    
    
    
    NSLog(@"aaa");
}


//请求数据
-(void)requerAllDatasWithString:(NSString *)string{
    
    //字符串拼接，根据日期，拼接成不同网址
    string = [NSString stringWithFormat:@"%d",20151111];
    
    NSString *stringUrl = [kHTTPMEIRIYIWEN stringByAppendingString:string];
    NSURL *url = [[NSURL alloc] initWithString:stringUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        self.model = [[ModelForMeiwen alloc] init];
        [self.model setValuesForKeysWithDictionary:dict];
        
        self.titleLabel.text = self.model.title;
        self.authorLabel.text = self.model.author;
        self.textView.text = self.model.content;
        
        //关闭整页滑动
        self.textView.pagingEnabled = NO;
        //关闭中央回弹
        self.textView.bouncesZoom = NO;
        
        NSLog(@"%@",self.model.title);

        
        
        
        
    }];
        
    
    
    
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
