//
//  WriteViewController.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "WriteViewController.h"

@interface WriteViewController ()

//存放模板的数组
@property(nonatomic,strong)NSArray *imageArray;


@end

@implementation WriteViewController

-(NSArray *)imageArray{
    if (!_imageArray) {
        NSMutableArray *muArr = [NSMutableArray new];
        
        //设置imageView的宽高适应图片宽高
        UIImage *image1 = [UIImage imageNamed:@"yuantu"];
        UIImageView *imageV1 = [[UIImageView alloc] initWithImage:image1];
        imageV1.frame = CGRectMake(0, 0, image1.size.width,image1.size.height);
        
        UIImage *image2 = [UIImage imageNamed:@"tui1"];
        UIImageView *imageV2 = [[UIImageView alloc] initWithImage:image2];
        imageV2.frame = CGRectMake(0, 0, image2.size.width,image2.size.height);
        
        
        UIImage *image3 = [UIImage imageNamed:@"t3"];
        UIImageView *imageV3 = [[UIImageView alloc] initWithImage:image3];
        imageV3.frame = CGRectMake(0, 0, image3.size.width, image3.size.height);
        
        UIImage *image4 = [UIImage imageNamed:@"tu3"];
        UIImageView *imageV4 = [[UIImageView alloc] initWithImage:image4];
        imageV4.frame = CGRectMake(0, 0, image4.size.width, image4.size.height);
        
        
        
        
        //将图片添加到数组，在给cell赋值是调用
        [muArr addObject:imageV1];
        [muArr addObject:imageV2];
        [muArr addObject:imageV3];
        [muArr addObject:imageV4];
        
        _imageArray = muArr;
    }
    return _imageArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageV = self.imageArray[self.indexPath];
    
    
    [self.view addSubview:imageV];
    
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
