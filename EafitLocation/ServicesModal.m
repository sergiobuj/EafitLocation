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

		
		services = [[NSArray alloc] initWithObjects:@"Loading...", nil];
			
		
		[[NSOperationQueue mainQueue] addOperationWithBlock:^{
			
			
			NSError * error = nil;
			NSPropertyListFormat format;
			NSString *errorDescription = nil;

			NSString * urlString = [NSString stringWithFormat:@"http://elocation.heroku.com/places/%@.xml",thisPlace];
			
			urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
			
			if(urlString){
				NSData * resourceAsData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString] options:NSPropertyListImmutable error:&error];
				
				if (error) {
					NSLog(@"%@", error);
				}else {
					NSDictionary *samplePlist = [NSPropertyListSerialization propertyListFromData:resourceAsData mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&errorDescription];				
					services = [samplePlist objectForKey:@"services"];

					
					[self setTitle:[samplePlist objectForKey:@"title"]];
					
					for (NSString * str in [services mutableArrayValueForKey:@"title"]) {
						NSLog(@"%@", str);
					}
				}
			}
			
		}];
		[self setPlace:thisPlace];
	}
	return self;
}

- (void) reloadTable
{
	

	
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
//    [super viewDidLoad];
	// the creation
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen]applicationFrame]];
	[contentView setBackgroundColor:[UIColor lightGrayColor]];

	
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

//- (NSInteger)tableView:(UITableView *)tbv numberOfRowsInSection:(NSInteger)section {
//	return [services count];
//}
//- (UITableViewCell *)tableView:(UITableView *)tbv cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//	return [UITableViewController tableView:tbv cellForRowAtIndexPath:indexPath];
//}

@end
