//
//  HelloWorldLayer.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 03/03/2011.
//  Copyright Forward 2011. All rights reserved.
//

#import "GameScene.h"
#import "GameLogic.h"
#import "UI.h"

@implementation GameScene

+(id) scene
{
	CCScene *scene = [CCScene node];
	GameScene *layer = [GameScene node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init] )) {    
    gameLogic = [[GameLogic alloc] initWithScene:self];
   
    ui = [[UI alloc]init:gameLogic];
    [self addChild:ui];

    [self schedule:@selector(update:) interval:1.0f/120.0f];
    
	}
	return self;
}

- (void)update:(ccTime)dt {
  [gameLogic update:dt]; 
}

- (void)hideMenu {
  [ui hideMenu];
}

@end