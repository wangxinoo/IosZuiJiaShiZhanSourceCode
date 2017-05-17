//
//  Demo7ViewController.m
//  ControlsApp
//
//  Created by msdcn on 12/1/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "Demo7ViewController.h"

@interface Demo7ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *customPicker;
- (IBAction)handleSelect:(id)sender;
@property (strong, nonatomic) NSDictionary *pickerData;
@end

@implementation Demo7ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.customPicker.dataSource = self;
    self.customPicker.delegate = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistFilePath = [bundle pathForResource:@"provincesandcities" ofType:@"plist"];
    self.pickerData = [[NSDictionary alloc] initWithContentsOfFile:plistFilePath];
    
}
#pragma mark - 数据源协议
#pragma 数据源协议包含两个方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [self.pickerData count];
}

#pragma mark - 委托协议
#pragma 委托协议包含六个方法，这里用到其中一个
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerData allKeys][row];
}

/*-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSDictionary *attributes = @{
NSForegroundColorAttributeName: [UIColor redColor],
NSFontAttributeName: [UIFont fontWithName: @"Zapfino" size:25.0]
    };
    NSString *strDisplayText = @"Test";
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:strDisplayText attributes:attributes];
    return attributedText;
}*/

- (IBAction)handleSelect:(id)sender
{
    NSInteger selectedRow = [self.customPicker selectedRowInComponent:0];
    NSString *strMessage = [NSString stringWithFormat:@"您选择了%@！", [self.pickerData allKeys][selectedRow]];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"选择结果"
                          message: strMessage
                          delegate: nil
                          cancelButtonTitle:@"取消"
                          otherButtonTitles: nil];
    [alert show];
}
@end
