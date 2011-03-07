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
  BOOL movingLeft;
  BOOL movingRight;
}

- (id)initWithPosition:(CGPoint)initialPosition;

- (void)startMoveLeft;
- (void)startMoveRight;
- (void)stopMoveLeft;
- (void)stopMoveRight;
- (void)stop;

@end
