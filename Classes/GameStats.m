//
//  GameStats.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 06/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "GameStats.h"

static NSString* GAME = @"paddlefx";

@implementation GameStats

+ (void)activate {
  NSString* urlString = [NSString stringWithFormat:@"http://%@/%@/activation?signature=%@", [Stats host], GAME, [Stats signature]];
  NSLog(@"%@", urlString);
  [Stats request:urlString];
}

+ (void)onePlayer {
  NSString* urlString = [NSString stringWithFormat:@"http://%@/%@/one-player?signature=%@", [Stats host], GAME, [Stats signature]];
  [Stats request:urlString];
}

+ (void)twoPlayer {
  NSString* urlString = [NSString stringWithFormat:@"http://%@/%@/two-player?signature=%@", [Stats host], GAME, [Stats signature]];
  [Stats request:urlString];
}

@end
