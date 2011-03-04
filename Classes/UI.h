//
//  UI.h
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class Menu;
@class Controller;

@interface UI : CCSprite {
  Menu* menu;
  Controller* controller;
}

- (id)init:(id)t;
- (void)onePlayer;
- (void)twoPlayer;

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event;

@end
