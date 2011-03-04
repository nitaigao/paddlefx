//
//  Button.h
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Button : CCSprite {
  
  CCSpriteBatchNode* spriteBatch;
  CCSprite* upState;
  CCSprite* downState;
  
  id target;
  SEL touched;
  SEL released;

}

- (id)initWithTarget:(id)t touched:(SEL)touch released:(SEL)release;
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event;

@end
