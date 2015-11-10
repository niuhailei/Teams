//
//  SelectDateView.m
//  team
//
//  Created by apple on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "SelectDateView.h"

@interface SelectDateView ()

@end

@implementation SelectDateView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews{
    self.backgroundColor = [UIColor whiteColor];
    self.selectLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, kWidth*0.3, kWidth,kWidth*0.15)];
    
    self.selectLabel.text = @"请选择日期";
    [self addSubview:self.selectLabel];
    
    self.finishBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.finishBtn.frame = CGRectMake(kWidth*0.7, kHeight*0.9,  kWidth*0.2, 35);
    [self.finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self addSubview:self.finishBtn];
    
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(kWidth*0.1, kHeight*0.3, kWidth*0.8, kWidth*0.8)];
    self.datePicker.layer.borderWidth = 1.f;
    [self addSubview:self.datePicker];
    
    
}
@end
