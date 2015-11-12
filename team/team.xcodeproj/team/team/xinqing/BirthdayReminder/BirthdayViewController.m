//
//  BirthdayViewController.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "BirthdayViewController.h"

@interface BirthdayViewController ()<HSDatePickerViewControllerDelegate>
@property (nonatomic,strong)NSDate *selectedDate;
@property (nonatomic,strong)NSString *dateString;
@property (nonatomic,strong)UILocalNotification *local;
@end

@implementation BirthdayViewController

static NSString *const cellID = @"hh";

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.tableView registerClass:[BirthdayViewCell class] forCellReuseIdentifier:cellID];
    //标题
    self.title = @"生日提醒";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPeopleBirth:)];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

#pragma mark -- 添加生日，跳转 --

- (void)addPeopleBirth:(UIBarButtonItem *)sender{
    HSDatePickerViewController *hsdpvc = [HSDatePickerViewController new];
    hsdpvc.delegate = self;
    if (self.selectedDate) {
        hsdpvc.date = self.selectedDate;
    }
    [self presentViewController:hsdpvc animated:YES completion:nil];
    
}

#pragma mark - HSDatePickerViewControllerDelegate
- (void)hsDatePickerPickedDate:(NSDate *)date {
    NSLog(@"Date picked %@", date);
    NSDateFormatter *dateFormater = [NSDateFormatter new];
    dateFormater.dateFormat = @"yyyy.MM.dd HH:mm:ss";
    //self.dateLabel.text = [dateFormater stringFromDate:date];
    self.dateString = [dateFormater stringFromDate:date];
    NSLog(@"^^^^%@",self.dateString);
    self.selectedDate = date;
    
}

//optional
- (void)hsDatePickerDidDismissWithQuitMethod:(HSDatePickerQuitMethod)method {
    NSLog(@"Picker did dismiss with %lu", method);
}

//optional
- (void)hsDatePickerWillDismissWithQuitMethod:(HSDatePickerQuitMethod)method {
    NSLog(@"Picker will dismiss with %lu", method);
}



- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BirthdayViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    [cell.remindSwitch addTarget:self action:@selector(remindSwitchAction:) forControlEvents:UIControlEventValueChanged];
    NSLog(@"-------%@",self.dateString);
    cell.introduceLabel.text = self.dateString;
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
#pragma mark -- 是否开启通知 --
- (void)remindSwitchAction:(UISwitch *)sender{
    
    if (sender.on == NO) {
        NSLog(@"ss");
        //通知的注销
    /*
        UIApplication *app = [UIApplication sharedApplication];
        //获取本地推送数组
        NSArray *localArr = [app scheduledLocalNotifications];
        //声明本地通知对象
       // UILocalNotification *localNotification;
        if (localArr) {
            for (UILocalNotification *localti in localArr) {
                NSDictionary *dict = localti.userInfo;
                if (dict) {
                    NSString *inKey = [dict objectForKey:@"ye"];
                    NSLog(@"%@",inKey);
                    if ([inKey isEqualToString:@"id"]) {
                        [[UIApplication sharedApplication] cancelLocalNotification:localti];
                    }
                }
            }
        }
*/
        
        
        
    }else{
        //添加通知
        /*
        
        CGFloat verson = [[UIDevice currentDevice].systemVersion floatValue];
        if (verson>=8.0) {
            //初始化推送
            NSDateComponents *com = [[NSDateComponents alloc]init];
            com.year = 2015;
            com.month = 11;
            com.day = 12;
            com.hour = 16;
            com.minute = 45;
            com.second = 0;
            com.timeZone = [NSTimeZone defaultTimeZone];
            NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:com];
            NSLog(@"%@",date);
            
            // NSDate *date = [NSDate date];
            self.local = [[UILocalNotification alloc]init];
            //设置发送的时间
            self.local.fireDate = date;
            //设置时区
            self.local.timeZone = [NSTimeZone defaultTimeZone];
            //设置重复次数
            self.local.repeatInterval = kCFCalendarUnitDay;
            //设置推送的内容
            self.local.alertBody = @"heihiei";
            //设置推送标题
            self.local.alertTitle = @"哈哈";
            //设置推送的声音
            self.local.soundName = UILocalNotificationDefaultSoundName;
            //点击推送通知时，启动app图片
            self.local.alertLaunchImage = @"";
            //在锁屏时显示的标题
            self.local.alertAction = @"hehe";
            //app图标数字
            self.local.applicationIconBadgeNumber = 2;
            //其它信息
            self.local.userInfo = [NSDictionary dictionaryWithObject:@"id" forKey:@"ye"];
            self.local.category = @"ccc";
            
        }else{
            
        }
        
        [[UIApplication sharedApplication] scheduleLocalNotification:self.local];
        */
    }
    
}




@end
