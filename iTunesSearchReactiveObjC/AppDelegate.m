//
//  AppDelegate.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesConstants.h"
#import "iTunesSearchViewController.h"
#import "iTunesSearchViewModel.h"
#import "NavigationService.h"

#import "AppDelegate.h"
#import <UIKit/UIKit.h>

@interface AppDelegate ()

@property(strong, nonatomic) UINavigationController *navigationController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.navigationController = [UINavigationController new];
    [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    
    NavigationService *navigationService = [[NavigationService alloc] initWithNavigationController:self.navigationController];
    iTunesSearchViewModel *viewModel = [[iTunesSearchViewModel alloc] initWithNavigationService:navigationService];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:mainStoryboardName bundle:nil];
    iTunesSearchViewController *nextViewController = [storyBoard instantiateViewControllerWithIdentifier:@"iTunesSearchViewController"];
    [self.navigationController pushViewController:nextViewController animated:NO];
    nextViewController.searchViewModel = viewModel;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:self.navigationController];
    [self.window makeKeyAndVisible];
    
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
