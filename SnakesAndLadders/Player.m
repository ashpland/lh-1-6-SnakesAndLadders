//
//  Player.m
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "Player.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
    }
    return self;
}

-(void)roll
{
    int roll = arc4random_uniform(6)+1;
    self.currentSquare = self.currentSquare + roll;
    
    NSLog(@"Rolled %d\nSquare %d", roll, self.currentSquare);
}

@end
