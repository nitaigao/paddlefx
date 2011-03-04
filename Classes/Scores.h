//
//  Scores.h
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 04/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "cocos2d.h"

@interface Scores : CCSprite {
  
  CCLabelTTF *player1score;
  CCLabelTTF *player2score;

}

- (void)setPlayer1:(int)score;
- (void)setPlayer2:(int)score;

@end
