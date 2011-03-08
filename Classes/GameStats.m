//
//  GameStats.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 06/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "GameStats.h"

@implementation GameStats

+ (void)activate {
  [Stats report:@"activation"];
}

+ (void)deactivate {
  [Stats report:@"deactivation"];
}

+ (void)onePlayer {
  [Stats report:@"one-player"];
}

+ (void)twoPlayer {
  [Stats report:@"two-player"];
}

@end
