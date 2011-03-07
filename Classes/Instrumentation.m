//
//  Instrumentation.m
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 06/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import "Instrumentation.h"


@implementation Instrumentation

static Instrumentation* instrumentationInstance = 0;

+ (Instrumentation*)sharedInstrumentation {
  if (!instrumentationInstance) {
    instrumentationInstance = [[Instrumentation alloc] init]; 
  }
  return instrumentationInstance;
}

- (int)playTime {
  return 0; 
}

- (void)activated {
  
}

- (void)deactivated {
  
}


@end