//
//  SNAppDelegate.h
//  Snake
//
//  Created by Daniel Barros on 8/9/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "Game.h"
#include "CustomView.h"

@interface SNAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong) Game *game;
@property BOOL status;
@property NSMutableArray *boxes;

@property (weak) IBOutlet NSButton *startButton;
@property (weak) IBOutlet CustomView *board;


- (void)updateUserInterface;
- (void)turn;
- (IBAction)start:(id)sender;
- (void)reset;

- (void)keyDown:(NSEvent *)event;

@end
