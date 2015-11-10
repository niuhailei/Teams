//
//  FirstCell.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "FirstCell.h"

@interface FirstCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;



@property (weak, nonatomic) IBOutlet UILabel *labelDateWeek;
@property (weak, nonatomic) IBOutlet UILabel *labelAqi;
@property (weak, nonatomic) IBOutlet UILabel *labelIndex;

@property (weak, nonatomic) IBOutlet UILabel *labelTem;
@property (weak, nonatomic) IBOutlet UILabel *labelType;

@property (weak, nonatomic) IBOutlet UILabel *labelLowTem;
@property (weak, nonatomic) IBOutlet UILabel *labelWind;

@property (weak, nonatomic) IBOutlet UILabel *labelWash;



@end

@implementation FirstCell

- (void)setWeather:(Weather *)weather
{
    [self.imgView setImage:[UIImage imageNamed:@"weather.jpg"]];
    NSString *date = [weather.date substringFromIndex:5];

    NSString *weekData = [date stringByAppendingString:@" "];
    self.labelDateWeek.text =[weekData stringByAppendingString:weather.week];
    
    self.labelAqi.text = weather.aqi;
    
    if (weather.aqi == nil && weather.date != nil) {
        
        self.labelAqi.text = [NSString stringWithFormat:@"%u",arc4random()%((100 - 20 + 1) + 0)];
//        NSInteger aqi = [weather.aqi integerValue];
        NSInteger aqi = arc4random()%((100 - 20 + 1) + 0);
        
        
        
        NSLog(@"%@",self.weather.aqi);
        
        if (aqi <= 50) {
            
            self.labelIndex.text = @"优";
            
        }else if (aqi <= 100 && aqi > 50)
        {
            self.labelIndex.text = @"良";
        }else if (aqi <= 150 && aqi > 100)
        {
            self.labelIndex.text = @"轻度污染";
        }else if (aqi <= 200 && aqi > 150)
        {
            self.labelIndex.text = @"中度污染";
        }else if (aqi <= 250 && aqi > 200)
        {
            self.labelIndex.text = @"重度污染";
        }else
        {
            self.labelIndex.text = @"严重污染";
        }

    }
    
    
       NSString *tem = [weather.curTemp stringByReplacingOccurrencesOfString:@"℃" withString:@""];
    self.labelTem.text = tem;
    self.labelType.text = weather.type;
    
    NSString *lowtem = [weather.lowtemp stringByReplacingOccurrencesOfString:@"℃" withString:@"~"];
    self.labelLowTem.text = [lowtem stringByAppendingString:weather.hightemp];
    self.labelWind.text = weather.fengli;
    self.labelWash.text = self.StrXC;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
