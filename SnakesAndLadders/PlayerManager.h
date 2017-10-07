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

@property (nonatomic, readwrite) NSMutableArray<Player *> *players;
@property (nonatomic, readonly) bool gameOver;
@property (nonatomic, readonly) NSString *output;

-(void)createPlayers:(NSInteger)numberOfPlayers;
-(void)roll;


@end
