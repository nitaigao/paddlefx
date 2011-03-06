#import "Sound.h"

#import "CocosDenshion.h"
#import "SimpleAudioEngine.h"

@implementation Sound

- (id) init
{
  self = [super init];
  if (self != nil) {
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"hit.wav"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"bounce.wav"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"score.wav"];
  }
  return self;
}

- (void)playHitSound { 
  [[SimpleAudioEngine sharedEngine] playEffect:@"hit.wav"];
}

- (void)playBounceSound { 
  [[SimpleAudioEngine sharedEngine] playEffect:@"bounce.wav"];
}

- (void)playScoreSound {    
  [[SimpleAudioEngine sharedEngine] playEffect:@"score.wav"];
}


@end
