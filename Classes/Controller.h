//
//  Controller.h
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class Button;

@interface Controller : CCSprite {  
  NSMutableArray *buttons;
  id target;
  
  Button* player1Left;
  Button* player1Right;
  Button* player2Right;
  Button* player2Left;
}

- (id)init:(id)t;

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event;

- (void)hideAll;
- (void)showPlayer1;
- (void)showBothPlayers;

@end
