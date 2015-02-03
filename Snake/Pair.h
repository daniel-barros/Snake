//
//  Pair.h
//  Snake
//
//  Created by Daniel Barros on 8/9/14.
//  Copyright (c) 2014 Daniel Barros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pair : NSObject

@property int x;
@property int y;

- (id)initWithX:(int)x y:(int)y;
+ (id)pairWithX:(int)x y:(int)y;
- (BOOL)isEqualTo:(id)object;

@end
