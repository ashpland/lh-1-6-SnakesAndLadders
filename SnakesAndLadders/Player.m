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
        _gameLogic = @{
           @4:@14,@9:@31,@17:@7,@20:@38,@28:@84,@40:@58,@51:@67,@63:@81,@64:@60,@89:@26,@95:@75,@99:@78
           };
    }
    return self;
}

-(void)roll
{
    int roll = arc4random_uniform(6)+1;
    //int roll = 4;
    self.currentSquare = self.currentSquare + roll;
    
    if ([self.gameLogic objectForKey:[NSNumber numberWithInteger:self.currentSquare]]) {
        NSInteger newSquare = [[self.gameLogic objectForKey:[NSNumber numberWithInteger:self.currentSquare]] integerValue];
        if (newSquare > self.currentSquare) {
            NSLog(@"☰ Ladder! ☰");
        } else {
            NSLog(@"🐍 Snake! 🐍");
        }
        
        self.currentSquare = newSquare;
//        NSInteger testSquare = [[NSNumber numberWithInteger:777] integerValue];
//        self.currentSquare = testSquare;

    }
    
    NSLog(@"Rolled %d\nSquare %ld", roll, (long)self.currentSquare);
}


@end
