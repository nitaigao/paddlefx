//
//  Button.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "Button.h"


@implementation Button

- (id) init
{
  self = [super init];
  if (self != nil) {
    spriteBatch = [CCSpriteBatchNode batchNodeWithFile:@"Arrow-Left-Sheet.png"];
    upState = [CCSprite spriteWithBatchNode:spriteBatch rect:CGRectMake(0, 0, 128, 128)];
    [spriteBatch addChild:upState];
    downState = [CCSprite spriteWithBatchNode:spriteBatch rect:CGRectMake(128, 0, 128, 128)];
    [spriteBatch addChild:downState];
    [downState setVisible:NO];
    [self addChild:spriteBatch];
  }
  return self;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
  CGPoint rawLocation = [touch locationInView: [touch view]];
  CGPoint touchLocation = [[CCDirector sharedDirector] convertToGL:rawLocation];

  CGSize buttonRect = [upState boundingBox].size;
  CGRect touchRect = CGRectMake(self.position.x - (buttonRect.width / 2) * 2, 
                                self.position.y - (buttonRect.height / 2) * 2, 
                                buttonRect.width * 2, buttonRect.height * 2);


  if (CGRectContainsPoint(touchRect, touchLocation)) {
    [downState setVisible:YES];
    [upState setVisible:NO];
  }
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
  [downState setVisible:NO];
  [upState setVisible:YES];
}


@end


