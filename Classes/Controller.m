//
//  Controller.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "Controller.h"


@implementation Controller

- (id)init:(id)t
{
  self = [super init];
  if (self != nil) {
    
    player1Left = [CCSprite spriteWithFile:@"Arrow-Left.png"];
    [self addChild:player1Left];
    
    player1Right = [CCSprite spriteWithFile:@"Arrow-Right.png"];
    [self addChild:player1Right];
    
    player2Left = [CCSprite spriteWithFile:@"Arrow-Right.png"];
    [self addChild:player2Left];

    player2Right = [CCSprite spriteWithFile:@"Arrow-Left.png"];
    [self addChild:player2Right];

  }
  return self;
}


@end
