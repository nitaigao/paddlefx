//
//  HelloWorldLayer.h
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 03/03/2011.
//  Copyright Forward 2011. All rights reserved.
//

#import "cocos2d.h"

@class Logic;
@class UI;

@interface Scene : CCLayer
{  
  Logic* gameLogic;
}

+(id) scene;

@end
