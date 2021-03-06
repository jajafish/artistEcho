//
//  JFAppDelegate.m
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFAppDelegate.h"
#import "JFJamsContainerViewController.h"
#import "JFLoginWithSCVC.h"
#import <Parse/Parse.h>
#import "JFMusician.h"
#import "JFAddJamWhereVC.h"
#import "JFJamSession.h"
#import "JFChoosePathVC.h"

@implementation JFAppDelegate

+ (void)initialize;
{
    [SCSoundCloud  setClientID:@"761ee8c9a61ac87e0a47e39ac682b5fa"
                        secret:@"2d38975763cb42619866fcee64b4c609"
                   redirectURL:[NSURL URLWithString:@"sampleproject://oauth"]];

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [JFMusician registerSubclass];
    [JFJamSession registerSubclass];
    
    [Parse setApplicationId:@"aGteGk8MEwD1hXG8F2HkqNGxWSVIgDFf88VklyvZ"
                  clientKey:@"JdzsCvjC6w22vnvMhdXsNHSXbjU49GjfFsn8cPCy"];
    
    
//    CHOOSE PATH
    JFChoosePathVC *choosePathVC = [[JFChoosePathVC alloc]init];
    self.window.rootViewController = choosePathVC;
    
    
    // ADD JAMS
//    JFAddJamWhereVC *addJamVC = [[JFAddJamWhereVC alloc]init];
//    self.window.rootViewController = addJamVC;
//    
    
    // VIEW JAMS
//    JFJamsContainerViewController *jf = [[JFJamsContainerViewController alloc] init];
//    self.window.rootViewController = jf;
    
    // LOGIN
//    JFLoginWithSCVC *loginVC = [[JFLoginWithSCVC alloc]init];
//    self.window.rootViewController = loginVC;
    
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
