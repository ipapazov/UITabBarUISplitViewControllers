//
//  AppDelegate.m
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController_iPhone.h"
#import "MasterViewController.h"
#import "DetailViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    // Check to see on what device we are running the app
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        MyViewController_iPhone *mvciPhone = [[[MyViewController_iPhone alloc] init] autorelease];
        UINavigationController *nvc = [[[UINavigationController alloc] initWithRootViewController:mvciPhone] autorelease];
        
        [nvc setNavigationBarHidden:YES];
        self.window.rootViewController = nvc;
    } 
    else
    {

        // Create veiw controller and set up navigation controller for master view
        MasterViewController *mvc = [[[MasterViewController alloc] init] autorelease];
        UINavigationController *mnc = [[[UINavigationController alloc] 
                                        initWithRootViewController:mvc] autorelease];
        
        // Create veiw controller and set up navigation controller for detail view
        DetailViewController *dvc = [[[DetailViewController alloc] init] autorelease];
        UINavigationController *dnc = [[[UINavigationController alloc] 
                                        initWithRootViewController:dvc] autorelease];
        
        // So we send messages from master to detail view controller 
        mvc.delegate = dvc;
        
        // Add the view controlers to an array
        NSArray *splitViewControllers = [NSArray arrayWithObjects:mnc, dnc, nil];
        
        // Set up split view and add it to the sub view
        UISplitViewController *svc = [[[UISplitViewController alloc] init] autorelease];
        [svc setViewControllers:splitViewControllers];
        
        // So we can send messages from split view controller to the detail view controller when rotating
        svc.delegate = dvc;
        
        self.window.rootViewController = svc;
        
    }
    
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
