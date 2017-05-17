//
//  GATestViewController.m
//  GATestApp
//
//  Created by msdcn on 1/13/13.
//  Copyright (c) 2013 Demo. All rights reserved.
//

#import "GATestViewController.h"
#import "GAI.h"

@interface GATestViewController ()

@end

@implementation GATestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.trackedViewName = @"Application主页";
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker setReferrerUrl:@"google.com"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
