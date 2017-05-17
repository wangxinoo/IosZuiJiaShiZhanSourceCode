//
//  SecondChildControllerViewController.m
//  ContainerViewApp
//
//  Created by msdcn on 11/14/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "SecondChildControllerViewController.h"
#import "FirstChildControllerViewController.h"

@interface SecondChildControllerViewController ()

- (IBAction)btnPressed:(id)sender;

@end

@implementation SecondChildControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPressed:(id)sender
{
    self.lblInfo.text = @"第二子视图按钮被点击了！";
    self.firstChildController.lblInfo.text = @"第二子视图按钮被点击了！";
}
@end
