//
//  PaddleGameRenderEntity.h
//  Pong
//
//  Created by Nicholas Kostelnik on 14/02/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Entity.h"

@interface Paddle : Entity {
	float moveSpeed;
}

- (id)initWithPosition:(CGPoint)initialPosition;

- (void)startMoveLeft;
- (void)startMoveRight;
- (void)stop;

@end
