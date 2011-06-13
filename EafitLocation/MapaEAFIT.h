//
//  MapaEAFIT.h
//  EafitLocation
//
//  Created by Juan Felipe on 7/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MPoint.h"
#import "SBAnnotationView.h"

@interface MapaEAFIT : UIViewController <MKMapViewDelegate> {
    
    MKMapView *mapview;  
    NSMutableData *responseData;
   // NSDictionary *samplePlist;
	NSMutableArray *points;

    
}

- (void) getPoints;

@end
