//
//  AppDelegate.m
//  SSHUDViewBug
//
//  Created by Henrik Hodne on 11/7/12.
//  Copyright (c) 2012 Henrik Hodne. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	RootViewController *viewController = [[RootViewController alloc] initWithNibName:nil bundle:nil];
	viewController.view.frame = self.window.bounds;
	self.window.rootViewController = viewController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
