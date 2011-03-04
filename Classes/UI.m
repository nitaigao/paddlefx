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
  }
  return self;
}

- (void)twoPlayer {
  [self removeChild:menu cleanup:NO];
  [controller showBothPlayers];
}

- (void)onePlayer {
  [self removeChild:menu cleanup:NO];
  [controller showPlayer1];
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  [controller touchBegan:touch withEvent:event];
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
  [controller touchEnded:touch withEvent:event];
}

@end
