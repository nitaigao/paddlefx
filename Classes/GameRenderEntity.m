//
//  GameRenderEntity.m
//  Pong
//
//  Created by Nicholas Kostelnik on 14/02/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import "GameRenderEntity.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>


@implementation GameRenderEntity

@synthesize position;
@synthesize dimensions;

- (id)init {
	[super init];
	
	position.x = 0.0f;
	position.y = 0.0f;
	
	dimensions.width = 0.0f;
	dimensions.height = 0.0f;
	
	r = g = b = 1.0f;
	
	return self;
}


- (void)update:(double)delta {
	
}

- (void)dealloc {
    [super dealloc];
}

- (void)draw {
  [super draw];
  glColor4f(r, g, b, 1.0f);
  glDisable(GL_TEXTURE_2D);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	glDisableClientState(GL_COLOR_ARRAY);

	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
  
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	glEnableClientState(GL_COLOR_ARRAY);
  glEnable(GL_TEXTURE_2D);
}

- (void)translate:(const CGFloat*)vertices {
	glLoadIdentity();
	glVertexPointer(2, GL_FLOAT, 0, vertices);
	glTranslatef(position.x, position.y, 0.0f);
}

@end
