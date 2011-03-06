//
//  GameRenderEntity.h
//  Pong
//
//  Created by Nicholas Kostelnik on 14/02/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

#include "cocos2d.h"

@interface Entity : CCSprite {
	
	CGPoint position;
	CGSize dimensions;
	
	float r, g, b;

}

@property (nonatomic) CGPoint position;
@property (nonatomic) CGSize dimensions;

- (void)draw;
- (void)translate:(const CGFloat*)vertices;
- (void)update:(double)delta;

@end


