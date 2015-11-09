//
//  ScheduleInfoCell.m
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "ScheduleInfoView.h"

@implementation ScheduleInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
    }
    return self;
}


#pragma mark -- 添加控件 --
- (void)addAllViews{
    self.tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    [self addSubview:self.tableView];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(kWidth*0.05, kWidth*0.08, kWidth-kWidth*0.05*2, kWidth)];
    self.textView.backgroundColor = [UIColor greenColor];
    self.textView.font = kFont;
    self.textView.layer.borderWidth = 1.f;
    [self.tableView addSubview:self.textView];
    
    self.finishBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.finishBtn.frame = CGRectMake(kWidth*0.7, kHeight*0.7,  kWidth*0.2, kWidth*0.15);
    [self.finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    //[self addSubview:self.finishBtn];
    
}
@end
