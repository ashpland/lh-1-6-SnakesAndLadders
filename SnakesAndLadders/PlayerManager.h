//
//  PlayerManager.h
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-07.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerManager : NSObject

@property (nonatomic, readwrite, strong) NSMutableArray<Player *> *players;
@property (nonatomic, readonly) bool gameOver;
@property (nonatomic, readonly, strong) NSString *output;
@property (nonatomic, readwrite) NSInteger currentIndex;
@property (nonatomic, readonly, strong) NSString *score;

-(void)createPlayers:(NSInteger)numberOfPlayers;
-(Player *)currentPlayer;
-(void)roll;
-(void)endTurn;

@end
