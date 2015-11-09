//
//  ScheduleInfoController.m
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "ScheduleInfoController.h"

@interface ScheduleInfoController ()
@property (nonatomic,strong)ScheduleInfoView *scheduleView;
@end

static NSString *const cellID = @"bb";
@implementation ScheduleInfoController

- (void)loadView{
    self.scheduleView = [[ScheduleInfoView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.scheduleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
     */
    
    [self.scheduleView.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    //消除分割线
    self.scheduleView.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //添加右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarBtnAction:)];
    
    
    
}
#pragma mark -- 传值，跳转 --
- (void)rightBarBtnAction:(UIBarButtonItem *)sender{
    
    NSString *scheduleStr = self.scheduleView.textView.text;
    
    
    //拿到要回到的控制器
    UIViewController *listSchedule = self.navigationController.viewControllers[0];
     //self.result(scheduleStr);
    Schedule *schedule = [[Schedule alloc]init];
    schedule.dateStr = self.dateStr;
    schedule.infoStr = scheduleStr;
    [[Helper sharedManager].mScheduleArr addObject:schedule];
    
    [self.navigationController popToViewController:listSchedule animated:YES];
    
   
    
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
}
#pragma mark -- 自定义高度 --

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
