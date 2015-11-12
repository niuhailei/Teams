//
//  AddScheduleTableController.m
//  team
//
//  Created by apple on 15/11/11.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "AddScheduleTableController.h"

@interface AddScheduleTableController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITextField *textField;
@property (nonatomic,strong)AddScheduleView *addSchedule;
@end

static NSString *const cellID = @"rr";
@implementation AddScheduleTableController

- (void)loadView{
    self.addSchedule = [[AddScheduleView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.addSchedule;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    
    
}

#pragma mark -- tableView的添加，头部视图的添加 --
- (void)createTableView{
    
    //消除分割线
//    self.addSchedule.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.addSchedule.tableView.delegate = self;
    self.addSchedule.tableView.dataSource = self;
    //注册
    [self.addSchedule.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    //添加头视图
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0,0, kWidth-200,kHeight*0.06)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor colorWithWhite:0.770 alpha:1.000];
    self.textField.placeholder = @"请输入...";
    self.textField.keyboardType = 
    self.textField.alpha = 0.5f;
    self.addSchedule.tableView.tableHeaderView = self.textField;
    //添加背景
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"love.jpg"]];
    imgView.frame = [UIScreen mainScreen].bounds;
    self.addSchedule.tableView.backgroundView = (UIView *)imgView;
}

- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
@end
