//
//  main.m
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        bool doContinue = YES;
        
        
        
        NSLog(@"🐍 Welcome to Snakes and Ladders! ☰");
        NSLog(@"Type r to roll");
        
        while (doContinue) {
            NSString *response = [InputCollector inputForPrompt:@""];
            
            if(!([response isEqualToString:@"r"] || [response isEqualToString:@"roll"])){
                if([response isEqualToString:@"quit"]){
                    doContinue = NO;
                } else {
                    NSLog(@"Try again");
                }
            } else {
                
                int roll = arc4random_uniform(6)+1;
                NSLog(@"%d", roll);
            }
            
            
        }
        
        
    }
    return 0;
}
