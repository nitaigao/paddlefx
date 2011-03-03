//
//  Menu.h
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Menu : CCSprite {
  id target;
}

- (id)init:(id)t;
- (void)onePlayer:(id)sender;

@end
