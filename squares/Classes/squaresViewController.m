//
//  squaresViewController.m
//  squares
//
//  Created by Peter Holzkorn on 06.02.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "squaresViewController.h"

@implementation squaresViewController

@synthesize tfInput;
@synthesize tfOutput;
@synthesize btnSquare;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[tfOutput release];
	[tfInput release];
	[btnSquare release];
    [super dealloc];
}

-(IBAction) btnSquarePressed:(id)sender {
	NSLog(@"btn press");
	
	int input = [[tfInput text] intValue];
	int res = input * input;
	
	[tfOutput setText:[NSString stringWithFormat: @"%d", res]];
	
	if([tfInput isEditing]){
		[tfInput resignFirstResponder];
	}
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
	
	NSLog(@"finished: %@",[textField description]);
	if(textField == tfInput || textField == tfOutput){
		[textField resignFirstResponder];
	}
	
	return YES;
}

-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
	if(textField == tfOutput){
		return NO;
	}
	else return YES;
}

@end
