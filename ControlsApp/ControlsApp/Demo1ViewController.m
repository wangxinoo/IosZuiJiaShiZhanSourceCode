//
//  Demo1ViewController.m
//  ControlsApp
//
//  Created by msdcn on 11/24/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "Demo1ViewController.h"

@interface Demo1ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblSliderVal;
@property (weak, nonatomic) IBOutlet UILabel *lblSelectedSeg;
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblSliderCurrentVal;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UILabel *lblSegCurrentVal;
- (IBAction)handleSlide:(id)sender;
- (IBAction)handleSelection:(id)sender;
- (IBAction)handleSubmit:(id)sender;
- (IBAction)handleTap:(id)sender;

@end

@implementation Demo1ViewController

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
    self.txtName.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleSlide:(id)sender
{
    //self.lblSliderCurrentVal.text =[NSString stringWithFormat:@"%.0f", ((UISlider *)sender).value];
      self.lblSliderCurrentVal.text =[NSString stringWithFormat:@"%.0f", self.slider.value];
}

- (IBAction)handleSelection:(id)sender
{
        self.lblSegCurrentVal.text = [self.segment titleForSegmentAtIndex: self.segment.selectedSegmentIndex];
}

- (IBAction)handleSubmit:(id)sender
{
    self.lblName.text = self.txtName.text;
    self.lblSliderVal.text = [NSString stringWithFormat:@"%.0f", self.slider.value];
    self.lblSelectedSeg.text = [self.segment titleForSegmentAtIndex: self.segment.selectedSegmentIndex];
}

- (IBAction)handleTap:(id)sender
{
    [self.txtName resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
