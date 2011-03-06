//
//  BallGameRenderEntity.h
//  Pong
//
//  Created by Nicholas Kostelnik on 02/03/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Entity.h"

@interface Ball : Entity {
	float ySpeed;
	float xSpeed;
	bool isDemo;
	
	CGPoint startPosition;
}

- (id)initWithPosition:(CGPoint)initialPosition;
- (bool)hitTestEntity:(Entity*) entity;
- (bool)hitTestSides;
- (void)demo;
- (void)serve:(int)serveDirection;
- (int)sideOf:(Entity*)entity;

@end
