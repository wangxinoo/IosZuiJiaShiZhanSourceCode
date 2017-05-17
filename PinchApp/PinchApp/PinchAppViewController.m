//
//  PinchAppViewController.m
//  PinchApp
//
//  Created by msdcn on 12/22/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "PinchAppViewController.h"

@interface PinchAppViewController ()
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property CGFloat initialSize;
@end

@implementation PinchAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.initialSize = self.lblText.font.pointSize;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender {
    if(sender.state == UIGestureRecognizerStateBegan)
        self.lblText.font = [self.lblText.font fontWithSize:self.initialSize];
    else
        self.lblText.font = [self.lblText.font fontWithSize:self.initialSize * sender.scale];
}
@end
