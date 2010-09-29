//
//  MyNSEvent.m
//  QsilverQscript
//
//  Created by Eric Nitardy on 8/23/10.
//  Copyright 2010.
//

#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>


#import "MyNSEvent.h"


@implementation MyNSEvent

+(int) clickAtLocation: (NSPoint) pt {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	int x = pt.x;
	int y = pt.y;
	
	CGPoint ptCG;
	ptCG.x = x;
	ptCG.y = y;
	
	
	CGEventRef mouseDownEv = CGEventCreateMouseEvent(
													 NULL,kCGEventLeftMouseDown,ptCG,kCGMouseButtonLeft);
	
	CGEventRef mouseUpEv = CGEventCreateMouseEvent(
												   NULL,kCGEventLeftMouseUp,ptCG,kCGMouseButtonLeft);
	
	CGEventPost (kCGSessionEventTap, mouseDownEv);

	
	CGEventPost (kCGSessionEventTap, mouseUpEv );
	
	
	
	[pool release];
	return 0;	
	
}
@end
