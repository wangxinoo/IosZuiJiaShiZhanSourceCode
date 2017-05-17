//
//  ContainerViewAppViewController.m
//  ContainerViewApp
//
//  Created by msdcn on 11/13/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "ContainerViewAppViewController.h"
#import "FirstChildControllerViewController.h"
#import "SecondChildControllerViewController.h"

@interface ContainerViewAppViewController ()
@property(nonatomic, weak)FirstChildControllerViewController *firstChildController;
@property(nonatomic, weak)SecondChildControllerViewController *secondChildController;
@end

@implementation ContainerViewAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.firstChildController.secondChildController = self.secondChildController;
    self.secondChildController.firstChildController = self.firstChildController;
    NSLog(@"%@",self.childViewControllers[0]);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"firstChildSegue"])
    {
        self.firstChildController =(FirstChildControllerViewController *)segue.destinationViewController;
    }
    else if([segue.identifier isEqualToString:@"secondChildSegue"])
    {
        self.secondChildController = (SecondChildControllerViewController *)segue.destinationViewController;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
