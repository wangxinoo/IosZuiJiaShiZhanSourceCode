//
//  RotationAppViewController.m
//  RotationApp
//
//  Created by msdcn on 12/9/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "RotationAppViewController.h"
#import "DrawCircleView.h"

@interface RotationAppViewController ()

@end

@implementation RotationAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    DrawCircleView *circleView = (DrawCircleView *)self.view;
    circleView.isVertical = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    DrawCircleView *circleView = (DrawCircleView *)self.view;
    if((toInterfaceOrientation == UIInterfaceOrientationPortrait) ||
       (toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown))
    {
        circleView.isVertical = YES;
    }
    else
    {
        circleView.isVertical = NO;
    }
}

@end
