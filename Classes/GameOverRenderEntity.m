//
//  GameOverRenderEntity.m
//  Pong
//
//  Created by Nicholas Kostelnik on 13/03/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import "GameOverRenderEntity.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@implementation GameOverRenderEntity

static const GLfloat gameOverVertices[] = {
	-1.1f,  -0.05f,
	1.1f,  -0.05f,
	-1.1f,   0.05f,
	1.1f,   0.05f,
};

- (id)initWithPosition:(CGPoint)initialPosition {
	[super init];
	position = initialPosition;
	dimensions.width = 2.2f;
	dimensions.height = 0.04f;
	r = g = b = 0.0f;
	return self;
}

- (void)draw {
	[super translate: gameOverVertices];
	[super draw];	
}

@end
