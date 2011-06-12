//
//  MapaEAFIT.m
//  EafitLocation
//
//  Created by Juan Felipe on 7/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapaEAFIT.h"
#import "MPoint.h"



@implementation MapaEAFIT


-(id) init{

    self = [super init];
    if(self){
        
        
        mapview = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        [mapview setMapType:MKMapTypeHybrid];
        [mapview setZoomEnabled:YES];
        [mapview setScrollEnabled:YES];
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
    samplePlist = [NSPropertyListSerialization propertyListFromData:responseData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&errorDescription];
    
    NSString * data = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"data is %@", data);
    
   // NSLog(@"ready");
    for (id key in samplePlist) {
        
        NSLog(@"key: %@, value: %@", key, [samplePlist objectForKey:key]);
        
    }
    //NSLog(@"%@", [NSString stringWithUTF8String:[responseData bytes]]);

    

    
    //////////
    
    
    CLLocationCoordinate2D coord = {[[samplePlist objectForKey:@"latitude"] doubleValue], [[samplePlist objectForKey:@"longitude"] doubleValue]};
    
    MPoint *point = [[MPoint alloc] initWithCoordinate:coord];
    
    [point setTitle:[samplePlist objectForKey:@"title"]];
        
    [points addObject:point];
    
    [point release];
    
    [mapview addAnnotations:points];
        
    MKCoordinateSpan span = MKCoordinateSpanMake(0.0003333f ,0.0003814f);

    MKCoordinateRegion region = MKCoordinateRegionMake([[points objectAtIndex:0] coordinate], span);
    
    [mapview setRegion:region animated:YES];
    
}




- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
    
    
    NSLog(@"%lf %lf", [mapview region].center.latitude, [mapview region].center.longitude);
    NSLog(@"%lf %lf", [mapview region].span.longitudeDelta, [mapview region].span.latitudeDelta);
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
      
    }
    return self;
}

- (void)dealloc
{
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
