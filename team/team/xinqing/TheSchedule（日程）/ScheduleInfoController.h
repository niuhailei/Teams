//
//  ScheduleInfoController.h
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Result)(NSString *);
@interface ScheduleInfoController : UITableViewController
@property (nonatomic,copy)Result result;
@property (nonatomic,strong)NSString *dateStr;
@end
