//
//  CoreMotionDemoViewController.h
//  CoreMotionDemo
//
//  Created by msdcn on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "CMMotionManager+InitAssistant.h"

@interface CoreMotionDemoViewController : UIViewController
@property (nonatomic) CMMotionManager *manager;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

@end
