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



#pragma mark -- 懒加载 --
- (NSMutableArray *)mScheduleArr{
    if (!_mScheduleArr) {
        self.mScheduleArr = [NSMutableArray array];
    }
    return _mScheduleArr;
}
@end
