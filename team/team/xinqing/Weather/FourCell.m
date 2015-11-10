//
//  FourCell.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "FourCell.h"
@interface FourCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
//指数Name
@property (weak, nonatomic) IBOutlet UILabel *labelGMName;
@property (weak, nonatomic) IBOutlet UILabel *labelFSname;
@property (weak, nonatomic) IBOutlet UILabel *labelYDname;
@property (weak, nonatomic) IBOutlet UILabel *labelXCname;
@property (weak, nonatomic) IBOutlet UILabel *labelLSname;
@property (weak, nonatomic) IBOutlet UILabel *labelCYname;

//指数Index
@property (weak, nonatomic) IBOutlet UILabel *labelGMIndex;
@property (weak, nonatomic) IBOutlet UILabel *labelFSIndex;
@property (weak, nonatomic) IBOutlet UILabel *labelYDIndex;
@property (weak, nonatomic) IBOutlet UILabel *labelXCIndex;
@property (weak, nonatomic) IBOutlet UILabel *labelLSIndex;
@property (weak, nonatomic) IBOutlet UILabel *labelCYIndex;

//指数 details
@property (weak, nonatomic) IBOutlet UILabel *labelGMDetails;
@property (weak, nonatomic) IBOutlet UILabel *labelFSDetails;
@property (weak, nonatomic) IBOutlet UILabel *labelYDDetails;
@property (weak, nonatomic) IBOutlet UILabel *labelXCDetails;
@property (weak, nonatomic) IBOutlet UILabel *labelLSDetails;
@property (weak, nonatomic) IBOutlet UILabel *labelCYDetails;
@end



@implementation FourCell

- (void)setWeather0:(Weather *)weather0
{
    
[self.imgView setImage:[UIImage imageNamed:@"weather.jpg"]];
    self.labelGMName.text = weather0.name;
    self.labelGMIndex.text = weather0.index;
    self.labelGMDetails.text = weather0.details;
}

- (void)setWeather1:(Weather *)weather1
{
    self.labelFSDetails.text = weather1.details;
    self.labelFSname.text = weather1.name;
    self.labelFSIndex.text = weather1.index;
}

- (void)setWeather2:(Weather *)weather2
{
    self.labelYDname.text = weather2.name;
    self.labelYDIndex.text = weather2.index;
    self.labelYDDetails.text = weather2.details;
}

- (void)setWeather3:(Weather *)weather3
{
    self.labelXCname.text = weather3.name;
    self.labelXCIndex.text = weather3.index;
    self.labelXCDetails.text = weather3.details;
}

- (void)setWeather4:(Weather *)weather4
{
    self.labelLSname.text = weather4.name;
    self.labelLSIndex.text = weather4.index;
    self.labelLSDetails.text = weather4.details;
}

- (void)setWeather5:(Weather *)weather5
{
    self.labelCYname.text = weather5.name;
    self.labelCYIndex.text = weather5.index;
    self.labelCYDetails.text = weather5.details;
}










- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
