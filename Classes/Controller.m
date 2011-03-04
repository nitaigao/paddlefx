//
//  Controller.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "Controller.h"
#import "Button.h"


@implementation Controller

- (id)init:(id)t
{
  self = [super init];
  if (self != nil) {
    target = t;
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    Button* player1Left = [[Button alloc] initWithTarget:t touched:@selector(player1LeftDown) released:@selector(player1LeftUp)];
    player1Left.position = ccp(80, 100);
    [self addChild:player1Left];
    
    Button* player1Right = [[Button alloc] initWithTarget:t touched:@selector(player1RightDown) released:@selector(player1RightUp)];
    player1Right.position = ccp(screenSize.width - 80, 100);
    player1Right.rotation = 180;
    [self addChild:player1Right];
    
    Button* player2Right = [[Button alloc] initWithTarget:t touched:@selector(player2RightDown) released:@selector(player2RightUp)];
    player2Right.position = ccp(screenSize.width - 80, screenSize.height - 80);
    player2Right.rotation = 180;
    [self addChild:player2Right];
    
    Button* player2Left = [[Button alloc] initWithTarget:t touched:@selector(player2LeftDown) released:@selector(player2LeftUp)];
    player2Left.position = ccp(80, screenSize.height - 80);
    [self addChild:player2Left];
    
    buttons = [[NSMutableArray alloc]initWithObjects:player1Left, player1Right, player2Right, player2Left, nil];
  }
  return self;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  for (Button* button in buttons) {
    [button touchBegan:touch withEvent:event];
  }
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
  for (Button* button in buttons) {
    [button touchEnded:touch withEvent:event];
  }  
}

@end
