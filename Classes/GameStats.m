//
//  GameStats.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 06/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "GameStats.h"

static NSString* SERVER_URL = @"192.168.1.105:9292";
static NSString* GAME = @"paddlefx";


@implementation GameStats

+ (void)activate {
  NSString* urlString = [NSString stringWithFormat:@"http://%@/%@/activation?signature=%@", SERVER_URL, GAME, [Stats signature]];
  [Stats request:urlString];
}

+ (void)onePlayer {
  NSString* urlString = [NSString stringWithFormat:@"http://%@/%@/one-player?signature=%@", SERVER_URL, GAME, [Stats signature]];
  [Stats request:urlString];
}

+ (void)twoPlayer {
  NSString* urlString = [NSString stringWithFormat:@"http://%@/%@/two-player?signature=%@", SERVER_URL, GAME, [Stats signature]];
  [Stats request:urlString];
}

@end
