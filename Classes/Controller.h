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
  
  CCSprite* player1Left;
  CCSprite* player1Right;
  
  CCSprite* player2Left;
  CCSprite* player2Right;
}

- (id)init:(id)t;

@end
