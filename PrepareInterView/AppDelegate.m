//
//  AppDelegate.m
//  PrepareInterView
//
//  Created by USER on 2017/5/18.
//  Copyright © 2017年 com.lottery.www. All rights reserved.
//

#import "AppDelegate.h"
#import <MMDrawerController/MMDrawerController.h>
#import "DrLeftViewController.h"
#import "DrRightViewController.h"
#import "HeadBlowUpViewController.h"

#import "ViewController.h"
#import "MyDrawerViewController.h"

#import "OpenCloseFaceViewController.h"

#import "AllReviewListViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
   
//    DrLeftViewController *left = [[DrLeftViewController alloc]init];
//    MyDrawerViewController *myDr = [[ MyDrawerViewController alloc]init];
//    
//    DrRightViewController *right = [[DrRightViewController alloc]init];
//    
//    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:myDr];
//    UINavigationController *nl = [[UINavigationController alloc]initWithRootViewController:left];
//    UINavigationController *nr = [[UINavigationController alloc]initWithRootViewController:right];
    
    
//    MMDrawerController *dr = [[MMDrawerController alloc]initWithCenterViewController:nc leftDrawerViewController:nl rightDrawerViewController:nr];
//    
//    [dr setShowsShadow:NO];
//    [dr setRestorationIdentifier:@"MMDrawer"];
//    [dr setMaximumRightDrawerWidth:50.0];
//    [dr setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
//    [dr setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
//    [dr setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//        UIViewController *sideDrawerViewController;
//        if(drawerSide == MMDrawerSideLeft){
//            sideDrawerViewController = drawerController.leftDrawerViewController;
//        }
//        else if(drawerSide == MMDrawerSideRight){
//            sideDrawerViewController = drawerController.rightDrawerViewController;
//        }
//        [sideDrawerViewController.view setAlpha:percentVisible];
//        
//       
//    }];
   
    
   
    
    AllReviewListViewController *allVC = [[AllReviewListViewController alloc]init];
    
    UINavigationController *allNV = [[UINavigationController alloc]initWithRootViewController:allVC];
    UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                          green:173.0/255.0
                                           blue:234.0/255.0
                                          alpha:1.0];
    [self.window setTintColor:tintColor];
    
    self.window.rootViewController = allNV;
    
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
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
