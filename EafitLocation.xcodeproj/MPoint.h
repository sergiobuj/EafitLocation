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

@interface MPoint : NSObject <MKAnnotation> {
    
    CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
	int ID;
    
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic) int ID;

- (id)initWithCoordinate:(CLLocationCoordinate2D) location;
@end
