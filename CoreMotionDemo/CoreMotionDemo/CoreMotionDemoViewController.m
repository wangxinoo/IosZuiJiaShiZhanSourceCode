//
//  CoreMotionDemoViewController.m
//  CoreMotionDemo
//
//  Created by msdcn on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoreMotionDemoViewController.h"



@interface CoreMotionDemoViewController ()

@end

@implementation CoreMotionDemoViewController
@synthesize manager;
@synthesize lblInfo;

- (void)viewDidLoad
{
    [super viewDidLoad];
    manager = [CMMotionManager sharedManager];
    if(manager.accelerometerAvailable)
    {
        manager.accelerometerUpdateInterval = 0.2;
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [manager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
        {
            if(error)
            {
                [manager stopAccelerometerUpdates];
                lblInfo.text = [NSString stringWithFormat:@"加速计数据采样出现错误：%@", error];
            }
            else 
            {
                lblInfo.text = [NSString stringWithFormat:@"加速计采集到的信息如下：\nx: %+.3f\ny: %+.3f\nz: %+.3f\n",
                      accelerometerData.acceleration.x,
                      accelerometerData.acceleration.y,
                      accelerometerData.acceleration.z];
            }
        }];
    }
    
    if(manager.gyroAvailable)
    {
        manager.gyroUpdateInterval = 0.2;
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [manager startGyroUpdatesToQueue:queue withHandler:^
         (CMGyroData *gyroData, NSError *error)
         {
             if(error)
             {
                 [manager stopGyroUpdates];
                 lblInfo.text = [NSString stringWithFormat:@"加速计数据采样出现错误：%@", error];
             }
             else 
             {
                 lblInfo.text = [NSString stringWithFormat:@"加速计采集到的信息如下：\nx: %+.3f\ny: %+.3f\nz: %+.3f\n",
                                 gyroData.rotationRate.x,
                                 gyroData.rotationRate.y,
                                 gyroData.rotationRate.z];
             }

         }];
    }

}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    event.
}

- (void)viewDidUnload
{
    [self setLblInfo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

@end


