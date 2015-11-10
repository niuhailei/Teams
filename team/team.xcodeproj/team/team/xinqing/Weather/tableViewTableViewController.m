//
//  tableViewTableViewController.m
//  Weather
//
//  Created by lanou3g on 15/11/7.
//  Copyright © 2015年 YC. All rights reserved.
//

#import "tableViewTableViewController.h"
#import "Weather.h"
#import "DataHelper.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <MapKit/MapKit.h>

@interface tableViewTableViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
@property (nonatomic,strong)NSMutableDictionary *Dict;
@property (nonatomic,strong)NSMutableArray *allArray;
@property (nonatomic,strong)NSMutableArray *array;
//map
@property (nonatomic,strong)MKMapView *mapView;
//Location
@property (nonatomic,strong)CLLocation *userLocation;
//manager
@property (nonatomic,strong)CLLocationManager *manger;

//key
@property (nonatomic,strong)NSString *StrCity;
@property (nonatomic,strong)NSString *StrProvinces;
@end

@implementation tableViewTableViewController
+ (instancetype)sharetableViewVC
{
    static tableViewTableViewController *tableVC = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tableVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"tableViewTable"];
        
    });
    return tableVC;
    
}

static NSString *const cellFirstID = @"FirstCell";
static NSString *const cellSecondID = @"SecondCell";
static NSString *const cellFourID = @"FourCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FirstCell" bundle:nil] forCellReuseIdentifier:cellFirstID];
    [self.tableView registerNib:[UINib nibWithNibName:@"SecondCell" bundle:nil] forCellReuseIdentifier:cellSecondID];
    [self.tableView registerNib:[UINib nibWithNibName:@"FourCell" bundle:nil] forCellReuseIdentifier:cellFourID];
    
    
    //判断系统
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        //获取当前设备
        self.manger = [CLLocationManager new];
        
        //允许定位
        [self.manger requestWhenInUseAuthorization];
        //        [self.manger requestAlwaysAuthorization];
        //设置用户跟随模式(一直跟踪)
        
        [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    }
    
    //设置代理
    self.mapView.delegate = self;
    self.manger.delegate = self;
    
    //距离筛选,设置最小位置更新
    self.manger.desiredAccuracy = 1000;
    //开始定位
    [self.manger startUpdatingLocation];
    
    
    self.tableView.bounces = NO;

    
}

- (void)CityID
{
  
    [[DataHelper shareWithDataHelper] allCityID];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self CityID];
   
//    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, Height * 2.6)];
//
//    
//    UIImage *image =[UIImage imageNamed:@"weather.jpg"];
//    
//    [view setImage:image];
//    
//    [self.tableView.superview insertSubview:view atIndex:0];
   
    
    
//    [self loadData];
}


- (void)loadData
{
    
   NSLog(@"allKeys : %@",[[DataHelper shareWithDataHelper] allKeys]);
    
    NSString *httpUrl = @"http://apis.baidu.com/apistore/weatherservice/recentweathers";
    
    NSString *str1 = @"区";
    NSString *str2 = @"县";
    NSString *str3 = @"市";
    NSString *str4 = @"省";

    NSString *strCit1 = [self.StrCity stringByReplacingOccurrencesOfString:str3 withString:@""];
    NSString *strPro1 = [self.StrProvinces stringByReplacingOccurrencesOfString:str1 withString:@""];
    
    
    //大城市最终名称
    NSString *strCit2 = [strCit1 stringByReplacingOccurrencesOfString:str4 withString:@""];
    //小城市最终名称
    NSString *strPro2 = [strPro1 stringByReplacingOccurrencesOfString:str2 withString:@""];
    
   NSArray *arrayPro = [[DataHelper shareWithDataHelper] getObjectWithKey:strCit2];
    
    //城市编码
    NSString *StringCityID = @"";
    
    for (Weather *weather in arrayPro) {
        
        NSLog(@"11%@",weather.provinces);
        
        if ([weather.provinces rangeOfString:strPro2].length != 0) {
          NSLog(@"22%@",weather.provinces);
            //获取城市编码
            StringCityID = weather.coding;
            
        }
    }
    
    NSLog(@"%@",StringCityID);
    NSLog(@"%@",strPro2);
    NSLog(@"%@",strCit2);
    
   
    
    
    NSString *Str = strPro2;
    
//    NSString *nameID = @"";
//    NSString *nameCity = @"";
//    if ([StringCityID isEqualToString:@""] || StringCityID == nil) {
//        
//        nameID = @"101010200";
//        nameCity = @"海淀";
//        
//    }else
//    {
//        nameID = StringCityID;
//        nameCity = [Str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    }
//    

    NSString * nameID = StringCityID;
    NSString * nameCity = [Str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];


    
    
    NSString *httpArg = [NSString stringWithFormat:@"cityname=%@&cityid=%@",nameCity,nameID];
    NSLog(@"%@",httpArg);
    
    
    [[DataHelper shareWithDataHelper] request:httpUrl withHttpArg:httpArg block:^{
        
        [self.tableView reloadData];
        
    }];
    
}


