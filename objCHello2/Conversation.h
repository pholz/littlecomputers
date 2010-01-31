//
//  Conversation.h
//  objCHello2
//
//  Created by Peter Holzkorn on 30.01.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Conversation : NSObject {
	
	int words;

}

- (id) initWithWords:(int)w;
- (void) start;
- (NSMutableString*) generate;


@end
