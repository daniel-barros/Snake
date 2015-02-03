//
//  Game.h
//  Snake
//
//  Created by Daniel Barros on 8/10/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Snake.h"

@interface Game : NSObject

+ (id)gameWithSize:(int)mapSize;
- (void)reset;
- (BOOL)move;   //returns false if game is over
- (NSArray*)map;
- (void)turnSnakeLeft;
- (void)turnSnakeRight;
- (NSInteger)getSnakeOrientation;

@end
