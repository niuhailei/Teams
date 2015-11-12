//
//  BirthdayViewCell.m
//  team
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "BirthdayViewCell.h"

@implementation BirthdayViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews{
    
    self.introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*0.03, kWidth*0.01, kWidth*0.55, 40)];
    self.introduceLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.introduceLabel];
    
    self.remindLabel =[[UILabel alloc]initWithFrame:CGRectMake(self.introduceLabel.frame.origin.x+kWidth*0.55+5, self.introduceLabel.frame.origin.y, kWidth*0.2, 40)];
    self.remindLabel.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.remindLabel];
    
    self.remindSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(self.remindLabel.frame.origin.x+kWidth*0.2+kWidth*0.03, self.remindLabel.frame.origin.y+5, kWidth*0.2, 40)];
    self.remindSwitch.on = NO;
    self.remindSwitch.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.remindSwitch];
    
    
    
    
}

@end
