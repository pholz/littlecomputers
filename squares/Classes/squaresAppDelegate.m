//
//  squaresAppDelegate.m
//  squares
//
//  Created by Peter Holzkorn on 06.02.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "squaresAppDelegate.h"
#import "squaresViewController.h"

@implementation squaresAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    squaresViewController *svc = [[squaresViewController alloc] initWithNibName:@"squaresView" bundle:nil];
	[self setViewController: svc];
	[svc release];
	
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
