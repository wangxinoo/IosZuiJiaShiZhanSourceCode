//
//  NotificationDemoViewController.m
//  NotificationDemo
//
//  Created by msdcn on 12/2/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "NotificationDemoViewController.h"

@interface NotificationDemoViewController ()

@end

@implementation NotificationDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    UIApplication *application = [UIApplication sharedApplication];
    
    [center addObserver:self selector:@selector(handleAppDidFinishLaunching) name:UIApplicationDidFinishLaunchingNotification object:application];
    self.view setNeedsDisplay
}

-(void)handleAppDidFinishLaunching
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
