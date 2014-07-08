//
//  AppDelegate.m
//  UILiveTilesExamples
//
//  Created by Victor Ilisei on 4/14/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.main = [[MainViewController alloc] init];
    
    self.window.rootViewController = self.main;
    [self.window makeKeyAndVisible];
    return YES;
}

@end