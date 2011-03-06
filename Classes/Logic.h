//
//  GameLogic.h
//  Pong
//
//  Created by Nicholas Kostelnik on 16/03/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Paddle;
@class Ball;
@class GameOver;
@class Net;
@class Entity;
@class Scene;
@class UI;

#import "Sound.h"

@class CCLayer;

@interface Logic : NSObject {
	
	bool isPlaying;
	bool isSinglePlayer;
	bool isDemo;
	  
  Paddle* player1Paddle;
	Paddle* player2Paddle;
	Ball* ball;
	GameOver* gameOver1;
	GameOver* gameOver2;
  Net* net;
  
	Sound* soundSystem;
	
	int player1Score;
	int player2Score;
  
  Scene* scene;  
  UI* ui;
}

- (id)initWithScene:(Scene*)scene;

- (void)onePlayer;
- (void)twoPlayer;

- (void)newGame;
- (void)update:(float)deltaMilliseconds;

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
@end
