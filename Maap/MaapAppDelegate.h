//
//  MaapAppDelegate.h
//  Maap
//
//  Created by Joe McCarthy on 5/29/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaapAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
