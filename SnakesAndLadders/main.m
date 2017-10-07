//
//  main.m
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Player.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        bool doContinue = YES;
        
        Player *player1 = [Player new];
        
        Player *currentPlayer = player1;
        
        NSLog(@"🐍 Welcome to Snakes and Ladders! ☰");
        NSLog(@"Type r to roll");
        
        while (!player1.gameOver) {
            NSString *response = [InputCollector inputForPrompt:@""];
            
            if(!([response isEqualToString:@"r"] || [response isEqualToString:@"roll"])){
                if([response isEqualToString:@"q"] || [response isEqualToString:@"quit"]){
                    break;
                } else {
                    NSLog(@"Try again");
                }
            } else {
                [currentPlayer roll];
                NSLog(@"%@", [currentPlayer output]);
            }
            
            
        }
        
        
    }
    return 0;
}
