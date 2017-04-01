//
//  AppDelegate.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "AppDelegate.h"
#import "TSDNavigationVC.h"
#import "TSDTabBarController.h"
#import "TSDOneViewController.h"
#import "TSDTwoViewController.h"
#import "TSDTabBar.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)showMainView {
    TSDOneViewController *oneVC = [[TSDOneViewController alloc] init];
    TSDNavigationVC *oneNav = [[TSDNavigationVC alloc] initWithRootViewController:oneVC];
    oneVC.hidesBottomBarWhenPushed = NO;
    
    TSDTwoViewController *twoVC = [[TSDTwoViewController alloc] init];
    TSDNavigationVC *twoNav = [[TSDNavigationVC alloc] initWithRootViewController:twoVC];
    twoVC.hidesBottomBarWhenPushed = NO;
    
    TSDTabBarController *tabVC = [[TSDTabBarController alloc] init];
    tabVC.viewControllers = @[oneNav,twoNav];
    
    TSDTabBar* tabBar = [TSDTabBar mTabBar];
    tabBar.isItemAnimition = YES;
    [tabBar setSelectedItemIcon:@[@"home1",@"user1"] unselectedItemIcon:@[@"home0",@"user0"] titles:@[@"首页",@"个人"]];
    tabVC.m_tabBar = tabBar;
    
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self showMainView];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
