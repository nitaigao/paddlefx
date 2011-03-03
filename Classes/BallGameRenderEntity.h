//
//  BallGameRenderEntity.h
//  Pong
//
//  Created by Nicholas Kostelnik on 02/03/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GameRenderEntity.h"

@interface BallGameRenderEntity : GameRenderEntity {
	float ySpeed;
	float xSpeed;
	bool isDemo;
	
	CGPoint startPosition;
}

- (id)initWithPosition:(CGPoint)initialPosition;
- (bool)hitTestEntity:(GameRenderEntity*) entity;
- (bool)hitTestSides;
- (void)demo;
- (void)serve:(int)serveDirection;
- (int)sideOf:(GameRenderEntity*)entity;

@end
