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
    return cell;
    
    
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kHeight*0.16;
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
