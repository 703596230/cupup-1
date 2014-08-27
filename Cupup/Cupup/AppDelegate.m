//
//  AppDelegate.m
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    UINavigationController * recommend = [[UINavigationController alloc]initWithRootViewController:[[RecommendViewController alloc]init] ];
    
    UINavigationController * classify = [[UINavigationController alloc]initWithRootViewController: [[ClassifyViewController alloc]init]];
    
    UINavigationController * find = [[UINavigationController alloc]initWithRootViewController:[[FindViewController alloc]init] ];
    
    UINavigationController * cart = [[UINavigationController alloc]initWithRootViewController: [[CartViewController alloc]init]];
    
    UINavigationController * user = [[UINavigationController alloc]initWithRootViewController: [[UserViewController alloc]init]];
    
    UITabBarController * tabbar = [[UITabBarController alloc]init];
    
    tabbar.viewControllers = [NSArray arrayWithObjects:recommend,classify,find,cart,user, nil];
    
    UITabBarItem * tabbarItem0 = [tabbar.tabBar.items objectAtIndex:0];
    tabbarItem0.title = @"推荐";
    
    UITabBarItem * tabbarItem1 = [tabbar.tabBar.items objectAtIndex:1];
    tabbarItem1.title = @"分类";
    
    UITabBarItem * tabbarItem2 = [tabbar.tabBar.items objectAtIndex:2];
    tabbarItem2.title = @"发现";
    
    UITabBarItem * tabbarItem3 = [tabbar.tabBar.items objectAtIndex:3];
    tabbarItem3.title = @"购物车";
    
    UITabBarItem * tabbarItem4 = [tabbar.tabBar.items objectAtIndex:4];
    tabbarItem4.title = @"我的";
    
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    return YES;
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
