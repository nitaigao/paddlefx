//
//  Instrumentation.h
//  PaddleFX
//
//  Created by Nicholas Kostelnik on 06/03/2011.
//  Copyright 2011 Forward. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Instrumentation : NSObject {

  float activationTime;
  
}

+ (Instrumentation*)sharedInstrumentation;

- (int)playTime;

- (void)activated;
- (void)deactivated;

@end
