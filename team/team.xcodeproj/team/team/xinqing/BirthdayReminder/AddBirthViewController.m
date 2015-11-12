//
//  AddBirthViewController.m
//  team
//
//  Created by apple on 15/11/12.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "AddBirthViewController.h"

@interface AddBirthViewController ()
@property (nonatomic,strong)UITextField *textField;
@property (nonatomic,strong)UILabel *peopleLabel;
@property (nonatomic,strong)UIButton *finishBtn;


@end

@implementation AddBirthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
}

- (void)createView{
    
    self.peopleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*0.1, kWidth*0.3, kWidth-2*kWidth*0.1, 40)];
    self.peopleLabel.text = @"请输入寿星的姓名，并选择日期";
    self.peopleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.peopleLabel];
    
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kWidth*0.05, self.peopleLabel.frame.origin.y+kWidth*0.2, kWidth*0.6, 35)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"请输入";
    [self.view addSubview:self.textField];
    
    self.finishBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.finishBtn.frame = CGRectMake(kWidth*0.5, self.textField.frame.origin.y+kWidth*0.3, self.textField.frame.size.width, 40);
    [self.finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.finishBtn addTarget:self action:@selector(finishBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -- finishBtn --

- (void)finishBtnAction:(UIButton *)sender{
    
    
    
}





@end
