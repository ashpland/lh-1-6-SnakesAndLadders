//
//  Player.h
//  SnakesAndLadders
//
//  Created by Andrew on 2017-10-06.
//  Copyright © 2017 Andrew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, readwrite) NSInteger currentSquare;

-(void)roll;

@end
