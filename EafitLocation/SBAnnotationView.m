//
//  SBAnnotationView.m
//  EafitLocation
//
//  Created by Sergio Botero on 6/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SBAnnotationView.h"
#import "MPoint.h"

@implementation SBAnnotationView

- (NSString *) ID
{
    MPoint *point = (MPoint *)self.annotation;
    if (point != nil)
		return [point ID];
	return nil;
}

@end
