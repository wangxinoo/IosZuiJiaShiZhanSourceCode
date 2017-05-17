//
//  AppLifeCycleDemoViewController.m
//  AppLifeCycleDemo
//
//  Created by msdcn on 12/2/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "AppLifeCycleDemoViewController.h"

@interface AppLifeCycleDemoViewController ()

@end

@implementation AppLifeCycleDemoViewController

/*-(void)loadView
{
     NSLog(@"%@", NSStringFromSelector(_cmd));
    UIView *sampleView = [[UIView alloc] init];
    sampleView.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(20, 50, 360, 50)];
    label.backgroundColor = [UIColor grayColor];
    label.text = @"LoadView方法里的视图覆盖了故事板\n中的视图";
    label.numberOfLines = 0;
    [sampleView addSubview:label];
    self.view = sampleView;
}*/

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)awakeFromNib
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
     NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
