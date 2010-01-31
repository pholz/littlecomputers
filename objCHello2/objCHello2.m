#import <Foundation/Foundation.h>
#import "Conversation.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    
    NSLog(@"Hello, World!");
	
	int words = 6;
	//NSLog(@"argc: %d", argc);
	if(argc == 2){
	//	NSLog(@"argv[1]: %s", argv[1]);
		words = atoi(argv[1]);
		NSLog(@"words: %d", words);
	}
	
	Conversation* conv = [[Conversation alloc] initWithWords:words];
	[conv start];
	
    [pool drain];
    return 0;
}
