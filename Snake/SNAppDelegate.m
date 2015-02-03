//
//  SNAppDelegate.m
//  Snake
//
//  Created by Daniel Barros on 8/9/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import "SNAppDelegate.h"
#import "Orientation.h"

const int size = 10;

@implementation SNAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    Game *game = [Game gameWithSize:size];
    [self setGame:game];
    
    _boxes = [NSMutableArray array];
    
    for (NSView* button in _board.subviews) {
        if (button.tag == 2)
            [_boxes addObject:button];
    }
}

- (void)updateUserInterface {
    if (self.status) {
        NSArray *map = [self.game map];
        for (NSButton* button in self.boxes) {
            [button setHidden:false];
        }
        for (int i=0; i<size; i++) {
            for (int j=0; j<size; j++) {
                NSNumber *box = map[i][j];
                if ([box intValue] == 0) {
                    [self.boxes[j*10+i] setTitle:@""];
                }
                else if ([box intValue] == 1) {
                    [self.boxes[j*10+i] setTitle:@"O"];
                }
                else if ([box intValue] == 2) {
                    [self.boxes[j*10+i] setTitle:@"X"];
                }
                else {
                    [self.boxes[j*10+i] setTitle:@"?"];
                }
            }
        }
    }
    else {
        [self performSelector:@selector(reset) withObject:nil afterDelay:1];
    }
}

- (void)reset {
    for (NSButton* button in self.boxes) {
        [button setHidden:true];
    }
    [self.startButton setEnabled:YES];
    [self.startButton setHidden:NO];
}

- (void)turn {
    self.status = [self.game move];
    [self updateUserInterface];
    if (self.status)
        [self performSelector:@selector(turn) withObject:nil afterDelay:0.4];
}

- (IBAction)start:(id)sender {
    [self.startButton setHidden:YES];
    [self.startButton setEnabled:NO];
    [self.game reset];
    [self setStatus:true];
    [self updateUserInterface];
    [self performSelector:@selector(turn) withObject:nil afterDelay:0.4];
}

- (void)keyDown:(NSEvent *)event
{
    if (self.status) {
    myDirection d = [self.game getSnakeOrientation];
    
    switch( [event keyCode] ) {
        case 126:       // up arrow
            if (d == left) {
                [self.game turnSnakeLeft];
            }
            else if (d == right) {
                [self.game turnSnakeRight];
            }
            break;
        case 125:       // down arrow
            if (d == left) {
                [self.game turnSnakeRight];
            }
            else if (d == right) {
                [self.game turnSnakeLeft];
            }
            break;
        case 124:       // right arrow
            if (d == up) {
                [self.game turnSnakeRight];
            }
            else if (d == down) {
                [self.game turnSnakeLeft];
            }
            break;
        case 123:       // left arrow
            if (d == up) {
                [self.game turnSnakeLeft];
            }
            else if (d == down) {
                [self.game turnSnakeRight];
            }
            break;
        default:
            break;
    }
    }
}


@end
