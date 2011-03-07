//
//  PaddleGameRenderEntity.m
//  Pong
//
//  Created by Nicholas Kostelnik on 14/02/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import "Paddle.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@implementation Paddle

const float MAX_MOVE_SPEED = 1.2f;

static const GLfloat paddleVertices[] = {
	-0.2f,  -0.03f,
	0.2f,  -0.03f,
	-0.2f,   0.03f,
	0.2f,   0.03f,
};

- (id)initWithPosition:(CGPoint)initialPosition {
	[super init];
	position = initialPosition;
	dimensions.width = 0.4f;
	dimensions.height = 0.06f;
  movingLeft = NO;
  movingRight = NO;
	return self;
}

static const float PADDLE_MAX = 0.69f;

- (void)update:(double)delta {
	float newPosition = self.position.x + (moveSpeed * delta);
	position.x = (newPosition > -PADDLE_MAX && newPosition < PADDLE_MAX) ? newPosition : position.x;
}

- (void)draw {
  glLoadIdentity();
  glTranslatef(0.0f, 0.0f, -2.0f);
	glVertexPointer(2, GL_FLOAT, 0, paddleVertices);
	glTranslatef(position.x, position.y, 0.0f);
  
  glColor4f(r, g, b, 1.0f);
  
  glDisable(GL_TEXTURE_2D);
  glDisableClientState(GL_TEXTURE_COORD_ARRAY);
  glDisableClientState(GL_COLOR_ARRAY);
  
  glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
  
  glEnableClientState(GL_TEXTURE_COORD_ARRAY);
  glEnableClientState(GL_COLOR_ARRAY);
  glEnable(GL_TEXTURE_2D);
}

- (void)startMoveLeft {
  movingLeft = YES;
	moveSpeed = -MAX_MOVE_SPEED;
}

- (void)stopMoveLeft {
  movingLeft = NO;
  if (!movingLeft && !movingRight) {
   [self stop];
  }
}

- (void)stop {
  movingRight = NO;
  movingLeft = NO;
  moveSpeed = 0.0f; 
}

- (void)stopMoveRight {
  movingRight = NO;
  if (!movingLeft && !movingRight) {
    [self stop];
  }  
}

- (void)startMoveRight {
  movingRight = YES;
	moveSpeed = MAX_MOVE_SPEED;
}

- (void)dealloc {
    [super dealloc];
}


@end
