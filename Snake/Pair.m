//
//  Pair.m
//  Snake
//
//  Created by Daniel Barros on 8/9/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import "Pair.h"

@implementation Pair

- (id)init {
    return [self initWithX:0 y:0];
}

- (id)initWithX:(int)x y:(int)y {
    self = [super init];
    
    if (self) {
        _x = x;
        _y = y;
    }
    
    return self;
}

+ (id)pairWithX:(int)x y:(int)y {
    id pair = [[Pair alloc] initWithX:x y:y];
    return pair;
}

- (BOOL)isEqualTo:(id)object {
    Pair *other = (Pair*)object;
    return _x == other.x && _y == other.y;
}

@end
