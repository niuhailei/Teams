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
    
    self.upView = [[UIView alloc]initWithFrame:CGRectMake(kX, kWidth*0.01, kWidth, kHeight*0.16)];
    self.upView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.upView];
    
    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.upView.frame.origin.x+kWidth*0.01, self.upView.frame.origin.y+self.upView.frame.size.height*0.1, self.upView.frame.size.width-2*kWidth*0.01, self.upView.frame.size.height*0.3)];
    self.dateLabel.backgroundColor = [UIColor greenColor];
    [self.upView addSubview:self.dateLabel];
    
    self.introLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.dateLabel.frame.origin.x, self.upView.frame.origin.y+self.upView.frame.size.height*0.5, self.dateLabel.frame.size.width, self.dateLabel.frame.size.height)];
    self.introLabel.backgroundColor = [UIColor purpleColor];
    [self.upView addSubview:self.introLabel];
    
    
    
    

    
    
}
@end
