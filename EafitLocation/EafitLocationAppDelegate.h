//
//  EafitLocationAppDelegate.h
//  EafitLocation
//
//  Created by Juan Felipe on 7/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EafitLocationAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UITabBarController *tabBar;
}

@property (nonatomic, retain) UITabBarController *tabBar;
@property (nonatomic, retain) UIWindow *window;



@end
