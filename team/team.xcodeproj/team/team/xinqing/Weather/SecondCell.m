//
//  SecondCell.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "SecondCell.h"
@interface SecondCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

//week
@property (weak, nonatomic) IBOutlet UILabel *labelWeek1;
@property (weak, nonatomic) IBOutlet UILabel *labelWeek2;
@property (weak, nonatomic) IBOutlet UILabel *labelWeek3;
@property (weak, nonatomic) IBOutlet UILabel *labelWeek4;
@property (weak, nonatomic) IBOutlet UILabel *labelWeek5;
@property (weak, nonatomic) IBOutlet UILabel *labelWeek6;
//date
@property (weak, nonatomic) IBOutlet UILabel *labelDate1;
@property (weak, nonatomic) IBOutlet UILabel *labelDate2;
@property (weak, nonatomic) IBOutlet UILabel *labelDate3;
@property (weak, nonatomic) IBOutlet UILabel *labelDate4;
@property (weak, nonatomic) IBOutlet UILabel *labelDate5;
@property (weak, nonatomic) IBOutlet UILabel *labelDate6;
//type
@property (weak, nonatomic) IBOutlet UILabel *labelType1;
@property (weak, nonatomic) IBOutlet UILabel *labelType2;
@property (weak, nonatomic) IBOutlet UILabel *labelType3;
@property (weak, nonatomic) IBOutlet UILabel *labelType4;
@property (weak, nonatomic) IBOutlet UILabel *labelType5;
@property (weak, nonatomic) IBOutlet UILabel *labelType6;
//temHigh
@property (weak, nonatomic) IBOutlet UILabel *labelHighTem1;
@property (weak, nonatomic) IBOutlet UILabel *labelHighTem2;
@property (weak, nonatomic) IBOutlet UILabel *labelHighTem4;
@property (weak, nonatomic) IBOutlet UILabel *labelHighTem5;
@property (weak, nonatomic) IBOutlet UILabel *labelHighTem6;
@property (weak, nonatomic) IBOutlet UILabel *labelHighTem3;
//temLow
@property (weak, nonatomic) IBOutlet UILabel *labelLowTem1;
@property (weak, nonatomic) IBOutlet UILabel *labelLowTem2;
@property (weak, nonatomic) IBOutlet UILabel *labelLowTem3;
@property (weak, nonatomic) IBOutlet UILabel *labelLowTem4;
@property (weak, nonatomic) IBOutlet UILabel *labelLowTem5;
@property (weak, nonatomic) IBOutlet UILabel *labelLowTem6;



@end
@implementation SecondCell

- (void)setWeather0:(Weather *)weather0
{
    [self.imgView setImage:[UIImage imageNamed:@"weather.jpg"]];
    self.labelWeek1.text = weather0.week;
      NSString *date = [weather0.date substringFromIndex:5];
    self.labelDate1.text = date;
    self.labelType1.text = weather0.type;
    self.labelHighTem1.text = weather0.hightemp;
    self.labelLowTem1.text = weather0.lowtemp;
//    self.imageView
    
}

- (void)setWeather1:(Weather *)weather1
{
    self.labelWeek2.text = weather1.week;
    NSString *date = [weather1.date substringFromIndex:5];
    self.labelDate2.text = date;
    self.labelType2.text = weather1.type;
    self.labelHighTem2.text = weather1.hightemp;
    self.labelLowTem2.text = weather1.lowtemp;
    //    self.imageView
    
}

- (void)setWeather2:(Weather *)weather2
{
    self.labelWeek3.text = weather2.week;
    NSString *date = [weather2.date substringFromIndex:5];
    self.labelDate3.text = date;
    self.labelType3.text = weather2.type;
    self.labelHighTem3.text = weather2.hightemp;
    self.labelLowTem3.text = weather2.lowtemp;
    //    self.imageView
}

- (void)setWeather3:(Weather *)weather3
{
    self.labelWeek4.text = weather3.week;
    NSString *date = [weather3.date substringFromIndex:5];
    self.labelDate4.text = date;
    self.labelType4.text = weather3.type;
    self.labelHighTem4.text = weather3.hightemp;
    self.labelLowTem4.text = weather3.lowtemp;
    //    self.imageView
}

- (void)setWeather4:(Weather *)weather4
{
    self.labelWeek5.text = weather4.week;
    NSString *date = [weather4.date substringFromIndex:5];
    self.labelDate5.text = date;
    self.labelType5.text = weather4.type;
    self.labelHighTem5.text = weather4.hightemp;
    self.labelLowTem5.text = weather4.lowtemp;
    //    self.imageView
    
}

- (void)setWeather5:(Weather *)weather5
{
    self.labelWeek6.text = weather5.week;
    NSString *date = [weather5.date substringFromIndex:5];
    self.labelDate6.text = date;
    self.labelType6.text = weather5.type;
    self.labelHighTem6.text = weather5.hightemp;
    self.labelLowTem6.text = weather5.lowtemp;
    //    self.imageView
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
