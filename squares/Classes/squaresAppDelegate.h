//
//  squaresAppDelegate.h
//  squares
//
//  Created by Peter Holzkorn on 06.02.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class squaresViewController;

@interface squaresAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    squaresViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet squaresViewController *viewController;

@end

