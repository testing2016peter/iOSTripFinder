//
//  AppDelegate.m
//  tripFinder
//
//  Created by Anson Ng on 3/13/16.
//  Copyright © 2016 Anson Ng. All rights reserved.
//

#import "AppDelegate.h"
#import "APSignInViewController.h"
#import "Flurry.h"
#import "APTrackUtil.h"
#import "APSearchListViewController.h"
#import "APTabbarViewController.h"
#import "UIImage+APResize.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [APTrackUtil startSession];
    [self launchMainFlow];
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

- (void)launchMainFlow
{
    // Shifting tab bar item image's position.
    UIEdgeInsets tabBarImageEdgeInsets = UIEdgeInsetsMake(6.0f, 0.0f, -6.0f, 0.0f);
    // Generating main window for Auction project.
    UIScreen *screen = [UIScreen mainScreen];
    self.window = [[UIWindow alloc] initWithFrame:screen.bounds];
    self.window.screen = screen;
    
    // Implement UITabBarController.
    self.tabBarController = [[APTabbarViewController alloc] init];

    //blur

    UITabBar *tabBar = self.tabBarController.tabBar;

    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    [[UITabBar appearance] setShadowImage:[UIImage new]];

    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, tabBar.bounds.size.height)];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    [blurView setEffect:blurEffect];

    UIView *maskView = [[UIView alloc] initWithFrame:blurView.frame];
    maskView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [blurView addSubview:maskView];
    
    [tabBar insertSubview:blurView atIndex:0];


    //1.search
    APSearchListViewController *apSearchListViewController = [[APSearchListViewController alloc] init];

    apSearchListViewController.tabBarItem.image = [UIImage imageNamed:@"Icon-Activity-Feed-Filled"];
    apSearchListViewController.tabBarItem.imageInsets = tabBarImageEdgeInsets;

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:apSearchListViewController];
    [self.tabBarController addChildViewController:navigationController];

    //2.search

    APSearchListViewController *apSearchListViewController2 = [[APSearchListViewController alloc] init];
    apSearchListViewController2.tabBarItem.image = [UIImage imageNamed:@"Icon-Activity-Feed-Filled"];
    apSearchListViewController2.tabBarItem.imageInsets = tabBarImageEdgeInsets;

    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:apSearchListViewController2];
    [self.tabBarController addChildViewController:navigationController2];
    self.tabBarController.tabBar.translucent = YES;
    //
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];

}

@end
