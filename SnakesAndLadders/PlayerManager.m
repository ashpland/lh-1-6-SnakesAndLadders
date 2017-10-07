//
//  PlayerManager.m
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-07.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [NSMutableArray<Player *> new];
        _gameOver = NO;

    }
    return self;
}

-(void)createPlayers:(NSInteger)numberOfPlayers {
    for (int i = 0; i < numberOfPlayers; i++) {
        NSString *playerName = [NSString stringWithFormat:@"Player %d", i + 1];
        Player *newPlayer = [[Player alloc] initWithName:playerName];
        [self.players addObject:newPlayer];
    }
}

- (NSString *)description
{
    NSMutableString *descriptionOutput = [NSMutableString new];
    for(Player *player in self.players){
        [descriptionOutput appendString:[NSString stringWithFormat:@"%@\n",player.description]];
    }
    return descriptionOutput;
}

-(void)roll{
    
}

@end
