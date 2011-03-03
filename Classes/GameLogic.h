//
//  GameLogic.h
//  Pong
//
//  Created by Nicholas Kostelnik on 16/03/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PaddleGameRenderEntity;
@class BallGameRenderEntity;
@class GameOverRenderEntity;
@class TennisNetGameRenderEntity;
@class GameRenderEntity;
@class GameScene;

#import "PlayerScores.h"
#import "SoundSystem.h"

@class CCLayer;

@interface GameLogic : NSObject {
	
	bool isPlaying;
	bool isSinglePlayer;
	bool isDemo;
	  
  PaddleGameRenderEntity* player1Paddle;
	PaddleGameRenderEntity* player2Paddle;
	BallGameRenderEntity* ball;
	GameOverRenderEntity* gameOver1;
	GameOverRenderEntity* gameOver2;
  TennisNetGameRenderEntity* net;
  
	SoundSystem* soundSystem;
	
	int player1Score;
	int player2Score;
  
  GameScene* scene;
  
}

- (id)initWithScene:(GameScene*)scene;
- (void)onePlayer;
- (void)twoPlayer;
- (void)addPlayer1Paddle:(PaddleGameRenderEntity*)entity;
- (void)addPlayer2Paddle:(PaddleGameRenderEntity*)entity;
- (void)addBall:(GameRenderEntity*)entity;
- (void)addGameOver1:(GameOverRenderEntity*)entity;
- (void)addGameOver2:(GameOverRenderEntity*)entity;
- (PlayerScores*)reportScores;

- (void)newGame;
- (void)setIsSinglePlayer:(bool)singlePlayer;
- (void)update:(float)deltaMilliseconds;

@end
