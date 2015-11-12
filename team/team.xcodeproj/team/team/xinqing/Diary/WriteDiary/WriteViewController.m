//
//  WriteViewController.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "WriteViewController.h"
#import "ViewImg1.h"
@interface WriteViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate,UIGestureRecognizerDelegate>

//存放模板的数组
//@property(nonatomic,strong)NSArray *imageArray;

@property (nonatomic,strong)ViewImg1 *ViewImg1;
@property (nonatomic,strong)UIImagePickerController *imagePicker;
@property (nonatomic,assign)NSInteger flag;
@property (nonatomic,strong)NSMutableArray *allImgArray;

//用于接收textView的frame
@property (nonatomic,assign)CGRect frameTextView;

@end

@implementation WriteViewController

//-(NSArray *)imageArray{
//    if (!_imageArray) {
//        NSMutableArray *muArr = [NSMutableArray new];
//        
//        //设置imageView的宽高适应图片宽高
//        UIImage *image1 = [UIImage imageNamed:@"jian.jpg"];
//        
//        UIImageView *imageV1 = [[UIImageView alloc] initWithImage:image1];
//        imageV1.frame = CGRectMake(0, 69, Width,image1.size.height * (Width/image1.size.width));
//        
//        //        imageV1.frame = Bounds;
//        
//        
//        UIImage *image2 = [UIImage imageNamed:@"tui1"];
//        UIImageView *imageV2 = [[UIImageView alloc] initWithImage:image2];
//        //        imageV2.frame = CGRectMake(0, 0, image2.size.width,image2.size.height);
//        imageV2.frame = CGRectMake(0, 69, Width,image2.size.height * (Width/image1.size.width));
//        
//        
//        //        imageV2.frame = Bounds;
//        
//        
//        UIImage *image3 = [UIImage imageNamed:@"t3"];
//        UIImageView *imageV3 = [[UIImageView alloc] initWithImage:image3];
//        //        imageV3.frame = CGRectMake(0, 0, image3.size.width, image3.size.height);
//        imageV3.frame = CGRectMake(0, 69, Width, image3.size.height * (Width/image1.size.width));
//        
//        //        imageV3.frame = Bounds;
//        
//        
//        
//        UIImage *image4 = [UIImage imageNamed:@"tu3"];
//        UIImageView *imageV4 = [[UIImageView alloc] initWithImage:image4];
//        //        imageV4.frame = CGRectMake(0, 0, image4.size.width, image4.size.height);
//        imageV4.frame = CGRectMake(0, 69, Width, image4.size.height * (Width/image1.size.width));
//        
//        //        imageV4.frame = Bounds;
//        
//        
//        //将图片添加到数组，在给cell赋值是调用
//        [muArr addObject:imageV1];
//        [muArr addObject:imageV2];
//        [muArr addObject:imageV3];
//        [muArr addObject:imageV4];
//        
//        _imageArray = muArr;
//    }
//    return _imageArray;
//}
//

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
    
    if (self.indexPath == 0) {
        //对模型1的控制
        [self loadViewImg1];
        
          self.frameTextView = self.ViewImg1.textView.frame;
        
        UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tgrAction:)];

        [self.view addGestureRecognizer:tgr];
        
    }
 
}

//轻怕手势
- (void)tgrAction:(UIGestureRecognizer *)sender
{
    [self.ViewImg1.textView resignFirstResponder];
    
    CGPoint point = CGPointMake(0, 0);
    
    [self.ViewImg1.scrollViewMain setContentOffset:point animated:YES];
    
}


