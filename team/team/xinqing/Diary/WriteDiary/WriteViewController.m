//
//  WriteViewController.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "WriteViewController.h"
#import "ViewImg1.h"
@interface WriteViewController ()

//存放模板的数组
@property(nonatomic,strong)NSArray *imageArray;
@property (nonatomic,strong)ViewImg1 *ViewImg1;

@end

@implementation WriteViewController

-(NSArray *)imageArray{
    if (!_imageArray) {
        NSMutableArray *muArr = [NSMutableArray new];
        
        //设置imageView的宽高适应图片宽高
        UIImage *image1 = [UIImage imageNamed:@"jian.jpg"];
        
        UIImageView *imageV1 = [[UIImageView alloc] initWithImage:image1];
        imageV1.frame = CGRectMake(0, 69, Width,image1.size.height * (Width/image1.size.width));
        
        //        imageV1.frame = Bounds;
        
        
        UIImage *image2 = [UIImage imageNamed:@"tui1"];
        UIImageView *imageV2 = [[UIImageView alloc] initWithImage:image2];
        //        imageV2.frame = CGRectMake(0, 0, image2.size.width,image2.size.height);
        imageV2.frame = CGRectMake(0, 69, Width,image2.size.height * (Width/image1.size.width));
        
        
        //        imageV2.frame = Bounds;
        
        
        UIImage *image3 = [UIImage imageNamed:@"t3"];
        UIImageView *imageV3 = [[UIImageView alloc] initWithImage:image3];
        //        imageV3.frame = CGRectMake(0, 0, image3.size.width, image3.size.height);
        imageV3.frame = CGRectMake(0, 69, Width, image3.size.height * (Width/image1.size.width));
        
        //        imageV3.frame = Bounds;
        
        
        
        UIImage *image4 = [UIImage imageNamed:@"tu3"];
        UIImageView *imageV4 = [[UIImageView alloc] initWithImage:image4];
        //        imageV4.frame = CGRectMake(0, 0, image4.size.width, image4.size.height);
        imageV4.frame = CGRectMake(0, 69, Width, image4.size.height * (Width/image1.size.width));
        
        //        imageV4.frame = Bounds;
        
        
        //将图片添加到数组，在给cell赋值是调用
        [muArr addObject:imageV1];
        [muArr addObject:imageV2];
        [muArr addObject:imageV3];
        [muArr addObject:imageV4];
        
        _imageArray = muArr;
    }
    return _imageArray;
}


- (void)loadView
{
    if (self.indexPath == 0) {
        
       
        
        self.ViewImg1 = [[ViewImg1 alloc] initWithFrame:Bounds];
        self.view = self.ViewImg1;
        
        self.ViewImg1.backgroundColor = [UIColor whiteColor];
        
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
