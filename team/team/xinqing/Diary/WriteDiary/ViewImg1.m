//
//  ViewImg1.m
//  team
//
//  Created by lanou3g on 15/11/10.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "ViewImg1.h"

@implementation ViewImg1

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self =  [super initWithFrame:frame]) {
        
        [self addAllViews];
        
    }
    return self;
}

- (void)addAllViews
{
    self.userInteractionEnabled = YES;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:Bounds];
    
    [self addSubview:scrollView];
    
    
    UIImage *image = [UIImage imageNamed:@"jian.jpg"];
    UIImageView *imagView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, image.size.height)];
    
    
    
     UIImage *image1 = [UIImage imageNamed:@"111.jpg"];
    self.imagView1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40,(Width - 30) / 2 , (Width - 30) / 2)];
    [self.imagView1 setImage:image1];
    self.imagView1.layer.cornerRadius = (Width - 30) / 4;
    self.imagView1.layer.masksToBounds = YES;
 
    self.imagView2 = [[UIImageView alloc] initWithFrame:CGRectMake(20 +( (Width - 30) / 2) , 40, (Width - 30)/2, (Width - 30) / 2)];
    [self.imagView2 setImage:image1];
    self.imagView2.layer.cornerRadius = (Width - 30) / 4;
    self.imagView2.layer.masksToBounds = YES;

    self.imagView3 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50 +(Width - 30)/2,(Width - 30) / 2 , (Width - 30) / 2)];
    [self.imagView3 setImage:image1];
    self.imagView3.layer.cornerRadius = (Width - 30) / 4;
    self.imagView3.layer.masksToBounds = YES;
    
    
    self.imagView4 = [[UIImageView alloc] initWithFrame:CGRectMake(20 +( (Width - 30) / 2) , 50 +(Width - 30)/2, (Width - 30)/2, (Width - 30) / 2)];
    [self.imagView4 setImage:image1];
    self.imagView4.layer.cornerRadius = (Width - 30) / 4;
    self.imagView4.layer.masksToBounds = YES;
    
    
    self. imagView5 = [[UIImageView alloc] initWithFrame:CGRectMake(20 +( (Width - 30) / 2), 60 +(Width - 30), (Width - 30)/2, (Width - 30)/2)];
    [self.imagView5 setImage:image1];
    self.imagView5.layer.cornerRadius = (Width - 30) / 4;
    self.imagView5.layer.masksToBounds = YES;
    
    self. imagView6 = [[UIImageView alloc] initWithFrame:CGRectMake(20 +( (Width - 30) / 2), 70 +(Width - 30) * 1.5, (Width - 30)/2, (Width - 30)/2)];
    [self.imagView6 setImage:image1];
    self.imagView6.layer.cornerRadius = (Width - 30) / 4;
    self.imagView6.layer.masksToBounds = YES;
    
    
    [imagView addSubview:self.imagView1];
    [imagView addSubview:self.imagView2];
    [imagView addSubview:self.imagView3];
    [imagView addSubview:self.imagView4];
    [imagView addSubview:self.imagView5];
    [imagView addSubview:self.imagView6];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 70 +(Width - 30), (Width - 30)/2, (Width - 30))];
    
     textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    textView.text = @"015-11-10 20:43:47.821 team[16998:506585] top:320.672241 2015-11-10 20:43:47.821 team[16998:506585] frme:209.500000,325.672241,199.500000,135.402832015-11-10 20:43:47.821 team[16998:506585] collectionViewContentSize    2015-11-10 20:43:47.821 team[16998:506585] layoutAttributesForElementsInRect2015-11-10 20:43:47.821 team[16998:506585] indexPathsOfItem    2015-11-10 20:43:47.822 team[16998:506585] collectionViewContentSize.672241,199.500000,135.402832015-11-10 20:43:47.821 team[16998:506585] collectionViewContentSize    2015-11-10 20:43:47.821 team[16998:506585.672241,199.500000,135.402832015-11-10 20:43:47.821 team[16998:506585] collectionViewContentSize    2015-11-10 20:43:47.821 team[16998:506585.672241,199.500000,135.402832015-11-10 20:43:47.821 team[16998:506585] collectionViewContentSize    2015-11-10 20:43:47.821 team[16998:506585.672241,199.500000,135.402832015-11-10 20:43:47.821 team[16998:506585] collectionViewContentSize    2015-11-10 20:43:47.821 team[16998:506585";
    
    textView.backgroundColor = [UIColor redColor];
    [imagView addSubview:textView];
    self.textView = textView;
    
    [imagView setImage:image];
    
    
    
    [scrollView addSubview:imagView];
    
    if (image.size.height > Height) {
        
        scrollView.contentSize = CGSizeMake(Width, image.size.height);
        
    }
}










@end
