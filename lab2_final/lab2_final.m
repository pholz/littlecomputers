#import <Foundation/Foundation.h>

@interface YourClass : NSObject
{
	
}

- (NSString*) goodbye;

@end

@implementation YourClass

- (id) init
{
	
}

- (void) dealloc
{
	// release any retained objects here.
	[super dealloc];
}

- (NSString*) goodbye
{
	NSString* s = @"Goodbye, nice seeing you!";
	return s;
}



@end


@interface MyClass : NSObject
{
	float myFloat;
	YourClass* friend;
}

- (void) hello;
- (void) setFriend:(YourClass*)yc;
- (YourClass*) friend;

@end

@implementation MyClass

- (id) init
{
	self = [super init];
	if(self != nil)
	{
		myFloat = 5.0;
		return self;
	}
	else return nil;
}

- (void) setFriend: (YourClass*) yc
{
	[yc retain];
	[friend release];
	friend = yc;
}

- (YourClass*) friend
{
	return friend;
}

- (void) hello
{
	NSLog(@"Hello, I'm your first Objective-C program!");
}

- (void) dealloc
{
	
	[friend release];
	
	//NSLog(@"dealloc %d", [friend retainCount]);
	[super dealloc];
	
	
}

@end

int main(int argc, char**argv)
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// allocate an instance
	MyClass *mc = [[MyClass alloc] init];
	MyClass *mc2 = [[MyClass alloc] init];
	[mc hello];
	
	YourClass *yc = [[YourClass alloc] init];
	YourClass *yc2 = [[YourClass alloc] init];
	///NSLog(@"%@",[yc goodbye]);
	
	[mc setFriend:yc];
	[mc2 setFriend:yc2];
	
	NSLog(@"I am %@, this is my friend %@ and he says '%@'", mc, [mc friend], [[mc friend] goodbye]);
	NSLog(@"I am %@, this is my friend %@ and he says '%@'", mc2, [mc2 friend], [[mc2 friend] goodbye]);
	
	[mc release];
	[mc2 release];
	[yc release];
	[yc2 release];
	[pool release];
	
	return 0;
}