//
//  MainViewController.m
//  MultiViewsApp
//
//  Created by msdcn on 11/10/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "MainViewController.h"
#import "RedViewController.h"
#import "BlueViewController.h"

@interface MainViewController ()
@property(nonatomic, strong) RedViewController *redViewController;
@property(nonatomic, strong) BlueViewController *blueViewController;
- (IBAction)switchView:(id)sender;

@end

@implementation MainViewController

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.redViewController = [[RedViewController alloc]initWithNibName:@"RedViewController" bundle:nil];
    [self.view insertSubview:self.redViewController.view atIndex:0];
}

- (IBAction)switchView:(id)sender
{
    if(self.blueViewController.view.superview == nil)
    {
        if(self.blueViewController == nil)
        {
            self.blueViewController = [[BlueViewController alloc]initWithNibName:@"BlueViewController" bundle:nil];
        }
        [self.redViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
       
    }
    else
    {
        /*if(self.blueViewController == nil)
         {
         self.blueViewController = [[BlueViewController alloc]initWithNibName:@"BlueViewController" bundle:nil];
         }*/
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.redViewController.view atIndex:0];
    }
}
@end
