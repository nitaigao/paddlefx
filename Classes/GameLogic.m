//
//  GameLogic.m
//  Pong
//
//  Created by Nicholas Kostelnik on 16/03/2010.
//  Copyright 2010 Black Art Studios. All rights reserved.
//

#import "GameLogic.h"

#import "Direction.h"

#import "PaddleGameRenderEntity.h"
#import "BallGameRenderEntity.h"
#import "GameOverRenderEntity.h"
#import "TennisNetGameRenderEntity.h"
#import "GameScene.h"


@implementation GameLogic

- (void)dealloc {
	[super dealloc];
	[soundSystem dealloc];
};

- (id)initWithScene:(GameScene*)s {
	isDemo = true;
	isPlaying = false;
	isSinglePlayer = false;
	soundSystem = [[SoundSystem alloc]init];
  scene = s;
  
  player1Paddle = [[PaddleGameRenderEntity alloc]initWithPosition:CGPointMake(0.0f, -0.7f)];
  [scene addChild:player1Paddle];
  [self addPlayer1Paddle:player1Paddle];
  
  player2Paddle = [[PaddleGameRenderEntity alloc]initWithPosition:CGPointMake(0.0f, 0.7f)];
  [scene addChild:player2Paddle];
  [self addPlayer2Paddle:player2Paddle];
  
  ball = [[BallGameRenderEntity alloc] initWithPosition:CGPointZero];
  [scene addChild:ball];
  [self addBall:ball];
  
  net = [[TennisNetGameRenderEntity alloc] initWithPosition:CGPointMake(-1.0f, 0.0f)];
  [scene addChild:net];
  
  gameOver1 = [[GameOverRenderEntity alloc]initWithPosition:CGPointMake(0.0f, -0.8f)];
  [scene addChild:gameOver1];
  [self addGameOver1:gameOver1];
  
  gameOver2 = [[GameOverRenderEntity alloc]initWithPosition:CGPointMake(0.0f, 0.8f)];
  [scene addChild:gameOver2];
  [self addGameOver2:gameOver2];
  
  [ball demo];

  
	return self;
}

- (void)player1LeftDown {
  if (isPlaying) {
    [player1Paddle startMoveLeft]; 
  }
}

- (void)player1LeftUp {
  if (isPlaying) {
    [player1Paddle stop]; 
  }
}

- (void)player1RightDown {
  if (isPlaying) {
    [player1Paddle startMoveRight]; 
  }
}

- (void)player1RightUp {
  if (isPlaying) {
    [player1Paddle stop]; 
  }
}

- (void)player2LeftDown {
  if (isPlaying) {
    [player2Paddle startMoveLeft]; 
  }
}

- (void)player2LeftUp {
  [player2Paddle stop]; 
}

- (void)player2RightDown {
  [player2Paddle startMoveRight]; 
}

- (void)player2RightUp {
  [player2Paddle stop]; 
}

- (void)onePlayer {
  [scene hideMenu];
  [self setIsSinglePlayer:YES];
  [self newGame];
}

- (void)twoPlayer { 
  [scene hideMenu];
  [self setIsSinglePlayer:NO];
  [self newGame];
}

- (void)addPlayer1Paddle:(PaddleGameRenderEntity*)entity { 
	player1Paddle = entity;
}

- (void)addPlayer2Paddle:(PaddleGameRenderEntity*)entity {
	player2Paddle = entity;
}

- (void)addGameOver1:(GameOverRenderEntity*)entity {
	gameOver1 = entity;
}

- (void)addGameOver2:(GameOverRenderEntity*)entity {
	gameOver2 = entity;
}

- (void)addBall:(BallGameRenderEntity*)entity {
	ball = entity;
}

- (void)setIsSinglePlayer:(bool)singlePlayer {
	isSinglePlayer = singlePlayer;
}

- (void)runAI {
	int direction = [ball sideOf:player2Paddle];
	
	if (direction == LEFT) {
		[player2Paddle startMoveRight];
	}
	else if (direction == RIGHT) {
		[player2Paddle startMoveLeft];
	}
	else {
		[player2Paddle stop];
	}
}

- (PlayerScores*)reportScores {
	return [[[PlayerScores alloc]initWithScores:player1Score player2:player2Score] autorelease];
}

- (void)resumeUpdates {
	isPlaying = true;
}

- (void)pauseUpdates:(NSTimeInterval)milliseconds {
	isPlaying = false;
	[NSTimer scheduledTimerWithTimeInterval:milliseconds target:self selector:@selector(resumeUpdates) userInfo:nil repeats:FALSE];
}

- (void)newRound:(int) winningPlayer {
	[ball serve:(winningPlayer == PLAYER1) ? 1.0f : -1.0f];
	[self pauseUpdates:1.0f];
}

- (void)newGame {
	isDemo = false;
	isPlaying = true;
	player1Score = 0;
	player2Score = 0;
	[self newRound:PLAYER1];
}

- (bool)hitTestGameOver:(GameOverRenderEntity*)entity player:(int)player {
	if ([ball hitTestEntity:entity]) {
		if (player == PLAYER1) {
			player1Score += 1;
			[self newRound:PLAYER1];
		}
		if (player == PLAYER2) {
			player2Score += 1;
			[self newRound:PLAYER2];
		}
		return true;
	}
	return false;
}


- (void)hitTest {	
	if([ball hitTestEntity:player1Paddle] ||
	   [ball hitTestEntity:player2Paddle]) {
		if(isPlaying) {
      [soundSystem playHitSound];
		}
	}
	
	if ([ball hitTestSides]) {
		if(isPlaying) {
			if(isPlaying) {
				[soundSystem playBounceSound];
			}
		}
	}
	
	if ([self hitTestGameOver:gameOver1 player:PLAYER2] ||
      [self hitTestGameOver:gameOver2 player:PLAYER1] ) {
		[soundSystem playScoreSound];		
	}
}

- (void)update:(float)deltaMilliseconds {
	[player1Paddle update:deltaMilliseconds];
	[player2Paddle update:deltaMilliseconds];
	
	if (isPlaying || isDemo) {
		[ball update:deltaMilliseconds];
	}
	
	if (isSinglePlayer) {
		[self runAI];
	}
	
	[self hitTest];
}

@end
