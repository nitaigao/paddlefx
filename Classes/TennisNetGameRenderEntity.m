//
//  TennisNetGameRenderEntity.m
//  Pong
//
//  Created by Nicholas Kostelnik on 13/03/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import "TennisNetGameRenderEntity.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@implementation TennisNetGameRenderEntity

static const GLfloat tennisNetVertices[] = {
	-0.02f,  -0.02f,
	0.02f,  -0.02f,
	-0.02f,   0.02f,
	0.02f,   0.02f,
};

- (id)initWithPositionX:(float)x y:(float)y {
	[super init];
	return self;
}

- (id)initWithPosition:(CGPoint)initialPosition {
	[super init];
	position = initialPosition;
	dimensions.width = 2.2f;
	dimensions.height = 0.04f;	
	return self;
}

- (void)draw {
  glLoadIdentity();
  glTranslatef(0.0f, 0.0f, -2.0f);
	glVertexPointer(2, GL_FLOAT, 0, tennisNetVertices);
	glTranslatef(position.x, position.y, 0.0f);

  glColor4f(r, g, b, 1.0f);
  
  glDisable(GL_TEXTURE_2D);
  glDisableClientState(GL_TEXTURE_COORD_ARRAY);
  glDisableClientState(GL_COLOR_ARRAY);
  
	for (int i = 0; i < 24; i++) {
		glTranslatef(0.08f, position.y, 0.0f);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
  }	

  glEnableClientState(GL_TEXTURE_COORD_ARRAY);
  glEnableClientState(GL_COLOR_ARRAY);
  glEnable(GL_TEXTURE_2D);
}

@end
