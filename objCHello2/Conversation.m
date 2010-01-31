//
//  Conversation.m
//  objCHello2
//
//  Created by Peter Holzkorn on 30.01.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Conversation.h"
#import <math.h>


@implementation Conversation

- (id) initWithWords:(int)w {
	
	self = [super init];
	
	if(self != nil){
		
		words = w;
		
	}
	
	return self;
	
} 

- (void) dealloc {
	[super dealloc];
}

- (void) start {
	
	for(int i = 0; i < words; i++){
		NSString* gen = [self generate];
		NSLog(@"%@", gen);
	}
}

- (NSString*) generate {
	NSString * gen = @"";
	
	int len = random() % 10 + 3;
	for(int i = 0; i < len; i++){
		char cs[] = { ((char) (random() % 26) + 'a') };
		gen = [gen stringByAppendingString: [NSString stringWithUTF8String:(char*)cs]];
	}
		
	
	return gen;
}

@end
