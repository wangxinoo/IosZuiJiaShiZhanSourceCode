//
//  CMMotionManager+sharedManager.h
//  CoreMotionDemo
//
//  Created by msdcn on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>

@interface CMMotionManager (sharedManager)
//@property (nonatomic, strong) CMMotionManager *manager;
+(CMMotionManager *)sharedManager;
@end
