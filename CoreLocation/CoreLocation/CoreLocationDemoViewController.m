//
//  CoreLocationDemoViewController.m
//  CoreLocation
//
//  Created by msdcn on 8/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CoreLocationDemoViewController.h"

@interface CoreLocationDemoViewController ()

@end

@implementation CoreLocationDemoViewController
@synthesize lblLongitude;
@synthesize lblLatitude;
@synthesize lblHorizontalAccuracy;
@synthesize lblAltitude;
@synthesize lblVerticalAccuracy;
@synthesize lblDistance;
@synthesize startLocation;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CLLocationManager *manager = [[CLLocationManager alloc] init];
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    [manager startUpdatingLocation];
    lblLongitude.text = [NSString stringWithString:@"121.1806\u00B0"]; 
    lblLatitude.text = [NSString stringWithString:@"31.251\u00B0"];
    lblHorizontalAccuracy.text = [NSString stringWithString:@"102米"];
    lblAltitude.text = [NSString stringWithString:@"4米"];
    lblVerticalAccuracy.text = [NSString stringWithString:@"1米"];
    lblDistance.text = [NSString stringWithString:@"120.9568米"];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if(startLocation == nil)
    {
        self.startLocation = newLocation;
    }
    
    NSString *strLatitude = [NSString stringWithFormat:@"%g\u00B0", newLocation.coordinate.latitude];
    lblLatitude.text = strLatitude;
    NSString *strLongitude = [NSString stringWithFormat:@"%g\u00B0", newLocation.coordinate.latitude];
    lblLongitude.text = strLongitude;
    NSString *strHorizontalAccuracy = [NSString stringWithFormat:@"%g米", newLocation.horizontalAccuracy];
    lblHorizontalAccuracy.text = strHorizontalAccuracy;
    
    NSString *strAltitude = [NSString stringWithFormat:@"%g米", newLocation.altitude];
    lblAltitude.text = strAltitude;
    NSString *strVerticalAccuracy = [NSString stringWithFormat:@"%g米", newLocation.verticalAccuracy];
    lblVerticalAccuracy.text = strVerticalAccuracy;
    
    CLLocationDistance distance = [newLocation distanceFromLocation:startLocation];
    NSString *strDistance = [NSString stringWithFormat:@"%g米", distance];
    lblDistance.text = strDistance;
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorMessage;
    if(error.code == kCLErrorDenied)
    {
        errorMessage = [NSString stringWithString:@"请设置允许应用使用地理位置信息！"];
    }
    else if(error.code == kCLErrorNetwork)
    {
        errorMessage = [NSString stringWithString:@"请检查网络是否联通！"];
    }
    else if(error.code == kCLErrorLocationUnknown)
    {
        errorMessage = [NSString stringWithString:@"地理信息未知！"];
    }
    else 
    {
        errorMessage = [NSString stringWithString:@"未知错误信息！"];
    }

    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"获取地理信息错误" 
                          message:errorMessage
                          delegate:nil 
                          cancelButtonTitle:@"确定" 
                          otherButtonTitles:nil];
    [alert show];
}


- (void)viewDidUnload
{
    [self setLblLongitude:nil];
    [self setLblLatitude:nil];
    [self setLblHorizontalAccuracy:nil];
    [self setLblAltitude:nil];
    [self setLblVerticalAccuracy:nil];
    [self setLblDistance:nil];
    [self setStartLocation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


@end
