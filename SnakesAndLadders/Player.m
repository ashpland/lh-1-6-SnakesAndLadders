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
@property (nonatomic, readwrite) bool gameOver;

@end

@implementation Player

- (instancetype)init
{
    return [self initWithName:@"Default Player"];
}

-(instancetype)initWithName:(NSString *)playerName
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _name = playerName;
        _gameLogic = @{
                       @4:@14,@9:@31,@17:@7,@20:@38,@28:@84,@40:@58,@51:@67,@63:@81,@64:@60,@89:@26,@95:@75,@99:@78
                       };

    }
    return self;
}

-(bool)roll
{
    int roll = arc4random_uniform(6)+1;
    //int roll = 100;
    self.currentSquare = self.currentSquare + roll;
    
    NSMutableString *rollOutput = [NSMutableString stringWithFormat:@"\n%@ rolled %d\n      Move to %ld\n", self, roll, (long)self.currentSquare];
    
    
    if ([self.gameLogic objectForKey:[NSNumber numberWithInteger:self.currentSquare]]) {
        NSInteger newSquare = [[self.gameLogic objectForKey:[NSNumber numberWithInteger:self.currentSquare]] integerValue];
 
        if (newSquare > self.currentSquare) {
            [rollOutput appendFormat:@"    🚀 Rocket! 🚀\n      Up to %ld!\n", (long)newSquare];
        }
        else {
            [rollOutput appendFormat:@"    🐍 Snake! 🐍\n      Down to %ld!\n", (long)newSquare];
        }
        self.currentSquare = newSquare;
    }
    else {
        if(self.currentSquare >= 100){
            self.output = [NSString stringWithFormat:@"\n%@ rolled %d\n      Move to 100!\n     🏆 You Win! 🏆\n\n", self, roll];
            return YES;
        }
    }
    self.output = rollOutput;
    return NO;
}

-(NSString *)heart
{
    NSInteger playerNumber = [[[self.name componentsSeparatedByString:@" "] objectAtIndex:1] integerValue];
    
    
    switch (playerNumber) {
        case 1:
            return @"❤️";
            break;
        case 2:
            return @"💙";
            break;
        case 3:
            return @"💛";
            break;
        case 4:
            return @"💚";
            break;
        default:
            return @"💜";
            break;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", self.heart, self.name];
}

-(NSString *)score
{
    return [NSString stringWithFormat:@"%@: %lu", self.heart, (long)self.currentSquare];
}

@end
