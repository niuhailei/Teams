//
//  SelectDateController.m
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "SelectDateController.h"

@interface SelectDateController ()
@property (nonatomic,strong)SelectDateView *selectDateView;
@end

@implementation SelectDateController

- (void)loadView{
    self.selectDateView = [[SelectDateView alloc]initWithFrame:[UIScreen mainScreen].bounds];

    self.view = self.selectDateView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self selectDateButton];
}
#pragma mark -- 得到日期,传值,跳转--
- (void)selectDateButton{

    
    
    [self.selectDateView.finishBtn addTarget:self action:@selector(finishBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark -- 事件 --

- (void)finishBtnAction:(UIButton *)sender{
    
    UIDatePicker *datePicker = self.selectDateView.datePicker;
    NSDate *date = datePicker.date;
    NSDateFormatter *format1 = [[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy-MM-dd eee"];
    
    NSDateFormatter *format2 = [[NSDateFormatter alloc]init];
    [format2 setDateFormat:@"hh:mm"];
    
    
    
    ScheduleInfoController *scheduleInfoController = [ScheduleInfoController new];
    scheduleInfoController.dateStr = [format1 stringFromDate:date];
    scheduleInfoController.timeStr = [format2 stringFromDate:date];
    
    [self.navigationController pushViewController:scheduleInfoController animated:YES];
    
    
    
}



@end
