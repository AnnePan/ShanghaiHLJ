//
//  PJAppDelegate.m
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-1.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJAppDelegate.h"
#import "PJFirstPageVc.h"
#import "PJOrdersVc.h"
#import "PJMineVc.h"

@implementation PJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self _initSubViewController];
    return YES;
}

- (void)_initSubViewController
{
    PJFirstPageVc *homeView = [[PJFirstPageVc alloc] init];
    PJOrdersVc *orderView = [[PJOrdersVc alloc] init];
    PJMineVc *mineView = [[PJMineVc alloc] init];
    
    NSArray *itemArr = @[@{@"view":homeView,@"image":@"home_tab_home",@"title":@"首页"},
                         @{@"view":orderView,@"image":@"home_tab_contact",@"title":@"订单"},
                         @{@"view":mineView,@"image":@"home_tab_profile",@"title":@"我的"}];
    NSMutableArray *itemNvcArr = [NSMutableArray arrayWithCapacity:4];
    
    for (int i = 0; i < itemArr.count; i++) {
        UINavigationController *itemNvc = [[UINavigationController alloc] initWithRootViewController:itemArr[i][@"view"]];
        itemNvc.tabBarItem.image = [UIImage imageNamed:itemArr[i][@"image"]];
        itemNvc.tabBarItem.title = itemArr[i][@"title"];
        [itemNvcArr addObject:itemNvc];
    }
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = itemNvcArr;
    tabBarController.tabBar.tintColor = [UIColor orangeColor];
    self.window.rootViewController = tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
