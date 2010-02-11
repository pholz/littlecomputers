//
//  squareGfx.m
//  squares
//
//  Created by Peter Holzkorn on 06.02.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "squareGfx.h"


@implementation squareGfx


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextClearRect(ctx, rect);
	
	CGContextSetRGBFillColor(ctx, 255, 0, 0, 1.0);
	CGContextFillRect(ctx, CGRectMake(0,0,50,50));
	
	NSLog(@"drawing");
	
}


- (void)dealloc {
	
    [super dealloc];
}


@end
