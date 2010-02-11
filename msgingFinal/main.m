//
//  main.m
//  msgingFinal
//
//  Created by Peter Holzkorn on 10.02.10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <time.h>

@interface Hello : NSObject
{
	
}
- (void) doNothing;
- (void) sayHelloTo: (NSString*) name;
- (NSString*) giveMeAnAnswer;

@end

@implementation Hello 

- (void) doNothing 
{
	// lalala
}

- (void) sayHelloTo: (NSString*) name
{
	NSLog(@"hello %@.", name);
	
}

- (NSString*) giveMeAnAnswer
{
	return @"answer";
}

@end



int main(int argc, char *argv[])
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	clock_t s, e;
	
	
	int ENOUGHNOTHING = 10000000;
	
    Hello *hello = [[Hello alloc] init];
	
	
	// [ ]
	
	NSLog(@"--- sending regular obj-c messages:");
	
	s = clock();
	int i;
	for(i = 0; i < ENOUGHNOTHING; i++)
		[hello doNothing];
	e = clock();
	
	NSLog(@"time spent doing nothing: %f", ((double)e-s)/CLK_TCK);
	
	[hello sayHelloTo:@"peter"];
	
	NSLog(@"%@",[hello giveMeAnAnswer]);
	
	
	// msgSend
	
	NSLog(@"--- sending messages with objc_msgSend:");
	
	s = clock();
	for(i = 0; i < ENOUGHNOTHING; i++)
		objc_msgSend(hello, @selector(doNothing));
	e = clock();
	
	NSLog(@"time spent doing nothing: %f", ((double)e-s)/CLK_TCK);
	
	objc_msgSend(hello, @selector(sayHelloTo:), @"peter");
	
	NSLog(@"%@",objc_msgSend(hello, @selector(giveMeAnAnswer)));
	
	
	// the backdoor
	
	NSLog(@"--- calling functions directly:");
	
	void (*doNothing)(id, SEL);
	doNothing = (void(*)(id, SEL))[hello methodForSelector:@selector(doNothing)];
	s = clock();
	for(i = 0; i < ENOUGHNOTHING; i++)
		doNothing(hello, @selector(doNothing));
	e = clock();
	NSLog(@"time spent doing nothing: %f", ((double)e-s)/CLK_TCK);
	
	void (*sayHelloTo)(id, SEL, NSString*);
	sayHelloTo = (void(*)(id, SEL, NSString*))[hello methodForSelector:@selector(sayHelloTo:)];
	sayHelloTo(hello, @selector(sayHelloTo:), @"peter");
	
	NSString* (*giveMeAnAnswer)(id, SEL);
	giveMeAnAnswer = (NSString*(*)(id, SEL))[hello methodForSelector:@selector(giveMeAnAnswer)];
	NSLog(@"%@",giveMeAnAnswer(hello, @selector(giveMeAnAnswer)));
	
	
	[hello release];
	
	[pool release];
	
	return 0;
}
