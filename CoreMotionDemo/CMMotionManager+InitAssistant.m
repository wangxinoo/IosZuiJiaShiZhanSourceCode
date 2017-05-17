//
//  CMMotionManager+InitAssistant.m
//  CoreMotionDemo
//
//  Created by msdcn on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CMMotionManager+InitAssistant.h"

@implementation CMMotionManager (InitAssistant)

+(CMMotionManager *)sharedManager
{
    static CMMotionManager *manager;
    if(manager == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[CMMotionManager alloc] init];
        });
    }
    return manager;
}

@end
