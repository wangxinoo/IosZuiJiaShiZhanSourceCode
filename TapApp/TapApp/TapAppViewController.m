//
//  TapAppViewController.m
//  TapApp
//
//  Created by msdcn on 12/22/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "TapAppViewController.h"

@interface TapAppViewController ()
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;
- (IBAction)handleTap:(UITapGestureRecognizer *)sender;
@property (strong, nonatomic) UITapGestureRecognizer *tap2Recognizer;
@end

@implementation TapAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tap2Recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    self.tap2Recognizer.numberOfTouchesRequired = 2;
    self.tap2Recognizer.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:self.tap2Recognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleTap:(UITapGestureRecognizer *)sender
{
    NSLog(@"轻击事件触发了！");
}
@end
