//
//  MapaEAFIT2.m
//  EafitLocation
//
//  Created by Juan Felipe on 11/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapaEAFIT2.h"


@implementation MapaEAFIT2

-(id) init{
    
    self = [super init];
    if(self){
        
	}
    
    return self;
    
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	UIView * infoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	info = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	
	[info setFont:[UIFont fontWithName:@"Helvetica" size:14]];
	[info setBackgroundColor:[UIColor lightGrayColor]];
	
	[info setText:@"Creado por Juan Felipe Arango y Nicolás Hock"];
	
	
	[infoView addSubview:info];
	
	
	
	[self setView:infoView];
	
	[info release];
	[infoView release];
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
