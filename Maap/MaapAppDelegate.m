//
//  MaapAppDelegate.m
//  Maap
//
//  Created by Joe McCarthy on 5/29/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import "MaapAppDelegate.h"

#import "MaapFirstViewController.h"

#import "MaapSecondViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@implementation MaapAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    UIViewController *viewController1, *viewController2;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController1 = [[MaapFirstViewController alloc] initWithNibName:@"MaapFirstViewController_iPhone" bundle:nil];
        viewController2 = [[MaapSecondViewController alloc] initWithNibName:@"MaapSecondViewController_iPhone" bundle:nil];
    } else {
        viewController1 = [[MaapFirstViewController alloc] initWithNibName:@"MaapFirstViewController_iPad" bundle:nil];
        viewController2 = [[MaapSecondViewController alloc] initWithNibName:@"MaapSecondViewController_iPad" bundle:nil];
    }
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[viewController1, viewController2];
    self.window.rootViewController = self.tabBarController;
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.window.rootViewController];
    
    // Google Maps
    // TODO make configurable
    [GMSServices provideAPIKey:@"AIzaSyCcJQTGZD_qUPxkC6plSrPeNh-fRTxEKXY"];
    
    // We don't want the bar to show
    self.navigationController.navigationBarHidden = true;
    [self.window addSubview:self.navigationController.view];

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

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
