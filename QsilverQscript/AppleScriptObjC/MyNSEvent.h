//
//  MyNSEvent.h
//  QsilverQscript
//
//  Created by Eric Nitardy on 8/23/10.
//  Copyright 2010.
//

#import <AppKit/NSEvent.h>


@interface MyNSEvent : NSEvent 

+(int) clickAtLocation: (NSPoint) pt;

@end
