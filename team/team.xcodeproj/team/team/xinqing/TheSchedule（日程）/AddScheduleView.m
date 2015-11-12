//
//  AddScheduleView.m
//  team
//
//  Created by apple on 15/11/11.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "AddScheduleView.h"

@implementation AddScheduleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews{
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kWidth*0.05, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
    [self addSubview:self.tableView];
    
    
}
@end
