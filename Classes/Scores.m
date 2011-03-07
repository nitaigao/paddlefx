//
//  Scores.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "Scores.h"
#import "Constants.h"


@implementation Scores

- (id) init
{
  self = [super init];
  if (self != nil) {
    player1score = [[CCLabelTTF alloc] initWithString:@"0" fontName:FONT_NAME fontSize:FONT_SIZE];
    player1score.position = ccp(-150, 0);
    [self addChild:player1score];
    
    player2score = [[CCLabelTTF alloc] initWithString:@"0" fontName:FONT_NAME fontSize:FONT_SIZE];
    player2score.position = ccp(150, 0);
    [self addChild:player2score];
  }
  return self;
}

- (void)setPlayer1:(int)score {
  [player1score setString:[NSString stringWithFormat:@"%d", score]];
}

- (void)setPlayer2:(int)score {
  [player2score setString:[NSString stringWithFormat:@"%d", score]];
}



@end
