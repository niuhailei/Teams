//
//  ScheduleView.m
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "ScheduleView.h"

@implementation ScheduleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews{
    
    
    self.tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = [UIColor colorWithRed:1.000 green:0.718 blue:0.036 alpha:1.000];
    [self addSubview:self.tableView];
    
    
    
    
    
    
}


@end
