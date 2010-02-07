//
//  squaresViewController.m
//  squares
//
//  Created by Peter Holzkorn on 06.02.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "squaresViewController.h"
#import "squareGfx.h"

@implementation squaresViewController

@synthesize tfInput;
@synthesize tfOutput;
@synthesize btnSquare;
@synthesize gfx;



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		squareGfx *g = [[squareGfx alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
		[self setGfx:g];
		[g release];
		
		CGPoint c = [self.view center];
		[gfx setCenter:CGPointMake(c.x, 80)];
		[self.view addSubview: gfx];
		
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	NSLog(@"did load draw");
	
    [super viewDidLoad];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	NSLog(@"touches began");
	
	UITouch *touch = [touches anyObject];
	
	if([touch view] == [self view]){
		CGPoint location = [touch locationInView:[self view]];
		NSLog(@"began %f,%f",location.x, location.y);
		[gfx setCenter:location];
	}
	
	
	


	
}
 

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	UITouch *touch = [[event allTouches] anyObject];
	if([touch view] == [self view]){
		
		CGPoint location = [touch locationInView:[touch view]];
		NSLog(@"moved %f,%f",location.x, location.y);
		[gfx setCenter:location];
	}
}

@end
