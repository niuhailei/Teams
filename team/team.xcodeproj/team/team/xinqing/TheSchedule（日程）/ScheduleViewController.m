//
//  ScheduleViewController.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "ScheduleViewController.h"
BOOL key = YES;
@interface ScheduleViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)ScheduleView *scheduleView;
@property (nonatomic,strong)NSMutableArray *barBtnMArray;
@property (nonatomic,strong)UIBarButtonItem *editBarBtn;
@property (nonatomic,strong)UIBarButtonItem *addBarBtn;
@property (nonatomic,strong)UILocalNotification *local;
@end

static NSString *const cellID = @"aa";
@implementation ScheduleViewController

- (void)loadView{
    self.scheduleView = [[ScheduleView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.scheduleView;
    self.scheduleView.tableView.delegate = self;
    self.scheduleView.tableView.dataSource = self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //注册
    [self.scheduleView.tableView registerClass:[ScheduleCell class] forCellReuseIdentifier:cellID];
    [self addNavigationBar];
    //自定义删除按钮
    [self customDelegate];
    
    
}
#pragma mark -- navigationBar上的btn --
- (void)addNavigationBar{
    
    self.title = @"日程安排";
    self.addBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(pushAddInfoView:)];
    self.editBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editBarBtnAction:)];

//    self.editBarBtn = self.editButtonItem;
    self.barBtnMArray = [NSMutableArray arrayWithObjects:self.editBarBtn,self.addBarBtn,nil];
    self.navigationItem.rightBarButtonItems = self.barBtnMArray;
    
    
}
#pragma mark -- 自定义删除按钮，事件 --
- (void)customDelegate{
//    UITableViewRowAction *delegateRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"ff" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        
  //  }];
}

- (void)editBarBtnAction:(UIBarButtonItem *)sender
{   if([Helper sharedManager].mScheduleArr.count == 0){
    return;
}else{
    if (key == YES) {
        [self.scheduleView.tableView setEditing:YES animated:YES];
        self.editBarBtn.title = @"完成";
        key = NO;
    }else{
        [self.scheduleView.tableView setEditing:NO animated:YES];
        self.editBarBtn.title = @"编辑";
        key = YES;
    }
}
}

#pragma mark -- addScheduleInformation --
- (void)pushAddInfoView:(UIBarButtonItem *)sender{
    SelectDateController *selectDateController = [SelectDateController new];
    [self.navigationController pushViewController:selectDateController animated:YES];

    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.scheduleView.tableView reloadData];
    
}

#pragma mark -- dataSource && delegate --

- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [Helper sharedManager].mScheduleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    //   ScheduleInfoController *scheduleInfo = [ScheduleInfoController new];
    //    scheduleInfo.result = ^(NSString *infoStr){
    //        cell.introLabel.text = infoStr;
    //    };
    
    Schedule *schedule = [Helper sharedManager].mScheduleArr[indexPath.row];
    cell.dateLabel.text = schedule.dateStr;
    cell.introLabel.text = schedule.infoStr;
    cell.timeLabel.text = schedule.timeStr;
    [cell.remindSwitch addTarget:self action:@selector(remindSwitchAction:) forControlEvents:UIControlEventValueChanged];
    return cell;
    
    
}

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




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kHeight*0.08;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
#pragma mark -- 删除 --
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [[Helper sharedManager].mScheduleArr removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

#pragma mark -- 移动 --

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    [[Helper sharedManager] moveDataFromIndexPath:fromIndexPath toIndexPath:toIndexPath];
}


@end
