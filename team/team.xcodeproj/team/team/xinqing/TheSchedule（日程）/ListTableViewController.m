//
//  ListTableViewController.m
//  team
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "ListTableViewController.h"

@interface ListTableViewController ()

@property (nonatomic,strong)UIImageView *tripImgView;
@property (nonatomic,strong)UILabel *tripLabel;
@property (nonatomic,strong)UIImageView *workImgView;
@property (nonatomic,strong)UILabel *workLabel;
@property (nonatomic,strong)UIImageView *familyImgView;
@property (nonatomic,strong)UILabel *familyLabel;
@property (nonatomic,strong)UIImageView *privateImgView;
@property (nonatomic,strong)UILabel *privateLabel;
@property (nonatomic,strong)UITapGestureRecognizer *tapGR1;
@property (nonatomic,strong)UITapGestureRecognizer *tapGR2;
@property (nonatomic,strong)UITapGestureRecognizer *tapGR3;
@property (nonatomic,strong)UITapGestureRecognizer *tapGR4;

@end

@implementation ListTableViewController
/*
 Fade = 1,                   //淡入淡出
 Push,                       //推挤
 Reveal,                     //揭开
 MoveIn,                     //覆盖
 Cube,                       //立方体
 SuckEffect,                 //吮吸
 OglFlip,                    //翻转
 RippleEffect,               //波纹
 PageCurl,                   //翻页
 PageUnCurl,                 //反翻页
 CameraIrisHollowOpen,       //开镜头
 CameraIrisHollowClose,      //关镜头
 CurlDown,                   //下翻页
 CurlUp,                     //上翻页
 FlipFromLeft,               //左翻转
 FlipFromRight,              //右翻转
 */

-(CATransition *)MyCAnimation1:(UIView *)viewNum upDown:(BOOL )boolUpDown typeAnimation:(NSString *)typeAnimation{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.endProgress = 1;
    animation.removedOnCompletion = NO;
    animation.type = typeAnimation;//101
    if (boolUpDown) {
        animation.subtype = kCATransitionFromRight;
    }else{
        animation.subtype = kCATransitionFromLeft;
    }
    
    return animation;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"日程分类";
    
    [self addImgView];
    [self createTableView];
    
    
}
#pragma mark -- tableView --
- (void)createTableView{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView *im = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //im.backgroundColor = [UIColor redColor];
    im.image = [UIImage imageNamed:@"love.jpg"];
    self.tableView.backgroundView = (UIView *)im;
}

#pragma mark -- imgView添加，手势，事件 --
- (void)addImgView{
    //手势初始化
    self.tapGR1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGRAction1:)];
    self.tapGR2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGRAction2:)];
    self.tapGR3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGRAction3:)];
    self.tapGR4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGRAction4:)];
    //旅游视图添加
    self.tripImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth*0.1,kWidth*0.35,kWidth*0.8,kWidth*0.2)];
    self.tripImgView.backgroundColor = [UIColor clearColor];

    self.tripImgView.image = [UIImage imageNamed:@"hongpng"];
    
    self.tripImgView.userInteractionEnabled = YES;
    [self.tableView addSubview:self.tripImgView];
    
    self.tripLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*0.35, -5, self.tripImgView.frame.size.width, self.tripImgView.frame.size.height)];
    self.tripLabel.text = @"旅游";
    [self.tripImgView addSubview:self.tripLabel];
    //手势添加
    [self.tripImgView addGestureRecognizer:self.tapGR1];
    
    //工作视图添加
    self.workImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth*0.1, kWidth*0.54, kWidth*0.8, kWidth*0.2)];
    self.workImgView.backgroundColor = [UIColor clearColor];
    self.workImgView.image = [UIImage imageNamed:@"lvpng"];
    self.workImgView.userInteractionEnabled = YES;
    [self.tableView addSubview:self.workImgView];
    self.workLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*0.35, -5, self.workImgView.frame.size.width, self.workImgView.frame.size.height)];
    self.workLabel.text = @"工作";
    [self.workImgView addSubview:self.workLabel];
    //手势添加
    [self.workImgView addGestureRecognizer:self.tapGR2];
    
    //家庭视图的添加
    self.familyImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth*0.1, kWidth*0.75, kWidth*0.95, kWidth*0.2)];
    self.familyImgView.backgroundColor = [UIColor clearColor];
    self.familyImgView.image = [UIImage imageNamed:@"lanpng"];
    self.familyImgView.userInteractionEnabled = YES;
    [self.tableView addSubview:self.familyImgView];
    self.familyLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*0.35, -5, self.familyImgView.frame.size.width, self.familyImgView.frame.size.height)];
    self.familyLabel.text = @"家庭";
    [self.familyImgView addSubview:self.familyLabel];
    //手势的添加
    [self.familyImgView addGestureRecognizer:self.tapGR3];
    
    //私人视图添加
    self.privateImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth*0.1, kWidth*0.95, kWidth*0.95, kWidth*0.2)];
    self.privateImgView.backgroundColor = [UIColor clearColor];
    self.privateImgView.image = [UIImage imageNamed:@"lan2png"];
    self.privateImgView.userInteractionEnabled = YES;
    [self.tableView addSubview:self.privateImgView];
    self.privateLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWidth*0.35, -10, self.privateImgView.frame.size.width, self.privateImgView.frame.size.height)];
    self.privateLabel.text = @"私人";
    [self.privateImgView addSubview:self.privateLabel];
    //手势的添加
    [self.privateImgView addGestureRecognizer:self.tapGR4];
    
}

#pragma mark -- 手势事件 --
- (void)tapGRAction1:(UITapGestureRecognizer *)sender{
    ScheduleViewController *scheduleController = [ScheduleViewController new];
    //添加动画
    [self.navigationController.view.layer addAnimation:[self MyCAnimation1:self.view upDown:YES typeAnimation:@"suckEffect"]forKey:@"animation"];
    [self.navigationController pushViewController:scheduleController animated:NO];
    
}

- (void)tapGRAction2:(UITapGestureRecognizer *)sender{
    
    [self.navigationController.view.layer addAnimation:[self MyCAnimation1:self.view upDown:YES typeAnimation:@"rippleEffect"]forKey:@"animation"];
    [self.navigationController pushViewController:[AddScheduleTableController new] animated:YES];
    
}
- (void)tapGRAction3:(UITapGestureRecognizer *)sender{
    
}
- (void)tapGRAction4:(UITapGestureRecognizer *)sender{
    
}



@end
