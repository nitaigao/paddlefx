//
//  Menu.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "Menu.h"
#import "Constants.h"


@implementation Menu

- (id)init:(id)t
{
  self = [super init];
  if (self != nil) {
    target = t;
    [CCMenuItemFont setFontName:FONT_NAME];
    [CCMenuItemFont setFontSize:FONT_SIZE];
    
    CCMenuItem *onePlayer = [CCMenuItemFont itemFromString:@"One Player" target:self selector:@selector(onePlayer:)];
    onePlayer.position = ccp(0, 80);
    
    CCMenuItem *twoPlayer = [CCMenuItemFont itemFromString:@"Two Player" target:self selector:@selector(twoPlayer:)];
    twoPlayer.position = ccp(0, -80);
    
    CCMenu *menu = [CCMenu menuWithItems: onePlayer, twoPlayer, nil];
    [self addChild:menu];
  }
  return self;
}

- (void)onePlayer:(id)sender {
  [target performSelector:@selector(onePlayer)];
}

- (void)twoPlayer:(id)sender {
  [target performSelector:@selector(twoPlayer)];
}

@end
