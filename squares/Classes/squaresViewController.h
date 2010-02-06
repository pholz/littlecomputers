//
//  squaresViewController.h
//  squares
//
//  Created by Peter Holzkorn on 06.02.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface squaresViewController : UIViewController <UITextFieldDelegate> {
	IBOutlet UIButton			*btnSquare;
	IBOutlet UITextField		*tfInput, *tfOutput;
}

@property(nonatomic,retain) IBOutlet UIButton		*btnSquare;
@property(nonatomic,retain) IBOutlet UITextField	*tfInput;
@property(nonatomic,retain) IBOutlet UITextField	*tfOutput;

-(IBAction) btnSquarePressed:(id)sender;

@end

