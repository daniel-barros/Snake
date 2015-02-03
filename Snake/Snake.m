//
//  Snake.m
//  Snake
//
//  Created by Daniel Barros on 8/10/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import "Snake.h"

@implementation Snake

- (id)initWithPosition:(Pair*)position matrixSize:(int) matrixSize{
    self = [super init];
    
    if (self) {
        _size = 1;
        _matrixSize = matrixSize;
        _direction = left;
        _positions = [NSMutableArray arrayWithObject:position];
    }
    
    return self;
}

- (void) turnLeft {
    if (_direction == right) _direction = up;
    else if (_direction == up) _direction = left;
    else if (_direction == left) _direction = down;
    else _direction = right;
}

- (void) turnRight {
    if (_direction == right) _direction = down;
    else if (_direction == down) _direction = left;
    else if (_direction == left) _direction = up;
    else _direction = right;
}

- (void) move {
    
    Pair *head = [_positions firstObject];
    Pair *new = [Pair pairWithX:head.x y:head.y];
    
    if (_direction == right) {
        new.x++;
    }
    else if (_direction == up) {
        new.y++;
    }
    else if (_direction == left) {
        new.x--;
    }
    else {
        new.y--;
    }
    
    if (new.x >= _matrixSize)
        new.x = 0;
    if (new.y >= _matrixSize)
        new.y = 0;
    if (new.x < 0)
        new.x = _matrixSize - 1;
    if (new.y < 0)
        new.y = _matrixSize - 1;
    
    [self.positions insertObject:new atIndex:0];
    
    //If the snake has to grow it doesn't remove the tail
    if (_size == [self.positions count] - 1) {
        [self.positions removeLastObject];
    }
}

- (void) grow {
    self.size++;
}

@end