- (NSMutableDictionary *)Dict
{
    if (!_Dict) {
        self.Dict = [NSMutableDictionary dictionary];
    }
    return _Dict;
}
- (NSMutableArray *)allArray
{
    if (!_allArray)
    {
        self.allArray = [NSMutableArray array];
        
    }
    return _allArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    
//    if (!cell) {
//        
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    
////   
//    self.Dict = [[DataHelper shareWithDataHelper] allDictionary];
//
////    NSLog(@"sssssssssssssssssssss%@",self.Dict);
//    
//    NSArray *Array = [self.Dict objectForKey:@"City"];
//    
//    Weather *weather = Array[indexPath.row];
//    
//    NSLog(@"allKeys : %@",[[DataHelper shareWithDataHelper] allKeys]);
//    
//    NSLog(@"222222222222222222%@,%@",weather.city,weather.cityid);
    
    
    if (indexPath.row == 0) {
        FirstCell *cell = [tableView dequeueReusableCellWithIdentifier:cellFirstID forIndexPath:indexPath];
        
       NSArray *array = [[DataHelper shareWithDataHelper]getObjectWithKey:@"Today"];
        
        NSArray *array2 = [[DataHelper shareWithDataHelper] getObjectWithKey:@"Name"];
       
        
        
        Weather *weather = array[0];
        
        for (Weather *weather in array2) {
            
            if ([weather.code isEqualToString:@"xc"]) {
                
                cell.StrXC = weather.index;
            }
        }
        cell.weather =weather;
        return cell;

    }
    else if (indexPath.row == 1)
    {
        SecondCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellSecondID forIndexPath:indexPath];
        
        //历史两天
        NSArray *arrayHistory = [[DataHelper shareWithDataHelper] getObjectWithKey:@"History"];
        for (int i = 0; i < 2; i ++) {
            if (i == 0) {
                Weather *weather = arrayHistory[i];
                cell1.weather0 = weather;
                NSLog(@"%@",weather.date);
            }
            if (i == 1) {
                Weather *weather = arrayHistory[i];
                cell1.weather1 = weather;
                NSLog(@"%@",weather.date);
            }
        }
        
        
        //未来4天
        NSArray *arrayForeCast = [[DataHelper shareWithDataHelper] getObjectWithKey:@"Forecast"];
        
        for (int i = 0; i < 4; i ++) {
            
            if (i == 0) {
                Weather *weater = arrayForeCast[i];
                cell1.weather2 = weater;
                NSLog(@"1%@",weater.date);
            }else if (i == 1)
            {
                Weather *weater = arrayForeCast[i];
                cell1.weather3 = weater;
                NSLog(@"2%@",weater.date);
            }else if (i == 2)
            {
                Weather *weater = arrayForeCast[i];
                cell1.weather4 = weater;
                NSLog(@"3%@",weater.date);
            }else if (i == 3)
            {
                Weather *weater = arrayForeCast[i];
                cell1.weather5 = weater;
                NSLog(@"4%@",weater.date);
            }
            
        }
        return cell1;
    }
    else
    {
        
        FourCell *cell = [tableView dequeueReusableCellWithIdentifier:cellFourID forIndexPath:indexPath];
        NSArray *array = [[DataHelper shareWithDataHelper] getObjectWithKey:@"Name"];
        
        for (int i = 0; i < 6; i ++ ) {
            
            if ( i == 0) {
              Weather *weather =  array[i];
                cell.weather0 = weather;
                
            }else if (i == 1)
            {
                Weather *weather =  array[i];
                cell.weather1 = weather;
                
            }else if ( i == 2)
            {
                Weather *weather =  array[i];
                cell.weather2 = weather;
                
            }else if (i == 3)
            {
                Weather *weather =  array[i];
                cell.weather3 = weather;
                
            }else if (i == 4)
            {
                Weather *weather =  array[i];
                cell.weather4 = weather;
            }else
            {
                Weather *weather =  array[i];
                cell.weather5 = weather;
                
            }
         
        }
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
     
        return Height;
        
        
    }else if (indexPath.row == 1)
    {
        return Height * 0.3;
    }else
    {
        
        return Height *1.3;
    }
}




#pragma mark -位置发生了改变

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    NSLog(@"location == %@",locations[0]);
    //获取第一个元素
    CLLocation *location = locations.firstObject;
    
    //1.获取经纬度
    //    CLLocation *location = [locations lastObject];
    
    //维度
    CLLocationDegrees latitude = location.coordinate.latitude;
    
    //精度
    CLLocationDegrees longitude = location.coordinate.longitude;
    
    _userLocation = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
    
    // 打印经纬度信息
    NSLog(@"经度  == %f 纬度 ==  %f", location.coordinate.latitude, location.coordinate.longitude);
    [self geographicNi];
  
}



- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorLocationUnknown) {
        
        NSLog(@"无法获得位置信息");
        
    }
    
    if ([error code] == kCLErrorDenied) {
        
        NSLog(@"访问被拒绝");
        
    }
}

//地理逆编码
- (void)geographicNi
{
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:_userLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
     {
         
         if (!error)
         {
             CLPlacemark *mark = placemarks[0];
             
             NSLog(@"xxxxxxxxxxx%@",mark.addressDictionary);
             
//             NSString *Str = [mark.addressDictionary objectForKey:@"name"];
             NSString *city = [mark.addressDictionary objectForKey:@"City"];
             
             NSString *subLocality = [mark.addressDictionary objectForKey:@"SubLocality"];
             
             NSLog(@"%@,%@",city,subLocality);

             self.StrCity = city;
             self.StrProvinces = subLocality;
             
              [self loadData];
         }
         NSLog(@"编码完成");
     }];
    
}



//地理编码
- (void)geographic{
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    NSString *Str = @"碧云寺路";
    [geocoder geocodeAddressString:Str completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        
        CLPlacemark *placemake = placemarks.firstObject;
        NSLog(@"%@",placemake.addressDictionary);
        
        NSLog(@"%@",placemake.location);
        
//        CLLocationCoordinate2D secondCoor = CLLocationCoordinate2DMake( placemake.location.coordinate.longitude,placemake.location.coordinate.latitude);
//        
        
//        MyAnnotation *myAnnotation = [[MyAnnotation alloc] initWithTitle:@"金五星商厦" subTitle:@"四层研发11" coordinate:secondCoor];
//        
//        [self.mapView addAnnotation:myAnnotation];
    }];
    
}














/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
