//
//  EafitLocationAppDelegate.m
//  EafitLocation
//
//  Created by Juan Felipe on 7/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EafitLocationAppDelegate.h"
#import "MapaEAFIT.h"
#import "MapaEAFIT2.h"

@implementation EafitLocationAppDelegate

@synthesize window;

@synthesize tabBar;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    tabBar = [[UITabBarController alloc] init];
	
	/////First TAB 
    MapaEAFIT * mapaEafit = [[MapaEAFIT alloc] init];
	[mapaEafit setTitle:@"Map"];
	UINavigationController *mapController = [[UINavigationController alloc] init];
	mapController.tabBarItem.image = [UIImage imageNamed:@"home_20.png"];
	[mapController pushViewController:mapaEafit animated:YES];
	[mapController setTitle:@"Map"];
	[mapaEafit release];
    

	/////Second TAB 

    
    MapaEAFIT2 * mapaEafit2 = [[MapaEAFIT2 alloc] init];
	[mapaEafit2 setTitle:@"Info"];
	UINavigationController *servicesController = [[UINavigationController alloc] init];
	servicesController.tabBarItem.image = [UIImage imageNamed:@"info_20.png"];
	[servicesController pushViewController:mapaEafit2 animated:YES];
	[servicesController setTitle:@"Info"];
	[mapaEafit2 release];

	
	[tabBar setViewControllers:[NSArray arrayWithObjects:mapController,servicesController,nil] animated:YES];
	[window addSubview:tabBar.view];
    
	[mapController release];
    [servicesController release];



	[window makeKeyAndVisible];
    
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

- (void)dealloc {
    [tabBar release];
    [window release];
    [super dealloc];
}
@end
