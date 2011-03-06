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
	return self;
}

- (void)update:(double)delta {
	float newPosition = self.position.x + (moveSpeed * delta);
	position.x = (newPosition > -0.8 && newPosition < 0.8) ? newPosition : position.x;
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
	moveSpeed = -MAX_MOVE_SPEED;
}

- (void)stop {
	moveSpeed = 0.0f;
}

- (void)startMoveRight {
	moveSpeed = MAX_MOVE_SPEED;
}

- (void)dealloc {
    [super dealloc];
}


@end
