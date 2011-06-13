//
//  ServicesModal.h
//  
//
//  Created by Sergio Botero on 06/12/11.
//  Copyright 2011 Sergiobuj. All rights reserved.
//


#import "ServicesModal.h"


@implementation ServicesModal

@synthesize place;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */
- (id) initWithPlace:(NSString *) thisPlace {
	self = [super init];
	if (self) {
		[self setPlace:thisPlace];
		[self setTitle:place];
	}
	return self;
}



// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
//    [super viewDidLoad];
	// the creation
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame]];
	[contentView setBackgroundColor:[UIColor redColor]];

	[self setView:contentView];
	[contentView release];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem *cancelB = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissModalViewControllerAnimated:)];
	
	self.navigationItem.leftBarButtonItem = cancelB;
	[cancelB release];
	
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {

	[super dealloc];
}


@end
