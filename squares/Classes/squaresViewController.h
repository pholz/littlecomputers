//
//  squaresViewController.h
//  squares
//
//  Created by Peter Holzkorn on 06.02.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class squareGfx;

@interface squaresViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UIButton			*btnSquare;
	IBOutlet UITextField		*tfInput, *tfOutput;
	squareGfx					*gfx;
}

@property(nonatomic,retain) IBOutlet UIButton		*btnSquare;
@property(nonatomic,retain) IBOutlet UITextField	*tfInput;
@property(nonatomic,retain) IBOutlet UITextField	*tfOutput;
@property(nonatomic,retain) squareGfx				*gfx;

-(IBAction) btnSquarePressed:(id)sender;

@end

