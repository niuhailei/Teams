//
//  AppDelegate.m
//  team
//
//  Created by lanou3g on 15/11/9.
//  Copyright © 2015年 钮海雷. All rights reserved.
//

#import "AppDelegate.h"
#import "CalendarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //通知的注册
    /*
     //通知的注册，按钮的添加
     UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc]init];
     action1.identifier = @"aaa";
     action1.title = @"确定";
     action1.activationMode = UIUserNotificationActivationModeForeground;//当点击的时候启动程序
     action1.authenticationRequired = YES;
     action1.destructive = YES;
     
     UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc]init];
     action2.identifier = @"bbb";
     action2.title = @"取消";
     action2.activationMode = UIUserNotificationActivationModeBackground;
     
     UIMutableUserNotificationCategory *categorys = [[UIMutableUserNotificationCategory alloc]init];
     categorys.identifier = @"ccc";//这组动作的唯一标示
     [categorys setActions:@[action1,action2] forContext:UIUserNotificationActionContextMinimal];
     
     UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:[NSSet setWithObjects:categorys, nil]];
     [[UIApplication sharedApplication] registerForRemoteNotifications];
     [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
     */
    
    
<<<<<<< HEAD
   self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *rootNC = [[UINavigationController alloc]initWithRootViewController:[ListTableViewController new]];
    self.window.rootViewController = rootNC;
    
=======
>>>>>>> cb3933924a0d0d308951f1a4afeab9ae801f3678
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]){
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//        
//        InfoViewController *infoVC = [[InfoViewController alloc] init];
//        
//        self.window.rootViewController = infoVC;
//        
//        NSLog(@"第一次启动");
//    }else {
//        
//       NSLog(@"已经不是第一次启动了");
//        
//        MainNavigationViewController *mainNavigationController = [[UIStoryboard storyboardWithName:@"NIU" bundle:nil] instantiateViewControllerWithIdentifier:@"mainNavigation"];
//        
//        
//        self.window.rootViewController = mainNavigationController;
//        
//        
<<<<<<< HEAD
    
        
        
        
// }
=======
//        
//        
//        
//        
//    }
>>>>>>> cb3933924a0d0d308951f1a4afeab9ae801f3678

    
    
    
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
