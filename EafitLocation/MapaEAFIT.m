//
//  MapaEAFIT.m
//  EafitLocation
//
//  Created by Juan Felipe on 7/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapaEAFIT.h"



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
        region.span.latitudeDelta = 0.0003814;
        [mapview setRegion:region animated:YES]; 
        [mapview setDelegate:self];
        
        
        [self setView:mapview];
        
        [self getPoints];
        
        
       // UIView * cosita = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
        //[cosita setBackgroundColor:[UIColor redColor]];
        
        //[self.view addSubview:cosita];
    }
    
    return self;

}


-(void)getPoints{

    responseData = [[NSMutableData data] retain];
    
    NSURLRequest *request =
    [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://raw.github.com/sergiobuj/EAFITENSE/catchup/EAFITENSE/Customization.plist"]];
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

    NSLog(@"%@", [NSString stringWithUTF8String:[responseData bytes]]);

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
