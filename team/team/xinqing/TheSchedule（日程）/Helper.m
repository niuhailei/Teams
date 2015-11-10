//
//  Helper.m
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(instancetype)sharedManager{
    static Helper *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [Helper new];
    });
    return manager;
}

//移动数据
- (void)moveDataFromIndexPath:(NSIndexPath *)fromIndexPath
                  toIndexPath:(NSIndexPath *)toIndexPath{
    
    
    Schedule *sch = self.mScheduleArr[fromIndexPath.row];
    
    [self.mScheduleArr removeObject:sch];
    
    [self.mScheduleArr insertObject:sch atIndex:toIndexPath.row];
    
    
}



#pragma mark -- 懒加载 --
- (NSMutableArray *)mScheduleArr{
    if (!_mScheduleArr) {
        self.mScheduleArr = [NSMutableArray array];
    }
    return _mScheduleArr;
}
@end
