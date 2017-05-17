//
//  CMMotionManager+sharedManager.m
//  CoreMotionDemo
//
//  Created by msdcn on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMMotionManager+sharedManager.h"

@implementation CMMotionManager (sharedManager)
+(CMMotionManager *)sharedManager
{
    static CMMotionManager *manager;

    if(manager == nil)
    {
        manager = [[CMMotionManager alloc] init];
        NSLog(@"CMMotionManager Initialized!");
    }
    return manager;
}

@end
