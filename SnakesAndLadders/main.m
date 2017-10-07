//
//  main.m
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "PlayerManager.h"

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Initialize
        
        PlayerManager *playerManager = [PlayerManager new];
                
        NSLog(@"🐍 Welcome to Snakes and Rockets! 🚀");
        
        //
        // Get players
        //
        
        do {
            NSLog(@"Please enter the number of players (1-4): ");
            NSInteger numberOfPlayers =[[InputCollector inputForPrompt:@"> "] integerValue];
            // the 5 is intention, for a secret extra player
            if (1 <= numberOfPlayers && numberOfPlayers <= 5) {
                [playerManager createPlayers:numberOfPlayers];
            }
        } while (playerManager.players.count == 0);
        
        NSLog(@"Here are the players:");
        NSLog(@"%@", playerManager);
        
        //
        // Start game
        //
        
        NSLog(@"Type r to roll");
        
        while (!playerManager.gameOver) {
            NSString *currentPlayerHeart = playerManager.currentPlayer.heart;
            NSString *response = [InputCollector inputForPrompt:[NSString stringWithFormat:@"%@ ", currentPlayerHeart]];
            
            if(!([response isEqualToString:@"r"] || [response isEqualToString:@"roll"])){
                if([response isEqualToString:@"q"] || [response isEqualToString:@"quit"]){
                    break;
                } else {
                    NSLog(@"Try again");
                }
            } else {
                [playerManager roll];
                NSLog(@"%@", [playerManager output]);
                [playerManager endTurn];
            }
        }
    }
    return 0;
}
