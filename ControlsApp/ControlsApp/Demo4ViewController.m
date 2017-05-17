//
//  Demo4ViewController.m
//  ControlsApp
//
//  Created by msdcn on 11/25/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "Demo4ViewController.h"

@interface Demo4ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblPrgInfo;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *lblStepperVal;
@property (weak, nonatomic) IBOutlet UISwitch *swiControl;
- (IBAction)handleSwitch:(id)sender;
- (IBAction)handleStep:(id)sender;
@end

@implementation Demo4ViewController

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

- (IBAction)handleSwitch:(id)sender
{
    self.lblPrgInfo.text = @"当前进度：0／10";
    UISwitch *switchControl = (UISwitch *)sender;
    
    if([switchControl isOn])
    {
        [self makeProgressBarMoving];
        switchControl.userInteractionEnabled = NO;
    }
    else
    {
        self.progressView.progress = 0.0f;
    }
}

-(void)makeProgressBarMoving
{
    float actual = self.progressView.progress;
    if(actual < 1)
    {
        //self.swiControl.on = YES;
        actual += 0.1;
        self.progressView.progress = actual;
        self.lblPrgInfo.text = [NSString stringWithFormat:@"当前进度：%d／10", (int)(actual * 10)];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(makeProgressBarMoving) userInfo:nil repeats:NO];
    }
    else
    {
        self.swiControl.userInteractionEnabled = YES;
    }
}

- (IBAction)handleStep:(id)sender
{
    self.lblStepperVal.text = [NSString stringWithFormat:@"%.0f", ((UIStepper *)sender).value ];
}
@end
