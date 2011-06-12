//
//  MPoint.h
//  EafitLocation
//
//  Created by Juan Felipe on 12/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MPoint : UIViewController {
    
    CLLocationCoordinate2D coordinate;
	NSString *title;
    
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D) location;
@end