//textViewDelegate
//开始编辑
- (void)textViewDidBeginEditing:(UITextView *)textView
{

    //为了避免输入的时候看不到字,让textView上移
    CGRect frame = textView.frame;
    //键盘高度216;
    
    //text文字的高度
    CGFloat height = [self getTextViewTextHeight:nil];
    
    UIImage *image = [UIImage imageNamed:@"jian.jpg"];
    
    //判断除去NavagationBar+电量条的高度 = 69;并且出去textView文字高度
    //
    //          ________
     //     69  _|______|
    //           |      |
    //           |__    |
    //  文字高度 _|_ |   |
    //         __|__|   |___Screen
    //           |______|
    
    if (Height - ((self.ViewImg1.textView.frame.origin.y + textView.frame.size.height + 64)) <= 216) {
        
//        CGFloat offset = (Height - ((self.ViewImg1.textView.frame.origin.y + textView.frame.size.height))) - 216 + 69;

        //将试图的Y坐标向上移动offset个单位,以便下面腾出地方用于软键盘的显示
        
//        self.ViewImg1.scrollViewMain.frame = CGRectMake(0, 0, Width, height - offset);

        
        //ScrollView高度缩减一个键盘的高度
//        self.ViewImg1.scrollViewMain.frame = CGRectMake(0, 0, Width, self.ViewImg1.frame.size.height -216);
        
        //偏移到键盘的地方在减去NavagationBar的高度+电量条的高度
        CGPoint point = CGPointMake(0, self.ViewImg1.textView.frame.origin.y - 64);
        
        [self.ViewImg1.scrollViewMain setContentOffset:point animated:YES];
//        self.ViewImg1.scrollViewMain.contentSize =  CGSizeMake(Width, [UIScreen mainScreen].bounds.size.height + offset);
        
        
        [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
        
        [UIView setAnimationDuration:0.30f];//动画持续时间
             [UIView commitAnimations];
    }
    
    if ([self.ViewImg1.textView.text isEqualToString:@"人一生有起有落，起的时候不忘落的时候，落的时候想想起的时候，哪里跌倒，哪里站起。\n相信有自信的生命与没自信的生命会有不一样的天地"]) {
        
        self.ViewImg1.textView.text = @"";
         self.ViewImg1.textView.textColor = [UIColor blackColor];
        self.ViewImg1.textView.backgroundColor = [UIColor whiteColor];
        self.ViewImg1.textView.textAlignment = NSTextAlignmentLeft;
       
        
    }
}

- (CGFloat)getTextViewTextHeight:(ViewImg1 *)height
{
    //    1.设置计算文字所在的最大范围
    CGSize maxSize = CGSizeMake(self.frameTextView.size.width, 1000);
    //    2.创建字典,包含字体大小
    NSDictionary *dictionary = @{
                                 NSFontAttributeName:self.ViewImg1.textView.font
                                 
                                 };
    
    //    3.使用方法,计算文字的frame
    CGRect frame = [self.ViewImg1.textView.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dictionary context:nil];
    
    //由于textView有固定高度,且textView里自带自适应高度,为了避免文字过多而出现误差So
    if (self.ViewImg1.textView.frame.size.height <= frame.size.height) {
        
        //    4.返回frame中的高度值
        return self.ViewImg1.textView.frame.size.height;
        
    }else
    {
        //    4.返回frame中的高度值
        return frame.size.height;
    }

}


//结束编辑
- (void)textViewDidEndEditing:(UITextView *)textView
{
//    //text文字的高度
//    CGFloat height = [self getTextViewTextHeight:nil];
//    
//    CGFloat offset = ([UIScreen mainScreen].bounds.size.height - ((self.ViewImg1.textView.frame.origin.y + textView.frame.size.height))) - 216 + 45;
//    
//    //将试图的Y坐标向上移动offset个单位,以便下面腾出地方用于软键盘的显示
//    self.ViewImg1.scrollViewMain.frame = CGRectMake(0, 0, Width, Height);
////    
//    CGPoint point = CGPointMake(0, -self.ViewImg1.textView.frame.origin.y - 69);
//    
//    [self.ViewImg1.scrollViewMain setContentOffset: point animated:YES];

    //ScrollView高度缩减一个键盘的高度
//    self.ViewImg1.scrollViewMain.frame = CGRectMake(0, 0, Width, self.ViewImg1.frame.size.height + 216);


    
    //偏移到键盘的地方在减去NavagationBar的高度+电量条的高度
    CGPoint point = CGPointMake(0, self.ViewImg1.textView.frame.origin.y - 64 );
    
    [self.ViewImg1.scrollViewMain setContentOffset:point animated:YES];

    
    
    
    self.ViewImg1.frame = self.frameTextView;
    
    if (textView.text) {
        
        textView.textColor = [UIColor grayColor];
        textView.backgroundColor = [UIColor whiteColor];
        [textView resignFirstResponder];
        
        
    }
}

//对模型1的控制
- (void)loadViewImg1
{
    //UIControl 的相应事件
    [self.ViewImg1.control1 addTarget:self action:@selector(addPic:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.control2 addTarget:self action:@selector(addPic:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.control3 addTarget:self action:@selector(addPic:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.control4 addTarget:self action:@selector(addPic:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.control5 addTarget:self action:@selector(addPic:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.control6 addTarget:self action:@selector(addPic:) forControlEvents:UIControlEventTouchUpInside];
    
    //imageView1 的响应事件
    [self.ViewImg1.imagView1 addTarget:self action:@selector(changeImageHiddenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.imagView2 addTarget:self action:@selector(changeImageHiddenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.imagView3 addTarget:self action:@selector(changeImageHiddenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.imagView4 addTarget:self action:@selector(changeImageHiddenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.imagView5 addTarget:self action:@selector(changeImageHiddenAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.ViewImg1.imagView6 addTarget:self action:@selector(changeImageHiddenAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //对textView的控制
    self.ViewImg1.textView.delegate = self;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction:)];
    
}

//保存相册
- (void)saveAction:(UINavigationBar *)sender
{
    NSInteger count = 0;
    [self.ViewImg1.textView resignFirstResponder];
    
    if (![self.allImgArray containsObject:@"1"]) {
        
        count ++;
        [self save:count];
        
    }else
    {
    
        [self save:count];
        
    }
}


//选择跳转相册还是访问相机
- (void)addPic:(UIControl *)sender
{
    
    sender.hidden = YES;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Please" message:@"选择图片来源" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
      //    访问相册
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"访问相册" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        sender.hidden = YES;
        
        //    访问相册
//        UIImagePickerController *pic = [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:self.imagePicker animated:YES completion:^{
            
            
            self.flag = sender.tag;
        }];
        
    }];
    
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"访问相机" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable: UIImagePickerControllerCameraDeviceRear];
        if(!isCamera) {
            return;
        }
//        UIImagePickerController *pic = [[UIImagePickerController alloc] init];
        // 摄像头
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        // 允许编辑
        self.imagePicker.allowsEditing = YES;
        
        [self presentViewController: self.imagePicker animated: YES completion:^{
            self.flag = sender.tag;
        }];
    }];
    
    UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    [alertController addAction:alertAction1];
    [alertController addAction:alertAction2];
    [alertController addAction:alertAction3];
    [self presentViewController:alertController animated:YES completion:^{
        
        
    }];
}

#pragma mark 对模型1 的控制
- (void)changeImageHiddenAction:(UIImageView *)sender
{
    
    UILabel *label = (UILabel *)[self.ViewImg1 viewWithTag:sender.tag - 90];
    
    [label setText:@"更换图片"];
    
    UIControl *control = (UIControl *)[self.ViewImg1 viewWithTag:(sender.tag - 100)];
    control.hidden = NO;
}

#pragma mark 懒加载imagePicker
- (UIImagePickerController *)imagePicker
{
    if(!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
    }
    
    return _imagePicker;
}

- (NSMutableArray *)allImgArray
{
    if (!_allImgArray) {
        
        self.allImgArray = [[NSMutableArray alloc] initWithObjects:@"1",@"1",@"1",@"1",@"1",@"1", nil];
        
    }
    return _allImgArray;
}



//相册回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImageView *viewImg = [[UIImageView alloc]init];
    
        viewImg.image = info[UIImagePickerControllerOriginalImage];
        
        NSData *DataImage = UIImageJPEGRepresentation(viewImg.image, 1);

    NSInteger index = self.flag - 1;
        [self.allImgArray replaceObjectAtIndex:index withObject:DataImage];
    
    NSData *data = self.allImgArray[index];
    UIImage *image = [UIImage imageWithData:data];
    
    //根据tag值获取imageView
    UIImageView *imageView = (UIImageView *)[self.ViewImg1 viewWithTag:self.flag + 100];
    imageView.image = image;
    
    
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}



- (void)save:(NSInteger)sender
{
    
    
    //保存成功
    if (sender == 1) {
        
        [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(timeAction1:) userInfo:nil repeats:NO];
    }else
    {
        //保存失败
        [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(timeAction:) userInfo:nil repeats:NO];
        
    }
    
    
    
}

//保存失败
- (void)timeAction:(NSTimer *)sender
{
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存失败" message:@"有空位置哦?" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertController animated:YES completion:^{
            
        }];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
             [self dismissViewControllerAnimated:YES completion:nil];
            
        });
        
    });
}

//保存成功
- (void)timeAction1:(NSTimer *)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存成功" message:@"请在你的日记本里查看哦!" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alertController animated:YES completion:^{
            
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        });
        
    });
}






@end
