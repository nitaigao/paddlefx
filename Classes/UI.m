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
    [self addChild:controller];
  }
  return self;
}

- (void)hideMenu {
  [self removeChild:menu cleanup:NO];
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  [controller touchBegan:touch withEvent:event];
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
  [controller touchEnded:touch withEvent:event];
}

@end
