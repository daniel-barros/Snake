//
//  Game.m
//  Snake
//
//  Created by Daniel Barros on 8/10/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import "Game.h"

@implementation Game {
    Snake *snake;
    Pair *foodPosition;
    int size;
}

- (id)init {
    return [self initWithSize:10];
}

- (id)initWithSize:(int)mapSize {
    self = [super init];
    if (self) {
        srand((unsigned int)time(NULL));
        size = mapSize;
        [self reset];
        
    }
    return self;
}

+ (id)gameWithSize:(int)size {
    Game *game = [[Game alloc] initWithSize:size];
    return game;
}

- (void)reset {
    snake = [[Snake alloc] initWithPosition:[Pair pairWithX:size/2 y:size/2]
                                 matrixSize:size];
    foodPosition = [Pair pairWithX:rand()%size y:rand()%size];
}

- (BOOL)move {
    [snake move];
    
    //Check if snake hit himslef
    NSArray *body = snake.positions;
    Pair *headPosition = [body firstObject];
    BOOL crash = false;
    for (int i=1; i<snake.size; i++) {
        if ([headPosition isEqualTo:body[i]]) {
            crash = true;
        }
    }
    if (crash) {
        return false;
    }
    
    //If it reaches the food...
    if ([headPosition isEqualTo:foodPosition]) {
        [snake grow];
        
        //Create new food
        bool valid;
        do {
            valid = true;
            foodPosition = [Pair pairWithX:rand()%size y:rand()%size];
            for (Pair *position in body) {
                if ([position isEqualTo:foodPosition])
                    valid = false;
            }
        } while (!valid);
    }
    
    return true;
}

- (NSArray*)map {
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<size; i++) {
        NSMutableArray *row = [NSMutableArray array];
        for (int j=0; j<size; j++) {
            NSNumber *box = [NSNumber numberWithInt:0];
            if (i == foodPosition.x && j == foodPosition.y)
                box = [NSNumber numberWithInt:2];
            for (Pair *position in snake.positions) {
                if (i == position.x && j == position.y) {
                    box = [NSNumber numberWithInt:1];
                }
            }
            [row addObject:box];
        }
        [array addObject:row];
    }
    
    return array;
}

- (void)turnSnakeLeft {
    [snake turnLeft];
}

- (void)turnSnakeRight {
    [snake turnRight];
}

- (NSInteger)getSnakeOrientation {
    return snake.direction;
}

@end
