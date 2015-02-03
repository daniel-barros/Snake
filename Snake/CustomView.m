//
//  CustomView.m
//  Snake
//
//  Created by Daniel Barros on 8/18/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import "CustomView.h"
#import "SNAppDelegate.h"

@implementation CustomView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (void)keyDown:(NSEvent *)theEvent {
    [(SNAppDelegate*)[[NSApplication sharedApplication] delegate] keyDown:theEvent];
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)resignFirstResponder {
    return NO;
}

@end
