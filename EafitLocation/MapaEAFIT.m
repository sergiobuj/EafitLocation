//
//  MapaEAFIT.m
//  EafitLocation
//
//  Created by Juan Felipe on 7/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapaEAFIT.h"
#import "MPoint.h"
#import "ServicesModal.h"


@implementation MapaEAFIT


-(id) init{

    self = [super init];
    if(self){
        
        
        mapview = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        [mapview setMapType:MKMapTypeHybrid];
        [mapview setZoomEnabled:YES];
        [mapview setScrollEnabled:YES];
        [mapview setShowsUserLocation:YES];
        MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } }; 
        region.center.latitude = 6.199931 ;
        region.center.longitude = -75.578599;
        region.span.longitudeDelta = 0.0003333f;
        region.span.latitudeDelta = 0.0003814f;
        [mapview setRegion:region animated:YES]; 
        [mapview setDelegate:self];
        
        
        points = [[NSMutableArray alloc] init];
        
        [self setView:mapview];
        
        [self getPoints];
        
    }
    
    return self;

}


-(void)getPoints{

    responseData = [[NSMutableData data] retain];
        
    NSURLRequest *request =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://elocation.heroku.com/places.xml"]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
 
    
}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [responseData setLength:0];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Show error
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSPropertyListFormat format;
    NSString *errorDescription = nil;
    NSDictionary *samplePlist = [NSPropertyListSerialization propertyListFromData:responseData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&errorDescription];
    
     for (NSDictionary *dict in [samplePlist objectForKey:@"map_points"]) {
        CLLocationCoordinate2D coord = { [[dict objectForKey:@"latitude"] doubleValue] , [[dict objectForKey:@"longitude"] doubleValue] };
        
        MPoint *point = [[MPoint alloc] initWithCoordinate:coord];
        
        [point setTitle:[dict objectForKey:@"title"]];
        [point setSubtitle:[dict objectForKey:@"subtitle"]];

        [points addObject:point];
        
        [point release];
    }	
    [mapview addAnnotations:points];
    
    MKCoordinateRegion region;
    region.center.latitude = [[points objectAtIndex:0] coordinate].latitude;
    region.center.longitude = [[points objectAtIndex:0] coordinate].longitude;
    region.span.longitudeDelta = 0.003338;
    region.span.latitudeDelta = 0.003806;
    
    [mapview setRegion:region animated:YES];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      
    }
    return self;
}


- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *pinAnnotation = nil;
    if(annotation != mV.userLocation) 
    {
        static NSString *defaultPinID = @"myPin";
        pinAnnotation = (MKPinAnnotationView *)[mV dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinAnnotation == nil )
            pinAnnotation = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
        
        pinAnnotation.canShowCallout = YES;
        
        //instatiate a detail-disclosure button and set it to appear on right side of annotation
        UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinAnnotation.rightCalloutAccessoryView = infoButton;

        
    }
    return pinAnnotation;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
	
	ServicesModal * modal = [[ServicesModal alloc] initWithPlace:[[view annotation] title]];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:modal];
	[self.navigationController presentModalViewController:navController animated:YES];
	[navController release];
	[modal release];
}



- (void)dealloc
{
    [points release];
	[mapview release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
//    mapview = [[MKMapView alloc] initWithFrame:(self.view.frame)];
    
    [super viewDidLoad];
    
//    mapview = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
//    [self.view addSubview:mapview];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
        
    
}



- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {}

// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
// mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
// The delegate can implement this method to animate the adding of the annotations views.
// Use the current positions of the annotation views as the destinations of the animation.
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {}

// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
