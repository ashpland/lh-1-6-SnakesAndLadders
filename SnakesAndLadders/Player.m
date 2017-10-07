//
//  Player.m
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "Player.h"

@interface Player ()

@property (nonatomic, readwrite) NSString *output;

@end

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
            self.output = [NSString stringWithFormat:@"\nYou rolled %d\n Move to %ld\n☰ Ladder! ☰\n Up to %ld!\n", roll, (long)self.currentSquare, (long)newSquare];
        } else {
            self.output = [NSString stringWithFormat:@"\nYou rolled %d\n Move to %ld\n🐍 Snake! 🐍\n Down to %ld!\n", roll, (long)self.currentSquare, (long)newSquare];

        }
        
        self.currentSquare = newSquare;
    } else {
        self.output = [NSString stringWithFormat:@"\nYou rolled %d\n Move to %ld\n", roll, (long)self.currentSquare];

    }
    
}


@end
