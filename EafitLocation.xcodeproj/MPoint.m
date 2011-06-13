//
//  MPoint.m
//  EafitLocation
//
//  Created by Juan Felipe on 12/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MPoint.h"

@implementation MPoint


@synthesize title;
@synthesize subtitle;
@synthesize coordinate;
@synthesize ID;

- (id)initWithCoordinate:(CLLocationCoordinate2D) location{
	coordinate = location;	
	return self;
}



- (void)dealloc
{
    [super dealloc];
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

@end
