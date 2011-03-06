//
//  UI.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "UI.h"
#import "Menu.h"
#import "Controller.h"
#import "Scores.h"

@implementation UI

- (id)init:(id)t
{
  self = [super init];
  if (self != nil) {
    menu = [[Menu alloc] init:t];
    [self addChild:menu];
    
    controller = [[Controller alloc] init:t];
    [controller hideAll];
    [self addChild:controller];
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    scores = [[Scores alloc]init];
    scores.position = ccp(screenSize.width - 50, screenSize.height / 2);
    scores.rotation = 90;
  }
  return self;
}

- (void)twoPlayer {
  [self removeChild:menu cleanup:NO];
  [self addChild:scores];
  [controller showBothPlayers];
}

- (void)onePlayer {
  [self removeChild:menu cleanup:NO];
  [self addChild:scores];
  [controller showPlayer1];
}

- (void)setScores:(int)player1 player2:(int)player2 {
  [scores setPlayer1:player1];
  [scores setPlayer2:player2];
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  [controller touchBegan:touch withEvent:event];
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
  [controller touchEnded:touch withEvent:event];
}

@end
