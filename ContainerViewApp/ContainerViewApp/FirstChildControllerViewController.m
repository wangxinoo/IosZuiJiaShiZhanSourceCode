//
//  FirstChildControllerViewController.m
//  ContainerViewApp
//
//  Created by msdcn on 11/13/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "FirstChildControllerViewController.h"
#import "SecondChildControllerViewController.h"
@interface FirstChildControllerViewController ()

- (IBAction)btnPressed:(id)sender;
@end

@implementation FirstChildControllerViewController

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
    self.lblInfo.text = @"第一子视图按钮被点击了！";
    self.secondChildController.lblInfo.text = @"第一子视图按钮被点击了！";
    /*ContainerViewAppViewController *mainController = (ContainerViewAppViewController *)self.parentViewController;

    for(UIViewController *controller in mainController.childViewControllers)
    {
        if([controller isKindOfClass: [SecondChildControllerViewController class]])
        {
            SecondChildControllerViewController *secondController = (SecondChildControllerViewController *)controller;
            secondController.lblInfo.text = @"Test";
        }
    }*/
}


@end
