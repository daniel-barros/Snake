//
//  Snake.h
//  Snake
//
//  Created by Daniel Barros on 8/10/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Pair.h"
#include "Orientation.h"

@interface Snake : NSObject

@property int size;
@property int matrixSize;
@property NSMutableArray *positions;
@property myDirection direction;

- (id)initWithPosition:(Pair*)position matrixSize:(int) matrixSize;

- (void) turnRight;
- (void) turnLeft;
- (void) move;
- (void) grow;

@end
