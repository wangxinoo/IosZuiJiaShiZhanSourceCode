//
//  DrawAppViewController.m
//  DrawApp
//
//  Created by msdcn on 12/8/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "DrawAppViewController.h"
#import "DrawAppView.h"

@interface DrawAppViewController ()
- (IBAction)handleChange:(id)sender;

@end

@implementation DrawAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleChange:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    DrawAppView *drawView = (DrawAppView *)self.view;
    drawView.shapeType = [control selectedSegmentIndex];
}

@end
