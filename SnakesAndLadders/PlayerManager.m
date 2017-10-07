//
//  PlayerManager.m
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-07.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import "PlayerManager.h"

@interface PlayerManager ()

@property (nonatomic, readwrite) bool gameOver;

@end

@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [NSMutableArray<Player *> new];
        _gameOver = NO;
        _currentIndex = 0;

    }
    return self;
}

-(void)createPlayers:(NSInteger)numberOfPlayers
{
    for (int i = 0; i < numberOfPlayers; i++) {
        NSString *playerName = [NSString stringWithFormat:@"Player %d", i + 1];
        Player *newPlayer = [[Player alloc] initWithName:playerName];
        [self.players addObject:newPlayer];
    }
}

-(Player *)currentPlayer
{
    return [ self.players objectAtIndex:self.currentIndex % self.players.count];
}

- (NSString *)description
{
    NSMutableString *descriptionOutput = [NSMutableString new];
    for(Player *player in self.players){
        [descriptionOutput appendString:[NSString stringWithFormat:@"%@\n",player.description]];
    }
    return descriptionOutput;
}

-(void)roll
{
    self.gameOver = [self.currentPlayer roll];
}

-(NSString *)output
{
    return self.currentPlayer.output;
}

-(void)endTurn
{
    self.currentIndex = self.currentIndex + 1;
}


@end
