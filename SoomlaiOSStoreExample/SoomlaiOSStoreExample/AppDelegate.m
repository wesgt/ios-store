//
//  AppDelegate.m
//  SoomlaiOSStoreExample
//
//  Created by Refael Dakar on 10/31/12.
//  Copyright (c) 2012 SOOMLA. All rights reserved.
//

#import "AppDelegate.h"
#import "StoreController.h"
#import "MuffinRushAssets.h"
#import "StoreInventory.h"
#import "VirtualCurrency.h"
#import "ObscuredNSUserDefaults.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    
    /**
     * We initialize StoreController when the application loads !
     */
    id<IStoreAsssets> storeAssets = [[MuffinRushAssets alloc] init];
    [[StoreController getInstance] initializeWithStoreAssets:storeAssets andCustomSecret:@"ChangeMe!!!"];
    
    // Checking if it's a first run and adding 10000 currencies if it is.
    // OFCOURSE... THIS IS JUST FOR TESTING.
    if (![ObscuredNSUserDefaults boolForKey:@"NotFirstLaunch"])
    {
        [ObscuredNSUserDefaults setBool:YES forKey:@"NotFirstLaunch"];
        [(VirtualCurrency*)[storeAssets.virtualCurrencies objectAtIndex:0] giveAmount:10000];
    }

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
