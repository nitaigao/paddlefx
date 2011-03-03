//
//  BallGameRenderEntity.m
//  Pong
//
//  Created by Nicholas Kostelnik on 02/03/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import "BallGameRenderEntity.h"

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

#import <AudioToolbox/AudioToolbox.h>

#import "Direction.h"

@implementation BallGameRenderEntity

float const ZEROF = 0.0f;
float const ANGLE_MODIFIER = 5.0f;
float const TOLERANCE = 0.1f;
float const SCREEN_SIZE = 1.0f;


float const MAX_SPEED_X = 1.5f;

float const MIN_SPEED_Y = 0.5f;
float const MAX_SPEED_Y = 1.0f;

static const GLfloat paddleVertices[] = {
	-0.02f,  -0.02f,
	0.02f,  -0.02f,
	-0.02f,   0.02f,
	0.02f,   0.02f,
};

/* initialize state to random bits */
static unsigned long state[16];
/* init should also reset this to 0 */
static unsigned int iindex = 0;
/* return 32 bit random number */
unsigned long WELLRNG512(void)
{
	unsigned long a, b, c, d;
	a = state[iindex];
	c = state[(iindex+13)&15];
	b = a^c^(a<<16)^(c<<15);
	c = state[(iindex+9)&15];
	c ^= (c>>11);
	a = state[iindex] = b^c;
	d = a^((a<<5)&0xDA442D20UL);
	iindex = (iindex + 15)&15;
	a = state[iindex];
	state[iindex] = a^b^d^(a<<2)^(b<<18)^(c<<28);
	return state[iindex];
}

- (id)initWithPosition:(CGPoint)initialPosition {
	[super init];
	startPosition = initialPosition;
	dimensions.height = 0.04f;
	dimensions.width = 0.04f;
	isDemo = false;
	
	srand(time(0));
	
	for (int i = 0; i < 16; i++) {
		state[i] = rand();
	}
	
	return self;
}

- (void)demo {
	ySpeed = 1.0f;
	xSpeed = 0.0f;
	position.y = 0.0f;
	position.x = 0.0f;
	isDemo = true;
}

- (void)serve:(int)serveDirection {
	isDemo = false;
	ySpeed = serveDirection;
	xSpeed = (WELLRNG512()) ? -0.5f : 0.5f;
	position = startPosition;
	position.y = -serveDirection / 2.0f;
	position.x = (WELLRNG512()) ? position.x + 0.5f : position.x - 0.5f;  
}

- (void)setYBounceSpeed {	
	float shouldSpeedAdjust = (WELLRNG512() % 20) / 10.0f;
	shouldSpeedAdjust = round(shouldSpeedAdjust);
	
	if (shouldSpeedAdjust) {
		float speedMultiplier = (WELLRNG512() % 20 + 3) / 10.0f;
		ySpeed = (ySpeed > 0.0f) ? MAX_SPEED_Y * speedMultiplier: -MAX_SPEED_Y * speedMultiplier;
	}
	
	if (ySpeed > 0.0f && ySpeed > MAX_SPEED_Y ) {
		ySpeed = MAX_SPEED_Y;
		return;
	}
	
	if (ySpeed < 0.0f && ySpeed < -MAX_SPEED_Y ) {
		ySpeed = -MAX_SPEED_Y;
		return;
	}
}

- (void)bounce:(float)xPosition {
	xSpeed += xPosition * ANGLE_MODIFIER;	
	xSpeed = (xSpeed > MAX_SPEED_X) ? MAX_SPEED_X : xSpeed;
	xSpeed = (xSpeed < -MAX_SPEED_X ) ? -MAX_SPEED_X : xSpeed;	
	
	ySpeed = -ySpeed;
	
	if (!isDemo) {
		[self setYBounceSpeed];
	}
}

- (void)update:(double)delta {	
	position.y += (ySpeed * delta);
	position.x += (xSpeed * delta);
  NSLog(@"update");
}

- (bool) test:(float)difference factor:(float)factor {
	return (difference >= ZEROF && difference <= factor);
}

- (bool) yTest:(GameRenderEntity *) entity {

	float difference = position.y - entity.position.y;
	
	if (difference > -0.01f && difference < 0.01f) {
		if (ySpeed < 0)
		{
			float bottom = position.y - dimensions.height;
			if (bottom <= entity.position.y)
			{
				position.y = entity.position.y + dimensions.height;
				return true;
			}
		}
		
		if (ySpeed > 0) {
			float bottom = entity.position.y - entity.dimensions.height;
			if (position.y >= bottom)
			{
				position.y = bottom;
				return true;
			}
		}
	}	
	
	return false;
}

- (bool) xTest:(GameRenderEntity *) entity  {

	float entityRight = entity.position.x + (entity.dimensions.width / 2);
	float entityLeft = entity.position.x - (entity.dimensions.width / 2);
	float ballRight = position.x + (dimensions.width / 2);
	float ballLeft = position.x - (dimensions.width / 2);
	
	if (ballRight >= entityLeft && ballLeft <= entityRight) {
		return true;
	}
	
	return false;
	
}

- (bool)hitTestEntity:(GameRenderEntity*) entity {
	if ( [self xTest: entity]) {
		if ([self yTest: entity]) {
			[self bounce:position.x - entity.position.x];
			return TRUE;	
		}
	}
	
	return FALSE;
}

- (bool)hitTestSides {
	if (position.x <= -SCREEN_SIZE) {
		xSpeed = -xSpeed;
		position.x = -SCREEN_SIZE;
		return true;
	}
		
	if (position.x >= SCREEN_SIZE) {
		xSpeed = -xSpeed;
		position.x = SCREEN_SIZE - dimensions.width;
		return true;
	}
	
	return false;
}

- (int)sideOf:(GameRenderEntity*)entity {
	float difference = entity.position.x - self.position.x;
	
	if (difference < -TOLERANCE) {
		return LEFT;
	} 
	
	if (difference > TOLERANCE) {
		return RIGHT;
	}
	
	return MIDDLE;
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

@end