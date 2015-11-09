//
//  WriteDiaryViewController.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "WriteDiaryViewController.h"


#define WIDTH ([UIScreen mainScreen].bounds.size.width-15)/2
CGFloat const kImageCount = 16;

static NSString *identifier = @"collectionView";


@interface WriteDiaryViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collecttionView;


//存放图片的数组
@property(nonatomic,strong)NSArray *imageArray;


@end

@implementation WriteDiaryViewController


-(NSArray *)imageArray{
    if (!_imageArray) {
        NSMutableArray *muArr = [NSMutableArray new];
        
        //设置imageView的宽高适应图片宽高
        UIImage *image1 = [UIImage imageNamed:@"jian.jpg"];
        UIImageView *imageV1 = [[UIImageView alloc] initWithImage:image1];
        imageV1.frame = CGRectMake(0, 0, image1.size.width,image1.size.height);
        
        UIImage *image2 = [UIImage imageNamed:@"jian3.jpg"];
        UIImageView *imageV2 = [[UIImageView alloc] initWithImage:image2];
        imageV2.frame = CGRectMake(0, 0, image2.size.width,image2.size.height);
        
        
        UIImage *image3 = [UIImage imageNamed:@"jiang4.jpg"];
        UIImageView *imageV3 = [[UIImageView alloc] initWithImage:image3];
        imageV3.frame = CGRectMake(0, 0, image3.size.width, image3.size.height);
        
        UIImage *image4 = [UIImage imageNamed:@"tu.jpg"];
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
   
    //初始化collertionView
    WaterFallFlowLayout *flowLayout = [[WaterFallFlowLayout alloc] init];
    self.collecttionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 69, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout]; //69是因为有navigation的高度
    
    
    //设置self.collecttionView的背景色
    self.collecttionView.backgroundColor = [UIColor magentaColor];
    
    
    [self.view addSubview:self.collecttionView];
    
    
    //设置代理并且遵循代理协议
    self.collecttionView.delegate = self;
    self.collecttionView.dataSource = self;
    
    //注册cell
    [self.collecttionView registerClass:[WaterFallUICollectionViewCell class] forCellWithReuseIdentifier:identifier];
    
    
    
    
}

//设置cell的数量
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}


//cell的内容
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WaterFallUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    cell.viewColorful = self.imageArray[indexPath.row];
    cell.viewColorful.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
    //cell.backgroundColor = [UIColor redColor];
    
    return cell;

}


//cell的点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //根据indexPath获取cell
    WaterFallUICollectionViewCell *cell = (WaterFallUICollectionViewCell *)[self.collecttionView cellForItemAtIndexPath:indexPath];
    
    //跳转到编辑界面  并且传入indexPath.row的值
    WriteViewController *writeVC = [[WriteViewController alloc] init];
    writeVC.indexPath = indexPath.row;
    [self.navigationController showViewController:writeVC sender:nil];
    
    
    
    
}



#pragma mark - 计算图片高度
-(float)imageHeight:(float)height width:(float)width{
    /*
     高度/宽度 = 压缩后高度/压缩后宽度
     */
    float newHeight = height/width*(WIDTH);
    return newHeight;
    
    
}

#pragma mark - cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    UIImageView *view = [self.imageArray objectAtIndex:indexPath.row];
    float height = [self imageHeight:view.frame.size.height width:view.frame.size.width];
    return CGSizeMake(WIDTH, height);
}

#pragma mark - 边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets edgeInsets = {5,5,5,5};
    return edgeInsets;
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
