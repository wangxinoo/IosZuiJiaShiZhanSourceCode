//
//  Demo6ViewController.m
//  ControlsApp
//
//  Created by msdcn on 12/1/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "Demo6ViewController.h"

@interface Demo6ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtDate;
@property (strong, nonatomic)UIDatePicker *datePicker;
@property (strong, nonatomic)UIActionSheet *dateSheet;
@end

@implementation Demo6ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.txtDate.delegate = self;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.txtDate resignFirstResponder];
    self.dateSheet  = [[UIActionSheet alloc]
                       initWithTitle:nil
                       delegate:nil
                       cancelButtonTitle:nil
                       destructiveButtonTitle:nil
                       otherButtonTitles: nil];
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 44, 0, 0)];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-CN"];
    self.datePicker.date = [NSDate date];
    
    UIToolbar *dateToolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 0, 320, 44)];
    dateToolbar.barStyle = UIBarStyleBlack;
    //[dateToolBar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    
    UIBarButtonItem *btnDone = [[UIBarButtonItem alloc] initWithTitle: @"确定" style: UIBarButtonItemStyleDone target: self action: @selector(handleDone)];
    [barItems addObject: btnDone];
    
    UIBarButtonItem *btnCancel = [[UIBarButtonItem alloc] initWithTitle: @"取消" style: UIBarButtonItemStyleDone target: self action: @selector(handleCancel)];
    [barItems addObject: btnCancel];
    
    [dateToolbar setItems:barItems animated:YES];
    
    [self.dateSheet addSubview:dateToolbar];
    [self.dateSheet addSubview:self.datePicker];
    [self.dateSheet showInView:self.view];
    [self.dateSheet setBounds: CGRectMake(0, 0, 320, 500)];
}

-(void)handleDone
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [formatter stringFromDate:[self.datePicker date]];
    self.txtDate.text = strDate;
    [self.dateSheet dismissWithClickedButtonIndex:1 animated:YES];
}

-(void)handleCancel
{
    [self.dateSheet dismissWithClickedButtonIndex:1 animated:YES];
}
@end
