//
//  ScheduleCell.m
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "ScheduleCell.h"
@implementation ScheduleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addAllViews];
    }
    return self;
}
#pragma mark -- 添加控件 --
- (void)addAllViews{
    
    self.upView = [[UIImageView alloc]initWithFrame:CGRectMake(kX, kWidth*0.01, kWidth, kHeight*0.08)];
    //self.upView.backgroundColor = [UIColor redColor];
    self.upView.image = [UIImage imageNamed:@"hui"];
    self.upView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.upView];
    
    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.upView.frame.origin.x+kWidth*0.01, self.upView.frame.origin.y+self.upView.frame.size.height*0.1, self.upView.frame.size.width-2*kWidth*0.01, self.upView.frame.size.height*0.3)];
    //self.dateLabel.backgroundColor = [UIColor greenColor];
    [self.upView addSubview:self.dateLabel];
    
    self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.upView.frame.origin.x+kWidth*0.01, self.upView.frame.origin.y+self.upView.frame.size.height*0.55, self.upView.frame.size.width-2*kWidth*0.01, self.upView.frame.size.height*0.3)];
    //self.timeLabel.backgroundColor = [UIColor redColor];
    [self.upView addSubview:self.timeLabel];
    
    self.introLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.dateLabel.frame.origin.x+kWidth*0.35, self.upView.frame.origin.y+self.upView.frame.size.height*0.05, kWidth*0.45, 40)];
     self.introLabel.backgroundColor = [UIColor purpleColor];
    [self.upView addSubview:self.introLabel];
    
    self.remindSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(kWidth*0.85, self.introLabel.frame.origin.y-3, kWidth*0.2, 40)];
    self.remindSwitch.on = NO;
    
    self.remindSwitch.backgroundColor = [UIColor yellowColor];
    [self.upView addSubview:self.remindSwitch];
    
    
    
    

    
    
}
@end
