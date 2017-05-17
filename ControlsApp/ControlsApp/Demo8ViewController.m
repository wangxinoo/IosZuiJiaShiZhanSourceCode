//
//  Demo8ViewController.m
//  ControlsApp
//
//  Created by msdcn on 12/1/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "Demo8ViewController.h"

@interface Demo8ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property (strong, nonatomic) NSDictionary *rawData;
@property (strong, nonatomic) NSArray *provincesData;
@property (strong, nonatomic) NSArray *citiesData;
- (IBAction)handleSelect:(id)sender;
@end

@implementation Demo8ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.doublePicker.dataSource = self;
    self.doublePicker.delegate = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistFilePath = [bundle pathForResource:@"provincesandcities" ofType:@"plist"];
    self.rawData = [[NSDictionary alloc] initWithContentsOfFile:plistFilePath];
    self.provincesData = [self.rawData allKeys];
    NSString *initialProvince = [self.provincesData objectAtIndex:0];
    self.citiesData = [self.rawData objectForKey:initialProvince];
    //self.citiesData = se;
    
}
#pragma mark - 数据源协议
#pragma 数据源协议包含两个方法
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    if(component == 0)
        return [self.provincesData count];
    else
        return [self.citiesData count];
}

#pragma mark - 委托协议
#pragma 委托协议包含六个方法，这里用到其中两个方法
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
        return [self.provincesData objectAtIndex:row];
    else
        return [self.citiesData objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
    {
        NSString *selectedProvince = [self.provincesData objectAtIndex:row];
        self.citiesData = [self.rawData objectForKey:selectedProvince];
        [pickerView selectRow: 0 inComponent:1 animated:YES];
        [pickerView reloadComponent:1];
    }
}

- (IBAction)handleSelect:(id)sender
{
    NSString *selectedProvince = [self.provincesData objectAtIndex:[self.doublePicker selectedRowInComponent:0]];
    NSString *selectedCity = [self.citiesData objectAtIndex:[self.doublePicker selectedRowInComponent:1]];
    
    NSString *strMessage = [NSString stringWithFormat:@"省份您选择了：%@\n城市您选择了：%@", selectedProvince, selectedCity];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"选择结果"
                          message: strMessage
                          delegate: nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles: nil];
    [alert show];
}
@end
