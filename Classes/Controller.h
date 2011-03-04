//
//  Controller.h
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Controller : CCSprite {  
  NSMutableArray *buttons;
  id target;
}

- (id)init:(id)t;

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event;

@end
