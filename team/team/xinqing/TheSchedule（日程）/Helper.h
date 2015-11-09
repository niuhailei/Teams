//
//  Helper.h
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject
@property (nonatomic,strong)NSMutableArray *mScheduleArr;
+(instancetype)sharedManager;
@end
